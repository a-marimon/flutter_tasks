import 'package:flutter/material.dart';

extension ThemeBuildContext on BuildContext {
  ThemeData get theme => Theme.of(this);
}
