import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

dynamicText(String text,
    {Color color,
    double fontSize = 16,
    FontWeight fontWeight,
    FontStyle fontStyle = FontStyle.normal,
    TextOverflow overflow,
    TextAlign textAlign,
    bool price = false,
    bool number = false,
    String fontFamily = "Roboto",
    int maxLines,
    TextDecoration textDecoration}) {
  
  return Text(
    text != null ? text : "",
    style: TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: textDecoration,
    ),
    overflow: overflow,
    textAlign: textAlign,
    maxLines: maxLines,
  );
}

navigationManager(context, Widget pageScreen, {isPushReplaced = false}) {
  // print('${pageScreen.toString()}');
  isPushReplaced
    ? Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => pageScreen,
        settings: RouteSettings(name: '${pageScreen.toString()}')))
    : Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pageScreen,
        settings: RouteSettings(name: '${pageScreen.toString()}')));
}

// SAVE LOCAL DATA STORAGE
savePreferences(String key,
  {bool boolValue,
  int intValue,
  double doubleValue,
  String stringValue}) async {
  var ref = await SharedPreferences.getInstance();
  if (boolValue != null) {
    // print('boolValue: $boolValue');
    ref.setBool(key, boolValue);
  } else if (intValue != null) {
    // print('intValue: $intValue');
    ref.setInt(key, intValue);
  } else if (doubleValue != null) {
    // print('doubleValue: $doubleValue');
    ref.setDouble(key, doubleValue);
  } else if (stringValue != null) {
    // print('stringValue: $stringValue');
    ref.setString(key, stringValue);
  }
}

//GET LOCAL DATA STORAGE
getPreferences(String key, {kType}) async {
  var ref = await SharedPreferences.getInstance();
  var value;

  if (kType == 'int') {
    value = ref.getInt(key);
  } else if (kType == 'double') {
    value = ref.getDouble(key);
  } else if (kType == 'string') {
    // print('stringValue: $kType');
    value = ref.getString(key);
  } else if (kType == 'bool') {
    value = ref.getBool(key);
  }
  return value;
}

Widget maintenancePage(String message, String subMessage) {
  return Center(
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 40.0),
        SvgPicture.asset(
          'assets/images/search.svg',
          placeholderBuilder: (context) => CircularProgressIndicator(),
          height: 130,
  //            color: Colors.white,
        ),
        SizedBox(height: 20.0),
        dynamicText(
          message,
          fontSize: 34.0,
          fontFamily: 'Oswald',
          color: Colors.black54,
        ),
  //      SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          child: Text(
            subMessage,
            style: TextStyle(fontSize: 15.0, color: Colors.black45, fontFamily: 'Oswald'),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10.0),
      ]
    ),
  );
}

Widget specUnit(String title, String value, Color fontColor) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        color: Colors.yellow,
        padding: const EdgeInsets.only(left: 30, bottom: 5, top: 5),
        width: 170,
        // child: dynamicText(title, fontSize: 14, color: fontColor, fontFamily: 'Oswald', fontWeight: FontWeight.w100),
        child: dynamicText(title, fontSize: 12, fontFamily: 'Oswald', fontWeight: FontWeight.w300),
      ),
      // Container(
      //   padding: const EdgeInsets.only(left: 0, bottom: 5),
      //   width: 10,
      //   child: dynamicText(':', fontSize: 14, color: fontColor),
      // ),
      Expanded(
        child: Container(
          color: Colors.yellow[700],
          padding: const EdgeInsets.only(right: 30, bottom: 5, top: 5),
          // width: 100,
          // child: dynamicText('${value ?? "-"}', fontSize: 14, color: fontColor, fontFamily: 'Oswald', fontWeight: FontWeight.w100),
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: dynamicText('${value ?? "-"}', fontSize: 12, fontFamily: 'Oswald', fontWeight: FontWeight.w300),
          )
        ),
      ),
    ],
  );
}