import 'package:flutter/material.dart'
;
Widget customButton({onPress,Color? color,Color? textColor,String ?title}) {
  return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.all(12),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Text(
        title!,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 19),
      ));
}