import 'package:drift/drift.dart';
import 'package:pomar/src/db/pomar_database.dart';

part 'especie_dao.g.dart';

@DriftAccessor(tables: [Especies])
class EspecieDAO extends DatabaseAccessor<PomarDatabase> with _$EspecieDAOMixin
{

  Stream<List<Especie>> watchAll() {
    return (select(especies)).watch();
  }

  Future addEspecie(EspeciesCompanion entry) {
    return into(especies).insert(entry);
  }

  Future updateEspecie(EspeciesCompanion entry) {
    return update(especies).replace(entry);
  }

  EspecieDAO(PomarDatabase db) : super(db);

}
