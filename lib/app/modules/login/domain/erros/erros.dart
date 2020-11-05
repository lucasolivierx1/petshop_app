abstract class Failure implements Exception {}

class ErrorLoginEmail implements Failure {}

class ErrorLoginPassword implements Failure {}

class ErrorGetLoggedUser implements Failure {
  String msg;
  ErrorGetLoggedUser({this.msg = ""});
  @override
  String toString() {
    return msg;
  }
}

class ErrorLoggout implements Failure {
  String msg;
  ErrorLoggout({this.msg = ""});
  @override
  String toString() {
    return msg;
  }
}
