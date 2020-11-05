import 'package:dartz/dartz.dart';
import 'package:petshop_app/app/modules/login/domain/entities/user_logged_info.dart';
import 'package:petshop_app/app/modules/login/domain/erros/erros.dart';
import 'package:petshop_app/app/modules/login/domain/repositories/login_repository.dart';

import 'package:meta/meta.dart';

abstract class GetLoggedUser {
  Future<Either<Failure, UserLoggedInfo>> call();
}

class GetLoggedUserImpl implements GetLoggedUser {
  final LoginRepository repository;

  GetLoggedUserImpl(@required this.repository);

  @override
  Future<Either<Failure, UserLoggedInfo>> call() async {
    final user = await repository.getUserLogged();

    if (user.leftMap((l) => l) == null)
      return Left(ErrorGetLoggedUser());
    else
      return user;
  }
}
