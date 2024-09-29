import 'package:flutter/material.dart';

class FoodDetailPage extends StatefulWidget {
  final String foodName; // 음식 이름
  final String koreanName; // 한글 음식 이름
  final String foodImage; // 음식 이미지 경로
  final double priceUsd; // 달러 가격
  final double priceKrw; // 원화 가격

  // 음식 정보 받기
  FoodDetailPage({
    required this.foodName,
    required this.koreanName,
    required this.foodImage,
    required this.priceUsd,
    required this.priceKrw,
  });

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1; // 수량 초기값 설정

  // 특정 음식 이름에 따라 설명을 생성
  String _getFoodDescription(String foodName) {
    switch (foodName) {
      case 'Kimchi':
        return '김치는 한국 전통 발효 음식으로, 고추, 마늘, 생강, 파 등 다양한 재료와 함께 배추나 무를 절여 만든 요리입니다.';
      case 'Bibimbap':
        return '비빔밥은 여러 가지 나물, 고기, 계란, 고추장과 함께 비벼 먹는 한국 전통 음식입니다.';
      case 'Bulgogi':
        return '불고기는 한국의 대표적인 고기 요리로, 얇게 저민 고기를 양념하여 구운 요리입니다.';
      case 'Tteokbokki':
        return '떡볶이는 쌀떡과 고추장 소스로 만든 매콤한 한국의 길거리 음식으로, 주로 어묵, 양배추, 양파와 함께 볶아 먹습니다.';
      case 'Galbi':
        return '갈비는 소고기나 돼지고기의 갈비뼈를 양념에 재운 후 구워 먹는 한국의 전통 요리입니다. 달콤하면서도 짭짤한 양념이 특징입니다.';
      case 'Japchae':
        return '잡채는 당면과 다양한 채소, 고기를 간장과 설탕으로 볶아 만든 한국의 대표적인 반찬 중 하나입니다.';
      default:
        return '이 음식은 맛있는 한국 요리입니다. 자세한 정보는 나중에 제공될 예정입니다.';
    }
  }

  @override
  Widget build(BuildContext context) {
    String description = _getFoodDescription(widget.foodName); // 음식 설명 가져오기
    double totalPriceUsd = widget.priceUsd * quantity; // 수량에 따른 달러 총 가격
    double totalPriceKrw = widget.priceKrw * quantity; // 수량에 따른 원화 총 가격

    return Scaffold(
      backgroundColor: Colors.white, // 페이지 전체 배경 흰색
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.foodName, style: TextStyle(color: Colors.black)), // 음식 이름을 앱바에 표시
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // 검정색 뒤로가기 버튼
          onPressed: () => Navigator.pop(context), // 뒤로가기 버튼
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black), // 검정색 장바구니 버튼
            onPressed: () {
              print("Go to Order Page"); // 장바구니 이동 (임시)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 음식 이미지 표시
            Image.asset(widget.foodImage, width: double.infinity, height: 200, fit: BoxFit.cover),

            SizedBox(height: 20),

            // 음식 이름 및 한글 이름
            Text(
              widget.foodName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              widget.koreanName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            // 음식 세부 설명
            Text(
              description, // 동적으로 생성된 설명 텍스트
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
                  '\$${widget.priceUsd.toStringAsFixed(2)}',
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
                  '₩${widget.priceKrw.toStringAsFixed(0)}',
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
                          if (quantity > 1) quantity--; // 수량이 1 이하로는 내려가지 않도록 설정
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
                        '\$${totalPriceUsd.toStringAsFixed(2)} (USD)',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '₩${totalPriceKrw.toStringAsFixed(0)} (KRW)',
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
                    print("Go to Order Page"); // 주문 페이지 이동 (임시)
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
