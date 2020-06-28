//
//  BlogViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 28/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
class BlockViewCell: UICollectionViewCell {
    @IBOutlet weak var blogImg: UIImageView!
    @IBOutlet weak var blogTitle: UILabel!
    @IBOutlet weak var blogDescription: UILabel!
}

class BlogViewController: UIViewController {
    @IBOutlet weak var blogCollectionView: UICollectionView!
   
    struct blogInformation {
        var blogUrl:String,blogTitle:String,blogDisc:String,blogImgUrl:String
        init(blogUrl: String, blogTitle: String,blogDisc: String,blogImgUrl:String) {
            self.blogUrl = blogUrl
            self.blogTitle = blogTitle
            self.blogDisc = blogDisc
            self.blogImgUrl = blogImgUrl
        }
    }
    var blogInfoList = [blogInformation]()
    var blogWebUrl:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarUIView?.backgroundColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
        navigationController?.navigationBar.barTintColor = LoginViewController.hexStringToUIColor(hex: hexaColor)
        self.navigationController?.isNavigationBarHidden = false
        getBlogInfo()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "BlogWebSegue") {
            DispatchQueue.main.async {
                let blogCNC : BlogWebViewController = segue.destination as! BlogWebViewController
                blogCNC.blogWebUrl = self.blogWebUrl
            }
        }
    }
    class func nullToNil(value : Any?) -> Any? {
        if value is NSNull || value == nil {
            return "" as Any?
        } else {
            if let a = value as? NSNumber {
                return a.stringValue
            } else {
                return (value as! String).uppercased() == "NULL"  ? "" : value
            }
        }
    }
    func getBlogInfo() {
        DispatchQueue.global(qos: .userInteractive).async {
            let url = "https://zerogravity.photography/wp-json/api/v1/posts"
            let escapedAddress = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            URLCache.shared.removeAllCachedResponses()
            Alamofire.request(escapedAddress!, method:.get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
                switch(response.result) {
                case .success(_):
                    let blogInfoArray = response.result.value as? [[String:Any]]
                    if blogInfoArray?.count != 0
                    {
                        self.blogInfoList.removeAll()
                        for blogInfoDict in blogInfoArray!
                        {
                            if blogInfoDict.count != 0
                            {
                                let blogUrl =  BlogViewController.nullToNil(value: blogInfoDict["url"]) as! String
                                let title =  BlogViewController.nullToNil(value: blogInfoDict["title"]) as! String
                                let blogDisc =  BlogViewController.nullToNil(value: blogInfoDict["excerpt"]) as! String
                                let imageUrl =  BlogViewController.nullToNil(value: blogInfoDict["featured_image"]) as! String
                            let blogInfo = blogInformation(blogUrl: blogUrl, blogTitle: title, blogDisc: blogDisc, blogImgUrl: imageUrl)
                                self.blogInfoList.append(blogInfo)

                            }
                        }
                        if self.blogInfoList.count > 0
                        {
                            DispatchQueue.main.async {
                                self.blogCollectionView.reloadData()
                            }
                        }
                    }
                    break
                case .failure(_):
                    break
                }
            }
        }
    }
}
extension BlogViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return blogInfoList.count > 0 ? blogInfoList.count : 0

    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlogIdentifier", for: indexPath as IndexPath) as! BlockViewCell
        let blogDict = blogInfoList[indexPath .row]
        Alamofire.request(blogDict.blogImgUrl).responseImage { response in
            if let image = response.result.value {
                cell.blogImg.image = image
            }
        }
        cell.blogTitle.text = blogDict.blogTitle
        cell.blogDescription.text = blogDict.blogDisc
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let blogDict = blogInfoList[indexPath .row]
        blogWebUrl = blogDict.blogUrl
        self.performSegue(withIdentifier: "BlogWebSegue", sender: self)
    }
}
extension UIImageView{
    func setImageFromURl(stringImageUrl url: String){
        if let url = NSURL(string: url) {
            if let data = NSData(contentsOf: url as URL) {
                self.image = UIImage(data: data as Data)
            }
        }
    }
}

extension BlogViewController: UICollectionViewDelegateFlowLayout{
    
    fileprivate var sectionInsets: UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    fileprivate var itemsPerRow: CGFloat {
        return 1
    }
    
    fileprivate var interitemSpace: CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionPadding = sectionInsets.left * (itemsPerRow + 1)
        let interitemPadding = max(0.0, itemsPerRow - 1) * interitemSpace
        let availableWidth = collectionView.bounds.width - sectionPadding - interitemPadding
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interitemSpace
    }
}
