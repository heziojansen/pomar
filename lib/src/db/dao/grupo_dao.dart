import 'package:drift/drift.dart';
import 'package:pomar/src/db/pomar_database.dart';

part 'grupo_dao.g.dart';

@DriftAccessor(tables: [Grupos])
class GrupoDAO extends DatabaseAccessor<PomarDatabase> with _$GrupoDAOMixin
{

  GrupoDAO(PomarDatabase db) : super(db);

}
