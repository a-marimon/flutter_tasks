import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class MyException implements Exception {
  final String message;

  static checkError(dynamic e) {
    debugPrint(e.toString());
    if (e is SocketException) {
      throw const ConnectionApiException();
    }
    if (e is DioException) {
      if (e.response?.statusCode == 400) {
        throw const BadRequestException();
      }
      if (e.response?.statusCode == 404) {
        throw const NotFoundException();
      }
    }
    throw Exception(["Unknown Error"]);
  }

  const MyException({required this.message});
}

class BadRequestException extends MyException {
  const BadRequestException({String message = "Check the information sent to the server"}) : super(message: message);
}

class NotFoundException extends MyException {
  const NotFoundException({String message = "Server url not found"}) : super(message: message);
}

class ConnectionApiException extends MyException {
  const ConnectionApiException({String message = "Check your access to server"}) : super(message: message);
}
