import 'package:petshop_app/app/modules/login/domain/erros/erros.dart';
import 'package:petshop_app/app/modules/login/domain/entities/user_logged.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop_app/app/modules/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<Either<Failure, UserLogged>> loginWithEmail(
      {String email, String password}) {}
}
