
import UIKit

class AnnotatedPhotoCell: UICollectionViewCell {
  @IBOutlet  weak var containerView: UIView!
  @IBOutlet  weak var imageView: UIImageView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
    super.awakeFromNib()
//    containerView.layer.cornerRadius = 6
//    containerView.layer.masksToBounds = true
  }
}
