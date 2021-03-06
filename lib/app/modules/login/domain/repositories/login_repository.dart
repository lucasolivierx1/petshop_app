import 'package:dartz/dartz.dart';
import 'package:petshop_app/app/modules/login/domain/entities/user_logged.dart';
import 'package:petshop_app/app/modules/login/domain/entities/user_logged_info.dart';
import 'package:petshop_app/app/modules/login/domain/erros/erros.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserLogged>> loginWithEmail(
      {String email, String password});

  Future<Either<Failure, UserLoggedInfo>> getUserLogged();

  Future<Either<Failure, bool>> loggout();
}
