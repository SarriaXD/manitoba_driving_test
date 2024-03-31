// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizzes_history_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuizHistoryEntityCollection on Isar {
  IsarCollection<QuizHistoryEntity> get quizHistoryEntitys => this.collection();
}

const QuizHistoryEntitySchema = CollectionSchema(
  name: r'QuizHistoryEntity',
  id: -6907177812826179595,
  properties: {
    r'correctSize': PropertySchema(
      id: 0,
      name: r'correctSize',
      type: IsarType.long,
    ),
    r'createTime': PropertySchema(
      id: 1,
      name: r'createTime',
      type: IsarType.dateTime,
    ),
    r'isFinished': PropertySchema(
      id: 2,
      name: r'isFinished',
      type: IsarType.bool,
    ),
    r'language': PropertySchema(
      id: 3,
      name: r'language',
      type: IsarType.string,
    ),
    r'spentTime': PropertySchema(
      id: 4,
      name: r'spentTime',
      type: IsarType.long,
    ),
    r'submittedSize': PropertySchema(
      id: 5,
      name: r'submittedSize',
      type: IsarType.long,
    ),
    r'totalSize': PropertySchema(
      id: 6,
      name: r'totalSize',
      type: IsarType.long,
    ),
    r'updateTime': PropertySchema(
      id: 7,
      name: r'updateTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _quizHistoryEntityEstimateSize,
  serialize: _quizHistoryEntitySerialize,
  deserialize: _quizHistoryEntityDeserialize,
  deserializeProp: _quizHistoryEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'createTime': IndexSchema(
      id: -7085130145048818916,
      name: r'createTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'updateTime': IndexSchema(
      id: 397922507239516479,
      name: r'updateTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'updateTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isFinished': IndexSchema(
      id: 4737544788539832154,
      name: r'isFinished',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isFinished',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _quizHistoryEntityGetId,
  getLinks: _quizHistoryEntityGetLinks,
  attach: _quizHistoryEntityAttach,
  version: '3.1.0+1',
);

int _quizHistoryEntityEstimateSize(
  QuizHistoryEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.language;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _quizHistoryEntitySerialize(
  QuizHistoryEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.correctSize);
  writer.writeDateTime(offsets[1], object.createTime);
  writer.writeBool(offsets[2], object.isFinished);
  writer.writeString(offsets[3], object.language);
  writer.writeLong(offsets[4], object.spentTime);
  writer.writeLong(offsets[5], object.submittedSize);
  writer.writeLong(offsets[6], object.totalSize);
  writer.writeDateTime(offsets[7], object.updateTime);
}

QuizHistoryEntity _quizHistoryEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuizHistoryEntity();
  object.correctSize = reader.readLongOrNull(offsets[0]);
  object.createTime = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.isFinished = reader.readBoolOrNull(offsets[2]);
  object.language = reader.readStringOrNull(offsets[3]);
  object.spentTime = reader.readLongOrNull(offsets[4]);
  object.submittedSize = reader.readLongOrNull(offsets[5]);
  object.totalSize = reader.readLongOrNull(offsets[6]);
  object.updateTime = reader.readDateTimeOrNull(offsets[7]);
  return object;
}

P _quizHistoryEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _quizHistoryEntityGetId(QuizHistoryEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _quizHistoryEntityGetLinks(
    QuizHistoryEntity object) {
  return [];
}

void _quizHistoryEntityAttach(
    IsarCollection<dynamic> col, Id id, QuizHistoryEntity object) {
  object.id = id;
}

extension QuizHistoryEntityQueryWhereSort
    on QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QWhere> {
  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhere>
      anyCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createTime'),
      );
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhere>
      anyUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updateTime'),
      );
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhere>
      anyIsFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isFinished'),
      );
    });
  }
}

extension QuizHistoryEntityQueryWhere
    on QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QWhereClause> {
  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
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

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      createTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createTime',
        value: [null],
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      createTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createTime',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      createTimeEqualTo(DateTime? createTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createTime',
        value: [createTime],
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      createTimeNotEqualTo(DateTime? createTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createTime',
              lower: [],
              upper: [createTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createTime',
              lower: [createTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createTime',
              lower: [createTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createTime',
              lower: [],
              upper: [createTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      createTimeGreaterThan(
    DateTime? createTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createTime',
        lower: [createTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      createTimeLessThan(
    DateTime? createTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createTime',
        lower: [],
        upper: [createTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      createTimeBetween(
    DateTime? lowerCreateTime,
    DateTime? upperCreateTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createTime',
        lower: [lowerCreateTime],
        includeLower: includeLower,
        upper: [upperCreateTime],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      updateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updateTime',
        value: [null],
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      updateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updateTime',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      updateTimeEqualTo(DateTime? updateTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updateTime',
        value: [updateTime],
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      updateTimeNotEqualTo(DateTime? updateTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updateTime',
              lower: [],
              upper: [updateTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updateTime',
              lower: [updateTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updateTime',
              lower: [updateTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updateTime',
              lower: [],
              upper: [updateTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      updateTimeGreaterThan(
    DateTime? updateTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updateTime',
        lower: [updateTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      updateTimeLessThan(
    DateTime? updateTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updateTime',
        lower: [],
        upper: [updateTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      updateTimeBetween(
    DateTime? lowerUpdateTime,
    DateTime? upperUpdateTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updateTime',
        lower: [lowerUpdateTime],
        includeLower: includeLower,
        upper: [upperUpdateTime],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      isFinishedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isFinished',
        value: [null],
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      isFinishedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'isFinished',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      isFinishedEqualTo(bool? isFinished) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isFinished',
        value: [isFinished],
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterWhereClause>
      isFinishedNotEqualTo(bool? isFinished) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFinished',
              lower: [],
              upper: [isFinished],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFinished',
              lower: [isFinished],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFinished',
              lower: [isFinished],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFinished',
              lower: [],
              upper: [isFinished],
              includeUpper: false,
            ));
      }
    });
  }
}

extension QuizHistoryEntityQueryFilter
    on QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QFilterCondition> {
  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      correctSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correctSize',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      correctSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correctSize',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      correctSizeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctSize',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      correctSizeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctSize',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      correctSizeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctSize',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      correctSizeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      createTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createTime',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      createTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createTime',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      createTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      createTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      createTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      createTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
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

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
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

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
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

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      isFinishedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isFinished',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      isFinishedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isFinished',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      isFinishedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFinished',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      languageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      languageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'language',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      languageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      languageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      languageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      languageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      languageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      languageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      languageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      languageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'language',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      spentTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'spentTime',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      spentTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'spentTime',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      spentTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'spentTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      spentTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'spentTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      spentTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'spentTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      spentTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'spentTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      submittedSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'submittedSize',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      submittedSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'submittedSize',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      submittedSizeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submittedSize',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      submittedSizeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'submittedSize',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      submittedSizeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'submittedSize',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      submittedSizeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'submittedSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      totalSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalSize',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      totalSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalSize',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      totalSizeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalSize',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      totalSizeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalSize',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      totalSizeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalSize',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      totalSizeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      updateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateTime',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      updateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateTime',
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      updateTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      updateTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      updateTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterFilterCondition>
      updateTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QuizHistoryEntityQueryObject
    on QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QFilterCondition> {}

extension QuizHistoryEntityQueryLinks
    on QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QFilterCondition> {}

extension QuizHistoryEntityQuerySortBy
    on QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QSortBy> {
  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortByCorrectSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctSize', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortByCorrectSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctSize', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortByIsFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinished', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortByIsFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinished', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortBySpentTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spentTime', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortBySpentTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spentTime', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortBySubmittedSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedSize', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortBySubmittedSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedSize', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortByTotalSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSize', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortByTotalSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSize', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      sortByUpdateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.desc);
    });
  }
}

extension QuizHistoryEntityQuerySortThenBy
    on QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QSortThenBy> {
  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenByCorrectSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctSize', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenByCorrectSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctSize', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenByIsFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinished', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenByIsFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinished', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenBySpentTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spentTime', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenBySpentTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spentTime', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenBySubmittedSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedSize', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenBySubmittedSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submittedSize', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenByTotalSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSize', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenByTotalSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSize', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QAfterSortBy>
      thenByUpdateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.desc);
    });
  }
}

extension QuizHistoryEntityQueryWhereDistinct
    on QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QDistinct> {
  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QDistinct>
      distinctByCorrectSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctSize');
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QDistinct>
      distinctByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createTime');
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QDistinct>
      distinctByIsFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFinished');
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QDistinct>
      distinctByLanguage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QDistinct>
      distinctBySpentTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'spentTime');
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QDistinct>
      distinctBySubmittedSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'submittedSize');
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QDistinct>
      distinctByTotalSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSize');
    });
  }

  QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QDistinct>
      distinctByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateTime');
    });
  }
}

extension QuizHistoryEntityQueryProperty
    on QueryBuilder<QuizHistoryEntity, QuizHistoryEntity, QQueryProperty> {
  QueryBuilder<QuizHistoryEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuizHistoryEntity, int?, QQueryOperations>
      correctSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctSize');
    });
  }

  QueryBuilder<QuizHistoryEntity, DateTime?, QQueryOperations>
      createTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createTime');
    });
  }

  QueryBuilder<QuizHistoryEntity, bool?, QQueryOperations>
      isFinishedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFinished');
    });
  }

  QueryBuilder<QuizHistoryEntity, String?, QQueryOperations>
      languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<QuizHistoryEntity, int?, QQueryOperations> spentTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'spentTime');
    });
  }

  QueryBuilder<QuizHistoryEntity, int?, QQueryOperations>
      submittedSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'submittedSize');
    });
  }

  QueryBuilder<QuizHistoryEntity, int?, QQueryOperations> totalSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSize');
    });
  }

  QueryBuilder<QuizHistoryEntity, DateTime?, QQueryOperations>
      updateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateTime');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuizHistoryQuestionEntityCollection on Isar {
  IsarCollection<QuizHistoryQuestionEntity> get quizHistoryQuestionEntitys =>
      this.collection();
}

const QuizHistoryQuestionEntitySchema = CollectionSchema(
  name: r'QuizHistoryQuestionEntity',
  id: 573299931770771968,
  properties: {
    r'answers': PropertySchema(
      id: 0,
      name: r'answers',
      type: IsarType.objectList,
      target: r'QuizHistoryAnswerEntity',
    ),
    r'correctAnswerId': PropertySchema(
      id: 1,
      name: r'correctAnswerId',
      type: IsarType.string,
    ),
    r'imageUrl': PropertySchema(
      id: 2,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'isSubmitted': PropertySchema(
      id: 3,
      name: r'isSubmitted',
      type: IsarType.bool,
    ),
    r'question': PropertySchema(
      id: 4,
      name: r'question',
      type: IsarType.string,
    ),
    r'quizHistoryId': PropertySchema(
      id: 5,
      name: r'quizHistoryId',
      type: IsarType.long,
    ),
    r'selectedAnswerId': PropertySchema(
      id: 6,
      name: r'selectedAnswerId',
      type: IsarType.string,
    )
  },
  estimateSize: _quizHistoryQuestionEntityEstimateSize,
  serialize: _quizHistoryQuestionEntitySerialize,
  deserialize: _quizHistoryQuestionEntityDeserialize,
  deserializeProp: _quizHistoryQuestionEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'quizHistoryId': IndexSchema(
      id: -7147532512247960731,
      name: r'quizHistoryId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'quizHistoryId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'QuizHistoryAnswerEntity': QuizHistoryAnswerEntitySchema},
  getId: _quizHistoryQuestionEntityGetId,
  getLinks: _quizHistoryQuestionEntityGetLinks,
  attach: _quizHistoryQuestionEntityAttach,
  version: '3.1.0+1',
);

int _quizHistoryQuestionEntityEstimateSize(
  QuizHistoryQuestionEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.answers;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[QuizHistoryAnswerEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += QuizHistoryAnswerEntitySchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.correctAnswerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.question;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.selectedAnswerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _quizHistoryQuestionEntitySerialize(
  QuizHistoryQuestionEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<QuizHistoryAnswerEntity>(
    offsets[0],
    allOffsets,
    QuizHistoryAnswerEntitySchema.serialize,
    object.answers,
  );
  writer.writeString(offsets[1], object.correctAnswerId);
  writer.writeString(offsets[2], object.imageUrl);
  writer.writeBool(offsets[3], object.isSubmitted);
  writer.writeString(offsets[4], object.question);
  writer.writeLong(offsets[5], object.quizHistoryId);
  writer.writeString(offsets[6], object.selectedAnswerId);
}

QuizHistoryQuestionEntity _quizHistoryQuestionEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuizHistoryQuestionEntity();
  object.answers = reader.readObjectList<QuizHistoryAnswerEntity>(
    offsets[0],
    QuizHistoryAnswerEntitySchema.deserialize,
    allOffsets,
    QuizHistoryAnswerEntity(),
  );
  object.correctAnswerId = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.imageUrl = reader.readStringOrNull(offsets[2]);
  object.isSubmitted = reader.readBoolOrNull(offsets[3]);
  object.question = reader.readStringOrNull(offsets[4]);
  object.quizHistoryId = reader.readLongOrNull(offsets[5]);
  object.selectedAnswerId = reader.readStringOrNull(offsets[6]);
  return object;
}

P _quizHistoryQuestionEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<QuizHistoryAnswerEntity>(
        offset,
        QuizHistoryAnswerEntitySchema.deserialize,
        allOffsets,
        QuizHistoryAnswerEntity(),
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _quizHistoryQuestionEntityGetId(QuizHistoryQuestionEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _quizHistoryQuestionEntityGetLinks(
    QuizHistoryQuestionEntity object) {
  return [];
}

void _quizHistoryQuestionEntityAttach(
    IsarCollection<dynamic> col, Id id, QuizHistoryQuestionEntity object) {
  object.id = id;
}

extension QuizHistoryQuestionEntityQueryWhereSort on QueryBuilder<
    QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QWhere> {
  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterWhere> anyQuizHistoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'quizHistoryId'),
      );
    });
  }
}

extension QuizHistoryQuestionEntityQueryWhere on QueryBuilder<
    QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QWhereClause> {
  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterWhereClause> quizHistoryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'quizHistoryId',
        value: [null],
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterWhereClause> quizHistoryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'quizHistoryId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterWhereClause> quizHistoryIdEqualTo(int? quizHistoryId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'quizHistoryId',
        value: [quizHistoryId],
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterWhereClause> quizHistoryIdNotEqualTo(int? quizHistoryId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'quizHistoryId',
              lower: [],
              upper: [quizHistoryId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'quizHistoryId',
              lower: [quizHistoryId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'quizHistoryId',
              lower: [quizHistoryId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'quizHistoryId',
              lower: [],
              upper: [quizHistoryId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterWhereClause> quizHistoryIdGreaterThan(
    int? quizHistoryId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'quizHistoryId',
        lower: [quizHistoryId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterWhereClause> quizHistoryIdLessThan(
    int? quizHistoryId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'quizHistoryId',
        lower: [],
        upper: [quizHistoryId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterWhereClause> quizHistoryIdBetween(
    int? lowerQuizHistoryId,
    int? upperQuizHistoryId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'quizHistoryId',
        lower: [lowerQuizHistoryId],
        includeLower: includeLower,
        upper: [upperQuizHistoryId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QuizHistoryQuestionEntityQueryFilter on QueryBuilder<
    QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QFilterCondition> {
  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> answersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answers',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> answersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answers',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> answersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> answersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> answersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> answersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> answersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> answersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> correctAnswerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correctAnswerId',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> correctAnswerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correctAnswerId',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> correctAnswerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> correctAnswerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> correctAnswerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> correctAnswerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctAnswerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> correctAnswerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correctAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> correctAnswerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correctAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
          QAfterFilterCondition>
      correctAnswerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correctAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
          QAfterFilterCondition>
      correctAnswerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correctAnswerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> correctAnswerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswerId',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> correctAnswerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correctAnswerId',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
          QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
          QAfterFilterCondition>
      imageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> isSubmittedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isSubmitted',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> isSubmittedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isSubmitted',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> isSubmittedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSubmitted',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> questionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'question',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> questionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'question',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> questionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> questionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> questionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> questionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'question',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> questionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> questionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
          QAfterFilterCondition>
      questionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
          QAfterFilterCondition>
      questionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'question',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> questionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> questionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> quizHistoryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quizHistoryId',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> quizHistoryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quizHistoryId',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> quizHistoryIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quizHistoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> quizHistoryIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quizHistoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> quizHistoryIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quizHistoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> quizHistoryIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quizHistoryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> selectedAnswerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'selectedAnswerId',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> selectedAnswerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'selectedAnswerId',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> selectedAnswerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> selectedAnswerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> selectedAnswerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> selectedAnswerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedAnswerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> selectedAnswerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'selectedAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> selectedAnswerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'selectedAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
          QAfterFilterCondition>
      selectedAnswerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'selectedAnswerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
          QAfterFilterCondition>
      selectedAnswerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'selectedAnswerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> selectedAnswerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedAnswerId',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterFilterCondition> selectedAnswerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'selectedAnswerId',
        value: '',
      ));
    });
  }
}

extension QuizHistoryQuestionEntityQueryObject on QueryBuilder<
    QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QFilterCondition> {
  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
          QAfterFilterCondition>
      answersElement(FilterQuery<QuizHistoryAnswerEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'answers');
    });
  }
}

extension QuizHistoryQuestionEntityQueryLinks on QueryBuilder<
    QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QFilterCondition> {}

extension QuizHistoryQuestionEntityQuerySortBy on QueryBuilder<
    QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QSortBy> {
  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> sortByCorrectAnswerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswerId', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> sortByCorrectAnswerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswerId', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> sortByIsSubmitted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubmitted', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> sortByIsSubmittedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubmitted', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> sortByQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> sortByQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> sortByQuizHistoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quizHistoryId', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> sortByQuizHistoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quizHistoryId', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> sortBySelectedAnswerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedAnswerId', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> sortBySelectedAnswerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedAnswerId', Sort.desc);
    });
  }
}

extension QuizHistoryQuestionEntityQuerySortThenBy on QueryBuilder<
    QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QSortThenBy> {
  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> thenByCorrectAnswerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswerId', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> thenByCorrectAnswerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswerId', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> thenByIsSubmitted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubmitted', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> thenByIsSubmittedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSubmitted', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> thenByQuestion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> thenByQuestionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'question', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> thenByQuizHistoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quizHistoryId', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> thenByQuizHistoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quizHistoryId', Sort.desc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> thenBySelectedAnswerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedAnswerId', Sort.asc);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity,
      QAfterSortBy> thenBySelectedAnswerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedAnswerId', Sort.desc);
    });
  }
}

extension QuizHistoryQuestionEntityQueryWhereDistinct on QueryBuilder<
    QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QDistinct> {
  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QDistinct>
      distinctByCorrectAnswerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctAnswerId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QDistinct>
      distinctByImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QDistinct>
      distinctByIsSubmitted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSubmitted');
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QDistinct>
      distinctByQuestion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'question', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QDistinct>
      distinctByQuizHistoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quizHistoryId');
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QDistinct>
      distinctBySelectedAnswerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedAnswerId',
          caseSensitive: caseSensitive);
    });
  }
}

extension QuizHistoryQuestionEntityQueryProperty on QueryBuilder<
    QuizHistoryQuestionEntity, QuizHistoryQuestionEntity, QQueryProperty> {
  QueryBuilder<QuizHistoryQuestionEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, List<QuizHistoryAnswerEntity>?,
      QQueryOperations> answersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answers');
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, String?, QQueryOperations>
      correctAnswerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctAnswerId');
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, String?, QQueryOperations>
      imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, bool?, QQueryOperations>
      isSubmittedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSubmitted');
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, String?, QQueryOperations>
      questionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'question');
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, int?, QQueryOperations>
      quizHistoryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quizHistoryId');
    });
  }

  QueryBuilder<QuizHistoryQuestionEntity, String?, QQueryOperations>
      selectedAnswerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedAnswerId');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const QuizHistoryAnswerEntitySchema = Schema(
  name: r'QuizHistoryAnswerEntity',
  id: -3995742533590482240,
  properties: {
    r'answer': PropertySchema(
      id: 0,
      name: r'answer',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.string,
    ),
    r'message': PropertySchema(
      id: 2,
      name: r'message',
      type: IsarType.string,
    )
  },
  estimateSize: _quizHistoryAnswerEntityEstimateSize,
  serialize: _quizHistoryAnswerEntitySerialize,
  deserialize: _quizHistoryAnswerEntityDeserialize,
  deserializeProp: _quizHistoryAnswerEntityDeserializeProp,
);

int _quizHistoryAnswerEntityEstimateSize(
  QuizHistoryAnswerEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.answer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.message;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _quizHistoryAnswerEntitySerialize(
  QuizHistoryAnswerEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.answer);
  writer.writeString(offsets[1], object.id);
  writer.writeString(offsets[2], object.message);
}

QuizHistoryAnswerEntity _quizHistoryAnswerEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuizHistoryAnswerEntity();
  object.answer = reader.readStringOrNull(offsets[0]);
  object.id = reader.readStringOrNull(offsets[1]);
  object.message = reader.readStringOrNull(offsets[2]);
  return object;
}

P _quizHistoryAnswerEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension QuizHistoryAnswerEntityQueryFilter on QueryBuilder<
    QuizHistoryAnswerEntity, QuizHistoryAnswerEntity, QFilterCondition> {
  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> answerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answer',
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> answerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answer',
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> answerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> answerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> answerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> answerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> answerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> answerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
          QAfterFilterCondition>
      answerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
          QAfterFilterCondition>
      answerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> answerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answer',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> answerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answer',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> idEqualTo(
    String? value, {
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

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> idGreaterThan(
    String? value, {
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

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> idLessThan(
    String? value, {
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

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> idBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> idStartsWith(
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

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> idEndsWith(
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

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
          QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
          QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> messageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'message',
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> messageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'message',
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> messageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> messageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> messageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> messageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'message',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> messageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> messageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
          QAfterFilterCondition>
      messageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
          QAfterFilterCondition>
      messageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'message',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<QuizHistoryAnswerEntity, QuizHistoryAnswerEntity,
      QAfterFilterCondition> messageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'message',
        value: '',
      ));
    });
  }
}

extension QuizHistoryAnswerEntityQueryObject on QueryBuilder<
    QuizHistoryAnswerEntity, QuizHistoryAnswerEntity, QFilterCondition> {}
