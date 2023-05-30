class Failure {
  Failure(this.message);
  final String message;

  @override
  String toString() => message;
}

class UnknownFailure extends Failure {
  UnknownFailure([String? message]): super(message ?? 'Ha ocurrido un error inesperado');
}

class InternetFailure extends Failure {
  InternetFailure([String? message]): super(message ?? 'Tiene un problema');
}
