import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:petshop_app/app/modules/login/domain/entities/user_logged.dart';
import 'package:petshop_app/app/modules/login/domain/entities/user_logged_info.dart';
import 'package:petshop_app/app/modules/login/domain/erros/erros.dart';
import 'package:petshop_app/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:petshop_app/app/modules/login/infra/models/user_model.dart';
import 'package:petshop_app/app/modules/login/infra/repositories/login_repository_impl.dart';

class LoginDataSourceMock extends Mock implements LoginDataSource {}

main() {
  final dataSource = LoginDataSourceMock();

  final repository = LoginRepositoryImpl(dataSource);

  final userLogged = UserModel(
      email: "lucas@lucas.com", name: "lucas", phoneNumber: "19999999");

  group("Login With Email", () {
    test('[REPOSITORY EXPECTED SUCESS] Deve retornar um UserLoggedInfo',
        () async {
      when(dataSource.loginEmail(
              email: anyNamed("email"), password: anyNamed("password")))
          .thenAnswer((_) async => Right(userLogged));

      var result = await repository.loginWithEmail(
          email: userLogged.email, password: userLogged.password);

      expect(result, isA<Right<dynamic, UserLoggedInfo>>());
    });

    test('[REPOSITORY EXPECTED ERROR] Deve retornar um ErrorLoginEmail',
        () async {
      when(dataSource.loginEmail(
              email: anyNamed("email"), password: anyNamed("password")))
          .thenAnswer((realInvocation) async => Left(ErrorLoginEmail()));

      var result = await repository.loginWithEmail();
      expect(result.isLeft(), true);
    });
  });
}
