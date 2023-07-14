import 'package:flutter/material.dart';
import 'package:my_tasks/data/const.dart';

ThemeData dark(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor, brightness: Brightness.dark),
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
        fillColor: Colors.grey.shade800,
        filled: true,
        hintStyle: const TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
        labelStyle: const TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
      ),
    );
