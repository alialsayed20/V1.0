// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_score_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarScoreModelCollection on Isar {
  IsarCollection<IsarScoreModel> get isarScoreModels => this.collection();
}

const IsarScoreModelSchema = CollectionSchema(
  name: r'IsarScoreModel',
  id: -5435798837894284522,
  properties: {
    r'correctAnswersCount': PropertySchema(
      id: 0,
      name: r'correctAnswersCount',
      type: IsarType.long,
    ),
    r'isWinner': PropertySchema(
      id: 1,
      name: r'isWinner',
      type: IsarType.bool,
    ),
    r'score': PropertySchema(
      id: 2,
      name: r'score',
      type: IsarType.long,
    ),
    r'sessionId': PropertySchema(
      id: 3,
      name: r'sessionId',
      type: IsarType.string,
    ),
    r'teamId': PropertySchema(
      id: 4,
      name: r'teamId',
      type: IsarType.string,
    ),
    r'unansweredCellsCount': PropertySchema(
      id: 5,
      name: r'unansweredCellsCount',
      type: IsarType.long,
    ),
    r'wrongAnswersCount': PropertySchema(
      id: 6,
      name: r'wrongAnswersCount',
      type: IsarType.long,
    )
  },
  estimateSize: _isarScoreModelEstimateSize,
  serialize: _isarScoreModelSerialize,
  deserialize: _isarScoreModelDeserialize,
  deserializeProp: _isarScoreModelDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'sessionId_teamId': IndexSchema(
      id: -2792347720531295003,
      name: r'sessionId_teamId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'sessionId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'teamId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _isarScoreModelGetId,
  getLinks: _isarScoreModelGetLinks,
  attach: _isarScoreModelAttach,
  version: '3.1.0+1',
);

int _isarScoreModelEstimateSize(
  IsarScoreModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.sessionId.length * 3;
  bytesCount += 3 + object.teamId.length * 3;
  return bytesCount;
}

void _isarScoreModelSerialize(
  IsarScoreModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.correctAnswersCount);
  writer.writeBool(offsets[1], object.isWinner);
  writer.writeLong(offsets[2], object.score);
  writer.writeString(offsets[3], object.sessionId);
  writer.writeString(offsets[4], object.teamId);
  writer.writeLong(offsets[5], object.unansweredCellsCount);
  writer.writeLong(offsets[6], object.wrongAnswersCount);
}

IsarScoreModel _isarScoreModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarScoreModel();
  object.correctAnswersCount = reader.readLong(offsets[0]);
  object.isWinner = reader.readBool(offsets[1]);
  object.isarId = id;
  object.score = reader.readLong(offsets[2]);
  object.sessionId = reader.readString(offsets[3]);
  object.teamId = reader.readString(offsets[4]);
  object.unansweredCellsCount = reader.readLong(offsets[5]);
  object.wrongAnswersCount = reader.readLong(offsets[6]);
  return object;
}

P _isarScoreModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarScoreModelGetId(IsarScoreModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _isarScoreModelGetLinks(IsarScoreModel object) {
  return [];
}

void _isarScoreModelAttach(
    IsarCollection<dynamic> col, Id id, IsarScoreModel object) {
  object.isarId = id;
}

extension IsarScoreModelByIndex on IsarCollection<IsarScoreModel> {
  Future<IsarScoreModel?> getBySessionIdTeamId(
      String sessionId, String teamId) {
    return getByIndex(r'sessionId_teamId', [sessionId, teamId]);
  }

  IsarScoreModel? getBySessionIdTeamIdSync(String sessionId, String teamId) {
    return getByIndexSync(r'sessionId_teamId', [sessionId, teamId]);
  }

  Future<bool> deleteBySessionIdTeamId(String sessionId, String teamId) {
    return deleteByIndex(r'sessionId_teamId', [sessionId, teamId]);
  }

  bool deleteBySessionIdTeamIdSync(String sessionId, String teamId) {
    return deleteByIndexSync(r'sessionId_teamId', [sessionId, teamId]);
  }

  Future<List<IsarScoreModel?>> getAllBySessionIdTeamId(
      List<String> sessionIdValues, List<String> teamIdValues) {
    final len = sessionIdValues.length;
    assert(teamIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([sessionIdValues[i], teamIdValues[i]]);
    }

    return getAllByIndex(r'sessionId_teamId', values);
  }

  List<IsarScoreModel?> getAllBySessionIdTeamIdSync(
      List<String> sessionIdValues, List<String> teamIdValues) {
    final len = sessionIdValues.length;
    assert(teamIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([sessionIdValues[i], teamIdValues[i]]);
    }

    return getAllByIndexSync(r'sessionId_teamId', values);
  }

  Future<int> deleteAllBySessionIdTeamId(
      List<String> sessionIdValues, List<String> teamIdValues) {
    final len = sessionIdValues.length;
    assert(teamIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([sessionIdValues[i], teamIdValues[i]]);
    }

    return deleteAllByIndex(r'sessionId_teamId', values);
  }

  int deleteAllBySessionIdTeamIdSync(
      List<String> sessionIdValues, List<String> teamIdValues) {
    final len = sessionIdValues.length;
    assert(teamIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([sessionIdValues[i], teamIdValues[i]]);
    }

    return deleteAllByIndexSync(r'sessionId_teamId', values);
  }

  Future<Id> putBySessionIdTeamId(IsarScoreModel object) {
    return putByIndex(r'sessionId_teamId', object);
  }

  Id putBySessionIdTeamIdSync(IsarScoreModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'sessionId_teamId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySessionIdTeamId(List<IsarScoreModel> objects) {
    return putAllByIndex(r'sessionId_teamId', objects);
  }

  List<Id> putAllBySessionIdTeamIdSync(List<IsarScoreModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'sessionId_teamId', objects,
        saveLinks: saveLinks);
  }
}

extension IsarScoreModelQueryWhereSort
    on QueryBuilder<IsarScoreModel, IsarScoreModel, QWhere> {
  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarScoreModelQueryWhere
    on QueryBuilder<IsarScoreModel, IsarScoreModel, QWhereClause> {
  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterWhereClause>
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

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterWhereClause>
      sessionIdEqualToAnyTeamId(String sessionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sessionId_teamId',
        value: [sessionId],
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterWhereClause>
      sessionIdNotEqualToAnyTeamId(String sessionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId_teamId',
              lower: [],
              upper: [sessionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId_teamId',
              lower: [sessionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId_teamId',
              lower: [sessionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId_teamId',
              lower: [],
              upper: [sessionId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterWhereClause>
      sessionIdTeamIdEqualTo(String sessionId, String teamId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sessionId_teamId',
        value: [sessionId, teamId],
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterWhereClause>
      sessionIdEqualToTeamIdNotEqualTo(String sessionId, String teamId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId_teamId',
              lower: [sessionId],
              upper: [sessionId, teamId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId_teamId',
              lower: [sessionId, teamId],
              includeLower: false,
              upper: [sessionId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId_teamId',
              lower: [sessionId, teamId],
              includeLower: false,
              upper: [sessionId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId_teamId',
              lower: [sessionId],
              upper: [sessionId, teamId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension IsarScoreModelQueryFilter
    on QueryBuilder<IsarScoreModel, IsarScoreModel, QFilterCondition> {
  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      correctAnswersCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswersCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      correctAnswersCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctAnswersCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      correctAnswersCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctAnswersCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      correctAnswersCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctAnswersCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      isWinnerEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWinner',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      isarIdGreaterThan(
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

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      isarIdLessThan(
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

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      isarIdBetween(
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

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      scoreEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      scoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      scoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      scoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      sessionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      sessionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      sessionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      sessionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sessionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      sessionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      sessionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      sessionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      sessionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sessionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      sessionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      sessionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sessionId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      teamIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      teamIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'teamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      teamIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'teamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      teamIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'teamId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      teamIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'teamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      teamIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'teamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      teamIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'teamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      teamIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'teamId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      teamIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teamId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      teamIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'teamId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      unansweredCellsCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unansweredCellsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      unansweredCellsCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unansweredCellsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      unansweredCellsCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unansweredCellsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      unansweredCellsCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unansweredCellsCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      wrongAnswersCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wrongAnswersCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      wrongAnswersCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wrongAnswersCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      wrongAnswersCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wrongAnswersCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterFilterCondition>
      wrongAnswersCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wrongAnswersCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarScoreModelQueryObject
    on QueryBuilder<IsarScoreModel, IsarScoreModel, QFilterCondition> {}

extension IsarScoreModelQueryLinks
    on QueryBuilder<IsarScoreModel, IsarScoreModel, QFilterCondition> {}

extension IsarScoreModelQuerySortBy
    on QueryBuilder<IsarScoreModel, IsarScoreModel, QSortBy> {
  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      sortByCorrectAnswersCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswersCount', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      sortByCorrectAnswersCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswersCount', Sort.desc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy> sortByIsWinner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWinner', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      sortByIsWinnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWinner', Sort.desc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy> sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy> sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy> sortBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      sortBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy> sortByTeamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      sortByTeamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.desc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      sortByUnansweredCellsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unansweredCellsCount', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      sortByUnansweredCellsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unansweredCellsCount', Sort.desc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      sortByWrongAnswersCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongAnswersCount', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      sortByWrongAnswersCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongAnswersCount', Sort.desc);
    });
  }
}

extension IsarScoreModelQuerySortThenBy
    on QueryBuilder<IsarScoreModel, IsarScoreModel, QSortThenBy> {
  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      thenByCorrectAnswersCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswersCount', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      thenByCorrectAnswersCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswersCount', Sort.desc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy> thenByIsWinner() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWinner', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      thenByIsWinnerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWinner', Sort.desc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy> thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy> thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy> thenBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      thenBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy> thenByTeamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      thenByTeamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.desc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      thenByUnansweredCellsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unansweredCellsCount', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      thenByUnansweredCellsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unansweredCellsCount', Sort.desc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      thenByWrongAnswersCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongAnswersCount', Sort.asc);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QAfterSortBy>
      thenByWrongAnswersCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrongAnswersCount', Sort.desc);
    });
  }
}

extension IsarScoreModelQueryWhereDistinct
    on QueryBuilder<IsarScoreModel, IsarScoreModel, QDistinct> {
  QueryBuilder<IsarScoreModel, IsarScoreModel, QDistinct>
      distinctByCorrectAnswersCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctAnswersCount');
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QDistinct> distinctByIsWinner() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWinner');
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QDistinct> distinctByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score');
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QDistinct> distinctBySessionId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QDistinct> distinctByTeamId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teamId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QDistinct>
      distinctByUnansweredCellsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unansweredCellsCount');
    });
  }

  QueryBuilder<IsarScoreModel, IsarScoreModel, QDistinct>
      distinctByWrongAnswersCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wrongAnswersCount');
    });
  }
}

extension IsarScoreModelQueryProperty
    on QueryBuilder<IsarScoreModel, IsarScoreModel, QQueryProperty> {
  QueryBuilder<IsarScoreModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<IsarScoreModel, int, QQueryOperations>
      correctAnswersCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctAnswersCount');
    });
  }

  QueryBuilder<IsarScoreModel, bool, QQueryOperations> isWinnerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWinner');
    });
  }

  QueryBuilder<IsarScoreModel, int, QQueryOperations> scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }

  QueryBuilder<IsarScoreModel, String, QQueryOperations> sessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionId');
    });
  }

  QueryBuilder<IsarScoreModel, String, QQueryOperations> teamIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teamId');
    });
  }

  QueryBuilder<IsarScoreModel, int, QQueryOperations>
      unansweredCellsCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unansweredCellsCount');
    });
  }

  QueryBuilder<IsarScoreModel, int, QQueryOperations>
      wrongAnswersCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wrongAnswersCount');
    });
  }
}
