# iOS RxMVVM 디자인 패턴 연습
 - 카카오 이미지 검색 api를 사용하여 검색어가 변화할 때마,다 1초마다 업데이트를 한다.
 - 카카오에서 불러온 결과 이미지를 tableView에 10개까지 표시하며, 고유 id와 즐겨찾기 버튼을 표시힌다.
 - 검색결과로 나온 이미지를 클릭하게 되면 큰 이미지 뷰로 전환이 된다.
 - 즐겨찾기 switch버튼을 켜거나 끄게 되면, Realm 로컬DB에 저장 및 삭제를 수행
 - 즐겨찾기 화면에서 즐겨찾기에 추가한 이미지를 불러오며, switch 버튼을 통해 switch를 끄면 realm로컬 데이터 베이스에서 삭제 후, Tableview에서 삭제
 
 #
 ## RxMVVM 코드 참고
[날씨 정보 검색 앱]


## RxMVVM, MVVM 개념 참고
[iOS MVVM 개념 참고]

[Swift RxMVVM 개념 참고]


#



[날씨 정보 검색 앱]: <https://github.com/spacedema/RxMvvmWeatherApp>
[iOS MVVM 개념 참고]: <https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52>
[Swift RxMVVM 개념 참고]: <https://ntomios.tistory.com/13>
