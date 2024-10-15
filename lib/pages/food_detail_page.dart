import 'package:flutter/material.dart';
import 'package:foodiepass_android/pages/order_list_page.dart';
import 'package:foodiepass_android/models/food.dart'; // food.dart에서 불러옴

class FoodDetailPage extends StatefulWidget {
  final MenuItem item; // MenuItem 객체

  // 생성자
  FoodDetailPage({required this.item});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1; // 수량 초기값 설정

  @override
  Widget build(BuildContext context) {
    double totalPriceUsd = widget.item.priceUsd * quantity; // 수량에 따른 달러 총 가격
    double totalPriceKrw = widget.item.priceKrw * quantity; // 수량에 따른 원화 총 가격

    return Scaffold(
      backgroundColor: Colors.white, // 페이지 전체 배경 흰색
      appBar: AppBar(
        title: Text(
          widget.item.name,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ), // 음식 이름을 앱바에 표시
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 30, color: Colors.black),
          onPressed: () => Navigator.pop(context), // 뒤로가기 버튼
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, size: 30, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderListPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 음식 이미지 표시 (이미지가 없으면 기본 이미지 표시)
            Image.asset(
              widget.item.imagePath ?? 'assets/images/food_menu/ImageNotFound.png', // null일 경우 기본 이미지 표시
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 20),

            // 음식 이름 및 한글 이름
            Text(
              widget.item.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              widget.item.koreanName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            // 음식 세부 설명
            Text(
              widget.item.description, // MenuItem 객체에서 설명을 불러옴
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),

            SizedBox(height: 20),

            // 가격 정보 (달러와 원화)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '가격',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$ ${widget.item.priceUsd.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '현지 가격',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '₩ ${widget.item.priceKrw.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),

            SizedBox(height: 20),

            // 수량 증감
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '수량',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    // 수량 감소 버튼
                    IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        setState(() {
                          if (quantity > 0)
                            quantity--; // 수량이 1 이하로는 내려가지 않도록 설정
                        });
                      },
                    ),
                    // 현재 수량
                    Text(
                      '$quantity',
                      style: TextStyle(fontSize: 18),
                    ),
                    // 수량 증가 버튼
                    IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: () {
                        setState(() {
                          quantity++; // 수량 증가
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),

            Spacer(), // 공백

            // 총 가격 표시
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // 좌우 정렬
                children: [
                  // 총 가격 텍스트 (왼쪽 정렬)
                  Text(
                    '총 가격',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  // USD와 KRW 가격 (오른쪽 정렬)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$ ${totalPriceUsd.toStringAsFixed(2)} (USD)',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '₩ ${totalPriceKrw.toStringAsFixed(0)} (KRW)',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Review Order 버튼
            Center(
              child: SizedBox(
                width: double.infinity, // 버튼 너비를 화면 전체로 설정
                height: 48, // 버튼 높이 설정
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderListPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen, // 버튼 배경색만 다르게 설정
                    padding: EdgeInsets.zero, // 기본 패딩을 제거
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // 버튼 모서리 둥글게 설정
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Review Order",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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
}
