import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rx_bus_demo/page/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxbus/rxbus.dart';

class RentHousePage extends StatefulWidget {
  final int count;

  RentHousePage(this.count) : super();

  @override
  _RentHousePageState createState() => _RentHousePageState(count);
}

class _RentHousePageState extends State<RentHousePage> {
  final int count;

  _RentHousePageState(this.count);

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
          "assets/icons/icon_rent_house_page.png",
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
