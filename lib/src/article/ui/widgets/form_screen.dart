// modules/form/form_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:noticias123/src/article/domian/models/article.dart';
import 'package:noticias123/src/article/ui/view_models/article_viewmodel.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _thumbnailController = TextEditingController();
  String _selectedCategory = 'Geral';
  final viewModel = Modular.get<ArticleViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.addListener(() {
      if (viewModel.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Artigo publicado com sucesso')),
        );
        _formKey.currentState!.reset();
      }
      if (viewModel.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao publicar o artigo')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: const [
                  DropdownMenuItem(value: 'Geral', child: Text('Geral')),
                  DropdownMenuItem(
                      value: 'Tecnologia', child: Text('Tecnologia')),
                  DropdownMenuItem(value: 'Esportes', child: Text('Esportes')),
                ],
                onChanged: (value) => _selectedCategory = value!,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Conteúdo'),
                maxLines: 5,
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              TextFormField(
                controller: _thumbnailController,
                decoration: const InputDecoration(labelText: 'url da imagem'),
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final article = Article(
                      title: _titleController.text,
                      content: _contentController.text,
                      authorId: 'user123', // ID do usuário logado
                      thumbnailUrl: _thumbnailController.text,
                      publishedAt: DateTime.now(),
                      category: _selectedCategory,
                      status: 'rascunho',
                      views: 0,
                      likes: 0,
                    );

                    await viewModel.createArticle(article);
                  }
                },
                child: const Text('Publicar Artigo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
