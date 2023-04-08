
import UIKit

class ViewController: UIViewController,SendDataDelegeate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController 뷰가 로드 되었다.")
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func TapCodePushButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") as? CodePushViewController
                
        else { return }
        viewController.name="Carter"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func TapCodePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController  else {return}
        viewController.modalPresentationStyle = .fullScreen
        viewController.name="Carter"
        viewController.delegate = self
        self.present(viewController, animated : true,completion: nil)
    }
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        print("ViewController 뷰가 나타날 것이다.")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SeguePushViewController{
            viewController.name="Carter"
        }
    }
    func sendData(name: String) {
        self.nameLabel.text=name
        self.nameLabel.sizeToFit()
    }
    
}

