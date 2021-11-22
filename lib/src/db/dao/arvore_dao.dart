import 'package:drift/drift.dart';
import 'package:pomar/src/db/pomar_database.dart';

part 'arvore_dao.g.dart';

@DriftAccessor(tables: [Arvores, Especies])
class ArvoreDAO extends DatabaseAccessor<PomarDatabase> with _$ArvoreDAOMixin
{

  Stream<List<Arvore>> watchAll() {
    return (select(arvores)).watch();
  }

  Future addArvore(ArvoresCompanion entry) {
    return into(arvores).insert(entry);
  }

  Future updateArvore(ArvoresCompanion entry) {
    return update(arvores).replace(entry);
  }

  ArvoreDAO(PomarDatabase db) : super(db);

}
