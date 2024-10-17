import 'package:flutter/material.dart';
import 'package:foodiepass_android/pages/order_script_page.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:foodiepass_android/models/food.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  List<Map<String, dynamic>> foodItems = [];

  @override
  void initState() {
    super.initState();
    // foodItems 초기화
    foodItems = menuItems
        .where((item) => item.quantity > 0)
        .map((item) => {
      'name': item.profileName,
      'engName': item.destinationName,
      'image': item.imagePath ?? 'assets/images/food_menu/ImageNotFound.png',
      'priceKRW': item.profilePrice,
      'priceUSD': item.destinationPrice,
      'quantity': item.quantity,
      'food': item, // Food 객체 참조 추가
    })
        .toList();
  }

  // NumberFormat을 사용하여 통화 형식 지정
  final NumberFormat krwFormat =
  NumberFormat.currency(locale: 'ko_KR', symbol: '₩');
  final NumberFormat usdFormat =
  NumberFormat.currency(locale: 'en_US', symbol: '\$');

  @override
  Widget build(BuildContext context) {
    final totalPrice = getTotalPrice();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Menu',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80, // 앱바 높이 설정

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
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            final item = foodItems[index];
            final int totalKRW = item['priceKRW'] * item['quantity'];
            final double totalUSD = item['priceUSD'] * item['quantity'];

            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.lightGreen, width: 2)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                        image: DecorationImage(
                          image: AssetImage(item['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${krwFormat.format(totalKRW)}',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          item['engName'],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${usdFormat.format(totalUSD)}',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    // 수량 조절 버튼
                    Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                decrementQuantity(index);
                              },
                              icon: Icon(Icons.remove_circle_outline),
                            ),
                            Text(
                              item['quantity'].toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                            IconButton(
                              onPressed: () {
                                incrementQuantity(index);
                              },
                              icon: Icon(Icons.add_circle_outline),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              deleteItem(index);
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 위쪽에 추가할 텍스트
            Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                '총 가격: ${krwFormat.format(totalPrice['totalKRW'])}\nTotal Price: ${usdFormat.format(totalPrice['totalUSD'])}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            // 하단 버튼
            Container(
              height: 48, // 버튼 높이
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
                      "Finish Order",
                      style: TextStyle(
                        color: Colors.white, // 텍스트 색상 설정
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void finishOrder() {
    Get.to(() => const OrderScriptPage());
  }

  void incrementQuantity(int index) {
    setState(() {
      foodItems[index]['quantity']++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (foodItems[index]['quantity'] > 1) {
        foodItems[index]['quantity']--; // 수량 감소
      }
    });
  }

  void deleteItem(int index) {
    setState(() {
      // Food 객체의 quantity를 0으로 설정
      Food food = foodItems[index]['food'];
      food.quantity = 0;
      foodItems.removeAt(index);
    });
  }

  // 총 가격 계산 함수
  Map<String, dynamic> getTotalPrice() {
    num totalKRW = 0;
    num totalUSD = 0.0;

    for (var item in foodItems) {
      totalKRW += item['priceKRW'] * item['quantity'];
      totalUSD += item['priceUSD'] * item['quantity'];
    }

    return {'totalKRW': totalKRW, 'totalUSD': totalUSD};
  }
}