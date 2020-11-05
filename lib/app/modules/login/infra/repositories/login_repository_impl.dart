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
    try {
      final userLogged =
          await dataSource.loginEmail(email: email, password: password);
      return Right(userLogged);
    } catch (e) {
      return Left(ErrorLoginEmail());
    }
  }

  @override
  Future<Either<Failure, UserLoggedInfo>> getUserLogged() async {
    try {
      final user = await dataSource.currentUser();
      return Right(user);
    } catch (e) {
      return Left(ErrorGetLoggedUser());
    }
  }

  @override
  Future<Either<Failure, Unit>> loggout() async {
    try {
      await dataSource.logout();
      return Right(unit);
    } catch (e) {
      return Left(ErrorLoggout(msg: "Error ao tentar fazer logout"));
    }
  }
}
