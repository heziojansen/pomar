import 'package:flutter/material.dart';
import 'package:pomar/src/db/pomar_database.dart';
import 'package:pomar/src/pages/arvores_page.dart';
import 'package:pomar/src/pages/cadastro_arvore_page.dart';
import 'package:pomar/src/pages/cadastro_especie_page.dart';
import 'package:pomar/src/pages/especies_page.dart';
import 'package:pomar/src/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const PomarApp());
}

class PomarApp extends StatelessWidget {
  const PomarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PomarDatabase(),
      child: AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.green,
              brightness: AppController.instance.isDarkTheme
                  ? Brightness.dark
                  : Brightness.light,
            ),
            initialRoute: '/home',
            routes: {
              '/home': (context) => const HomePage(),
              '/arvores': (context) => const ArvoresPage(),
              '/especies': (context) => const EspeciesPage(),
              '/cadastro_arvore': (context) => const CadastroArvorePage(),
              '/cadastro_especie': (context) => const CadastroEspeciePage(),
            },
          );
        },
      ),
    );
  }
}

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDarkTheme = false;

  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
