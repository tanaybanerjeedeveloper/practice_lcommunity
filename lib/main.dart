import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:gradient_borders/gradient_borders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final oneSidedBoxshadow = Padding(
      padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(0.5),
                blurRadius: 56,
                offset: Offset(0, 2),
              )
            ]),
      ),
    );
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  height: mediaQuery.height * 0.45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://picsum.photos/250?image=9',
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  height: mediaQuery.height * 0.45,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.5),
                      Colors.black,
                    ],
                  )),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            //color: Colors.amberAccent,
            color: Colors.transparent,
            margin: EdgeInsets.only(top: (60 / 100) * mediaQuery.height * 0.45),
            child: Column(children: [
              Container(
                width: mediaQuery.width * 0.8,
                height: mediaQuery.height * 0.3,
                child: Stack(
                  children: [
                    oneSidedBoxshadow,
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // gradient: LinearGradient(colors: [],),
                          border: GradientBoxBorder(
                              width: 1,
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff1511DB).withOpacity(0.5),
                                    Color(0xff1511DB).withOpacity(0),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomRight))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Pinput(
                              defaultPinTheme: PinTheme(
                                width: 57,
                                height: 44,
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(30, 60, 87, 1),
                                    fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                  color: Color(0xffF4F4F4),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              validator: (s) {
                                return s == '2222' ? null : 'Pin is incorrect';
                              },
                              pinputAutovalidateMode:
                                  PinputAutovalidateMode.onSubmit,
                              showCursor: true,
                              onCompleted: (pin) => print(pin),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.05),
              Text('data')
            ]),
          )
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(20),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Already have an account?'), Text(' Sign in')],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    //(0,0)
    // path.lineTo(0, h - 100);
    // path.quadraticBezierTo(w * 0.5, h 00, w, h);
    // path.lineTo(w, 0);
    // path.close();
    path.lineTo(0, h - 100);
    path.quadraticBezierTo(w * 0.5, h, w, h - 100);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
