import 'package:dartz/dartz.dart';
import 'package:petshop_app/app/modules/login/domain/erros/erros.dart';
import 'package:petshop_app/app/modules/login/infra/models/user_model.dart';

abstract class LoginDataSource {
  Future<Either<Failure, UserModel>> loginEmail(
      {String email, String password});
  Future<Either<Failure, UserModel>> currentUser();
  Future<Either<Failure, bool>> logout();
}
