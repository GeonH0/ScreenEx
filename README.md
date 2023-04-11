


# 프로젝트명


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

를 액션함수 안에 정의 해주면 이동하는 것을 알 수 있다.


BackButton은 Segue로 push 에서 활용했던 backButton과 동일하게 선언해 주면 된다





## 코드로 Present


ViewController에서 코드로 Present 버튼에 액션 함수를 정의 한 후


```sh

guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") else {return}

viewController.modalPresentationStyle = .fullScreen // fullScreen 설정

        self.present(viewController, animated : true, completion: nil)

```

를 액션 함수 안에 정의 해주면 이동하는 것을 알 수 있다.


BackButton은 Segue로 Present 에서 활용했던 backButton과 동일하게 선언해 주면 된다




## 코드로 Present,Push 화면에 데이터 전달하기


먼저 viewController로 이동하여 viewcontroller를 instance화 해주는 코드에 각각 as? CodePushViewController, as? CodePresentViewController 로 다운캐스팅 해줍니다
```sh
guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController else {return}

self.storyboard?.instantiateViewController(identifier: "CodePushViewController" /*이동할 storyboardID*/) as? CodePushViewController else {return}

```

이렇게 각 타입에 맞는 뷰 컨트롤러로 다운 캐스팅할 경우 
각 뷰 컨트롤러의 프로퍼티에 접근할수 있게 된다. 
그럴경우 다른 화면에 push 되기전에 프로퍼티에 값을 넘겨주면 전환되는 화면으로 데이터 전환이 가능하다

전달 받은 프로퍼티는 각 뷰컨트롤러로 viewDidLoad에 옵셔널 바인딩해서 전달받은 데이터를 출력해보면 잘 출력되는것을 볼수 있다.

위 프로젝트에서는 namelabel.text에 name을 넘겨주는 예시를 해보았다.

![image](https://user-images.githubusercontent.com/88571960/231225370-0cd6323e-9678-404c-8a2e-49588ccb5fae.png)
![image](https://user-images.githubusercontent.com/88571960/231225267-85bcfd13-6e5c-4a1c-baf1-e691e3f43527.png)

위와 같이 잘 넘어 오는것을 볼수 있었다.

하지만 약간의 오류가 있었다. 순서를 잘못 두어 self.present(viewController, animated : true,completion: nil) 아래에 프로퍼티를 설정하니 제대로 작동하지 않게되었다. 
프로퍼티는 순서를 잘 보면서 코드를 짜야될거 같다.









## 출처: 30개 프로젝트로 배우는 iOS 앱 개발 with Swift 초격차 패키지 Online.




