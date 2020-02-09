import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rx_bus_demo/page/rent_house__page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxbus/rxbus.dart';
import 'new_case_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 創建階段
  @override
  void initState() {
    super.initState();
    registerBus();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: new AppBar(
            // brightness是取反的, 如果想要黑色字體, 則要設置Brightness.light
            brightness: Brightness.light,
          ),
        ),
        Image.asset(
          "assets/icons/icon_home_page.png",
          fit: BoxFit.fill,
        ),
        Column(
          children: <Widget>[
            Flexible(
              child: Container(),
              flex: 5,
            ),
            Flexible(
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        RxBus.post(OnTapEvent(0));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x00000000),
                        ),
                      ),
                    ),
                    flex: 22,
                  ),
                  Flexible(
                    child: Container(),
                    flex: 19,
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        RxBus.post(OnTapEvent(1));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x00000000),
                        ),
                      ),
                    ),
                    flex: 20,
                  ),
                  Flexible(
                    child: Container(),
                    flex: 21,
                  ),
                ],
              ),
              flex: 2,
            ),
            Flexible(
              child: Container(),
              flex: 6,
            ),
          ],
        ),
      ],
    );
  }

  /// 銷毀階段
  @override
  void dispose() {
    destroyBus();
    super.dispose();
  }

  /// 註冊RxBus
  void registerBus() {
    RxBus.register<OnTapEvent>().listen((event) {
      switch (event.type) {
        case 0:
          pushRentHousePage(context);
          break;
        case 1:
          pushNewCasePage(context);
          break;
      }
    });
  }

  /// 解除註冊RxBus
  void destroyBus() {
    RxBus.destroy();
  }
}

class OnTapEvent {
  int type;

  OnTapEvent(this.type);
}

void pushRentHousePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RentHousePage(12710),
    ),
  );
}

void pushNewCasePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => NewCasePage(647),
    ),
  );
}

void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIos: 1,
    backgroundColor: Color(0xF2383838),
    textColor: Color(0xFFFFFFFF),
    fontSize: 16,
  );
}
