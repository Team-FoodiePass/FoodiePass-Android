import 'package:flutter/material.dart';
import 'package:foodiepass_android/pages/food_detail_page.dart';
import 'package:foodiepass_android/pages/order_list_page.dart';

class MenuSelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 30, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
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
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80, // 앱바 높이 설정
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: 100),
              // 하단 패딩을 늘려서 스크롤 여유 확보
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 한 줄에 2개의 항목
                crossAxisSpacing: 8, // 항목 사이의 가로 간격
                mainAxisSpacing: 8, // 항목 사이의 세로 간격
                childAspectRatio: 0.75, // 항목의 가로 세로 비율
              ),
              itemCount: menuItems.length,
              // 메뉴 아이템의 개수
              itemBuilder: (context, index) {
                return MenuItemCard(item: menuItems[index]); // 개별 메뉴 아이템 카드 생성
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity, // 버튼 너비를 화면 전체로 설정
                height: 48, // 버튼 높이 설정
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderListPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen, // 버튼 배경 색상
                    padding: EdgeInsets.zero, // 기본 패딩 제거
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // 버튼 모서리 둥글게 설정
                    ),
                  ),
                  child: const Text(
                    'Review Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 개별 메뉴 아이템을 표시하는 카드 위젯
class MenuItemCard extends StatelessWidget {
  final MenuItem item;

  const MenuItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // 카드 배경 흰색
      child: InkWell(
        onTap: () {
          // 메뉴 아이템 클릭 시 FoodDetailPage로 이동
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailPage(
                foodName: item.name,
                // 영어 메뉴 이름
                koreanName: item.koreanName,
                // 한글 메뉴 이름
                foodImage: item.imagePath,
                // 메뉴 이미지 경로
                priceUsd: item.priceUsd,
                // 달러 가격
                priceKrw: item.priceKrw, // 원화 가격
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 메뉴 이미지
            Expanded(
              child: Container(
                color: Colors.white, // 이미지 배경 흰색
                child: Image.asset(
                  item.imagePath, // 이미지 경로
                  fit: BoxFit.cover, // 이미지를 꽉 채워 표시
                ),
              ),
            ),
            // 메뉴 텍스트 정보 (이름, 가격)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(item.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  // 영어 메뉴 이름
                  SizedBox(height: 4),
                  Text(item.koreanName),
                  // 한글 메뉴 이름
                  SizedBox(height: 4),
                  Text('\$ ${item.priceUsd.toStringAsFixed(2)}'),
                  // 달러 가격
                  Text('₩ ${item.priceKrw.toStringAsFixed(0)}'),
                  // 원화 가격
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 메뉴 아이템 정보 클래스
class MenuItem {
  final String name; // 메뉴 이름 (영어)
  final String koreanName; // 메뉴 이름 (한글)
  final String imagePath; // 이미지 파일 경로
  final double priceUsd; // 달러 가격
  final double priceKrw; // 원화 가격

  MenuItem({
    required this.name,
    required this.koreanName,
    required this.imagePath,
    required this.priceUsd,
    required this.priceKrw,
  });
}

// 메뉴 아이템 목록 정의
final List<MenuItem> menuItems = [
  MenuItem(
    name: 'Kimchi',
    koreanName: '김치',
    imagePath: 'assets/images/food_menu/kimchi.png',
    priceUsd: 3.73,
    priceKrw: 5000,
  ),
  MenuItem(
    name: 'Bibimbap',
    koreanName: '비빔밥',
    imagePath: 'assets/images/food_menu/bibimbap.png',
    priceUsd: 7.47,
    priceKrw: 10000,
  ),
  MenuItem(
    name: 'Bulgogi',
    koreanName: '불고기',
    imagePath: 'assets/images/food_menu/bulgogi.png',
    priceUsd: 14.94,
    priceKrw: 20000,
  ),
  MenuItem(
    name: 'Tteokbokki',
    koreanName: '떡볶이',
    imagePath: 'assets/images/food_menu/tteokbokki.png',
    priceUsd: 37.34,
    priceKrw: 50000,
  ),
  MenuItem(
    name: 'Galbi',
    koreanName: '갈비',
    imagePath: 'assets/images/food_menu/galbi.png',
    priceUsd: 74.68,
    priceKrw: 100000,
  ),
  MenuItem(
    name: 'Japchae',
    koreanName: '잡채',
    imagePath: 'assets/images/food_menu/japchae.png',
    priceUsd: 112.02,
    priceKrw: 150000,
  ),
];
