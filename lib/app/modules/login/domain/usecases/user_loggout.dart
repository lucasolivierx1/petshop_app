import 'package:dartz/dartz.dart';
import 'package:petshop_app/app/modules/login/domain/erros/erros.dart';
import 'package:petshop_app/app/modules/login/domain/repositories/login_repository.dart';
import 'package:meta/meta.dart';

abstract class UserLoggout {
  Future<Either<Failure, Unit>> call();
}

class UserLoggoutImpl implements UserLoggout {
  final LoginRepository repository;

  UserLoggoutImpl(this.repository);

  @override
  Future<Either<Failure, Unit>> call() {
    return repository.loggout();
  }
}
