import 'package:flutter/material.dart';
import 'package:toonfilx/widgets/Button.dart';
import 'package:toonfilx/widgets/currency_card.dart';

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ), // 수평 방향으로 여백 넣기
            child: Column(
              // 본문 정렬
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 여백 공간 넣기
                const SizedBox(
                  height: 60,
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
                  height: 40,
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // button container 만들기
                    Button(
                      text: 'Transfer',
                      bgColor: Color(0xFFF1B33B),
                      textColor: Colors.black,
                    ),
                    Button(
                      text: 'Request',
                      bgColor: Color(0XFF1F2123),
                      textColor: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end, // 세로축 정렬
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 가로축 정렬
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCard(
                  name: 'Euro',
                  code: 'EUR',
                  amount: '6 428',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                ),
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: const CurrencyCard(
                    name: 'Bitcoin',
                    code: 'BTC',
                    amount: '9 785',
                    icon: Icons.currency_bitcoin,
                    isInverted: true,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: const CurrencyCard(
                    name: 'Dollar',
                    code: 'USD',
                    amount: '428',
                    icon: Icons.attach_money_outlined,
                    isInverted: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
