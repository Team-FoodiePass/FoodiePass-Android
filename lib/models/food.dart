// food.dart

// 메뉴 아이템 정보를 담는 클래스
class MenuItem {
  final String name; // 메뉴 이름 (영어)
  final String koreanName; // 메뉴 이름 (한글)
  final String? imagePath; // 이미지 파일 경로 (null 허용)
  final double priceUsd; // 달러 가격
  final double priceKrw; // 원화 가격
  final String description; // 음식 설명

  // 생성자
  MenuItem({
    required this.name,
    required this.koreanName,
    this.imagePath, // null 허용
    required this.priceUsd,
    required this.priceKrw,
    required this.description,
  });
}

// 메뉴 아이템 목록
final List<MenuItem> menuItems = [
  MenuItem(
    name: 'Kimchi',
    koreanName: '김치',
    imagePath: 'assets/images/food_menu/kimchi.png',
    priceUsd: 3.73,
    priceKrw: 5000,
    description: '김치는 한국 전통 발효 음식으로, 고추, 마늘, 생강, 파 등 다양한 재료와 함께 배추나 무를 절여 만든 요리입니다.',
  ),
  MenuItem(
    name: 'Bibimbap',
    koreanName: '비빔밥',
    imagePath: 'assets/images/food_menu/bibimbap.png',
    priceUsd: 7.47,
    priceKrw: 10000,
    description: '비빔밥은 여러 가지 나물, 고기, 계란, 고추장과 함께 비벼 먹는 한국 전통 음식입니다.',
  ),
  MenuItem(
    name: 'Bulgogi',
    koreanName: '불고기',
    imagePath: 'assets/images/food_menu/bulgogi.png',
    priceUsd: 14.94,
    priceKrw: 20000,
    description: '불고기는 한국의 대표적인 고기 요리로, 얇게 저민 고기를 양념하여 구운 요리입니다.',
  ),
  MenuItem(
    name: 'Tteokbokki',
    koreanName: '떡볶이',
    imagePath: 'assets/images/food_menu/tteokbokki.png',
    priceUsd: 37.34,
    priceKrw: 50000,
    description: '떡볶이는 쌀떡과 고추장 소스로 만든 매콤한 한국의 길거리 음식으로, 주로 어묵, 양배추, 양파와 함께 볶아 먹습니다.',
  ),
  MenuItem(
    name: 'Galbi',
    koreanName: '갈비',
    imagePath: 'assets/images/food_menu/galbi.png',
    priceUsd: 74.68,
    priceKrw: 100000,
    description: '갈비는 소고기나 돼지고기의 갈비뼈를 양념에 재운 후 구워 먹는 한국의 전통 요리입니다. 달콤하면서도 짭짤한 양념이 특징입니다.',
  ),
  MenuItem(
    name: 'Japchae',
    koreanName: '잡채',
    imagePath: 'assets/images/food_menu/japchae.png',
    priceUsd: 112.02,
    priceKrw: 150000,
    description: '잡채는 당면과 다양한 채소, 고기를 간장과 설탕으로 볶아 만든 한국의 대표적인 반찬 중 하나입니다.',
  ),
  // 이미지가 없는 음식 추가
  MenuItem(
    name: 'Doenjang Jjigae',
    koreanName: '된장찌개',
    imagePath: null, // 이미지 경로를 제공하지 않음
    priceUsd: 5.00,
    priceKrw: 7000,
    description: '된장찌개는 된장과 다양한 채소, 두부, 고기를 넣어 끓인 한국의 전통 찌개입니다.',
  ),
];
