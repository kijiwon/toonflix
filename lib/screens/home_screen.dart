import 'package:flutter/material.dart';
import 'package:toonfilx/models/webtoon_model.dart';
import 'package:toonfilx/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          // snapshot-> future의 상태를 알려줌
          if (snapshot.hasData) {
            // 데이터를 받아온 경우
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  // Expanded로 감싸 List의 길이를 적당하게 넣어주기
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal, // 가로 스크롤
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index]; // item의 index에 접근해 build
        print(index); // index를 찍어보면 하나씩 추가됨
        return Column(
          children: [
            Container(
              width: 250,
              child: Image.network(
                webtoon.thumb,

                // 이미지 표시 오류 해결
                headers: const {
                  'Referer': 'https://comic.naver.com',
                },
              ),
            ),
            Text(webtoon.title),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
