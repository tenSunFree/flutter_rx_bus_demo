import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rx_bus_demo/page/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxbus/rxbus.dart';

class NewCasePage extends StatefulWidget {
  final int count;

  NewCasePage(this.count) : super();

  @override
  _NewCasePageState createState() => _NewCasePageState(count);
}

class _NewCasePageState extends State<NewCasePage> {
  final int count;

  _NewCasePageState(this.count);

  @override
  Widget build(BuildContext context) {
    showToast("共$count筆物件");
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: new AppBar(
            brightness: Brightness.dark,
          ),
        ),
        Image.asset(
          "assets/icons/icon_new_case_page.png",
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
