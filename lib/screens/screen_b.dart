import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

@RoutePage()
class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Spacer(),
              CircleAvatar(),
              Container(
                width: double.infinity,
                child: Card(
                  // padding: EdgeInsets.all(8),
                  // width: double.infinity,
                  // height: 200,

                  color: Colors.white,
                  child: Container(
                    margin: EdgeInsets.all(50),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff5B11DC).withOpacity(0.6),
                            blurRadius: 38.1,
                            offset: Offset(0, 21),
                            spreadRadius: -23,
                          )
                        ],
                        shape: BoxShape.circle,
                        border: GradientBoxBorder(
                          width: 1,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff1511db).withOpacity(0.4),
                              Color(0xff1511db).withOpacity(0)
                            ],
                          ),
                        )),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff5B11DC).withOpacity(0.6),
                              blurRadius: 38.1,
                              offset: Offset(0, 21),
                              spreadRadius: -23,
                            )
                          ],
                          shape: BoxShape.circle,
                          border: GradientBoxBorder(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff1511db).withOpacity(0.4),
                                Color(0xff1511db).withOpacity(0)
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
