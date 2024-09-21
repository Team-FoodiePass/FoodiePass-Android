import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DestinationSettingPage extends StatefulWidget {
  final bool fromHomePage;

  const DestinationSettingPage({super.key, required this.fromHomePage});

  @override
  State<DestinationSettingPage> createState() => DestinationSettingPageState();
}

class DestinationSettingPageState extends State<DestinationSettingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("여행지 설정"),
        centerTitle: true,
        leading: SizedBox(
          width: 100,
          height: 50,
          child: InkWell(
            onTap: () {
              // TODO: 뒤로 가기 기능
            },
            child: Container(
              alignment: Alignment.center,
              child: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white70])),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "어디에서 새로운 미식을 즐기고 계신가요?\n 여행지를 선택하세요.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20, // 텍스트 크기
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "언어",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 7),
              GestureDetector(
                onTap: () {
                  // TODO: 언어 목록 보여주기
                },
                child: Container(
                  width: double.infinity,
                  height: 48,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(5))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("선택한 언어"),
                      Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "화폐",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 7),
              GestureDetector(
                onTap: () {
                  // TODO: 통화 목록 보여주기
                },
                child: Container(
                  width: double.infinity,
                  height: 48,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(5))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("선택한 화폐"),
                      Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        decoration: ShapeDecoration(
          color: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            // TODO: 설정한 언어와 통화 적용 로직
          },
          child: const Center(
            child: Text("완료"),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
