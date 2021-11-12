// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Budget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Budget _$BudgetFromJson(Map<String, dynamic> json) {
  return Budget(
    json['index'] as int,
    json['iconId'] as int,
    json['category'] as String,
    (json['monthlyAvg'] as num).toDouble(),
    json['newValue'] as List<dynamic>,
  );
}

Map<String, dynamic> _$BudgetToJson(Budget instance) => <String, dynamic>{
      'index': instance.index,
      'iconId': instance.iconId,
      'category': instance.category,
      'monthlyAvg': instance.monthlyAvg,
      'newValue': instance.newValue,
    };
