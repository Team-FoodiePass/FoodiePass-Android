import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:foodiepass_android/pages/destination_setting_page.dart';
import 'package:foodiepass_android/pages/profile_setting_page.dart';
import 'package:foodiepass_android/pages/ocr_loading_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image; // 선택된 이미지 파일을 저장하는 변수

  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // 촬영된 이미지를 상태에 저장
      });

      //메뉴 선택 페이지로 이동
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OcrLoadingPage()),
      );

    } else {
      print('선택된 이미지가 없습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar 설정
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // 뒤로가기 버튼을 자동으로 넣지 않음
        // 타이틀
        title: const Text('FoodiePass',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 60)),
        centerTitle: true,
        // 타이틀 가운데 정렬
        backgroundColor: Colors.white,
        // AppBar 배경 흰색
        elevation: 0,
        // AppBar 그림자 제거
        toolbarHeight: 120, // AppBar 높이 설정
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // 전체 패딩 설정
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 위젯들을 상하로 배치
          crossAxisAlignment: CrossAxisAlignment.center, // 위젯들을 좌우 가운데 정렬
          children: [
            // 이미지 클릭시
            GestureDetector(
              onTap: () {
                _pickImageFromCamera(); // 카메라 실행 함수 호출s
              },

              // 시작 이미지
              child: Container(
                color: Colors.white, // 배경 흰색 설정
                height: 350, // 이미지 높이
                width: 350, // 이미지 너비
                child: SvgPicture.asset(
                  'assets/images/home/startButton.svg',
                ),
              ),
            ),

            // 여행지 정보 컨테이너
            Container(
              padding: const EdgeInsets.all(20), // 컨테이너 내부 패딩
              margin: const EdgeInsets.symmetric(vertical: 20), // 컨테이너 상하 마진
              decoration: BoxDecoration(
                color: Colors.white, // 배경 색상 흰색
                borderRadius: BorderRadius.circular(35), // 모서리 둥글게
                border: Border.all(color: Colors.lightGreen), // 테두리 색상
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // 그림자 색상 및 투명도
                    blurRadius: 5, // 그림자 흐림 정도
                    spreadRadius: 2, // 그림자 확산 정도
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                children: [
                  // 왼쪽 컬럼: 여행지 텍스트와 아이콘
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start, // 좌측 정렬
                    mainAxisAlignment: MainAxisAlignment.center, // 수직 중앙 정렬
                    crossAxisAlignment: CrossAxisAlignment.center, // 수평 중앙 정렬
                    children: [
                      Text(
                        '여행지',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10), // 텍스트와 아이콘 사이 간격
                      Icon(Icons.luggage, size: 30), // 아이콘
                    ],
                  ),
                  SizedBox(width: 50),
                  // 오른쪽 컬럼: English와 USD 텍스트 중앙 정렬
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, // 수직 중앙 정렬
                    crossAxisAlignment: CrossAxisAlignment.center, // 수평 중앙 정렬
                    children: [
                      Text(
                        'English(US)', // 언어 정보
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'USD',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // 프로필, 여행지 설정 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // 버튼 중앙 정렬
              children: [
                // 프로필
                Flexible(
                  child: ElevatedButton(
                    // 버튼 클릭시
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileSettingPage(fromHomePage: true),
                          ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15), // 버튼 패딩
                    ),
                    child: const Text(
                      '프로필 설정 >',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // 여행지
                Flexible(
                  child: ElevatedButton(
                    // 버튼 클릭시
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DestinationSettingPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15), // 버튼 패딩
                    ),
                    child: const Text(
                      '여행지 설정 >',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // 하단 메시지
            const Text(
              'made by TEAM FoodiePass',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
