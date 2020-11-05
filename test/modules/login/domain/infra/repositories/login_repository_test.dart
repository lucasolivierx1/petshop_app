import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:petshop_app/app/modules/login/domain/entities/user_logged.dart';
import 'package:petshop_app/app/modules/login/domain/entities/user_logged_info.dart';
import 'package:petshop_app/app/modules/login/domain/erros/erros.dart';
import 'package:petshop_app/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:petshop_app/app/modules/login/infra/repositories/login_repository_impl.dart';

class LoginDataSourceMock extends Mock implements LoginDataSource {}

main() {
  final dataSource = LoginDataSourceMock();

  final repository = LoginRepositoryImpl(dataSource);

  final userLogged = UserLogged(
      email: "lucas@lucas.com",
      name: "lucas",
      password: "123",
      phoneNumber: "19999999");

  group("Login With Email", () {
    test('[REPOSITORY EXPECTED SUCESS] Deve retornar um UserLoggedInfo',
        () async {
      when(dataSource.loginEmail(
              email: anyNamed("email"), password: anyNamed("password")))
          .thenAnswer((_) async => userLogged);

      var result = await repository.getUserLogged();

      expect(result, isA<Right<dynamic, UserLoggedInfo>>());
    });

    test('[REPOSITORY EXPECTED ERROR] Deve retornar um ErrorLoginEmail',
        () async {
      when(dataSource.loginEmail(
              email: anyNamed("email"), password: anyNamed("password")))
          .thenThrow(ErrorLoginEmail());

      var result = await repository.loginWithEmail();
      expect(result.leftMap((l) => l is ErrorLoginEmail), Left(true));
    });
  });
}
