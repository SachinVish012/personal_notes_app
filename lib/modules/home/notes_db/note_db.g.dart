// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_db.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotesDbCollection on Isar {
  IsarCollection<NotesDb> get notesDbs => this.collection();
}

const NotesDbSchema = CollectionSchema(
  name: r'NotesDb',
  id: 1782281775217790297,
  properties: {
    r'notesListDb': PropertySchema(
      id: 0,
      name: r'notesListDb',
      type: IsarType.objectList,
      target: r'NotesDBModel',
    )
  },
  estimateSize: _notesDbEstimateSize,
  serialize: _notesDbSerialize,
  deserialize: _notesDbDeserialize,
  deserializeProp: _notesDbDeserializeProp,
  idName: r'sRNumber',
  indexes: {},
  links: {},
  embeddedSchemas: {r'NotesDBModel': NotesDBModelSchema},
  getId: _notesDbGetId,
  getLinks: _notesDbGetLinks,
  attach: _notesDbAttach,
  version: '3.1.0+1',
);

int _notesDbEstimateSize(
  NotesDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.notesListDb;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[NotesDBModel]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              NotesDBModelSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _notesDbSerialize(
  NotesDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<NotesDBModel>(
    offsets[0],
    allOffsets,
    NotesDBModelSchema.serialize,
    object.notesListDb,
  );
}

NotesDb _notesDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotesDb(
    notesListDb: reader.readObjectList<NotesDBModel>(
      offsets[0],
      NotesDBModelSchema.deserialize,
      allOffsets,
      NotesDBModel(),
    ),
  );
  object.sRNumber = id;
  return object;
}

P _notesDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<NotesDBModel>(
        offset,
        NotesDBModelSchema.deserialize,
        allOffsets,
        NotesDBModel(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _notesDbGetId(NotesDb object) {
  return object.sRNumber;
}

List<IsarLinkBase<dynamic>> _notesDbGetLinks(NotesDb object) {
  return [];
}

void _notesDbAttach(IsarCollection<dynamic> col, Id id, NotesDb object) {
  object.sRNumber = id;
}

extension NotesDbQueryWhereSort on QueryBuilder<NotesDb, NotesDb, QWhere> {
  QueryBuilder<NotesDb, NotesDb, QAfterWhere> anySRNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NotesDbQueryWhere on QueryBuilder<NotesDb, NotesDb, QWhereClause> {
  QueryBuilder<NotesDb, NotesDb, QAfterWhereClause> sRNumberEqualTo(
      Id sRNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: sRNumber,
        upper: sRNumber,
      ));
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterWhereClause> sRNumberNotEqualTo(
      Id sRNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: sRNumber, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: sRNumber, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: sRNumber, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: sRNumber, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterWhereClause> sRNumberGreaterThan(
      Id sRNumber,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: sRNumber, includeLower: include),
      );
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterWhereClause> sRNumberLessThan(
      Id sRNumber,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: sRNumber, includeUpper: include),
      );
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterWhereClause> sRNumberBetween(
    Id lowerSRNumber,
    Id upperSRNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerSRNumber,
        includeLower: includeLower,
        upper: upperSRNumber,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NotesDbQueryFilter
    on QueryBuilder<NotesDb, NotesDb, QFilterCondition> {
  QueryBuilder<NotesDb, NotesDb, QAfterFilterCondition> notesListDbIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notesListDb',
      ));
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterFilterCondition> notesListDbIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notesListDb',
      ));
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterFilterCondition>
      notesListDbLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notesListDb',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterFilterCondition> notesListDbIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notesListDb',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterFilterCondition>
      notesListDbIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notesListDb',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterFilterCondition>
      notesListDbLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notesListDb',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterFilterCondition>
      notesListDbLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notesListDb',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterFilterCondition>
      notesListDbLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'notesListDb',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterFilterCondition> sRNumberEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sRNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterFilterCondition> sRNumberGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sRNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterFilterCondition> sRNumberLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sRNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterFilterCondition> sRNumberBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sRNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NotesDbQueryObject
    on QueryBuilder<NotesDb, NotesDb, QFilterCondition> {
  QueryBuilder<NotesDb, NotesDb, QAfterFilterCondition> notesListDbElement(
      FilterQuery<NotesDBModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'notesListDb');
    });
  }
}

extension NotesDbQueryLinks
    on QueryBuilder<NotesDb, NotesDb, QFilterCondition> {}

extension NotesDbQuerySortBy on QueryBuilder<NotesDb, NotesDb, QSortBy> {}

extension NotesDbQuerySortThenBy
    on QueryBuilder<NotesDb, NotesDb, QSortThenBy> {
  QueryBuilder<NotesDb, NotesDb, QAfterSortBy> thenBySRNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sRNumber', Sort.asc);
    });
  }

  QueryBuilder<NotesDb, NotesDb, QAfterSortBy> thenBySRNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sRNumber', Sort.desc);
    });
  }
}

extension NotesDbQueryWhereDistinct
    on QueryBuilder<NotesDb, NotesDb, QDistinct> {}

extension NotesDbQueryProperty
    on QueryBuilder<NotesDb, NotesDb, QQueryProperty> {
  QueryBuilder<NotesDb, int, QQueryOperations> sRNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sRNumber');
    });
  }

  QueryBuilder<NotesDb, List<NotesDBModel>?, QQueryOperations>
      notesListDbProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notesListDb');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NotesDBModelSchema = Schema(
  name: r'NotesDBModel',
  id: 5577639369243498236,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 1,
      name: r'notes',
      type: IsarType.string,
    ),
    r'updatedOn': PropertySchema(
      id: 2,
      name: r'updatedOn',
      type: IsarType.string,
    )
  },
  estimateSize: _notesDBModelEstimateSize,
  serialize: _notesDBModelSerialize,
  deserialize: _notesDBModelDeserialize,
  deserializeProp: _notesDBModelDeserializeProp,
);

int _notesDBModelEstimateSize(
  NotesDBModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.notes.length * 3;
  bytesCount += 3 + object.updatedOn.length * 3;
  return bytesCount;
}

void _notesDBModelSerialize(
  NotesDBModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
  writer.writeString(offsets[1], object.notes);
  writer.writeString(offsets[2], object.updatedOn);
}

NotesDBModel _notesDBModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotesDBModel(
    id: reader.readStringOrNull(offsets[0]) ?? '',
    notes: reader.readStringOrNull(offsets[1]) ?? '',
    updatedOn: reader.readStringOrNull(offsets[2]) ?? '',
  );
  return object;
}

P _notesDBModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 2:
      return (reader.readStringOrNull(offset) ?? '') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension NotesDBModelQueryFilter
    on QueryBuilder<NotesDBModel, NotesDBModel, QFilterCondition> {
  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> notesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      notesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> notesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> notesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      updatedOnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedOn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      updatedOnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedOn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      updatedOnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedOn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      updatedOnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedOn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      updatedOnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'updatedOn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      updatedOnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'updatedOn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      updatedOnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'updatedOn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      updatedOnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'updatedOn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      updatedOnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedOn',
        value: '',
      ));
    });
  }

  QueryBuilder<NotesDBModel, NotesDBModel, QAfterFilterCondition>
      updatedOnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'updatedOn',
        value: '',
      ));
    });
  }
}

extension NotesDBModelQueryObject
    on QueryBuilder<NotesDBModel, NotesDBModel, QFilterCondition> {}
