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
            child: Image.asset(
              'assets/images/ecoradar.png',
              height: 250,
              width: 250,
            ),
          ),
          Text(
            "Conheça, Inspire, Preserve",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
