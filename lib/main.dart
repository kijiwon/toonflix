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
          backgroundColor: const Color(0xFF181818), // custom color
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ), // 수평 방향으로 여백 넣기
            child: Column(
              // 본문 정렬
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 여백 공간 넣기
                const SizedBox(
                  height: 80,
                ),
                Row(
                  // 수평 방향 정렬
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Hey, Selena',
                          // text styling
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '\$5 194 482', // \를 붙여 $를 기호로 사용
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    // button container 만들기
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 50,
                        ),
                        child: Text(
                          'Transfer',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
