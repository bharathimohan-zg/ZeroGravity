import Foundation
import UIKit

@IBDesignable
class CarouselItem: UIView {
    static let CAROUSEL_ITEM_NIB = "CarouselItem"
    @IBOutlet var vwContent: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    // MARK: - Init
    @IBOutlet weak var nextBtnbottomConst: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initWithNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initWithNib()
    }
    @IBAction func customerLogin(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Login"), object: nil)
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Next"), object: nil)
    }
    @IBAction func eventLogin(_ sender: Any) {
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Event"), object: nil)
    }
    convenience init(titleText: String? = "", backgroundimg: String, items:[String]) {
        self.init()
        bgImg.image = UIImage(named: backgroundimg)
        lblTitle.text = titleText
    }
    
    fileprivate func initWithNib() {
        Bundle.main.loadNibNamed(CarouselItem.CAROUSEL_ITEM_NIB, owner: self, options: nil)
        vwContent.frame = bounds
        vwContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(vwContent)
    }
}
