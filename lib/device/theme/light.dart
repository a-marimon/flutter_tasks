import 'package:flutter/material.dart';
import 'package:my_tasks/data/const.dart';

ThemeData light(BuildContext context) => ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor, brightness: Brightness.light),
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(kDefaultPadding * 1.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDefaultPadding),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        fillColor: Colors.grey.shade50,
        filled: true,
        hintStyle: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
        labelStyle: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
      ),
    );
