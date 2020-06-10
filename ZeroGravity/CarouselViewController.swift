import UIKit

class CarouselViewController: UIViewController {
    @IBOutlet weak var vwContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(login), name: NSNotification.Name(rawValue: "login"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(Event), name: NSNotification.Name(rawValue: "Event"), object: nil)
    }
    @objc func login(){
        DispatchQueue.main.async {
        let main: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vcObj = main.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            return
        }
            self.navigationController?.pushViewController(vcObj, animated: true)
        }
    }
    
    @objc func Event(){
           DispatchQueue.main.async {
           let main: UIStoryboard = UIStoryboard(name: "Event", bundle: nil)
           guard let vcObj = main.instantiateViewController(withIdentifier: "EventViewController") as? EventViewController else {
               return
           }
            self.navigationController?.pushViewController(vcObj, animated: true)
           }
       }
}

