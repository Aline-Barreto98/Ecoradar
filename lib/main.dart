import 'package:flutter/material.dart';
//material: estrutura padronizada - importante lembrar que é uma estrutura por padrão do android

void main() {
  runApp(EcoradarApp());
  // runApp sempre precisa ter, pois é a que chama a aplicação para funcionar
  //seguido do nome da aplicação.
}

class EcoradarApp extends StatelessWidget {
  const EcoradarApp({super.key});

  @override
  Widget build(BuildContext context) {
    //contexto de criação do build
    return MaterialApp(
      debugShowCheckedModeBanner: false, // retirar o adesivo de debug
      title: 'Ecoradar',

      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ecoradar"), centerTitle: true),
      body: Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/ecoradar.png', height: 150),
          ),
          Text(
            "Conheça, Inspire, Preserve",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 20),
          Expanded(child: NewsListPage()),
        ],
      ),
    );
  }
}

class News {
  //conjunto de regras para definir a estrutura padrão de notícias
  //classe News criada para criação automática de um conjunto de regras e diretrizes

  final String title;
  final String content;

  News({required this.title, required this.content});
  //.this = construir conteúdo
}

class NewsListPage extends StatelessWidget {
  final List<News> news = [
    News(
      title: "Plantas urbanas ajudam a reduzir a poluição do ar",
      content:
          "Estudos comprovam que as plantas urbanas podem ajudar na redução da poluição atmosférica, melorando a qualidade de vida",
    ),
    News(
      title: "Iniciativas de reciclagem crescem nas cidades brasileiras",
      content:
          "Nos últimos anos, diversas cidades brasileiras têm se empenhado em aumentar a coleta seletiva e incentivar a reciclagem",
    ),
    News(
      title: "Comunidades adotam energia solar como alternativa sustentável",
      content:
          "Cada vez mais, as comunidades no Brasil estão adotando a energia solar como alternativa sustentável e econômica",
    ),
    News(
      title: "Estudo mostra impacto do desmatamento na biodiversidade",
      content:
          "Pesquisas recentes revelam que o desmatamento nas florestas tropicais está provocando sérios danos à biodiversidade",
    ),
    News(
      title: "A importância da preservação de áreas verdes em centros urbanos",
      content:
          "As áreas verdes em centros urbanos desempenham umpapel vital na saúde e be,-estar da população",
    ),
  ];

  //construção do widget de ListView para aparecer os títulos das notícias.
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //ListView é um widget que vai permitir rolagem no aplicativo
      itemCount: news.length,

      //itemCount = quantos itens teremos?
      //vai depender de news.length (quantos forem adicionados)
      itemBuilder: (context, index) {
        //itemBuider = vai trazer sempre o contexto e o index

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Icon(Icons.eco, color: Colors.green, size: 32),
            //leading = ícone antes do text
            title: Text(
              news[index].title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward, color: Colors.green),

            // trailing = ícone após o text
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(news: news[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final News news;
  NewsDetailPage({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              news.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(news.content, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
