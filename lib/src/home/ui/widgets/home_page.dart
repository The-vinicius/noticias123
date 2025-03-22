import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:noticias123/src/article/ui/view_models/article_viewmodel.dart';
import 'package:noticias123/src/article/ui/widgets/article_screen.dart';
import 'package:noticias123/src/article/ui/widgets/form_screen.dart';
import 'package:noticias123/src/auth/data/repositories/auth_repository.dart';
import 'package:noticias123/src/profile/ui/widget/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _screens = [
    ArticlesScreen(articleViewModel: Modular.get<ArticleViewModel>()),
    const FormScreen(),
    ProfileScreen(authRepository: Modular.get<AuthRepository>())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notícias123')),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Artigos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: 'Formulário'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
