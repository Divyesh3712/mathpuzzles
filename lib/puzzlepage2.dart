import 'package:flutter/material.dart';
import 'package:mathpuzzles/firstpage.dart';
import 'package:mathpuzzles/puzzlepage3.dart';
import 'package:mathpuzzles/secondpage.dart';

import 'Utils.dart';

class puzzlepage2 extends StatefulWidget {
  int cnt;

  puzzlepage2(this.cnt);

  @override
  State<puzzlepage2> createState() => _puzzlepage2State();
}

class _puzzlepage2State extends State<puzzlepage2> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            body: SafeArea(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("myimages/background.jpg"),
                      fit: BoxFit.fill,
                    )),
                child: Column(children: [
                  Container(
                    height: 50,
                    width: 230,
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Text(
                      "Select Puzzle",
                      style: TextStyle(
                        // fontFamily: "family1",
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          fontStyle: FontStyle.italic,
                          fontSize: 33),
                    ),
                  ),
                  Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        child: GridView.builder(
                          itemCount: 24,
                          itemBuilder: (context, index) {
                            int cnt = Utils.prefs!.getInt("cnt") ?? 0;

                            int status = Utils.prefs!.getInt("level${index+48}") ?? 0;
                            // 0 : pending
                            // 1 : clear
                            // 2 : skip
                            if (status == 1) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) {
                                      return secondpage(index+48);
                                    },
                                  ));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 1, color: Colors.black),
                                      image: DecorationImage(
                                        image: AssetImage("myimages/tick.png"),
                                        fit: BoxFit.fill,
                                      )),
                                  child: Text(
                                    "${index+48+ 1}",
                                    style: TextStyle(
                                        fontSize: 35, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            } else if (status == 2) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) {
                                      return secondpage(index+48);
                                    },
                                  ));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                      Border.all(width: 1, color: Colors.black)),
                                  child: Text(
                                    "${index +48+1}",
                                    style: TextStyle(
                                        fontSize: 35, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            } else {
                              if (index+48 == cnt) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return secondpage(index+48);
                                            },
                                          ));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1, color: Colors.black)),
                                      child: Text(
                                        "${index +48+1}",
                                        style: TextStyle(
                                            fontSize: 35, fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ));
                              } else {
                                return Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("myimages/lock.png"),
                                        fit: BoxFit.fill,
                                      )),
                                );
                              }
                            }
                          },
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                        ),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return firstpage();
                          },
                        ));
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(22),
                            height: 50,
                            alignment: Alignment.centerLeft,
                            child: Image(
                              image: AssetImage("myimages/back.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          InkWell(onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return puzzlepage3(widget.cnt);
                            },));
                          },
                            child: Container(
                              margin: EdgeInsets.only(left: 230),
                              height: 50,
                              alignment: Alignment.centerRight,
                              child: Image(
                                image: AssetImage("myimages/next.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ))
                ]),
              ),
            )),
        onWillPop: goback);
  }

  Future<bool> goback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return firstpage();
      },
    ));
    return Future.value();
  }
}
