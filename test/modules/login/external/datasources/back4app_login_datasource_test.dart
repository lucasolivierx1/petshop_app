import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:petshop_app/app/back4app/back4app_initialization.dart';
import 'package:petshop_app/app/modules/login/external/datasources/back4app_login_datasource.dart';

class ParseUserMock extends Mock implements ParseUser {}

main() async {
  final parseMock = ParseUserMock();
  final dataSource = Back4AppLoginDatasource();

  setUp(() async {
    Back4AppInitialization();
    await CoreStoreSharedPrefsImp.getInstance();
  });

  test('[EXPECTED SUCESS] Deve retornar um ParseUser com código 200', () async {
    ParseResponse response = ParseResponse();

    response.statusCode = 200;
    response.result = ParseUser("teste", "teste", "teste", debug: true);

    when(parseMock.login()).thenAnswer((_) async => response);

    var result = await dataSource.loginEmail(email: "teste", password: "tste");

    expect(result, response);
  });
}
