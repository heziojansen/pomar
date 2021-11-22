import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:pomar/src/db/dao/arvore_dao.dart';
import 'package:pomar/src/db/dao/especie_dao.dart';
import 'package:uuid/uuid.dart';

part 'pomar_database.g.dart';

final _uuid = Uuid();

class Especies extends Table {
  IntColumn get codigo => integer().autoIncrement()();
  TextColumn get descricao => text().withLength(min: 1, max: 255)();
}

class Arvores extends Table {
  IntColumn get codigo => integer().autoIncrement()();
  TextColumn get descricao => text().withLength(min: 1, max: 255)();
  DateTimeColumn get dataPlantio => dateTime()();
  IntColumn get especie =>
      integer().customConstraint('REFERENCES especies(codigo)')();
}

class Grupos extends Table {
  IntColumn get codigo => integer().autoIncrement()();
  TextColumn get nome => text().withLength(min: 1, max: 255)();
  TextColumn get descricao => text().withLength(min: 1, max: 255)();
  TextColumn get arvores => text().withLength(min: 1, max: 1023)();
}

class Colheitas extends Table {
  IntColumn get codigo => integer().autoIncrement()();
  TextColumn get informacoes => text().withLength(min: 1, max: 1023)();
  DateTimeColumn get data => dateTime()();
  RealColumn get pesoBruto => real()();
  IntColumn get arvore => integer()();
}

class Usuarios extends Table {
  TextColumn get codigo => text().clientDefault(() => _uuid.v4())();
  TextColumn? get usuario => text()();
  TextColumn? get senha => text()();

  @override
  Set<Column> get primaryKey => {codigo};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Especies, Arvores, Grupos, Colheitas, Usuarios],
    daos: [EspecieDAO, ArvoreDAO])
class PomarDatabase extends _$PomarDatabase {

  static PomarDatabase instance = PomarDatabase();

  PomarDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
