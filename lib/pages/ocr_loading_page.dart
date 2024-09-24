import 'package:flutter/material.dart';

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
          title: Text(' '),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              // TODO: 뒤로 가기
              print('click go back button');
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // TODO: () => Get.to(() => const OrderListPage()
                },
                icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: Container(
        )
    );
  }
}
