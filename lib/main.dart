import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/core/app.widget.dart';
import 'src/shared/hive/hive.config.dart';
import 'src/shared/hive/secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveConfig(SecureStorage()).init();

  await dotenv.load();

  runApp(const PontoApp());
}
