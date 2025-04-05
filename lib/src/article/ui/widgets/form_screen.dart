// modules/form/form_screen.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:noticias123/src/app_config.dart';
import 'package:noticias123/src/article/data/services/filepicker_image_service.dart';
import 'package:noticias123/src/article/domian/models/article.dart';
import 'package:noticias123/src/article/ui/view_models/post_article_viewmodel.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  File? image;
  final _selectedCategory = 'Geral';
  final viewModel = Modular.get<PostArticleViewmodel>();

  @override
  void initState() {
    super.initState();

    viewModel.addListener(() {
      if (viewModel.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Artigo publicado com sucesso')),
        );
        _formKey.currentState!.reset();
        setState(() {
          image = null;
        });
      }
      if (viewModel.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(viewModel.message)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: viewModel,
        builder: (context, chilf) {
          return SafeArea(
            child: viewModel.loading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          spacing: 10,
                          children: [
                            Row(
                              children: [
                                const Spacer(),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green.shade100,
                                    foregroundColor: Colors.green.shade800,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: () async {
                                    if (image == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'selecione uma imagem')));
                                      return;
                                    }
                                    if (_formKey.currentState!.validate()) {
                                      final article = Article(
                                        title: _titleController.text,
                                        content: _contentController.text,
                                        authorId: supabase.auth.currentUser!
                                            .id, // ID do usuário logado
                                        thumbnailUrl: '',
                                        publishedAt: DateTime.now(),
                                        category: _selectedCategory,
                                        status: 'rascunho',
                                        views: 0,
                                        likes: 0,
                                      );

                                      await viewModel.createArticle(
                                          article, image!);
                                    }
                                  },
                                  child: const Text('Publicar'),
                                ),
                              ],
                            ),
                            TextFormField(
                              controller: _titleController,
                              decoration: const InputDecoration(
                                hintText: 'Title',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Georgia',
                              ),
                              validator: (value) =>
                                  value!.isEmpty ? 'Campo obrigatório' : null,
                            ),
                            InkWell(
                              onTap: () async {
                                image = await FilePickerSelectImageService()
                                    .select();
                                setState(() {});
                              },
                              child: image != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.file(
                                        image!,
                                        fit: BoxFit.fitWidth,
                                        height: 300,
                                        width: double.infinity,
                                      ),
                                    )
                                  : const Icon(Icons.add_sharp),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _contentController,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Georgia',
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Tell your story...',
                                border: InputBorder.none,
                              ),
                              minLines: 1,
                              maxLines: null,
                              validator: (value) =>
                                  value!.isEmpty ? 'Campo obrigatório' : null,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        });
  }
}
