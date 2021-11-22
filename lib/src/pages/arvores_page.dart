import 'package:flutter/material.dart';
import 'package:pomar/src/db/pomar_database.dart';
import 'package:pomar/src/widgets/menu_lateral_widget.dart';
import 'package:provider/provider.dart';

class ArvoresPage extends StatefulWidget {
  const ArvoresPage({Key? key}) : super(key: key);

  @override
  _ArvoresPageState createState() => _ArvoresPageState();
}

class _ArvoresPageState extends State<ArvoresPage> {

  List<DataRow> _retrieveRows(List<Arvore>? arvores) {
    List<DataRow> arvoresList = <DataRow>[];
    if (arvores == null) {
      return arvoresList;
    }
    return arvores.map(
            (arvore) => DataRow(
            cells: [
              DataCell(Text(arvore.codigo.toString())),
              DataCell(Text(arvore.descricao)),
              DataCell(Text(arvore.dataPlantio.toString())),
              DataCell(Text(arvore.especie.toString())),
            ])
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateralWidget(),
      appBar: AppBar(
        title: const Text('Árvores'),
      ),
      body: StreamBuilder<List<Arvore>>(
          stream: Provider.of<PomarDatabase>(context, listen: false)
              .arvoreDAO.watchAll(),
          builder: (context, snapshot) {

            if(!snapshot.hasData) {
              return Container();
            }

            List<Arvore>? arvores = snapshot.data;

            return ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Cod')),
                          DataColumn(label: Text('Descrição')),
                          DataColumn(label: Text('Plantio')),
                          DataColumn(label: Text('Espécie'))
                        ],
                        rows: _retrieveRows(arvores),
                      ),
                    ),
                  ),
                ]
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .pushReplacementNamed('/cadastro_arvore');
        },
      ),
    );
  }
}
