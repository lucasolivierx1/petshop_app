import 'package:dartz/dartz.dart';
import 'package:petshop_app/app/modules/login/domain/entities/login_credential.dart';
import 'package:petshop_app/app/modules/login/domain/entities/user_logged.dart';
import 'package:petshop_app/app/modules/login/domain/erros/erros.dart';
import 'package:petshop_app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:meta/meta.dart';

abstract class LoginWithEmail {
  Future<Either<Failure, UserLogged>> call(
      {@required LoginCredential credential});
}

class LoginWithEmailImpl implements LoginWithEmail {
  final LoginRepository repository;

  LoginWithEmailImpl(this.repository);

  @override
  Future<Either<Failure, UserLogged>> call(
      {@required LoginCredential credential}) async {
    if (!credential.isValidEmail) return Left(ErrorLoginEmail());

    if (!credential.isValidPassword) return Left(ErrorLoginPassword());

    return await repository.loginWithEmail(
        email: credential.email, password: credential.password);
  }
}
