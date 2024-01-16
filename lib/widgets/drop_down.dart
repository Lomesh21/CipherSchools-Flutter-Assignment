
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/image.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key, required this.title, required this.onTap,
  });
  final String title;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.only(top: 15,bottom: 15),
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                primary: Colors.transparent,
                padding: EdgeInsets.all(12),
                elevation: 0,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), side: BorderSide(color: Colors.grey.shade200)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w400, fontSize: 19),
                ),
                Image.asset(dropDownArrow,)
              ],
            )
        ));
  }
}