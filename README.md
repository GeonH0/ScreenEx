


# 프로젝트명


> Swift를 이용한 아이폰 화면 전환 예제 입니다.



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

self.storyboard?.instantiateViewController(identifier: "CodePushViewController" /*이동할 storyboardID*/) as? CodePushViewController

else { return }

self.navigationController?.pushViewController(viewController, animated: true)

```

를 액션함수 안에 정의 해주면 이동하는 것을 알 수 있다.


BackButton은 Segue로 push 에서 활용했던 backButton과 동일하게 선언해 주면 된다





## 코드로 Present


ViewController에서 코드로 Present 버튼에 액션 함수를 정의 한 후


```sh

guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController else {return}

viewController.modalPresentationStyle = .fullScreen // fullScreen 설정

        self.present(viewController, animated : true, completion: nil)

```

를 액션 함수 안에 정의 해주면 이동하는 것을 알 수 있다.


BackButton은 Segue로 Present 에서 활용했던 backButton과 동일하게 선언해 주면 된다





## 출처: 30개 프로젝트로 배우는 iOS 앱 개발 with Swift 초격차 패키지 Online.




