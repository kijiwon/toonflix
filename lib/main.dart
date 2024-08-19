import 'package:flutter/material.dart';

class Player {
  // String 뒤에 ?를 붙여주면 아무 파라미터 없이도 생성자 함수를 만들 수 있음
  String? name;

  // 파라미터를 받지 않는 생성자 함수
  // Player({});

  // named parameter 사용 <- appBar, home 등과 비슷
  Player({required this.name});
}

// 1. runApp에 새로운 App class 넣기
void main() {
  var kiji = Player(name: 'kiji');
  runApp(MyApp());
}

// 2. App class 정의
// ⭐️3. core widget 중 하나를 상속받기
class MyApp extends StatelessWidget {
  // 4. build 메소드를 사용해 widget을 리턴
  @override
  Widget build(BuildContext context) {
    // 5. UI 테마 선택
    return MaterialApp(
      // 6. home 프로퍼티 설정
      home: Scaffold(
        // 8. scaffold widget을 사용해 화면 구성
        appBar: AppBar(
          title: const Text('Hello flutter!'),
        ),
        body: const Center(
          child: Text('Hello World!'),
        ), // 7. Text를 전달
      ),
    );
  }
}
