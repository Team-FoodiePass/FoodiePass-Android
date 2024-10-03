import 'package:flutter/material.dart';
import 'package:foodiepass_android/pages/home_page.dart';
import 'package:get/get.dart';

class ProfileSettingPage extends StatefulWidget {
  final bool fromHomePage;

  const ProfileSettingPage({super.key, required this.fromHomePage});

  @override
  State<ProfileSettingPage> createState() => _ProfileSettingPageState();
}

class _ProfileSettingPageState extends State<ProfileSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "프로필 설정",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        leading: SizedBox(
          width: 100,
          height: 50,
          child: InkWell(
            onTap: () {
              Get.back();
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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                "당신은 누구인가요?\n 당신에 대해 알려주세요.",
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 7),
            GestureDetector(
              onTap: () {
                showLanguageList();
              },
              child: Container(
                width: double.infinity,
                height: 60,
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
                    Text(
                      "선택한 언어",
                      style: TextStyle(fontSize: 17),
                    ),
                    Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "화폐",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 7),
            GestureDetector(
              onTap: () {
                showCurrencyList();
              },
              child: Container(
                width: double.infinity,
                height: 60,
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
                    Text(
                      "선택한 화폐",
                      style: TextStyle(fontSize: 17),
                    ),
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
      floatingActionButton: Container(
        width: double.infinity,
        height: 48,
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
            submitProfileInfo();
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                "완료",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showLanguageList() {
    // TODO: 언어 목록 보여주기
    print('click language list button');
  }

  void showCurrencyList() {
    // TODO: 화폐 목록 보여주기
    print('click currency list button');
  }

  void submitProfileInfo() {
    // TODO: 언어와 화폐 정보 저장
    print("click submit profile info button");

    if (widget.fromHomePage) {
      Get.back();
    } else {
      Get.to(() => const HomePage());
    }
  }
}
