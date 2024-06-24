// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_type_model.freezed.dart';
part 'stock_type_model.g.dart';

@freezed
class StockTypeModel with _$StockTypeModel {
  const factory StockTypeModel({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "code") required String code,
    @JsonKey(name: "name") required String name,
  }) = _StockTypeModel;

  factory StockTypeModel.fromJson(Map<String, dynamic> json) => _$StockTypeModelFromJson(json);
}
