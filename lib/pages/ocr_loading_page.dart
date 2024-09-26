import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OcrLoadingPage extends StatefulWidget {
  const OcrLoadingPage({super.key});

  @override
  State<StatefulWidget> createState() => OcrLoadingPageState();
}

class OcrLoadingPageState extends State<OcrLoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(' '),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              clickBackButton();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
        ),
        body: Container(
          // TODO: 서버 연결 성공 여부에 따른 로직 분리가 필요함.
          // 우선은 연결 성공의 경우에 보여줄 화면을 구성함
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Loading...',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset('assets/images/LoadingImage.svg'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '당신만을 위한 특별한 메뉴판을 제작하고 있습니다...',
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CircularProgressIndicator(),
              ],
            ),
          ),
          // TODO: 정상 작동이 아닌 경우에 대한 화면 구성 필요
          // ex. 서버 연결 실패, 데이터 없음 등
        ));
  }

  void clickBackButton() {
    // TODO: Get.back();
    print("click go back button");
  }
}
