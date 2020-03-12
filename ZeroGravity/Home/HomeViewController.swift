//
//  HomeViewController.swift
//  zerogravity
//
//  Created by Bharathimohan on 13/08/19.
//  Copyright © 2019 Bharathimohan. All rights reserved.
//

import UIKit
import CenteredCollectionView
class HomesliderCell: UICollectionViewCell {
    @IBOutlet weak var deviceImg: UIImageView!
}

class HomeViewController: UIViewController {
    let reuseIdentifier = "HomeIdentifier"
    let homeNameDict = ["SpecialOffers"
        :"Offers","Gift your Friend a Shoot":"Gift","Refer your Family and Friends":"Refer","Blogs":"Blogs","Need help?":"NeedHelp"]
    let homeNameArray = ["SpecialOffers","Gift your Friend a Shoot","Refer your Family and Friends","Blogs","Need help?"]

    @IBOutlet weak var homeScrollview: UIScrollView!
    let homeTypeNameArray = ["Exclusive Savings just for you","Surprise your Friends","Earn Upto 10,000 INR","Every Week - Brand New Blog","Contact Our Customer Support Team"]
    @IBOutlet var pageController: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
//        if let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as? UIView {
//            statusBar.backgroundColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
//        }
        if #available(iOS 13, *)
             {
                 let statusBar = UIView(frame: (UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)
                 statusBar.backgroundColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
                 UIApplication.shared.keyWindow?.addSubview(statusBar)
             } else {
                // ADD THE STATUS BAR AND SET A CUSTOM COLOR
                let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
                if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
                   statusBar.backgroundColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
                }
             }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}


extension HomeViewController : UITableViewDataSource,UITableViewDelegate
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeNameArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTBIdentifier", for: indexPath) as! HomeTableViewCell
        let hometypeName = homeNameArray[indexPath.row]
        cell.offerName.text = hometypeName
        cell.offeraType.text = homeTypeNameArray[indexPath.row]
        if let templateImage = UIImage(named: homeNameDict[hometypeName]!)?.withRenderingMode(.alwaysTemplate) {
            let imageView = UIImageView(image: templateImage)
            cell.homeTbIcon.image = imageView.image
            cell.homeTbIcon.tintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        }
        if let templateImage = UIImage(named: "Arrow")?.withRenderingMode(.alwaysTemplate) {            let imageView = UIImageView(image: templateImage)
            cell.arrowImg.image = imageView.image
            cell.arrowImg.tintColor = UIColor(red: 241/255.0, green: 107/255.0, blue: 182/255.0, alpha: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hometypeName = homeNameArray[indexPath.row]
        if hometypeName == "Refer your Family and Friends"
        {
        self.performSegue(withIdentifier: "ReferFriendSegue", sender: self)
        }
        else if hometypeName == "Blogs"
        {
            self.performSegue(withIdentifier: "BlogViewSegue", sender: self)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ReferFriendSegue") {
            DispatchQueue.main.async {
            let _ : ReferFriendViewController = segue.destination as! ReferFriendViewController
            }
        }
       else if (segue.identifier == "BlogViewSegue") {
            DispatchQueue.main.async {
                let _ : BlogViewController = segue.destination as! BlogViewController
            }
        }
    }

}


