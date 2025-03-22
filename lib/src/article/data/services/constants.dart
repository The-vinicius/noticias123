import 'package:noticias123/src/article/domian/models/article.dart';

final articles = [
  Article.fromJson({
    "title": "Flutter",
    "content":
        "Flutter é um kit de desenvolvimento de interface de usuário, de código aberto, criado pelo Google, que possibilita a criação de aplicativos compilados nativamente para mobile, web e desktop a partir de uma única base de código.",
    "authorId": "1",
    "thumbnailUrl":
        "https://miro.medium.com/max/1400/1*ilC2Aqp5sZd1wi0CopD1Hw.png",
    "publishedAt": "2021-09-01T00:00:00Z",
    "category": "tecnologia",
    "status": "publicado",
    "views": 100,
    "likes": 10,
  }),
  Article.fromJson({
    "title": "Dart",
    "content":
        "Dart é uma linguagem de programação de código aberto, desenvolvida pelo Google, que pode ser usada para criar aplicativos para dispositivos móveis, desktop, servidores e a web.",
    "authorId": "1",
    "thumbnailUrl":
        "https://miro.medium.com/max/1400/1*ilC2Aqp5sZd1wi0CopD1Hw.png",
    "publishedAt": "2021-09-01T00:00:00Z",
    "category": "tecnologia",
    "status": "publicado",
    "views": 100,
    "likes": 10,
  }),
  Article.fromJson({
    "title": "Supabase",
    "content":
        "Supabase é uma plataforma open-source que fornece uma API e um banco de dados PostgreSQL para desenvolvedores criarem aplicativos web e móveis modernos.",
    "authorId": "1",
    "thumbnailUrl":
        "https://i.pinimg.com/originals/e1/37/7c/e1377cf33880d539108d2e282523ced7.jpg",
    "publishedAt": "2021-09-01T00:00:00Z",
    "category": "tecnologia",
    "status": "publicado",
    "views": 100,
    "likes": 10,
  })
];
