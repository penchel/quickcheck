// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence_list.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPresenceListCollection on Isar {
  IsarCollection<PresenceList> get presenceLists => this.collection();
}

const PresenceListSchema = CollectionSchema(
  name: r'PresenceList',
  id: 6861208109653940379,
  properties: {
    r'absences': PropertySchema(
      id: 0,
      name: r'absences',
      type: IsarType.long,
    ),
    r'roomId': PropertySchema(
      id: 1,
      name: r'roomId',
      type: IsarType.long,
    ),
    r'studentId': PropertySchema(
      id: 2,
      name: r'studentId',
      type: IsarType.long,
    )
  },
  estimateSize: _presenceListEstimateSize,
  serialize: _presenceListSerialize,
  deserialize: _presenceListDeserialize,
  deserializeProp: _presenceListDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _presenceListGetId,
  getLinks: _presenceListGetLinks,
  attach: _presenceListAttach,
  version: '3.1.0+1',
);

int _presenceListEstimateSize(
  PresenceList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _presenceListSerialize(
  PresenceList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.absences);
  writer.writeLong(offsets[1], object.roomId);
  writer.writeLong(offsets[2], object.studentId);
}

PresenceList _presenceListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PresenceList();
  object.absences = reader.readLong(offsets[0]);
  object.id = id;
  object.roomId = reader.readLong(offsets[1]);
  object.studentId = reader.readLong(offsets[2]);
  return object;
}

P _presenceListDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _presenceListGetId(PresenceList object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _presenceListGetLinks(PresenceList object) {
  return [];
}

void _presenceListAttach(
    IsarCollection<dynamic> col, Id id, PresenceList object) {
  object.id = id;
}

extension PresenceListQueryWhereSort
    on QueryBuilder<PresenceList, PresenceList, QWhere> {
  QueryBuilder<PresenceList, PresenceList, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PresenceListQueryWhere
    on QueryBuilder<PresenceList, PresenceList, QWhereClause> {
  QueryBuilder<PresenceList, PresenceList, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<PresenceList, PresenceList, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterWhereClause> idBetween(
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
}

extension PresenceListQueryFilter
    on QueryBuilder<PresenceList, PresenceList, QFilterCondition> {
  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition>
      absencesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'absences',
        value: value,
      ));
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition>
      absencesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'absences',
        value: value,
      ));
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition>
      absencesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'absences',
        value: value,
      ));
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition>
      absencesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'absences',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition> roomIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomId',
        value: value,
      ));
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition>
      roomIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomId',
        value: value,
      ));
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition>
      roomIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomId',
        value: value,
      ));
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition> roomIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition>
      studentIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentId',
        value: value,
      ));
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition>
      studentIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'studentId',
        value: value,
      ));
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition>
      studentIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'studentId',
        value: value,
      ));
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterFilterCondition>
      studentIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'studentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PresenceListQueryObject
    on QueryBuilder<PresenceList, PresenceList, QFilterCondition> {}

extension PresenceListQueryLinks
    on QueryBuilder<PresenceList, PresenceList, QFilterCondition> {}

extension PresenceListQuerySortBy
    on QueryBuilder<PresenceList, PresenceList, QSortBy> {
  QueryBuilder<PresenceList, PresenceList, QAfterSortBy> sortByAbsences() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'absences', Sort.asc);
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterSortBy> sortByAbsencesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'absences', Sort.desc);
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterSortBy> sortByRoomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.asc);
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterSortBy> sortByRoomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.desc);
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterSortBy> sortByStudentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentId', Sort.asc);
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterSortBy> sortByStudentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentId', Sort.desc);
    });
  }
}

extension PresenceListQuerySortThenBy
    on QueryBuilder<PresenceList, PresenceList, QSortThenBy> {
  QueryBuilder<PresenceList, PresenceList, QAfterSortBy> thenByAbsences() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'absences', Sort.asc);
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterSortBy> thenByAbsencesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'absences', Sort.desc);
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterSortBy> thenByRoomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.asc);
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterSortBy> thenByRoomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.desc);
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterSortBy> thenByStudentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentId', Sort.asc);
    });
  }

  QueryBuilder<PresenceList, PresenceList, QAfterSortBy> thenByStudentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentId', Sort.desc);
    });
  }
}

extension PresenceListQueryWhereDistinct
    on QueryBuilder<PresenceList, PresenceList, QDistinct> {
  QueryBuilder<PresenceList, PresenceList, QDistinct> distinctByAbsences() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'absences');
    });
  }

  QueryBuilder<PresenceList, PresenceList, QDistinct> distinctByRoomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomId');
    });
  }

  QueryBuilder<PresenceList, PresenceList, QDistinct> distinctByStudentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentId');
    });
  }
}

extension PresenceListQueryProperty
    on QueryBuilder<PresenceList, PresenceList, QQueryProperty> {
  QueryBuilder<PresenceList, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PresenceList, int, QQueryOperations> absencesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'absences');
    });
  }

  QueryBuilder<PresenceList, int, QQueryOperations> roomIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomId');
    });
  }

  QueryBuilder<PresenceList, int, QQueryOperations> studentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentId');
    });
  }
}
