import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home_page.dart';
import 'pages/profile_setting_page.dart';
import 'pages/destination_setting_page.dart';

void main() {
  runApp(const FoodiePass());
}

class FoodiePass extends StatelessWidget {
  const FoodiePass({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FoodiePass',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),

      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()), // 메인 화면
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 로고 이미지
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0), // 좌우 여백 설정
              child: Container(
                height: MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/splashIcon.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0), // 좌우 20 픽셀 여백 설정
              child: LinearProgressIndicator(
                minHeight: 8.0, // 프로세스 바 높이
                backgroundColor: Colors.grey[300], // 배경 색상 설정
                valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen), // 진행 바 색상
              ),
            )
,
            const SizedBox(height: 20),
            const Text(
              "Loading...",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
