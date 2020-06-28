
import UIKit
import AVFoundation

class ContestSearchCollectionViewController: UIViewController {
  var photos = ["search1","search2","search3","search4","search5"]
  
    @IBOutlet weak var contestColllectionView: UICollectionView!
    override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let layout = contestColllectionView?.collectionViewLayout as? PinterestLayout {
      layout.delegate = self
    }
    contestColllectionView?.backgroundColor = .clear
    contestColllectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
  }
}

extension ContestSearchCollectionViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnotatedPhotoCell", for: indexPath as IndexPath) as! AnnotatedPhotoCell
        let img = photos[indexPath.row]
        cell.imageView.image = UIImage(named: img)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
    return CGSize(width: itemSize, height: itemSize)
  }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       }
}

extension ContestSearchCollectionViewController: PinterestLayoutDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    let img = photos[indexPath.row]
    let image = UIImage(named: img)
    return (image!.size.height + 35)
  }
}
