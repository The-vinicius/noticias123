import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:noticias123/src/article/domian/models/article.dart';
import 'package:noticias123/src/article/ui/view_models/article_viewmodel.dart';

class ArticlesScreen extends StatefulWidget {
  final ArticleViewModel articleViewModel;
  const ArticlesScreen({super.key, required this.articleViewModel});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    super.initState();
    widget.articleViewModel.getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListenableBuilder(
        listenable: widget.articleViewModel,
        builder: (ctx, child) {
          if (widget.articleViewModel.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (widget.articleViewModel.error) {
            return Center(
              child: Text(widget.articleViewModel.message),
            );
          }
          if (widget.articleViewModel.noData) {
            return const Center(
              child: Text('No articles found'),
            );
          }
          return ListView.builder(
            itemCount: widget.articleViewModel.articles.length,
            itemBuilder: (ctx, index) {
              final article = widget.articleViewModel.articles[index];
              return _ArticleCard(
                  article: article, viewModel: widget.articleViewModel);
            },
          );
        },
      ),
    );
  }
}

class _ArticleCard extends StatelessWidget {
  final Article article;
  final ArticleViewModel viewModel;

  const _ArticleCard({
    required this.article,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/article/detail', arguments: article);
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(4)),
              child: CachedNetworkImage(
                imageUrl: article.thumbnailUrl,
                height: 200,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Chip(
                        label: Text(article.category),
                        backgroundColor: const Color.fromRGBO(230, 230, 250, 1),
                      ),
                      const Spacer(),
                      Text(
                        DateFormat('dd/MM/yyyy').format(article.publishedAt),
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _StatItem(
                        icon: Icons.visibility,
                        value: article.views.toString(),
                      ),
                      const SizedBox(width: 16),
                      _StatItem(
                        icon: Icons.favorite,
                        value: article.likes.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;

  const _StatItem({
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(value, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }
}
