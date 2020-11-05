import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:petshop_app/app/modules/login/domain/erros/erros.dart';
import 'package:petshop_app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:petshop_app/app/modules/login/domain/usecases/user_loggout.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

main() {
  final repository = LoginRepositoryMock();

  final usecase = UserLoggoutImpl(repository);

  test('[EXPECTED SUCESS] Deve retornar unit quando fizer loggout', () async {
    when(repository.loggout())
        .thenAnswer((realInvocation) async => Right(unit));

    var result = await usecase();

    expect(result, Right(unit));
  });

  test('[EXPECTED ERROR] Deve null se não houver usuário logado', () async {
    when(repository.loggout()).thenAnswer((_) async => Left(ErrorLoggout()));

    var result = await usecase();

    expect(result.fold((l) => l, (r) => null), isA<ErrorLoggout>());
  });
}
