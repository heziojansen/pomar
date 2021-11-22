import 'package:drift/drift.dart';
import 'package:pomar/src/db/pomar_database.dart';

part 'colheita_dao.g.dart';

@DriftAccessor(tables: [Colheitas])
class ColheitaDAO extends DatabaseAccessor<PomarDatabase> with _$ColheitaDAOMixin
{

  ColheitaDAO(PomarDatabase db) : super(db);

}
