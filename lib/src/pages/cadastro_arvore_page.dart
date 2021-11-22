import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:pomar/src/db/pomar_database.dart';
import 'package:pomar/src/models/arvore_model.dart';
import 'package:pomar/src/widgets/menu_lateral_widget.dart';
import 'package:provider/provider.dart';

class CadastroArvorePage extends StatefulWidget {
  const CadastroArvorePage({Key? key}) : super(key: key);

  @override
  State<CadastroArvorePage> createState() => _CadastroArvorePageState();
}

class _CadastroArvorePageState extends State<CadastroArvorePage> {

  ArvoreModel arvore = ArvoreModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MenuLateralWidget(),
        appBar: AppBar(
          title: const Text('Cadastro de Árvores'),
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
                              arvore.descricao = text;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Descrição',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2010),
                                lastDate: DateTime(2050)
                              ).then((date) {
                                arvore.dataPlantio = date;
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: 'Data do plantio',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          StreamBuilder<List<Especie>>(
                              stream: Provider.of<PomarDatabase>(
                                  context, listen: false)
                                  .especieDAO.watchAll(),
                              builder: (context, snapshot) {

                                if(!snapshot.hasData) {
                                  return const SizedBox(height: 10);
                                }

                                List<Especie>? especies = snapshot.data;
                                Especie selectedEspecie = especies![0];

                                return DropdownButton<Especie>(
                                  value: selectedEspecie,
                                  onChanged: (Especie? newValue) {
                                    if (newValue != null) {
                                      arvore.especie = newValue.codigo;
                                      setState(() {
                                        selectedEspecie = newValue;
                                      });
                                    }
                                  },
                                  items: especies.map(
                                      (Especie especie) {
                                        return DropdownMenuItem<Especie>(
                                          value: especie,
                                          child: Text(especie.descricao),
                                        );
                                      }
                                  ).toList(),
                                );
                              }
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (arvore.descricao != null) {
                                    Provider.of<PomarDatabase>(context,
                                        listen: false)
                                        .arvoreDAO.addArvore(
                                        ArvoresCompanion(
                                          descricao: Value(
                                            arvore.descricao ?? ''
                                          ),
                                          dataPlantio: Value(
                                            arvore.dataPlantio!
                                          ),
                                          especie: Value(
                                            arvore.especie!
                                          )
                                        )
                                    );
                                    Navigator.of(context)
                                        .pushReplacementNamed('/arvores');
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
