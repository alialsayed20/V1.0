// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_question_round_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarQuestionRoundModelCollection on Isar {
  IsarCollection<IsarQuestionRoundModel> get isarQuestionRoundModels =>
      this.collection();
}

const IsarQuestionRoundModelSchema = CollectionSchema(
  name: r'IsarQuestionRoundModel',
  id: -6804181961557004257,
  properties: {
    r'answerOrder': PropertySchema(
      id: 0,
      name: r'answerOrder',
      type: IsarType.stringList,
    ),
    r'blockedTeamIds': PropertySchema(
      id: 1,
      name: r'blockedTeamIds',
      type: IsarType.stringList,
    ),
    r'boardCellId': PropertySchema(
      id: 2,
      name: r'boardCellId',
      type: IsarType.string,
    ),
    r'isStealBlocked': PropertySchema(
      id: 3,
      name: r'isStealBlocked',
      type: IsarType.bool,
    ),
    r'questionId': PropertySchema(
      id: 4,
      name: r'questionId',
      type: IsarType.string,
    ),
    r'sessionId': PropertySchema(
      id: 5,
      name: r'sessionId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.string,
    ),
    r'stealingTeamId': PropertySchema(
      id: 7,
      name: r'stealingTeamId',
      type: IsarType.string,
    ),
    r'winningTeamId': PropertySchema(
      id: 8,
      name: r'winningTeamId',
      type: IsarType.string,
    )
  },
  estimateSize: _isarQuestionRoundModelEstimateSize,
  serialize: _isarQuestionRoundModelSerialize,
  deserialize: _isarQuestionRoundModelDeserialize,
  deserializeProp: _isarQuestionRoundModelDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'sessionId': IndexSchema(
      id: 6949518585047923839,
      name: r'sessionId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'sessionId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _isarQuestionRoundModelGetId,
  getLinks: _isarQuestionRoundModelGetLinks,
  attach: _isarQuestionRoundModelAttach,
  version: '3.1.0+1',
);

int _isarQuestionRoundModelEstimateSize(
  IsarQuestionRoundModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.answerOrder.length * 3;
  {
    for (var i = 0; i < object.answerOrder.length; i++) {
      final value = object.answerOrder[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.blockedTeamIds.length * 3;
  {
    for (var i = 0; i < object.blockedTeamIds.length; i++) {
      final value = object.blockedTeamIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.boardCellId.length * 3;
  bytesCount += 3 + object.questionId.length * 3;
  bytesCount += 3 + object.sessionId.length * 3;
  bytesCount += 3 + object.status.length * 3;
  {
    final value = object.stealingTeamId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.winningTeamId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarQuestionRoundModelSerialize(
  IsarQuestionRoundModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.answerOrder);
  writer.writeStringList(offsets[1], object.blockedTeamIds);
  writer.writeString(offsets[2], object.boardCellId);
  writer.writeBool(offsets[3], object.isStealBlocked);
  writer.writeString(offsets[4], object.questionId);
  writer.writeString(offsets[5], object.sessionId);
  writer.writeString(offsets[6], object.status);
  writer.writeString(offsets[7], object.stealingTeamId);
  writer.writeString(offsets[8], object.winningTeamId);
}

IsarQuestionRoundModel _isarQuestionRoundModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarQuestionRoundModel();
  object.answerOrder = reader.readStringList(offsets[0]) ?? [];
  object.blockedTeamIds = reader.readStringList(offsets[1]) ?? [];
  object.boardCellId = reader.readString(offsets[2]);
  object.isStealBlocked = reader.readBool(offsets[3]);
  object.isarId = id;
  object.questionId = reader.readString(offsets[4]);
  object.sessionId = reader.readString(offsets[5]);
  object.status = reader.readString(offsets[6]);
  object.stealingTeamId = reader.readStringOrNull(offsets[7]);
  object.winningTeamId = reader.readStringOrNull(offsets[8]);
  return object;
}

P _isarQuestionRoundModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarQuestionRoundModelGetId(IsarQuestionRoundModel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _isarQuestionRoundModelGetLinks(
    IsarQuestionRoundModel object) {
  return [];
}

void _isarQuestionRoundModelAttach(
    IsarCollection<dynamic> col, Id id, IsarQuestionRoundModel object) {
  object.isarId = id;
}

extension IsarQuestionRoundModelByIndex
    on IsarCollection<IsarQuestionRoundModel> {
  Future<IsarQuestionRoundModel?> getBySessionId(String sessionId) {
    return getByIndex(r'sessionId', [sessionId]);
  }

  IsarQuestionRoundModel? getBySessionIdSync(String sessionId) {
    return getByIndexSync(r'sessionId', [sessionId]);
  }

  Future<bool> deleteBySessionId(String sessionId) {
    return deleteByIndex(r'sessionId', [sessionId]);
  }

  bool deleteBySessionIdSync(String sessionId) {
    return deleteByIndexSync(r'sessionId', [sessionId]);
  }

  Future<List<IsarQuestionRoundModel?>> getAllBySessionId(
      List<String> sessionIdValues) {
    final values = sessionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'sessionId', values);
  }

  List<IsarQuestionRoundModel?> getAllBySessionIdSync(
      List<String> sessionIdValues) {
    final values = sessionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'sessionId', values);
  }

  Future<int> deleteAllBySessionId(List<String> sessionIdValues) {
    final values = sessionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'sessionId', values);
  }

  int deleteAllBySessionIdSync(List<String> sessionIdValues) {
    final values = sessionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'sessionId', values);
  }

  Future<Id> putBySessionId(IsarQuestionRoundModel object) {
    return putByIndex(r'sessionId', object);
  }

  Id putBySessionIdSync(IsarQuestionRoundModel object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'sessionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySessionId(List<IsarQuestionRoundModel> objects) {
    return putAllByIndex(r'sessionId', objects);
  }

  List<Id> putAllBySessionIdSync(List<IsarQuestionRoundModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'sessionId', objects, saveLinks: saveLinks);
  }
}

extension IsarQuestionRoundModelQueryWhereSort
    on QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QWhere> {
  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarQuestionRoundModelQueryWhere on QueryBuilder<
    IsarQuestionRoundModel, IsarQuestionRoundModel, QWhereClause> {
  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterWhereClause> isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterWhereClause> isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterWhereClause> sessionIdEqualTo(String sessionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sessionId',
        value: [sessionId],
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterWhereClause> sessionIdNotEqualTo(String sessionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId',
              lower: [],
              upper: [sessionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId',
              lower: [sessionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId',
              lower: [sessionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sessionId',
              lower: [],
              upper: [sessionId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension IsarQuestionRoundModelQueryFilter on QueryBuilder<
    IsarQuestionRoundModel, IsarQuestionRoundModel, QFilterCondition> {
  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> answerOrderElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerOrder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> answerOrderElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answerOrder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> answerOrderElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answerOrder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> answerOrderElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answerOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> answerOrderElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answerOrder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> answerOrderElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answerOrder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
          QAfterFilterCondition>
      answerOrderElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answerOrder',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
          QAfterFilterCondition>
      answerOrderElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answerOrder',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> answerOrderElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerOrder',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> answerOrderElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answerOrder',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> answerOrderLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answerOrder',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> answerOrderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answerOrder',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> answerOrderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answerOrder',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> answerOrderLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answerOrder',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> answerOrderLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answerOrder',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> answerOrderLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answerOrder',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> blockedTeamIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockedTeamIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> blockedTeamIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockedTeamIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> blockedTeamIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockedTeamIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> blockedTeamIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockedTeamIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> blockedTeamIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'blockedTeamIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> blockedTeamIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'blockedTeamIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
          QAfterFilterCondition>
      blockedTeamIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'blockedTeamIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
          QAfterFilterCondition>
      blockedTeamIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'blockedTeamIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> blockedTeamIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockedTeamIds',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> blockedTeamIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'blockedTeamIds',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> blockedTeamIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blockedTeamIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> blockedTeamIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blockedTeamIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> blockedTeamIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blockedTeamIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> blockedTeamIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blockedTeamIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> blockedTeamIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blockedTeamIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> blockedTeamIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'blockedTeamIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> boardCellIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'boardCellId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> boardCellIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'boardCellId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> boardCellIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'boardCellId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> boardCellIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'boardCellId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> boardCellIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'boardCellId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> boardCellIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'boardCellId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
          QAfterFilterCondition>
      boardCellIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'boardCellId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
          QAfterFilterCondition>
      boardCellIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'boardCellId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> boardCellIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'boardCellId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> boardCellIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'boardCellId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> isStealBlockedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isStealBlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> questionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> questionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
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

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> sessionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sessionId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> sessionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sessionId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
          QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
          QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> stealingTeamIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stealingTeamId',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> stealingTeamIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stealingTeamId',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> stealingTeamIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stealingTeamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> stealingTeamIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stealingTeamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> stealingTeamIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stealingTeamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> stealingTeamIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stealingTeamId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> stealingTeamIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stealingTeamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> stealingTeamIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stealingTeamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
          QAfterFilterCondition>
      stealingTeamIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stealingTeamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
          QAfterFilterCondition>
      stealingTeamIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stealingTeamId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> stealingTeamIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stealingTeamId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> stealingTeamIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stealingTeamId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> winningTeamIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'winningTeamId',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> winningTeamIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'winningTeamId',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> winningTeamIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winningTeamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> winningTeamIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'winningTeamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> winningTeamIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'winningTeamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> winningTeamIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'winningTeamId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> winningTeamIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'winningTeamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> winningTeamIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'winningTeamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
          QAfterFilterCondition>
      winningTeamIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'winningTeamId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
          QAfterFilterCondition>
      winningTeamIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'winningTeamId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> winningTeamIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'winningTeamId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel,
      QAfterFilterCondition> winningTeamIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'winningTeamId',
        value: '',
      ));
    });
  }
}

extension IsarQuestionRoundModelQueryObject on QueryBuilder<
    IsarQuestionRoundModel, IsarQuestionRoundModel, QFilterCondition> {}

extension IsarQuestionRoundModelQueryLinks on QueryBuilder<
    IsarQuestionRoundModel, IsarQuestionRoundModel, QFilterCondition> {}

extension IsarQuestionRoundModelQuerySortBy
    on QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QSortBy> {
  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      sortByBoardCellId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boardCellId', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      sortByBoardCellIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boardCellId', Sort.desc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      sortByIsStealBlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStealBlocked', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      sortByIsStealBlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStealBlocked', Sort.desc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      sortBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      sortBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      sortByStealingTeamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stealingTeamId', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      sortByStealingTeamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stealingTeamId', Sort.desc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      sortByWinningTeamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winningTeamId', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      sortByWinningTeamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winningTeamId', Sort.desc);
    });
  }
}

extension IsarQuestionRoundModelQuerySortThenBy on QueryBuilder<
    IsarQuestionRoundModel, IsarQuestionRoundModel, QSortThenBy> {
  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenByBoardCellId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boardCellId', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenByBoardCellIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'boardCellId', Sort.desc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenByIsStealBlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStealBlocked', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenByIsStealBlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStealBlocked', Sort.desc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenByStealingTeamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stealingTeamId', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenByStealingTeamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stealingTeamId', Sort.desc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenByWinningTeamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winningTeamId', Sort.asc);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QAfterSortBy>
      thenByWinningTeamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'winningTeamId', Sort.desc);
    });
  }
}

extension IsarQuestionRoundModelQueryWhereDistinct
    on QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QDistinct> {
  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QDistinct>
      distinctByAnswerOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'answerOrder');
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QDistinct>
      distinctByBlockedTeamIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockedTeamIds');
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QDistinct>
      distinctByBoardCellId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'boardCellId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QDistinct>
      distinctByIsStealBlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isStealBlocked');
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QDistinct>
      distinctByQuestionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QDistinct>
      distinctBySessionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QDistinct>
      distinctByStealingTeamId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stealingTeamId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarQuestionRoundModel, IsarQuestionRoundModel, QDistinct>
      distinctByWinningTeamId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'winningTeamId',
          caseSensitive: caseSensitive);
    });
  }
}

extension IsarQuestionRoundModelQueryProperty on QueryBuilder<
    IsarQuestionRoundModel, IsarQuestionRoundModel, QQueryProperty> {
  QueryBuilder<IsarQuestionRoundModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<IsarQuestionRoundModel, List<String>, QQueryOperations>
      answerOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answerOrder');
    });
  }

  QueryBuilder<IsarQuestionRoundModel, List<String>, QQueryOperations>
      blockedTeamIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockedTeamIds');
    });
  }

  QueryBuilder<IsarQuestionRoundModel, String, QQueryOperations>
      boardCellIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'boardCellId');
    });
  }

  QueryBuilder<IsarQuestionRoundModel, bool, QQueryOperations>
      isStealBlockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isStealBlocked');
    });
  }

  QueryBuilder<IsarQuestionRoundModel, String, QQueryOperations>
      questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }

  QueryBuilder<IsarQuestionRoundModel, String, QQueryOperations>
      sessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionId');
    });
  }

  QueryBuilder<IsarQuestionRoundModel, String, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<IsarQuestionRoundModel, String?, QQueryOperations>
      stealingTeamIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stealingTeamId');
    });
  }

  QueryBuilder<IsarQuestionRoundModel, String?, QQueryOperations>
      winningTeamIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'winningTeamId');
    });
  }
}
