
import UIKit

class ViewController: UIViewController,SendDataDelegeate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController 뷰가 로드 되었다.")
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func TapCodePushButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController"/*이동할 storyboardID*/) as? CodePushViewController
        else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
        
        viewController.name="Carter"
        
        
    }
    
    @IBAction func TapCodePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController  else {return}  // 다운캐스팅 해준다.각 타입에 맞는 뷰 컨트롤러로 다운 캐스팅할 경우 각 뷰 컨트롤러의 프로퍼티에 접근할수 있게 된다. 그럴경우 다른 화면에 push 되기전에 프로퍼티에 값을 넘겨주면 전환되는 화면으로 데이터 전환이 가능핟
        
        viewController.modalPresentationStyle = .fullScreen // fullScreen 설정
        viewController.name="Carter"
        self.present(viewController, animated : true,completion: nil)
        
        
        viewController.delegate = self

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

