import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:noticias123/src/article/domian/models/article.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final article = Modular.args.data as Article;
    // Formata a data para exibição
    final publishedDate =
        "${article.publishedAt.day}/${article.publishedAt.month}/${article.publishedAt.year}";

    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exibe a thumbnail, se houver
            if (article.thumbnailUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  article.thumbnailUrl,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              article.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Publicado em: $publishedDate',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Categoria: ${article.category}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Divider(height: 32),
            Text(
              article.content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Divider(height: 32),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(Icons.remove_red_eye, size: 20),
                    const SizedBox(width: 4),
                    Text('${article.views}'),
                  ],
                ),
                const SizedBox(width: 16),
                Row(
                  children: [
                    const Icon(Icons.thumb_up, size: 20),
                    const SizedBox(width: 4),
                    Text('${article.likes}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
