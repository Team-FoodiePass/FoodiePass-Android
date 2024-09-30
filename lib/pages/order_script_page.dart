import 'package:flutter/material.dart';

class OrderScriptPage extends StatefulWidget {
  const OrderScriptPage({super.key});

  @override
  State<OrderScriptPage> createState() => OrderScriptPageState();
}

class OrderScriptPageState extends State<OrderScriptPage> {

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = 60.0;
    final double screenHeight = MediaQuery.of(context).size.height; // 전체 화면 높이
    final double bodyHeight = screenHeight - appBarHeight;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: appBarHeight,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                clickBackButton();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                clickHomeButton();
              },
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: bodyHeight, // Body의 높이를 AppBar를 제외한 높이로 설정
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Transform.rotate(
                      angle: 3.14159, // 텍스트 뒤집기
                      child: const Text(
                        "hello, I want to order",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Transform.rotate(
                      angle: 3.14159, // 텍스트 뒤집기
                      child: const Text(
                        'Order',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
            // 가운데 선 화면 중앙 정렬
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20), // 좌우 여백 설정
                child: const Divider(
                  thickness: 2,
                  color: Colors.grey,
                  height: 0,
                ),
              ),
            ),
            // 하단 텍스트 왼쪽 정렬
            Expanded(
              child: Container(
                alignment: Alignment.topLeft, // 텍스트를 왼쪽 정렬
                padding: const EdgeInsets.only(left: 20), // 왼쪽 여백 추가
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '당신의 주문',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "주문하고 싶습니다.",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 70,)
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
            finishOrder();
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                "Bon appétit!",
                style: TextStyle(
                  color: Colors.white, // 텍스트 색상 설정
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void clickBackButton() {
    // TODO: Get.back()
    print("click go back button");
  }

  void clickHomeButton() {
    // TODO: Go main
    print("click go home button");
  }

  void finishOrder() {
    // TODO: Go main
    print("click finish button");
  }
}
