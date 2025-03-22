import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:noticias123/src/app_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _userIsAuthenticated();
  }

  void _userIsAuthenticated() {
    final user = supabase.auth.currentUser;
    if (user != null) {
      Modular.to.navigate('/home/');
    }
    if (user == null) {
      Modular.to.navigate('/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
