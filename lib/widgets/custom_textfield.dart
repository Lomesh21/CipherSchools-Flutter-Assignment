import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customTextField({String? hint, controller, isPass}){
  return Padding(
    padding: const EdgeInsets.only(top: 10,bottom: 10),
    child: TextFormField(
      obscureText: isPass,
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          fillColor: Colors.red,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular(12)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular(12)
          ),
          hintText: hint,
          suffixIcon: isPass?IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye_outlined, size: 25, color: Colors.grey.shade500,)):null,
          hintStyle: TextStyle(color: Colors.grey.shade500)
      ),
    ),
  );
}