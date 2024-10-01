import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class OrderScriptPage extends StatefulWidget {
  const OrderScriptPage({super.key});

  @override
  State<OrderScriptPage> createState() => OrderScriptPageState();
}

class OrderScriptPageState extends State<OrderScriptPage> {

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = 60.0;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double bodyHeight = screenHeight - appBarHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                clickHomeButton();
              },
              icon: const Icon(
                Icons.home,
                size: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: bodyHeight,
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
                      angle: 3.14159,
                      child: const Text(
                        "hello, I want to order",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Transform.rotate(
                      angle: 3.14159,
                      child: const Text(
                        'Order',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Divider(
                  thickness: 2,
                  color: Colors.grey,
                  height: 0,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 20),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '당신의 주문',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "주문하고 싶습니다.",
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            )
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
                  color: Colors.white,
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
    Navigator.pop(context);
  }

  void clickHomeButton() {
    // TODO: Go main
    print("click go home button");
    Get.to(() => const HomePage());
  }

  void finishOrder() {
    // TODO: Go main
    print("click finish button");
    Get.to(() => const HomePage());
  }
}
