import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:noticias123/src/article/ui/view_models/article_viewmodel.dart';
import 'package:noticias123/src/auth/data/repositories/auth_repository.dart';
import 'package:noticias123/src/auth/domian/models/user/user.dart';

class ProfileScreen extends StatefulWidget {
  final AuthRepository authRepository;
  final ArticleViewModel articleViewModel;

  const ProfileScreen(
      {super.key,
      required this.authRepository,
      required this.articleViewModel});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    widget.authRepository.getUser();
    widget.articleViewModel.getArticles();
  }

  @override
  void dispose() {
    super.dispose();
    widget.authRepository.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: widget.authRepository.observerUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data!;
            return Column(
              children: [
                _buildProfileHeader(user),
                const SizedBox(height: 24),
                _buildProfileDetails(user),
                _buildArticles(),
              ],
            );
          }
          return const Center(
            child: Text('Sem dados'),
          );
        });
  }

  Widget _buildProfileHeader(User user) {
    return Column(
      children: [
        CircleAvatar(
          radius: 64,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
          child: user.avatarUrl.isEmpty
              ? const Icon(Icons.person, size: 64)
              : null,
        ),
        const SizedBox(height: 16),
        Text(
          user.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          user.email,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileDetails(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sobre',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          user.bio.isNotEmpty ? user.bio : 'Nenhuma biografia informada',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
            height: 1.4,
          ),
        ),
        const SizedBox(height: 24),
        _buildDetailItem(
          icon: Icons.fingerprint,
          title: 'ID do Usuário',
          value: user.uid,
        ),
      ],
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticles() {
    return ListenableBuilder(
        listenable: widget.articleViewModel,
        builder: (context, child) {
          if (widget.articleViewModel.loading) {
            return const CircularProgressIndicator();
          } else if (widget.articleViewModel.articles.isEmpty) {
            return const Text('sem dados');
          }
          return Expanded(
            child: ListView.builder(
                itemCount: widget.articleViewModel.articles.length,
                itemBuilder: (ctx, index) {
                  final article = widget.articleViewModel.articles[index];
                  return ListTile(
                    style: ListTileStyle.list,
                    trailing:
                        CachedNetworkImage(imageUrl: article.thumbnailUrl),
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('delatar ${article.title}'),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text('Não')),
                                TextButton(
                                    onPressed: () async {
                                      await widget.articleViewModel
                                          .deleteArticle(article.id);
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Sim')),
                              ],
                            );
                          });
                    },
                    title: Text(
                      article.title,
                    ),
                    // titleTextStyle: TextStyle(fontSize: 20),
                    subtitle: Text(
                      maxLines: 2,
                      article.content,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }),
          );
        });
  }
}
