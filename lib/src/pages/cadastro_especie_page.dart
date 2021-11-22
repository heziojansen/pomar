
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:pomar/src/db/pomar_database.dart';
import 'package:pomar/src/models/especie_model.dart';
import 'package:pomar/src/widgets/menu_lateral_widget.dart';
import 'package:provider/provider.dart';


class CadastroEspeciePage extends StatefulWidget {
  const CadastroEspeciePage({Key? key}) : super(key: key);

  @override
  State<CadastroEspeciePage> createState() => _CadastroEspeciePageState();
}

class _CadastroEspeciePageState extends State<CadastroEspeciePage> {

  EspecieModel especie = EspecieModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MenuLateralWidget(),
        appBar: AppBar(
          title: const Text('Cadastro de Espécie'),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.white.withOpacity(0.9),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        top: 10,
                      ),
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (text) {
                              especie.descricao = text;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Descrição',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (especie.descricao != null) {
                                    Provider.of<PomarDatabase>(context,
                                        listen: false)
                                        .especieDAO.addEspecie(
                                          EspeciesCompanion(
                                            descricao: Value(
                                              especie.descricao ?? ''
                                            ),
                                          )
                                        );
                                    Navigator.of(context)
                                        .pushReplacementNamed('/especies');
                                  }
                                },
                                child: const Text(
                                  'Salvar',
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
