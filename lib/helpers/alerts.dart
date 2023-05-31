import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alerts {
  Alerts({this.title, this.message});

  String? title;
  String? message;
  final navigatorKey = GlobalKey<NavigatorState>();

  void showError() {
    title = 'Error';
    Platform.isIOS
        ? _displayDialogsiOS(
            showCancelButton: false,
            actionOkButton: () => Navigator.pop(navigatorKey.currentContext!),
          )
        : _displayDialogsAndroid(
            showCancelButton: false,
            actionOkButton: () => Navigator.pop(navigatorKey.currentContext!),
          );
  }

  void showAlert(
    void Function()? actionOkButton, {
    String actionButtonText = 'Ok',
    bool showCancelButton = true,
  }) {
    title = 'Alerta';
    Platform.isIOS
        ? _displayDialogsiOS(
            actionButtonText: actionButtonText,
            actionOkButton: actionOkButton,
            showCancelButton: showCancelButton,
          )
        : _displayDialogsAndroid(
            actionButtonText: actionButtonText,
            actionOkButton: actionOkButton,
            showCancelButton: showCancelButton,
          );
  }

  void showAlertWithTextField(
    Widget textField,
    void Function()? actionOkButton, {
    String? actionButtonText,
    bool showCancelButton = true,
  }) {
    title = 'Alerta';
    Platform.isIOS
        ? _displayDialogsiOSWithTextField(
            textField,
            actionButtonText: actionButtonText,
            actionOkButton: actionOkButton,
            showCancelButton: showCancelButton,
          )
        : _displayDialogsAndroidWithTextField(
            textField,
            actionButtonText: actionButtonText,
            actionOkButton: actionOkButton,
            showCancelButton: showCancelButton,
          );
  }

  void _displayDialogsiOSWithTextField(
    Widget textField, {
    String? actionButtonText,
    bool showCancelButton = true,
    void Function()? actionOkButton,
  }) {
    showCupertinoDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Material(
            color: Colors.transparent,
            child: Column(
              children: [
                Text(message ?? ''),
                const SizedBox(height: 10),
                textField,
                const SizedBox(height: 5),
              ],
            ),
          ),
          actions: _textButtonsCupertino(
            showCancelButton,
            actionOkButton,
            actionButtonText: actionButtonText ?? 'Aceptar',
          ),
        );
      },
    );
  }

  void _displayDialogsAndroidWithTextField(
    Widget textField, {
    String? actionButtonText,
    bool showCancelButton = true,
    void Function()? actionOkButton,
  }) {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          content: Scaffold(
            body: Column(
              children: [
                Text(message ?? ''),
                const SizedBox(height: 10),
                textField,
                const SizedBox(height: 5),
              ],
            ),
          ),
          actions: _textButtonsMaterial(
            showCancelButton,
            actionOkButton,
            actionButtonText: actionButtonText ?? 'Aceptar',
          ),
        );
      },
    );
  }

  void _displayDialogsiOS({
    String actionButtonText = 'Ok',
    bool showCancelButton = true,
    void Function()? actionOkButton,
  }) {
    showCupertinoDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title ?? ''),
          content: Text(message ?? ''),
          actions: _textButtonsCupertino(
            showCancelButton,
            actionOkButton,
            actionButtonText: actionButtonText,
          ),
        );
      },
    );
  }

  void _displayDialogsAndroid({
    String actionButtonText = 'Ok',
    bool showCancelButton = true,
    void Function()? actionOkButton,
  }) {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? ''),
          content: Text(message ?? ''),
          actions: _textButtonsMaterial(
            showCancelButton,
            actionOkButton,
            actionButtonText: actionButtonText,
          ),
        );
      },
    );
  }

  List<Widget> _textButtonsMaterial(
    bool showCancelButton,
    void Function()? actionOkButton, {
    String actionButtonText = 'Ok',
  }) {
    return [
      if (showCancelButton)
        MaterialButton(
          elevation: 5,
          onPressed: () => Navigator.pop(navigatorKey.currentContext!),
          child: const Text('Cancelar'),
        ),
      MaterialButton(
        elevation: 5,
        onPressed: actionOkButton,
        child: Text(actionButtonText),
      ),
    ];
  }

  List<Widget> _textButtonsCupertino(
    bool showCancelButton,
    void Function()? actionOkButton, {
    String actionButtonText = 'Ok',
  }) {
    return [
      if (showCancelButton)
        CupertinoDialogAction(
          onPressed: () => Navigator.pop(navigatorKey.currentContext!),
          child: const Text(
            'Cancelar',
          ),
        ),
      CupertinoDialogAction(
        isDefaultAction: true,
        onPressed: actionOkButton,
        child: Text(actionButtonText),
      ),
    ];
  }

  void showSnackBarApp(String? message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final scaffoldMessenger =
          ScaffoldMessenger.of(navigatorKey.currentContext!);

      // ignore: cascade_invocations
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Center(child: Text(message ?? '')),
          duration: const Duration(seconds: 3),
        ),
      );
    });
  }
}
