// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_penalty_state_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarPenaltyStateModelCollection on Isar {
  IsarCollection<IsarPenaltyStateModel> get isarPenaltyStateModels =>
      this.collection();
}

const IsarPenaltyStateModelSchema = CollectionSchema(
  name: r'IsarPenaltyStateModel',
  id: 8150740072213791592,
  properties: {
    r'isBlockedFromCurrentQuestion': PropertySchema(
      id: 0,
      name: r'isBlockedFromCurrentQuestion',
      type: IsarType.bool,
    ),
    r'isEliminated': PropertySchema(
      id: 1,
      name: r'isEliminated',
      type: IsarType.bool,
    ),
    r'redCardCount': PropertySchema(
      id: 2,
      name: r'redCardCount',
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
    r'yellowCardCount': PropertySchema(
      id: 5,
      name: r'yellowCardCount',
      type: IsarType.long,
    )
  },
  estimateSize: _isarPenaltyStateModelEstimateSize,
  serialize: _isarPenaltyStateModelSerialize,
  deserialize: _isarPenaltyStateModelDeserialize,
  deserializeProp: _isarPenaltyStateModelDeserializeProp,
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
  getId: _isarPenaltyStateModelGetId,
  getLinks: _isarPenaltyStateModelGetLinks,
  attach: _isarPenaltyStateModelAttach,
  version: '3.1.0+1',
);

int _isarPenaltyStateModelEstimateSize(
  IsarPenaltyStateModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.sessionId.length * 3;
  bytesCount += 3 + object.teamId.length * 3;
  return bytesCount;
}

void _isarPenaltyStateModelSerialize(
  IsarPenaltyStateModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isBlockedFromCurrentQuestion);
  writer.writeBool(offsets[1], object.isEliminated);
  writer.writeLong(offsets[2], object.redCardCount);
  writer.writeString(offsets[3], object.sessionId);
  writer.writeString(offsets[4], object.teamId);
  writer.writeLong(offsets[5], object.yellowCardCount);
}

IsarPenaltyStateModel _isarPenaltyStateModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarPenaltyStateModel();
  object.isBlockedFromCurrentQuestion = reader.readBool(offsets[0]);
  object.isEliminated = reader.readBool(offsets[1]);
  object.isarId = id;
  object.redCardCount = reader.readLong(offsets[2]);
  object.sessionId = reader.readString(offsets[3]);
  object.teamId = reader.readString(offsets[4]);
  object.yellowCardCount = reader.readLong(offsets[5]);
  return object;
}

P _isarPenaltyStateModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarPenaltyStateModelGetId(IsarPenaltyStateModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _isarPenaltyStateModelGetLinks(
    IsarPenaltyStateModel object) {
  return [];
}

void _isarPenaltyStateModelAttach(
    IsarCollection<dynamic> col, Id id, IsarPenaltyStateModel object) {
  object.isarId = id;
}

extension IsarPenaltyStateModelByIndex
    on IsarCollection<IsarPenaltyStateModel> {
  Future<IsarPenaltyStateModel?> getBySessionIdTeamId(
      String sessionId, String teamId) {
    return getByIndex(r'sessionId_teamId', [sessionId, teamId]);
  }

  IsarPenaltyStateModel? getBySessionIdTeamIdSync(
      String sessionId, String teamId) {
    return getByIndexSync(r'sessionId_teamId', [sessionId, teamId]);
  }

  Future<bool> deleteBySessionIdTeamId(String sessionId, String teamId) {
    return deleteByIndex(r'sessionId_teamId', [sessionId, teamId]);
  }

  bool deleteBySessionIdTeamIdSync(String sessionId, String teamId) {
    return deleteByIndexSync(r'sessionId_teamId', [sessionId, teamId]);
  }

  Future<List<IsarPenaltyStateModel?>> getAllBySessionIdTeamId(
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

  List<IsarPenaltyStateModel?> getAllBySessionIdTeamIdSync(
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

  Future<Id> putBySessionIdTeamId(IsarPenaltyStateModel object) {
    return putByIndex(r'sessionId_teamId', object);
  }

  Id putBySessionIdTeamIdSync(IsarPenaltyStateModel object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'sessionId_teamId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySessionIdTeamId(
      List<IsarPenaltyStateModel> objects) {
    return putAllByIndex(r'sessionId_teamId', objects);
  }

  List<Id> putAllBySessionIdTeamIdSync(List<IsarPenaltyStateModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'sessionId_teamId', objects,
        saveLinks: saveLinks);
  }
}

extension IsarPenaltyStateModelQueryWhereSort
    on QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QWhere> {
  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarPenaltyStateModelQueryWhere on QueryBuilder<IsarPenaltyStateModel,
    IsarPenaltyStateModel, QWhereClause> {
  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterWhereClause>
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterWhereClause>
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterWhereClause>
      sessionIdEqualToAnyTeamId(String sessionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sessionId_teamId',
        value: [sessionId],
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterWhereClause>
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterWhereClause>
      sessionIdTeamIdEqualTo(String sessionId, String teamId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sessionId_teamId',
        value: [sessionId, teamId],
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterWhereClause>
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

extension IsarPenaltyStateModelQueryFilter on QueryBuilder<
    IsarPenaltyStateModel, IsarPenaltyStateModel, QFilterCondition> {
  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> isBlockedFromCurrentQuestionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlockedFromCurrentQuestion',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> isEliminatedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEliminated',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> redCardCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'redCardCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> redCardCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'redCardCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> redCardCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'redCardCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> redCardCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'redCardCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> sessionIdEqualTo(
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> sessionIdGreaterThan(
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> sessionIdLessThan(
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> sessionIdBetween(
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> sessionIdStartsWith(
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> sessionIdEndsWith(
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
          QAfterFilterCondition>
      sessionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sessionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
          QAfterFilterCondition>
      sessionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sessionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> sessionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> sessionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sessionId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> teamIdEqualTo(
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> teamIdGreaterThan(
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> teamIdLessThan(
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> teamIdBetween(
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> teamIdStartsWith(
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> teamIdEndsWith(
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

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
          QAfterFilterCondition>
      teamIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'teamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
          QAfterFilterCondition>
      teamIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'teamId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> teamIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teamId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> teamIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'teamId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> yellowCardCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yellowCardCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> yellowCardCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yellowCardCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> yellowCardCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yellowCardCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel,
      QAfterFilterCondition> yellowCardCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yellowCardCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarPenaltyStateModelQueryObject on QueryBuilder<
    IsarPenaltyStateModel, IsarPenaltyStateModel, QFilterCondition> {}

extension IsarPenaltyStateModelQueryLinks on QueryBuilder<IsarPenaltyStateModel,
    IsarPenaltyStateModel, QFilterCondition> {}

extension IsarPenaltyStateModelQuerySortBy
    on QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QSortBy> {
  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      sortByIsBlockedFromCurrentQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlockedFromCurrentQuestion', Sort.asc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      sortByIsBlockedFromCurrentQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlockedFromCurrentQuestion', Sort.desc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      sortByIsEliminated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEliminated', Sort.asc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      sortByIsEliminatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEliminated', Sort.desc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      sortByRedCardCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'redCardCount', Sort.asc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      sortByRedCardCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'redCardCount', Sort.desc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      sortBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      sortBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      sortByTeamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.asc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      sortByTeamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.desc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      sortByYellowCardCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yellowCardCount', Sort.asc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      sortByYellowCardCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yellowCardCount', Sort.desc);
    });
  }
}

extension IsarPenaltyStateModelQuerySortThenBy
    on QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QSortThenBy> {
  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      thenByIsBlockedFromCurrentQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlockedFromCurrentQuestion', Sort.asc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      thenByIsBlockedFromCurrentQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlockedFromCurrentQuestion', Sort.desc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      thenByIsEliminated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEliminated', Sort.asc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      thenByIsEliminatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEliminated', Sort.desc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      thenByRedCardCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'redCardCount', Sort.asc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      thenByRedCardCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'redCardCount', Sort.desc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      thenBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      thenBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      thenByTeamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.asc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      thenByTeamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.desc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      thenByYellowCardCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yellowCardCount', Sort.asc);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QAfterSortBy>
      thenByYellowCardCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yellowCardCount', Sort.desc);
    });
  }
}

extension IsarPenaltyStateModelQueryWhereDistinct
    on QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QDistinct> {
  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QDistinct>
      distinctByIsBlockedFromCurrentQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBlockedFromCurrentQuestion');
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QDistinct>
      distinctByIsEliminated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEliminated');
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QDistinct>
      distinctByRedCardCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'redCardCount');
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QDistinct>
      distinctBySessionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QDistinct>
      distinctByTeamId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teamId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPenaltyStateModel, IsarPenaltyStateModel, QDistinct>
      distinctByYellowCardCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'yellowCardCount');
    });
  }
}

extension IsarPenaltyStateModelQueryProperty on QueryBuilder<
    IsarPenaltyStateModel, IsarPenaltyStateModel, QQueryProperty> {
  QueryBuilder<IsarPenaltyStateModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<IsarPenaltyStateModel, bool, QQueryOperations>
      isBlockedFromCurrentQuestionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBlockedFromCurrentQuestion');
    });
  }

  QueryBuilder<IsarPenaltyStateModel, bool, QQueryOperations>
      isEliminatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEliminated');
    });
  }

  QueryBuilder<IsarPenaltyStateModel, int, QQueryOperations>
      redCardCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'redCardCount');
    });
  }

  QueryBuilder<IsarPenaltyStateModel, String, QQueryOperations>
      sessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionId');
    });
  }

  QueryBuilder<IsarPenaltyStateModel, String, QQueryOperations>
      teamIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teamId');
    });
  }

  QueryBuilder<IsarPenaltyStateModel, int, QQueryOperations>
      yellowCardCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'yellowCardCount');
    });
  }
}
