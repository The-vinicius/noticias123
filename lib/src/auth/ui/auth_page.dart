import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:noticias123/src/auth/ui/view_models/login_viewmodel.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final loginViewmodel = Modular.get<LoginViewmodel>();
  @override
  void initState() {
    loginViewmodel.addListener(_listenable);
    super.initState();
  }

  void _listenable() {
    if (loginViewmodel.estado == 'success') {
      Modular.to.navigate('/home/articles/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(loginViewmodel.estado),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
              onPressed: () async {
                await loginViewmodel.login();
              },
              child: const Text('Sign in with Google')),
        ),
      ),
    );
  }
}
