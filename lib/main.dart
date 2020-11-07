import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petshop_app/app/back4app/back4app_initialization.dart';

import 'app/petshop_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Back4AppInitialization();
  runApp(PetShopApp());
}
