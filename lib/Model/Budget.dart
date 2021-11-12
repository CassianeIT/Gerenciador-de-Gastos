
import 'package:json_annotation/json_annotation.dart';

part 'Budget.g.dart';

@JsonSerializable(explicitToJson: true)
class Budget {
   Budget(this.index, this.iconId, this.category, this.monthlyAvg, this.newValue);

    final int index;
    final int iconId;
    final String category;
    final double monthlyAvg;
    final List newValue;

  factory Budget.fromJson(Map<String, dynamic> json) => _$BudgetFromJson(json);
  Map<String, dynamic> toJson() => _$BudgetToJson(this);
}


