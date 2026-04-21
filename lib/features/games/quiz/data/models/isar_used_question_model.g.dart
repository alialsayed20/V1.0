// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_used_question_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarUsedQuestionModelCollection on Isar {
  IsarCollection<IsarUsedQuestionModel> get isarUsedQuestionModels =>
      this.collection();
}

const IsarUsedQuestionModelSchema = CollectionSchema(
  name: r'IsarUsedQuestionModel',
  id: 7944048150221930645,
  properties: {
    r'questionId': PropertySchema(
      id: 0,
      name: r'questionId',
      type: IsarType.string,
    )
  },
  estimateSize: _isarUsedQuestionModelEstimateSize,
  serialize: _isarUsedQuestionModelSerialize,
  deserialize: _isarUsedQuestionModelDeserialize,
  deserializeProp: _isarUsedQuestionModelDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'questionId': IndexSchema(
      id: 5032123391997384121,
      name: r'questionId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'questionId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _isarUsedQuestionModelGetId,
  getLinks: _isarUsedQuestionModelGetLinks,
  attach: _isarUsedQuestionModelAttach,
  version: '3.1.0+1',
);

int _isarUsedQuestionModelEstimateSize(
  IsarUsedQuestionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.questionId.length * 3;
  return bytesCount;
}

void _isarUsedQuestionModelSerialize(
  IsarUsedQuestionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.questionId);
}

IsarUsedQuestionModel _isarUsedQuestionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarUsedQuestionModel();
  object.isarId = id;
  object.questionId = reader.readString(offsets[0]);
  return object;
}

P _isarUsedQuestionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarUsedQuestionModelGetId(IsarUsedQuestionModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _isarUsedQuestionModelGetLinks(
    IsarUsedQuestionModel object) {
  return [];
}

void _isarUsedQuestionModelAttach(
    IsarCollection<dynamic> col, Id id, IsarUsedQuestionModel object) {
  object.isarId = id;
}

extension IsarUsedQuestionModelByIndex
    on IsarCollection<IsarUsedQuestionModel> {
  Future<IsarUsedQuestionModel?> getByQuestionId(String questionId) {
    return getByIndex(r'questionId', [questionId]);
  }

  IsarUsedQuestionModel? getByQuestionIdSync(String questionId) {
    return getByIndexSync(r'questionId', [questionId]);
  }

  Future<bool> deleteByQuestionId(String questionId) {
    return deleteByIndex(r'questionId', [questionId]);
  }

  bool deleteByQuestionIdSync(String questionId) {
    return deleteByIndexSync(r'questionId', [questionId]);
  }

  Future<List<IsarUsedQuestionModel?>> getAllByQuestionId(
      List<String> questionIdValues) {
    final values = questionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'questionId', values);
  }

  List<IsarUsedQuestionModel?> getAllByQuestionIdSync(
      List<String> questionIdValues) {
    final values = questionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'questionId', values);
  }

  Future<int> deleteAllByQuestionId(List<String> questionIdValues) {
    final values = questionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'questionId', values);
  }

  int deleteAllByQuestionIdSync(List<String> questionIdValues) {
    final values = questionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'questionId', values);
  }

  Future<Id> putByQuestionId(IsarUsedQuestionModel object) {
    return putByIndex(r'questionId', object);
  }

  Id putByQuestionIdSync(IsarUsedQuestionModel object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'questionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByQuestionId(List<IsarUsedQuestionModel> objects) {
    return putAllByIndex(r'questionId', objects);
  }

  List<Id> putAllByQuestionIdSync(List<IsarUsedQuestionModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'questionId', objects, saveLinks: saveLinks);
  }
}

extension IsarUsedQuestionModelQueryWhereSort
    on QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QWhere> {
  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarUsedQuestionModelQueryWhere on QueryBuilder<IsarUsedQuestionModel,
    IsarUsedQuestionModel, QWhereClause> {
  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QAfterWhereClause>
      questionIdEqualTo(String questionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'questionId',
        value: [questionId],
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QAfterWhereClause>
      questionIdNotEqualTo(String questionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'questionId',
              lower: [],
              upper: [questionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'questionId',
              lower: [questionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'questionId',
              lower: [questionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'questionId',
              lower: [],
              upper: [questionId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension IsarUsedQuestionModelQueryFilter on QueryBuilder<
    IsarUsedQuestionModel, IsarUsedQuestionModel, QFilterCondition> {
  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel,
      QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel,
      QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel,
      QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel,
      QAfterFilterCondition> questionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel,
      QAfterFilterCondition> questionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel,
      QAfterFilterCondition> questionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel,
      QAfterFilterCondition> questionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel,
      QAfterFilterCondition> questionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel,
      QAfterFilterCondition> questionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel,
          QAfterFilterCondition>
      questionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel,
          QAfterFilterCondition>
      questionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel,
      QAfterFilterCondition> questionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel,
      QAfterFilterCondition> questionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionId',
        value: '',
      ));
    });
  }
}

extension IsarUsedQuestionModelQueryObject on QueryBuilder<
    IsarUsedQuestionModel, IsarUsedQuestionModel, QFilterCondition> {}

extension IsarUsedQuestionModelQueryLinks on QueryBuilder<IsarUsedQuestionModel,
    IsarUsedQuestionModel, QFilterCondition> {}

extension IsarUsedQuestionModelQuerySortBy
    on QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QSortBy> {
  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QAfterSortBy>
      sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QAfterSortBy>
      sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }
}

extension IsarUsedQuestionModelQuerySortThenBy
    on QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QSortThenBy> {
  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QAfterSortBy>
      thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QAfterSortBy>
      thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }
}

extension IsarUsedQuestionModelQueryWhereDistinct
    on QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QDistinct> {
  QueryBuilder<IsarUsedQuestionModel, IsarUsedQuestionModel, QDistinct>
      distinctByQuestionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId', caseSensitive: caseSensitive);
    });
  }
}

extension IsarUsedQuestionModelQueryProperty on QueryBuilder<
    IsarUsedQuestionModel, IsarUsedQuestionModel, QQueryProperty> {
  QueryBuilder<IsarUsedQuestionModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<IsarUsedQuestionModel, String, QQueryOperations>
      questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }
}
