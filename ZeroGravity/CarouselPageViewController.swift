import Foundation
import UIKit
var currentindex:Int = 0
class CarouselPageViewController: UIPageViewController {
    fileprivate var items: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(pageNavigate), name: NSNotification.Name(rawValue: "Next"), object: nil)
        currentindex  = 0
        populateItems()
        if let firstViewController = items.first {
            setViewControllers([firstViewController], direction:.forward, animated: false, completion: nil)
        }
    }

    fileprivate func populateItems() {
        var backgroundImg:[String] = []
        
        backgroundImg = (loginType == "Customer") ? ["Sales.jpg","Coordination.jpg","Tracking.jpg","Offers1.jpg","Future.jpg"] :  ["Explore.jpg","Expierience.jpg","Capture.jpg","Share.jpg"]
        for (index, image) in backgroundImg.enumerated() {
            let c = createCarouselItemControler(with: String(index), imageName: image, itemArray: backgroundImg)
            items.append(c)
        }
    }
    
    fileprivate func createCarouselItemControler(with titleText: String?, imageName:String, itemArray: [String]) -> UIViewController {
        let c = UIViewController()
        c.view = CarouselItem(titleText: titleText, backgroundimg: imageName, items: itemArray)
        return c
    }
    @objc func pageNavigate(){
        currentindex = currentindex + 1
        if items.count == currentindex {
            currentindex = 0
            if loginType == "Customer" {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "login"), object: nil)
            } else {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Event"), object: nil)
            }
        }
        if let firstViewController = items[currentindex] as? UIViewController {
            setViewControllers([firstViewController], direction:.reverse, animated: false, completion: nil)
        }
    }
}

