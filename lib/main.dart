import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:noticias123/src/app_module.dart';
import 'package:noticias123/src/app_widget.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
