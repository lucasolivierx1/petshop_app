import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:petshop_app/app/modules/login/domain/entities/login_credential.dart';
import 'package:petshop_app/app/modules/login/domain/erros/erros.dart';
import 'package:petshop_app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:petshop_app/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:petshop_app/app/modules/login/infra/models/user_model.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

main() {
  final repository = LoginRepositoryMock();

  final usecase = LoginWithEmailImpl(repository);

  test('Deve retornar um ErrorLoginEmail com email inválido', () async {
    var result = await usecase(
        credential:
            LoginCredential.withEmailAndPassword(email: "", password: ""));

    expect(result.leftMap((l) => l is ErrorLoginEmail), Left(true));
  });

  test("Deve retornar um ErrorLoginPassword com senha inválida", () async {
    var result = await usecase(
        credential: LoginCredential.withEmailAndPassword(
            email: faker.internet.email(), password: ""));

    expect(result.leftMap((l) => l is ErrorLoginPassword), Left(true));
  });

  test("Deve User UserModel", () async {
    var user = UserModel(name: "teste");
    when(repository.loginWithEmail(
            email: anyNamed('email'), password: anyNamed('password')))
        .thenAnswer((_) async => Right(user));

    var result = await usecase(
        credential: LoginCredential.withEmailAndPassword(
            email: faker.internet.email(),
            password: faker.internet.password(length: 12)));

    expect(result, Right(user));
  });
}
