// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pomar_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Especie extends DataClass implements Insertable<Especie> {
  final int codigo;
  final String descricao;
  Especie({required this.codigo, required this.descricao});
  factory Especie.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Especie(
      codigo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codigo'])!,
      descricao: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}descricao'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['codigo'] = Variable<int>(codigo);
    map['descricao'] = Variable<String>(descricao);
    return map;
  }

  EspeciesCompanion toCompanion(bool nullToAbsent) {
    return EspeciesCompanion(
      codigo: Value(codigo),
      descricao: Value(descricao),
    );
  }

  factory Especie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Especie(
      codigo: serializer.fromJson<int>(json['codigo']),
      descricao: serializer.fromJson<String>(json['descricao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codigo': serializer.toJson<int>(codigo),
      'descricao': serializer.toJson<String>(descricao),
    };
  }

  Especie copyWith({int? codigo, String? descricao}) => Especie(
        codigo: codigo ?? this.codigo,
        descricao: descricao ?? this.descricao,
      );
  @override
  String toString() {
    return (StringBuffer('Especie(')
          ..write('codigo: $codigo, ')
          ..write('descricao: $descricao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codigo, descricao);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Especie &&
          other.codigo == this.codigo &&
          other.descricao == this.descricao);
}

class EspeciesCompanion extends UpdateCompanion<Especie> {
  final Value<int> codigo;
  final Value<String> descricao;
  const EspeciesCompanion({
    this.codigo = const Value.absent(),
    this.descricao = const Value.absent(),
  });
  EspeciesCompanion.insert({
    this.codigo = const Value.absent(),
    required String descricao,
  }) : descricao = Value(descricao);
  static Insertable<Especie> custom({
    Expression<int>? codigo,
    Expression<String>? descricao,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (descricao != null) 'descricao': descricao,
    });
  }

  EspeciesCompanion copyWith({Value<int>? codigo, Value<String>? descricao}) {
    return EspeciesCompanion(
      codigo: codigo ?? this.codigo,
      descricao: descricao ?? this.descricao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EspeciesCompanion(')
          ..write('codigo: $codigo, ')
          ..write('descricao: $descricao')
          ..write(')'))
        .toString();
  }
}

class $EspeciesTable extends Especies with TableInfo<$EspeciesTable, Especie> {
  final GeneratedDatabase _db;
  final String? _alias;
  $EspeciesTable(this._db, [this._alias]);
  final VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  late final GeneratedColumn<int?> codigo = GeneratedColumn<int?>(
      'codigo', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _descricaoMeta = const VerificationMeta('descricao');
  late final GeneratedColumn<String?> descricao = GeneratedColumn<String?>(
      'descricao', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [codigo, descricao];
  @override
  String get aliasedName => _alias ?? 'especies';
  @override
  String get actualTableName => 'especies';
  @override
  VerificationContext validateIntegrity(Insertable<Especie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    }
    if (data.containsKey('descricao')) {
      context.handle(_descricaoMeta,
          descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta));
    } else if (isInserting) {
      context.missing(_descricaoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  Especie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Especie.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EspeciesTable createAlias(String alias) {
    return $EspeciesTable(_db, alias);
  }
}

class Arvore extends DataClass implements Insertable<Arvore> {
  final int codigo;
  final String descricao;
  final DateTime dataPlantio;
  final int especie;
  Arvore(
      {required this.codigo,
      required this.descricao,
      required this.dataPlantio,
      required this.especie});
  factory Arvore.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Arvore(
      codigo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codigo'])!,
      descricao: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}descricao'])!,
      dataPlantio: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data_plantio'])!,
      especie: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}especie'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['codigo'] = Variable<int>(codigo);
    map['descricao'] = Variable<String>(descricao);
    map['data_plantio'] = Variable<DateTime>(dataPlantio);
    map['especie'] = Variable<int>(especie);
    return map;
  }

  ArvoresCompanion toCompanion(bool nullToAbsent) {
    return ArvoresCompanion(
      codigo: Value(codigo),
      descricao: Value(descricao),
      dataPlantio: Value(dataPlantio),
      especie: Value(especie),
    );
  }

  factory Arvore.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Arvore(
      codigo: serializer.fromJson<int>(json['codigo']),
      descricao: serializer.fromJson<String>(json['descricao']),
      dataPlantio: serializer.fromJson<DateTime>(json['dataPlantio']),
      especie: serializer.fromJson<int>(json['especie']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codigo': serializer.toJson<int>(codigo),
      'descricao': serializer.toJson<String>(descricao),
      'dataPlantio': serializer.toJson<DateTime>(dataPlantio),
      'especie': serializer.toJson<int>(especie),
    };
  }

  Arvore copyWith(
          {int? codigo,
          String? descricao,
          DateTime? dataPlantio,
          int? especie}) =>
      Arvore(
        codigo: codigo ?? this.codigo,
        descricao: descricao ?? this.descricao,
        dataPlantio: dataPlantio ?? this.dataPlantio,
        especie: especie ?? this.especie,
      );
  @override
  String toString() {
    return (StringBuffer('Arvore(')
          ..write('codigo: $codigo, ')
          ..write('descricao: $descricao, ')
          ..write('dataPlantio: $dataPlantio, ')
          ..write('especie: $especie')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codigo, descricao, dataPlantio, especie);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Arvore &&
          other.codigo == this.codigo &&
          other.descricao == this.descricao &&
          other.dataPlantio == this.dataPlantio &&
          other.especie == this.especie);
}

class ArvoresCompanion extends UpdateCompanion<Arvore> {
  final Value<int> codigo;
  final Value<String> descricao;
  final Value<DateTime> dataPlantio;
  final Value<int> especie;
  const ArvoresCompanion({
    this.codigo = const Value.absent(),
    this.descricao = const Value.absent(),
    this.dataPlantio = const Value.absent(),
    this.especie = const Value.absent(),
  });
  ArvoresCompanion.insert({
    this.codigo = const Value.absent(),
    required String descricao,
    required DateTime dataPlantio,
    required int especie,
  })  : descricao = Value(descricao),
        dataPlantio = Value(dataPlantio),
        especie = Value(especie);
  static Insertable<Arvore> custom({
    Expression<int>? codigo,
    Expression<String>? descricao,
    Expression<DateTime>? dataPlantio,
    Expression<int>? especie,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (descricao != null) 'descricao': descricao,
      if (dataPlantio != null) 'data_plantio': dataPlantio,
      if (especie != null) 'especie': especie,
    });
  }

  ArvoresCompanion copyWith(
      {Value<int>? codigo,
      Value<String>? descricao,
      Value<DateTime>? dataPlantio,
      Value<int>? especie}) {
    return ArvoresCompanion(
      codigo: codigo ?? this.codigo,
      descricao: descricao ?? this.descricao,
      dataPlantio: dataPlantio ?? this.dataPlantio,
      especie: especie ?? this.especie,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (dataPlantio.present) {
      map['data_plantio'] = Variable<DateTime>(dataPlantio.value);
    }
    if (especie.present) {
      map['especie'] = Variable<int>(especie.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArvoresCompanion(')
          ..write('codigo: $codigo, ')
          ..write('descricao: $descricao, ')
          ..write('dataPlantio: $dataPlantio, ')
          ..write('especie: $especie')
          ..write(')'))
        .toString();
  }
}

class $ArvoresTable extends Arvores with TableInfo<$ArvoresTable, Arvore> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ArvoresTable(this._db, [this._alias]);
  final VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  late final GeneratedColumn<int?> codigo = GeneratedColumn<int?>(
      'codigo', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _descricaoMeta = const VerificationMeta('descricao');
  late final GeneratedColumn<String?> descricao = GeneratedColumn<String?>(
      'descricao', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _dataPlantioMeta =
      const VerificationMeta('dataPlantio');
  late final GeneratedColumn<DateTime?> dataPlantio =
      GeneratedColumn<DateTime?>('data_plantio', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _especieMeta = const VerificationMeta('especie');
  late final GeneratedColumn<int?> especie = GeneratedColumn<int?>(
      'especie', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES especies(codigo)');
  @override
  List<GeneratedColumn> get $columns =>
      [codigo, descricao, dataPlantio, especie];
  @override
  String get aliasedName => _alias ?? 'arvores';
  @override
  String get actualTableName => 'arvores';
  @override
  VerificationContext validateIntegrity(Insertable<Arvore> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    }
    if (data.containsKey('descricao')) {
      context.handle(_descricaoMeta,
          descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta));
    } else if (isInserting) {
      context.missing(_descricaoMeta);
    }
    if (data.containsKey('data_plantio')) {
      context.handle(
          _dataPlantioMeta,
          dataPlantio.isAcceptableOrUnknown(
              data['data_plantio']!, _dataPlantioMeta));
    } else if (isInserting) {
      context.missing(_dataPlantioMeta);
    }
    if (data.containsKey('especie')) {
      context.handle(_especieMeta,
          especie.isAcceptableOrUnknown(data['especie']!, _especieMeta));
    } else if (isInserting) {
      context.missing(_especieMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  Arvore map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Arvore.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ArvoresTable createAlias(String alias) {
    return $ArvoresTable(_db, alias);
  }
}

class Grupo extends DataClass implements Insertable<Grupo> {
  final int codigo;
  final String nome;
  final String descricao;
  final String arvores;
  Grupo(
      {required this.codigo,
      required this.nome,
      required this.descricao,
      required this.arvores});
  factory Grupo.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Grupo(
      codigo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codigo'])!,
      nome: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nome'])!,
      descricao: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}descricao'])!,
      arvores: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}arvores'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['codigo'] = Variable<int>(codigo);
    map['nome'] = Variable<String>(nome);
    map['descricao'] = Variable<String>(descricao);
    map['arvores'] = Variable<String>(arvores);
    return map;
  }

  GruposCompanion toCompanion(bool nullToAbsent) {
    return GruposCompanion(
      codigo: Value(codigo),
      nome: Value(nome),
      descricao: Value(descricao),
      arvores: Value(arvores),
    );
  }

  factory Grupo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Grupo(
      codigo: serializer.fromJson<int>(json['codigo']),
      nome: serializer.fromJson<String>(json['nome']),
      descricao: serializer.fromJson<String>(json['descricao']),
      arvores: serializer.fromJson<String>(json['arvores']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codigo': serializer.toJson<int>(codigo),
      'nome': serializer.toJson<String>(nome),
      'descricao': serializer.toJson<String>(descricao),
      'arvores': serializer.toJson<String>(arvores),
    };
  }

  Grupo copyWith(
          {int? codigo, String? nome, String? descricao, String? arvores}) =>
      Grupo(
        codigo: codigo ?? this.codigo,
        nome: nome ?? this.nome,
        descricao: descricao ?? this.descricao,
        arvores: arvores ?? this.arvores,
      );
  @override
  String toString() {
    return (StringBuffer('Grupo(')
          ..write('codigo: $codigo, ')
          ..write('nome: $nome, ')
          ..write('descricao: $descricao, ')
          ..write('arvores: $arvores')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codigo, nome, descricao, arvores);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Grupo &&
          other.codigo == this.codigo &&
          other.nome == this.nome &&
          other.descricao == this.descricao &&
          other.arvores == this.arvores);
}

class GruposCompanion extends UpdateCompanion<Grupo> {
  final Value<int> codigo;
  final Value<String> nome;
  final Value<String> descricao;
  final Value<String> arvores;
  const GruposCompanion({
    this.codigo = const Value.absent(),
    this.nome = const Value.absent(),
    this.descricao = const Value.absent(),
    this.arvores = const Value.absent(),
  });
  GruposCompanion.insert({
    this.codigo = const Value.absent(),
    required String nome,
    required String descricao,
    required String arvores,
  })  : nome = Value(nome),
        descricao = Value(descricao),
        arvores = Value(arvores);
  static Insertable<Grupo> custom({
    Expression<int>? codigo,
    Expression<String>? nome,
    Expression<String>? descricao,
    Expression<String>? arvores,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (nome != null) 'nome': nome,
      if (descricao != null) 'descricao': descricao,
      if (arvores != null) 'arvores': arvores,
    });
  }

  GruposCompanion copyWith(
      {Value<int>? codigo,
      Value<String>? nome,
      Value<String>? descricao,
      Value<String>? arvores}) {
    return GruposCompanion(
      codigo: codigo ?? this.codigo,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      arvores: arvores ?? this.arvores,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (arvores.present) {
      map['arvores'] = Variable<String>(arvores.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GruposCompanion(')
          ..write('codigo: $codigo, ')
          ..write('nome: $nome, ')
          ..write('descricao: $descricao, ')
          ..write('arvores: $arvores')
          ..write(')'))
        .toString();
  }
}

class $GruposTable extends Grupos with TableInfo<$GruposTable, Grupo> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GruposTable(this._db, [this._alias]);
  final VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  late final GeneratedColumn<int?> codigo = GeneratedColumn<int?>(
      'codigo', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  late final GeneratedColumn<String?> nome = GeneratedColumn<String?>(
      'nome', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _descricaoMeta = const VerificationMeta('descricao');
  late final GeneratedColumn<String?> descricao = GeneratedColumn<String?>(
      'descricao', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _arvoresMeta = const VerificationMeta('arvores');
  late final GeneratedColumn<String?> arvores = GeneratedColumn<String?>(
      'arvores', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1, maxTextLength: 1023),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [codigo, nome, descricao, arvores];
  @override
  String get aliasedName => _alias ?? 'grupos';
  @override
  String get actualTableName => 'grupos';
  @override
  VerificationContext validateIntegrity(Insertable<Grupo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('descricao')) {
      context.handle(_descricaoMeta,
          descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta));
    } else if (isInserting) {
      context.missing(_descricaoMeta);
    }
    if (data.containsKey('arvores')) {
      context.handle(_arvoresMeta,
          arvores.isAcceptableOrUnknown(data['arvores']!, _arvoresMeta));
    } else if (isInserting) {
      context.missing(_arvoresMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  Grupo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Grupo.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GruposTable createAlias(String alias) {
    return $GruposTable(_db, alias);
  }
}

class Colheita extends DataClass implements Insertable<Colheita> {
  final int codigo;
  final String informacoes;
  final DateTime data;
  final double pesoBruto;
  final int arvore;
  Colheita(
      {required this.codigo,
      required this.informacoes,
      required this.data,
      required this.pesoBruto,
      required this.arvore});
  factory Colheita.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Colheita(
      codigo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codigo'])!,
      informacoes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}informacoes'])!,
      data: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data'])!,
      pesoBruto: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}peso_bruto'])!,
      arvore: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}arvore'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['codigo'] = Variable<int>(codigo);
    map['informacoes'] = Variable<String>(informacoes);
    map['data'] = Variable<DateTime>(data);
    map['peso_bruto'] = Variable<double>(pesoBruto);
    map['arvore'] = Variable<int>(arvore);
    return map;
  }

  ColheitasCompanion toCompanion(bool nullToAbsent) {
    return ColheitasCompanion(
      codigo: Value(codigo),
      informacoes: Value(informacoes),
      data: Value(data),
      pesoBruto: Value(pesoBruto),
      arvore: Value(arvore),
    );
  }

  factory Colheita.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Colheita(
      codigo: serializer.fromJson<int>(json['codigo']),
      informacoes: serializer.fromJson<String>(json['informacoes']),
      data: serializer.fromJson<DateTime>(json['data']),
      pesoBruto: serializer.fromJson<double>(json['pesoBruto']),
      arvore: serializer.fromJson<int>(json['arvore']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codigo': serializer.toJson<int>(codigo),
      'informacoes': serializer.toJson<String>(informacoes),
      'data': serializer.toJson<DateTime>(data),
      'pesoBruto': serializer.toJson<double>(pesoBruto),
      'arvore': serializer.toJson<int>(arvore),
    };
  }

  Colheita copyWith(
          {int? codigo,
          String? informacoes,
          DateTime? data,
          double? pesoBruto,
          int? arvore}) =>
      Colheita(
        codigo: codigo ?? this.codigo,
        informacoes: informacoes ?? this.informacoes,
        data: data ?? this.data,
        pesoBruto: pesoBruto ?? this.pesoBruto,
        arvore: arvore ?? this.arvore,
      );
  @override
  String toString() {
    return (StringBuffer('Colheita(')
          ..write('codigo: $codigo, ')
          ..write('informacoes: $informacoes, ')
          ..write('data: $data, ')
          ..write('pesoBruto: $pesoBruto, ')
          ..write('arvore: $arvore')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codigo, informacoes, data, pesoBruto, arvore);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Colheita &&
          other.codigo == this.codigo &&
          other.informacoes == this.informacoes &&
          other.data == this.data &&
          other.pesoBruto == this.pesoBruto &&
          other.arvore == this.arvore);
}

class ColheitasCompanion extends UpdateCompanion<Colheita> {
  final Value<int> codigo;
  final Value<String> informacoes;
  final Value<DateTime> data;
  final Value<double> pesoBruto;
  final Value<int> arvore;
  const ColheitasCompanion({
    this.codigo = const Value.absent(),
    this.informacoes = const Value.absent(),
    this.data = const Value.absent(),
    this.pesoBruto = const Value.absent(),
    this.arvore = const Value.absent(),
  });
  ColheitasCompanion.insert({
    this.codigo = const Value.absent(),
    required String informacoes,
    required DateTime data,
    required double pesoBruto,
    required int arvore,
  })  : informacoes = Value(informacoes),
        data = Value(data),
        pesoBruto = Value(pesoBruto),
        arvore = Value(arvore);
  static Insertable<Colheita> custom({
    Expression<int>? codigo,
    Expression<String>? informacoes,
    Expression<DateTime>? data,
    Expression<double>? pesoBruto,
    Expression<int>? arvore,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (informacoes != null) 'informacoes': informacoes,
      if (data != null) 'data': data,
      if (pesoBruto != null) 'peso_bruto': pesoBruto,
      if (arvore != null) 'arvore': arvore,
    });
  }

  ColheitasCompanion copyWith(
      {Value<int>? codigo,
      Value<String>? informacoes,
      Value<DateTime>? data,
      Value<double>? pesoBruto,
      Value<int>? arvore}) {
    return ColheitasCompanion(
      codigo: codigo ?? this.codigo,
      informacoes: informacoes ?? this.informacoes,
      data: data ?? this.data,
      pesoBruto: pesoBruto ?? this.pesoBruto,
      arvore: arvore ?? this.arvore,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (informacoes.present) {
      map['informacoes'] = Variable<String>(informacoes.value);
    }
    if (data.present) {
      map['data'] = Variable<DateTime>(data.value);
    }
    if (pesoBruto.present) {
      map['peso_bruto'] = Variable<double>(pesoBruto.value);
    }
    if (arvore.present) {
      map['arvore'] = Variable<int>(arvore.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ColheitasCompanion(')
          ..write('codigo: $codigo, ')
          ..write('informacoes: $informacoes, ')
          ..write('data: $data, ')
          ..write('pesoBruto: $pesoBruto, ')
          ..write('arvore: $arvore')
          ..write(')'))
        .toString();
  }
}

class $ColheitasTable extends Colheitas
    with TableInfo<$ColheitasTable, Colheita> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ColheitasTable(this._db, [this._alias]);
  final VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  late final GeneratedColumn<int?> codigo = GeneratedColumn<int?>(
      'codigo', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _informacoesMeta =
      const VerificationMeta('informacoes');
  late final GeneratedColumn<String?> informacoes = GeneratedColumn<String?>(
      'informacoes', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1, maxTextLength: 1023),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _dataMeta = const VerificationMeta('data');
  late final GeneratedColumn<DateTime?> data = GeneratedColumn<DateTime?>(
      'data', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _pesoBrutoMeta = const VerificationMeta('pesoBruto');
  late final GeneratedColumn<double?> pesoBruto = GeneratedColumn<double?>(
      'peso_bruto', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _arvoreMeta = const VerificationMeta('arvore');
  late final GeneratedColumn<int?> arvore = GeneratedColumn<int?>(
      'arvore', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [codigo, informacoes, data, pesoBruto, arvore];
  @override
  String get aliasedName => _alias ?? 'colheitas';
  @override
  String get actualTableName => 'colheitas';
  @override
  VerificationContext validateIntegrity(Insertable<Colheita> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    }
    if (data.containsKey('informacoes')) {
      context.handle(
          _informacoesMeta,
          informacoes.isAcceptableOrUnknown(
              data['informacoes']!, _informacoesMeta));
    } else if (isInserting) {
      context.missing(_informacoesMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('peso_bruto')) {
      context.handle(_pesoBrutoMeta,
          pesoBruto.isAcceptableOrUnknown(data['peso_bruto']!, _pesoBrutoMeta));
    } else if (isInserting) {
      context.missing(_pesoBrutoMeta);
    }
    if (data.containsKey('arvore')) {
      context.handle(_arvoreMeta,
          arvore.isAcceptableOrUnknown(data['arvore']!, _arvoreMeta));
    } else if (isInserting) {
      context.missing(_arvoreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  Colheita map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Colheita.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ColheitasTable createAlias(String alias) {
    return $ColheitasTable(_db, alias);
  }
}

class Usuario extends DataClass implements Insertable<Usuario> {
  final String codigo;
  final String usuario;
  final String senha;
  Usuario({required this.codigo, required this.usuario, required this.senha});
  factory Usuario.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Usuario(
      codigo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codigo'])!,
      usuario: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}usuario'])!,
      senha: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}senha'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['codigo'] = Variable<String>(codigo);
    map['usuario'] = Variable<String>(usuario);
    map['senha'] = Variable<String>(senha);
    return map;
  }

  UsuariosCompanion toCompanion(bool nullToAbsent) {
    return UsuariosCompanion(
      codigo: Value(codigo),
      usuario: Value(usuario),
      senha: Value(senha),
    );
  }

  factory Usuario.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Usuario(
      codigo: serializer.fromJson<String>(json['codigo']),
      usuario: serializer.fromJson<String>(json['usuario']),
      senha: serializer.fromJson<String>(json['senha']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codigo': serializer.toJson<String>(codigo),
      'usuario': serializer.toJson<String>(usuario),
      'senha': serializer.toJson<String>(senha),
    };
  }

  Usuario copyWith({String? codigo, String? usuario, String? senha}) => Usuario(
        codigo: codigo ?? this.codigo,
        usuario: usuario ?? this.usuario,
        senha: senha ?? this.senha,
      );
  @override
  String toString() {
    return (StringBuffer('Usuario(')
          ..write('codigo: $codigo, ')
          ..write('usuario: $usuario, ')
          ..write('senha: $senha')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codigo, usuario, senha);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Usuario &&
          other.codigo == this.codigo &&
          other.usuario == this.usuario &&
          other.senha == this.senha);
}

class UsuariosCompanion extends UpdateCompanion<Usuario> {
  final Value<String> codigo;
  final Value<String> usuario;
  final Value<String> senha;
  const UsuariosCompanion({
    this.codigo = const Value.absent(),
    this.usuario = const Value.absent(),
    this.senha = const Value.absent(),
  });
  UsuariosCompanion.insert({
    this.codigo = const Value.absent(),
    required String usuario,
    required String senha,
  })  : usuario = Value(usuario),
        senha = Value(senha);
  static Insertable<Usuario> custom({
    Expression<String>? codigo,
    Expression<String>? usuario,
    Expression<String>? senha,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (usuario != null) 'usuario': usuario,
      if (senha != null) 'senha': senha,
    });
  }

  UsuariosCompanion copyWith(
      {Value<String>? codigo, Value<String>? usuario, Value<String>? senha}) {
    return UsuariosCompanion(
      codigo: codigo ?? this.codigo,
      usuario: usuario ?? this.usuario,
      senha: senha ?? this.senha,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<String>(codigo.value);
    }
    if (usuario.present) {
      map['usuario'] = Variable<String>(usuario.value);
    }
    if (senha.present) {
      map['senha'] = Variable<String>(senha.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsuariosCompanion(')
          ..write('codigo: $codigo, ')
          ..write('usuario: $usuario, ')
          ..write('senha: $senha')
          ..write(')'))
        .toString();
  }
}

class $UsuariosTable extends Usuarios with TableInfo<$UsuariosTable, Usuario> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UsuariosTable(this._db, [this._alias]);
  final VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  late final GeneratedColumn<String?> codigo = GeneratedColumn<String?>(
      'codigo', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  final VerificationMeta _usuarioMeta = const VerificationMeta('usuario');
  late final GeneratedColumn<String?> usuario = GeneratedColumn<String?>(
      'usuario', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _senhaMeta = const VerificationMeta('senha');
  late final GeneratedColumn<String?> senha = GeneratedColumn<String?>(
      'senha', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [codigo, usuario, senha];
  @override
  String get aliasedName => _alias ?? 'usuarios';
  @override
  String get actualTableName => 'usuarios';
  @override
  VerificationContext validateIntegrity(Insertable<Usuario> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    }
    if (data.containsKey('usuario')) {
      context.handle(_usuarioMeta,
          usuario.isAcceptableOrUnknown(data['usuario']!, _usuarioMeta));
    } else if (isInserting) {
      context.missing(_usuarioMeta);
    }
    if (data.containsKey('senha')) {
      context.handle(
          _senhaMeta, senha.isAcceptableOrUnknown(data['senha']!, _senhaMeta));
    } else if (isInserting) {
      context.missing(_senhaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  Usuario map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Usuario.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UsuariosTable createAlias(String alias) {
    return $UsuariosTable(_db, alias);
  }
}

abstract class _$PomarDatabase extends GeneratedDatabase {
  _$PomarDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $EspeciesTable especies = $EspeciesTable(this);
  late final $ArvoresTable arvores = $ArvoresTable(this);
  late final $GruposTable grupos = $GruposTable(this);
  late final $ColheitasTable colheitas = $ColheitasTable(this);
  late final $UsuariosTable usuarios = $UsuariosTable(this);
  late final EspecieDAO especieDAO = EspecieDAO(this as PomarDatabase);
  late final ArvoreDAO arvoreDAO = ArvoreDAO(this as PomarDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [especies, arvores, grupos, colheitas, usuarios];
}
