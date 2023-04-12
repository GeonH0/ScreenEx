


# Swift를 이용한 아이폰 화면 전환 예제 + 화면간 데이터 전달 


> Swift를 이용한 아이폰 화면 전환 예제 입니다.

> ++ 화면간 데이터 전달 예제



![image](https://user-images.githubusercontent.com/88571960/230752521-8f29fbb7-458d-4ac9-9562-8bc8ffe317b9.png)



Segueway와 코드를 이용하여 총 4개의 화면 전환을 이용하고 어떤 것이 다른지


어떤 것이 활용성이 좋은지 알아보았습니다.



![](../header.png)



## Segue로 Push



![스크린샷 2023-04-09 오후 12 29 01](https://user-images.githubusercontent.com/88571960/230752621-5df2ad2f-62f0-4572-a7de-1e822595ea44.png)



와 같이 Action Segueway를 Show로 설정하면 Segue로 Push 시 다음 화면으로 이동하는 것을 할 수 있습니다.



BackButton에는 액션 함수를 추가하여 self.navigationController?.popViewController(animated: true)을 추가하면 


이전 화면으로 돌아가는 걸 볼 수 있습니다.




## Segue로 Present



![스크린샷 2023-04-09 오후 12 29 01](https://user-images.githubusercontent.com/88571960/230752921-cef44184-47b0-43b7-b8b1-158633f252bd.png)



와 같이 Actino Segueway를 Present Modally로 설정합니다. 그럼 모달 창 처럼 아래에 화면이 올라오는 것을 확인 할 수 있습니다



만약 꽉 찬 화면으로 바꾸고 싶다면 속성에서 Presentation 속성을 full Screen으로 변경하면 됩니다.


BackButton에는 액션 함수를 추가하여 self.presentingViewController?.dismiss(animated: true, completion: nil)를 추가하면

이전 화면으로 돌아가는 걸 볼 수 있습니다.



## 코드로 Push



viewController에서 코드로 push 버튼에 액션 함수를 정의  한후


```sh

self.storyboard?.instantiateViewController(identifier: "CodePushViewController" /*이동할 storyboardID*/) 

else { return }

self.navigationController?.pushViewController(viewController, animated: true)

```

를 액션함수 안에 정의 해주면 이동하는 것을 알 수 있습니다..


BackButton은 Segue로 push 에서 활용했던 backButton과 동일하게 선언해 주면 됩니다.





## 코드로 Present


ViewController에서 코드로 Present 버튼에 액션 함수를 정의 한 후


```sh

guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") else {return}

viewController.modalPresentationStyle = .fullScreen // fullScreen 설정

        self.present(viewController, animated : true, completion: nil)

```

를 액션 함수 안에 정의 해주면 이동하는 것을 알 수 있습니다.


BackButton은 Segue로 Present 에서 활용했던 backButton과 동일하게 선언해 주면 됩니다.




## 코드로 Present,Push 화면에 데이터 전달하기


먼저 viewController로 이동하여 viewcontroller를 instance화 해주는 코드에 각각 as? CodePushViewController, as? CodePresentViewController 로 다운캐스팅 해줍니다
```sh
guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController else {return}

self.storyboard?.instantiateViewController(identifier: "CodePushViewController" /*이동할 storyboardID*/) as? CodePushViewController else {return}

```

이렇게 각 타입에 맞는 뷰 컨트롤러로 다운 캐스팅할 경우 
각 뷰 컨트롤러의 프로퍼티에 접근할수 있게 됩니다. 
그럴경우 다른 화면에 push 되기전에 프로퍼티에 값을 넘겨주면 전환되는 화면으로 데이터 전환이 가능합니다.

전달 받은 프로퍼티는 각 뷰컨트롤러로 viewDidLoad에 옵셔널 바인딩해서 전달받은 데이터를 출력해보면 잘 출력되는것을 볼수 있습니다.

위 프로젝트에서는 namelabel.text에 name을 넘겨주는 예시를 해보았습니다.

![image](https://user-images.githubusercontent.com/88571960/231225370-0cd6323e-9678-404c-8a2e-49588ccb5fae.png)
![image](https://user-images.githubusercontent.com/88571960/231225267-85bcfd13-6e5c-4a1c-baf1-e691e3f43527.png)

위와 같이 잘 넘어 오는것을 볼수 있었습니다.

하지만 약간의 오류가 있었다. 순서를 잘못 두어 self.present(viewController, animated : true,completion: nil) 
아래에 프로퍼티를 설정하니 제대로 작동하지 않게되었습니다.. 
프로퍼티는 순서를 잘 보면서 코드를 짜야될거 같습니다..


## 이전 화면으로 데이터 전달(Delegate 패턴)

delegate는 위임자라고 생각하면된다.

rootviewController에 label을 추가해 준뒤
CodePresentViewController에 protocol을 정의 해줍니다.
sendData라는 함수를 정의해 준뒤 name이라는 프로토콜을 받게 했습니다.

```sh
protocol SendDataDelegeate: AnyObject{
    func sendData(name: String)
}

```

그 다음 CodePresentViewController 안에 프로토콜 타입의 변수를 정의해 줍니다.
```sh
weak var delegate: SendDataDelegate?

```
여기서 주의점은 delegate패턴 사용시 delegate변수 앞에는 weak를 걸어줘야 합니다..
이를 붙어주지 않을시 메모리 누수가 일어날수 있습니다.

그 다음 dismiss 메소드 안에

```sh
self.delegate?.sendData(name: "Carter")

```
로 정의해 준다. 여기서 순서는 dismiss 되기전 이기 떄문에 dismiss 위에 설정해 주어야 합니다..

이제 viewController에서 위임받기위해서는
self.present 함수가 실행되기 전에 viewController.delegate = self 로 초기화 하게 되면 delegate를 위임 받게 되는데
그럼 error가 뜨는데 SendDataDelegate를 채택하라는 오류이기 때문에 채택한후
sendData 함수를 선언해주면 이전화면의 데이터가 전달되는 것을 알수 있다.

초기 화면에는 그냥 label로 되어있지만

![image](https://user-images.githubusercontent.com/88571960/231363322-54d8ec83-ca53-4f67-9a0e-d7d4d4eafb00.png)

->

![image](https://user-images.githubusercontent.com/88571960/231363389-fcef2627-7277-4e0a-bc84-3d11342ea59a.png)

코드로 present의 label.text 인 Carter를 위임 받은후 backbutton을 눌러 초기화면으로 돌아가면

![image](https://user-images.githubusercontent.com/88571960/231363517-f4970d7a-dc07-4fbe-86c7-e77594f33692.png)

label이 Carter로 변경된것을 볼수 있습니다..


## Segue에서 화면간 데이터 전달 받기
마찬가지로 전환되는 viewcontroller instance에 접근하여 데이터를 전달하는 방식입니다.

seguepushViewController에 프로퍼티를 정의한후 seugeway로 전환되는 화면에서 제일 좋은 위치는 전처리 prepare 메소드 입니다.
prepae메소드는 overide하면 segueway를 실행하기 직전에 시스템에 의해 자동으로 실행됩니다.
root viewController에 아래와 같이 입력합니다.

```sh
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SeguePushViewController{
            viewController.name="Carter"
        }

```
SeguepushViewController로 다운캐스팅합니다.
그리고 SeguepushViewController에 설정된 프로퍼티를 변경해 주면

![스크린샷 2023-04-12 오후 4 00 41](https://user-images.githubusercontent.com/88571960/231377570-6e274687-d306-4e3a-b1b6-2b3dce1d19fa.png)

와 같이 잘 전달 되는 것을 알수 있습니다

화면 전달에는 닶이 없습니다 상황에 맞추어 잘 활용하면 좋을거 같습니다.








## 출처: 30개 프로젝트로 배우는 iOS 앱 개발 with Swift 초격차 패키지 Online.




