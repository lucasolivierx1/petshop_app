import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:petshop_app/app/modules/login/domain/erros/erros.dart';
import 'package:petshop_app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:petshop_app/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:petshop_app/app/modules/login/infra/models/user_model.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

main() {
  final repository = LoginRepositoryMock();

  final usecase = GetLoggedUserImpl(repository);

  test('[EXPECTED SUCESS] Deve retornar um UserLoggedInfo', () async {
    var user = UserModel(name: "teste");
    when(repository.getUserLogged())
        .thenAnswer((realInvocation) async => Right(user));

    var result = await usecase();

    expect(result, Right(user));
  });

  test(
      '[EXPECTED ERROR] Deve retornar um ErrorGetLoggedUser se não estiver logado',
      () async {
    when(repository.getUserLogged())
        .thenAnswer((_) async => Left(ErrorGetLoggedUser()));

    var result = (await usecase()).fold((l) => null, (r) => r);
    expect(result, null);
  });
}
