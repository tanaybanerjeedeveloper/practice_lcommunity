import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

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
                      decoration: const BoxDecoration(
                        color: Colors.white,
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
