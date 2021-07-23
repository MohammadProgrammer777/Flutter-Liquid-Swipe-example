import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Liquid Swipe test app',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LiquidController _liquidController = LiquidController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    PageMaker(
        Color color, String path, String price, String title, Color btn_color) {
      return Container(
        color: color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 2,
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Lalezar',
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  path,
                  width: width * 0.4,
                  height: width * 0.4,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    price,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontFamily: 'Lalezar',
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 3,
              ),
              Text(
                'این هدفون عالی است!',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontFamily: 'Salamat',
                  fontSize: 25.0,
                ),
              ),
              Spacer(),
              Container(
                width: width * 0.6,
                height: height * 0.07,
                decoration: BoxDecoration(
                  color: btn_color,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'افزودن به سبد خرید',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Salamat',
                          fontSize: 25.0,
                        ),
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      );
    }

    final pages = [
      PageMaker(
        Colors.white,
        'assets/images/two.png',
        '۳۵,۹۰۰تومان ',
        'هدفون بی سیم',
        Color(0xffff3f34),
      ),
      PageMaker(
        Colors.pink,
        'assets/images/five.png',
        '۳۵,۹۰۰تومان ',
        'هدفون بی سیم',
        Colors.white,
      ),
      PageMaker(
        Colors.orange,
        'assets/images/six.png',
        '۳۵,۹۰۰تومان ',
        'هدفون بی سیم',
        Colors.purple,
      ),
      PageMaker(
        Colors.purple,
        'assets/images/seven.png',
        '۳۵,۹۰۰تومان ',
        'هدفون بی سیم',
        Colors.orange,
      ),
    ];
    return Scaffold(
      body: LiquidSwipe(
        liquidController: _liquidController,
        pages: pages,
        positionSlideIcon: 0.7,
        slideIconWidget: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.arrow_back),
        ),
        fullTransitionValue: 200.0,
      ),
    );
  }
}
