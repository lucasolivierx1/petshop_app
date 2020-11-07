import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Back4AppInitialization {
  static Future<void> call() async {
    await Parse().initialize("jbqpXV91bp0xnZJP3A61c2MPJG0ekrGehpj6kaih",
        "https://parseapi.back4app.com/",
        masterKey: "BiWFY4QTYYaURWelwANPX7O2WpierlQoiQwRSAb5",
        clientKey: "aumTc11LfbC2hm09cRNCsGwqYJhilkrv4KoOCHdm",
        debug: true,
        autoSendSessionId: true,
        coreStore: await CoreStoreSharedPrefsImp.getInstance());
  }
}
