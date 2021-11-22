import 'package:flutter/material.dart';
import 'package:pomar/src/widgets/menu_lateral_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateralWidget(),
      appBar: AppBar(
        title: const Text('Pomar'),
      ),
      body: Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          children: [
            Center(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/arvores');
                      },
                    icon: const Icon(Icons.park),
                  ),
                  const Text('Árvores'),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed('/cadastro_especie');
                      },
                    icon: const Icon(Icons.agriculture),
                  ),
                  const Text('Colheitas'),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                        .pushReplacementNamed('/especies');
                    },
                    icon: const Icon(Icons.eco),
                  ),
                  const Text('Espécies'),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.group_work),
                  ),
                  const Text('Grupos de Árvores'),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
