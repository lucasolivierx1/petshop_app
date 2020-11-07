import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:petshop_app/app/modules/login/domain/erros/erros.dart';
import 'package:petshop_app/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:petshop_app/app/modules/login/infra/models/user_model.dart';

class Back4AppLoginDatasource implements LoginDataSource {
  @override
  Future<Either<Failure, UserModel>> currentUser() async {
    final currentUser = await ParseUser.currentUser();
    try {
      return Right(UserModel.fromBack4App(currentUser));
    } catch (e) {
      return Left(ErrorGetLoggedUser(msg: "Falha ao recuperar usuário atual "));
    }
  }

  @override
  Future<Either<Failure, UserModel>> loginEmail(
      {String email, String password}) async {
    try {
      final response = await ParseUser(email, password, email).login();
      return Right(UserModel.fromBack4App(response.results.first));
    } catch (e) {
      return Left(ErrorLoginEmail());
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final ParseUser currentUser = await ParseUser.currentUser();
      return Right((await currentUser.logout()).success);
    } catch (e) {
      return Left(ErrorLoggout(msg: "Ocorreu um erro ao efetuar loggout"));
    }
  }
}
