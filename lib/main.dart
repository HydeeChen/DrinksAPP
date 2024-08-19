import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isVisible = false;
  late Drink _selectedDrink;

  @override
  void initState() {
    super.initState();
    _selectedDrink = drinks[0]; 
  }

  void _showRandomDrink() {
    setState(() {
      _isVisible = true;
      _selectedDrink = drinks[Random().nextInt(drinks.length)]; // 随机选择一个饮品
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.7),
            child: Text(
              'What would you like to drink?',
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'noteWorthy',
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.7),
            child: ElevatedButton(
              onPressed: _showRandomDrink,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 26),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.local_bar, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Order Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'noteWorthy',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isVisible) ...[
            Align(
              alignment: Alignment(0, 0.2),
              child: Text(
                _selectedDrink.name,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'noteWorthy',
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.4),
              child: Text(
                _selectedDrink.content,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'noteWorthy',
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  _selectedDrink.image,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class Drink {
  final String image;
  final String name;
  final String content;

  Drink({required this.image, required this.name, required this.content});
}

final List<Drink> drinks = [
  Drink(
    image: 'assets/01.jpeg',
    name: '毒蘋果',
    content: '野格利口酒*1、金蘋果-蘋果牛奶*1 、強冽雙重檸檬*1; 口感酸甜順口，適合初學者嘗試。',
  ),
  Drink(
    image: 'assets/02.jpg',
    name: '養樂多葡萄沙瓦',
    content: '葡萄沙瓦*1、養樂多*1、伏特加利口酒*1; 口感酸甜口感，零酒味、好喝妹酒選這款！',
  ),
  Drink(
    image: 'assets/03.jpeg',
    name: '螺絲起子',
    content: '伏特加 : 柳橙汁 = 1 : 2; 口感清新酸甜，酒味較淡，適合初學者嘗試。',
  ),
  Drink(
    image: 'assets/04.jpeg',
    name: '梅子綠茶',
    content: '梅酒 : 綠茶 = 1 : 1 (可依個人喜好調整); 梅酒的甜味與綠茶的清香完美融合，口感清爽，帶有梅子的酸甜，非常解膩。',
  ),
  Drink(
    image: 'assets/05.jpeg',
    name: '自由古巴 (Cuba Libre)',
    content: '蘭姆酒 : 可樂 = 1 : 2; 可樂的甜味與萊姆的酸味平衡了蘭姆酒的辛辣，口感清爽，適合各種場合。',
  ),
];
