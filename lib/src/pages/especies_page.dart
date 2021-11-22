import 'package:flutter/material.dart';
import 'package:pomar/src/db/pomar_database.dart';
import 'package:pomar/src/widgets/menu_lateral_widget.dart';
import 'package:provider/provider.dart';

class EspeciesPage extends StatefulWidget {
  const EspeciesPage({Key? key}) : super(key: key);

  @override
  _EspeciesPageState createState() => _EspeciesPageState();
}

class _EspeciesPageState extends State<EspeciesPage> {

  List<DataRow> _retrieveRows(List<Especie>? especies) {
    List<DataRow> especiesList = <DataRow>[];
    if (especies == null) {
      return especiesList;
    }
    return especies.map(
      (especie) => DataRow(
        cells: [
          DataCell(Text(especie.codigo.toString())),
          DataCell(Text(especie.descricao)),
        ])
      ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateralWidget(),
      appBar: AppBar(
        title: const Text('Espécies'),
      ),
      body: StreamBuilder<List<Especie>>(
        stream: Provider.of<PomarDatabase>(context, listen: false)
        .especieDAO.watchAll(),
        builder: (context, snapshot) {

          if(!snapshot.hasData) {
            return Container();
          }

          List<Especie>? especies = snapshot.data;

          return ListView(
            children: [
              DataTable(
                  columns: const [
                    DataColumn(label: Text('Código')),
                    DataColumn(label: Text('Descrição')),
                  ],
                  rows: _retrieveRows(especies),
              ),
            ]
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .pushReplacementNamed('/cadastro_especie');
        },
      ),
    );
  }
}
