// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_helper_usage_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarHelperUsageModelCollection on Isar {
  IsarCollection<IsarHelperUsageModel> get isarHelperUsageModels =>
      this.collection();
}

const IsarHelperUsageModelSchema = CollectionSchema(
  name: r'IsarHelperUsageModel',
  id: 8457551574214420515,
  properties: {
    r'sessionId': PropertySchema(
      id: 0,
      name: r'sessionId',
      type: IsarType.string,
    ),
    r'teamId': PropertySchema(
      id: 1,
      name: r'teamId',
      type: IsarType.string,
    ),
    r'usedHelpers': PropertySchema(
      id: 2,
      name: r'usedHelpers',
      type: IsarType.stringList,
    )
  },
  estimateSize: _isarHelperUsageModelEstimateSize,
  serialize: _isarHelperUsageModelSerialize,
  deserialize: _isarHelperUsageModelDeserialize,
  deserializeProp: _isarHelperUsageModelDeserializeProp,
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
  getId: _isarHelperUsageModelGetId,
  getLinks: _isarHelperUsageModelGetLinks,
  attach: _isarHelperUsageModelAttach,
  version: '3.1.0+1',
);

int _isarHelperUsageModelEstimateSize(
  IsarHelperUsageModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.sessionId.length * 3;
  bytesCount += 3 + object.teamId.length * 3;
  bytesCount += 3 + object.usedHelpers.length * 3;
  {
    for (var i = 0; i < object.usedHelpers.length; i++) {
      final value = object.usedHelpers[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _isarHelperUsageModelSerialize(
  IsarHelperUsageModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.sessionId);
  writer.writeString(offsets[1], object.teamId);
  writer.writeStringList(offsets[2], object.usedHelpers);
}

IsarHelperUsageModel _isarHelperUsageModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarHelperUsageModel();
  object.isarId = id;
  object.sessionId = reader.readString(offsets[0]);
  object.teamId = reader.readString(offsets[1]);
  object.usedHelpers = reader.readStringList(offsets[2]) ?? [];
  return object;
}

P _isarHelperUsageModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarHelperUsageModelGetId(IsarHelperUsageModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _isarHelperUsageModelGetLinks(
    IsarHelperUsageModel object) {
  return [];
}

void _isarHelperUsageModelAttach(
    IsarCollection<dynamic> col, Id id, IsarHelperUsageModel object) {
  object.isarId = id;
}

extension IsarHelperUsageModelByIndex on IsarCollection<IsarHelperUsageModel> {
  Future<IsarHelperUsageModel?> getBySessionIdTeamId(
      String sessionId, String teamId) {
    return getByIndex(r'sessionId_teamId', [sessionId, teamId]);
  }

  IsarHelperUsageModel? getBySessionIdTeamIdSync(
      String sessionId, String teamId) {
    return getByIndexSync(r'sessionId_teamId', [sessionId, teamId]);
  }

  Future<bool> deleteBySessionIdTeamId(String sessionId, String teamId) {
    return deleteByIndex(r'sessionId_teamId', [sessionId, teamId]);
  }

  bool deleteBySessionIdTeamIdSync(String sessionId, String teamId) {
    return deleteByIndexSync(r'sessionId_teamId', [sessionId, teamId]);
  }

  Future<List<IsarHelperUsageModel?>> getAllBySessionIdTeamId(
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

  List<IsarHelperUsageModel?> getAllBySessionIdTeamIdSync(
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

  Future<Id> putBySessionIdTeamId(IsarHelperUsageModel object) {
    return putByIndex(r'sessionId_teamId', object);
  }

  Id putBySessionIdTeamIdSync(IsarHelperUsageModel object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'sessionId_teamId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySessionIdTeamId(List<IsarHelperUsageModel> objects) {
    return putAllByIndex(r'sessionId_teamId', objects);
  }

  List<Id> putAllBySessionIdTeamIdSync(List<IsarHelperUsageModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'sessionId_teamId', objects,
        saveLinks: saveLinks);
  }
}

extension IsarHelperUsageModelQueryWhereSort
    on QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QWhere> {
  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarHelperUsageModelQueryWhere
    on QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QWhereClause> {
  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterWhereClause>
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterWhereClause>
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterWhereClause>
      sessionIdEqualToAnyTeamId(String sessionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sessionId_teamId',
        value: [sessionId],
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterWhereClause>
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterWhereClause>
      sessionIdTeamIdEqualTo(String sessionId, String teamId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sessionId_teamId',
        value: [sessionId, teamId],
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterWhereClause>
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

extension IsarHelperUsageModelQueryFilter on QueryBuilder<IsarHelperUsageModel,
    IsarHelperUsageModel, QFilterCondition> {
  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> sessionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> sessionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sessionId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
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

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> teamIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'teamId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> teamIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'teamId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> usedHelpersElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usedHelpers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> usedHelpersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usedHelpers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> usedHelpersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usedHelpers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> usedHelpersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usedHelpers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> usedHelpersElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'usedHelpers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> usedHelpersElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'usedHelpers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
          QAfterFilterCondition>
      usedHelpersElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'usedHelpers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
          QAfterFilterCondition>
      usedHelpersElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'usedHelpers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> usedHelpersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usedHelpers',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> usedHelpersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'usedHelpers',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> usedHelpersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedHelpers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> usedHelpersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedHelpers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> usedHelpersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedHelpers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> usedHelpersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedHelpers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> usedHelpersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedHelpers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel,
      QAfterFilterCondition> usedHelpersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedHelpers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension IsarHelperUsageModelQueryObject on QueryBuilder<IsarHelperUsageModel,
    IsarHelperUsageModel, QFilterCondition> {}

extension IsarHelperUsageModelQueryLinks on QueryBuilder<IsarHelperUsageModel,
    IsarHelperUsageModel, QFilterCondition> {}

extension IsarHelperUsageModelQuerySortBy
    on QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QSortBy> {
  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterSortBy>
      sortBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterSortBy>
      sortBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterSortBy>
      sortByTeamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.asc);
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterSortBy>
      sortByTeamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.desc);
    });
  }
}

extension IsarHelperUsageModelQuerySortThenBy
    on QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QSortThenBy> {
  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterSortBy>
      thenBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterSortBy>
      thenBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterSortBy>
      thenByTeamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.asc);
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QAfterSortBy>
      thenByTeamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'teamId', Sort.desc);
    });
  }
}

extension IsarHelperUsageModelQueryWhereDistinct
    on QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QDistinct> {
  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QDistinct>
      distinctBySessionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QDistinct>
      distinctByTeamId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'teamId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarHelperUsageModel, IsarHelperUsageModel, QDistinct>
      distinctByUsedHelpers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usedHelpers');
    });
  }
}

extension IsarHelperUsageModelQueryProperty on QueryBuilder<
    IsarHelperUsageModel, IsarHelperUsageModel, QQueryProperty> {
  QueryBuilder<IsarHelperUsageModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<IsarHelperUsageModel, String, QQueryOperations>
      sessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionId');
    });
  }

  QueryBuilder<IsarHelperUsageModel, String, QQueryOperations>
      teamIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'teamId');
    });
  }

  QueryBuilder<IsarHelperUsageModel, List<String>, QQueryOperations>
      usedHelpersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usedHelpers');
    });
  }
}
