// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patientTodo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPatientTodoModelCollection on Isar {
  IsarCollection<PatientTodoModel> get patientTodoModels => this.collection();
}

const PatientTodoModelSchema = CollectionSchema(
  name: r'PatientTodoModel',
  id: -5481294779159249923,
  properties: {
    r'done': PropertySchema(
      id: 0,
      name: r'done',
      type: IsarType.bool,
    ),
    r'patientId': PropertySchema(
      id: 1,
      name: r'patientId',
      type: IsarType.long,
    ),
    r'todoId': PropertySchema(
      id: 2,
      name: r'todoId',
      type: IsarType.long,
    )
  },
  estimateSize: _patientTodoModelEstimateSize,
  serialize: _patientTodoModelSerialize,
  deserialize: _patientTodoModelDeserialize,
  deserializeProp: _patientTodoModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'patientId': IndexSchema(
      id: 403389457658259617,
      name: r'patientId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'patientId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'todoId': IndexSchema(
      id: 4266691497494727738,
      name: r'todoId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'todoId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _patientTodoModelGetId,
  getLinks: _patientTodoModelGetLinks,
  attach: _patientTodoModelAttach,
  version: '3.1.0',
);

int _patientTodoModelEstimateSize(
  PatientTodoModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _patientTodoModelSerialize(
  PatientTodoModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.done);
  writer.writeLong(offsets[1], object.patientId);
  writer.writeLong(offsets[2], object.todoId);
}

PatientTodoModel _patientTodoModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PatientTodoModel();
  object.done = reader.readBoolOrNull(offsets[0]);
  object.id = id;
  object.patientId = reader.readLongOrNull(offsets[1]);
  object.todoId = reader.readLongOrNull(offsets[2]);
  return object;
}

P _patientTodoModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _patientTodoModelGetId(PatientTodoModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _patientTodoModelGetLinks(PatientTodoModel object) {
  return [];
}

void _patientTodoModelAttach(
    IsarCollection<dynamic> col, Id id, PatientTodoModel object) {
  object.id = id;
}

extension PatientTodoModelQueryWhereSort
    on QueryBuilder<PatientTodoModel, PatientTodoModel, QWhere> {
  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhere> anyPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'patientId'),
      );
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhere> anyTodoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'todoId'),
      );
    });
  }
}

extension PatientTodoModelQueryWhere
    on QueryBuilder<PatientTodoModel, PatientTodoModel, QWhereClause> {
  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      patientIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'patientId',
        value: [null],
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      patientIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'patientId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      patientIdEqualTo(int? patientId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'patientId',
        value: [patientId],
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      patientIdNotEqualTo(int? patientId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [],
              upper: [patientId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [patientId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [patientId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [],
              upper: [patientId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      patientIdGreaterThan(
    int? patientId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'patientId',
        lower: [patientId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      patientIdLessThan(
    int? patientId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'patientId',
        lower: [],
        upper: [patientId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      patientIdBetween(
    int? lowerPatientId,
    int? upperPatientId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'patientId',
        lower: [lowerPatientId],
        includeLower: includeLower,
        upper: [upperPatientId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      todoIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'todoId',
        value: [null],
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      todoIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'todoId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      todoIdEqualTo(int? todoId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'todoId',
        value: [todoId],
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      todoIdNotEqualTo(int? todoId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'todoId',
              lower: [],
              upper: [todoId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'todoId',
              lower: [todoId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'todoId',
              lower: [todoId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'todoId',
              lower: [],
              upper: [todoId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      todoIdGreaterThan(
    int? todoId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'todoId',
        lower: [todoId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      todoIdLessThan(
    int? todoId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'todoId',
        lower: [],
        upper: [todoId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterWhereClause>
      todoIdBetween(
    int? lowerTodoId,
    int? upperTodoId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'todoId',
        lower: [lowerTodoId],
        includeLower: includeLower,
        upper: [upperTodoId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PatientTodoModelQueryFilter
    on QueryBuilder<PatientTodoModel, PatientTodoModel, QFilterCondition> {
  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      doneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'done',
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      doneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'done',
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      doneEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'done',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      patientIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'patientId',
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      patientIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'patientId',
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      patientIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'patientId',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      patientIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'patientId',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      patientIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'patientId',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      patientIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'patientId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      todoIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'todoId',
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      todoIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'todoId',
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      todoIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todoId',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      todoIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'todoId',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      todoIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'todoId',
        value: value,
      ));
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterFilterCondition>
      todoIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'todoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PatientTodoModelQueryObject
    on QueryBuilder<PatientTodoModel, PatientTodoModel, QFilterCondition> {}

extension PatientTodoModelQueryLinks
    on QueryBuilder<PatientTodoModel, PatientTodoModel, QFilterCondition> {}

extension PatientTodoModelQuerySortBy
    on QueryBuilder<PatientTodoModel, PatientTodoModel, QSortBy> {
  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterSortBy> sortByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.asc);
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterSortBy>
      sortByDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.desc);
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterSortBy>
      sortByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.asc);
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterSortBy>
      sortByPatientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.desc);
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterSortBy>
      sortByTodoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoId', Sort.asc);
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterSortBy>
      sortByTodoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoId', Sort.desc);
    });
  }
}

extension PatientTodoModelQuerySortThenBy
    on QueryBuilder<PatientTodoModel, PatientTodoModel, QSortThenBy> {
  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterSortBy> thenByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.asc);
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterSortBy>
      thenByDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'done', Sort.desc);
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterSortBy>
      thenByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.asc);
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterSortBy>
      thenByPatientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.desc);
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterSortBy>
      thenByTodoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoId', Sort.asc);
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QAfterSortBy>
      thenByTodoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoId', Sort.desc);
    });
  }
}

extension PatientTodoModelQueryWhereDistinct
    on QueryBuilder<PatientTodoModel, PatientTodoModel, QDistinct> {
  QueryBuilder<PatientTodoModel, PatientTodoModel, QDistinct> distinctByDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'done');
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QDistinct>
      distinctByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'patientId');
    });
  }

  QueryBuilder<PatientTodoModel, PatientTodoModel, QDistinct>
      distinctByTodoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'todoId');
    });
  }
}

extension PatientTodoModelQueryProperty
    on QueryBuilder<PatientTodoModel, PatientTodoModel, QQueryProperty> {
  QueryBuilder<PatientTodoModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PatientTodoModel, bool?, QQueryOperations> doneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'done');
    });
  }

  QueryBuilder<PatientTodoModel, int?, QQueryOperations> patientIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'patientId');
    });
  }

  QueryBuilder<PatientTodoModel, int?, QQueryOperations> todoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'todoId');
    });
  }
}
