import 'package:petshop_app/app/modules/login/domain/entities/user_logged_info.dart';
import 'package:petshop_app/app/modules/login/domain/erros/erros.dart';
import 'package:petshop_app/app/modules/login/domain/entities/user_logged.dart';
import 'package:dartz/dartz.dart';
import 'package:petshop_app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:petshop_app/app/modules/login/infra/datasources/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, UserLogged>> loginWithEmail(
      {String email, String password}) async {
    final userLogged =
        await dataSource.loginEmail(email: email, password: password);

    return userLogged;
  }

  @override
  Future<Either<Failure, UserLoggedInfo>> getUserLogged() async {
    return await dataSource.currentUser();
  }

  @override
  Future<Either<Failure, bool>> loggout() async {
    return await dataSource.logout();
  }
}
