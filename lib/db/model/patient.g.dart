// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPatientCollection on Isar {
  IsarCollection<Patient> get patients => this.collection();
}

const PatientSchema = CollectionSchema(
  name: r'Patient',
  id: -3057427754190339924,
  properties: {
    r'hn': PropertySchema(
      id: 0,
      name: r'hn',
      type: IsarType.string,
    )
  },
  estimateSize: _patientEstimateSize,
  serialize: _patientSerialize,
  deserialize: _patientDeserialize,
  deserializeProp: _patientDeserializeProp,
  idName: r'id',
  indexes: {
    r'hn': IndexSchema(
      id: 7240396015325355821,
      name: r'hn',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'hn',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _patientGetId,
  getLinks: _patientGetLinks,
  attach: _patientAttach,
  version: '3.1.0',
);

int _patientEstimateSize(
  Patient object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.hn;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _patientSerialize(
  Patient object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.hn);
}

Patient _patientDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Patient();
  object.hn = reader.readStringOrNull(offsets[0]);
  object.id = id;
  return object;
}

P _patientDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _patientGetId(Patient object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _patientGetLinks(Patient object) {
  return [];
}

void _patientAttach(IsarCollection<dynamic> col, Id id, Patient object) {
  object.id = id;
}

extension PatientQueryWhereSort on QueryBuilder<Patient, Patient, QWhere> {
  QueryBuilder<Patient, Patient, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhere> anyHn() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'hn'),
      );
    });
  }
}

extension PatientQueryWhere on QueryBuilder<Patient, Patient, QWhereClause> {
  QueryBuilder<Patient, Patient, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Patient, Patient, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> idBetween(
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

  QueryBuilder<Patient, Patient, QAfterWhereClause> hnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'hn',
        value: [null],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> hnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'hn',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> hnEqualTo(String? hn) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'hn',
        value: [hn],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> hnNotEqualTo(String? hn) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hn',
              lower: [],
              upper: [hn],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hn',
              lower: [hn],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hn',
              lower: [hn],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hn',
              lower: [],
              upper: [hn],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> hnGreaterThan(
    String? hn, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'hn',
        lower: [hn],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> hnLessThan(
    String? hn, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'hn',
        lower: [],
        upper: [hn],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> hnBetween(
    String? lowerHn,
    String? upperHn, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'hn',
        lower: [lowerHn],
        includeLower: includeLower,
        upper: [upperHn],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> hnStartsWith(
      String HnPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'hn',
        lower: [HnPrefix],
        upper: ['$HnPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> hnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'hn',
        value: [''],
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterWhereClause> hnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'hn',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'hn',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'hn',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'hn',
              upper: [''],
            ));
      }
    });
  }
}

extension PatientQueryFilter
    on QueryBuilder<Patient, Patient, QFilterCondition> {
  QueryBuilder<Patient, Patient, QAfterFilterCondition> hnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hn',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> hnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hn',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> hnEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> hnGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> hnLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> hnBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> hnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> hnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> hnContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> hnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> hnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hn',
        value: '',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> hnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hn',
        value: '',
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Patient, Patient, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Patient, Patient, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Patient, Patient, QAfterFilterCondition> idBetween(
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
}

extension PatientQueryObject
    on QueryBuilder<Patient, Patient, QFilterCondition> {}

extension PatientQueryLinks
    on QueryBuilder<Patient, Patient, QFilterCondition> {}

extension PatientQuerySortBy on QueryBuilder<Patient, Patient, QSortBy> {
  QueryBuilder<Patient, Patient, QAfterSortBy> sortByHn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hn', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> sortByHnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hn', Sort.desc);
    });
  }
}

extension PatientQuerySortThenBy
    on QueryBuilder<Patient, Patient, QSortThenBy> {
  QueryBuilder<Patient, Patient, QAfterSortBy> thenByHn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hn', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByHnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hn', Sort.desc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Patient, Patient, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension PatientQueryWhereDistinct
    on QueryBuilder<Patient, Patient, QDistinct> {
  QueryBuilder<Patient, Patient, QDistinct> distinctByHn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hn', caseSensitive: caseSensitive);
    });
  }
}

extension PatientQueryProperty
    on QueryBuilder<Patient, Patient, QQueryProperty> {
  QueryBuilder<Patient, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Patient, String?, QQueryOperations> hnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hn');
    });
  }
}
