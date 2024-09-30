import 'package:flutter/material.dart';

class OrderScriptPage extends StatefulWidget {
  const OrderScriptPage({super.key});

  @override
  State<OrderScriptPage> createState() => OrderScriptPageState();
}

class OrderScriptPageState extends State<OrderScriptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60.0,
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
                )),
            IconButton(
                onPressed: () {
                  clickHomeButton();
                },
                icon: const Icon(
                  Icons.home,
                  size: 30,
                ))
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(3.141592),
                  child: Column(
                    children: [
                      Container(
                        height: 20,
                      ),
                      const Text(
                        'hello, I want to order',
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(3.141592),
                child: const Text(
                  'Order',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ),
              ),
              const Text(
                '당신의 주문',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 20,
                    ),
                    const Text(
                      'hello, I want to order',
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
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
