// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_stock_model.freezed.dart';
part 'create_stock_model.g.dart';

@freezed
class CreateStockModel with _$CreateStockModel {
  const factory CreateStockModel({
    @JsonKey(name: "code") required String code,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "status") required bool status,
    @JsonKey(name: "stockTypeId") required int stockTypeId,
    @JsonKey(name: "type") required int type,
    @JsonKey(name: "salesKDV") required double salesKdv,
    @JsonKey(name: "sackKilo") required double sackKilo,
  }) = _CreateStockModel;

  factory CreateStockModel.fromJson(Map<String, dynamic> json) => _$CreateStockModelFromJson(json);
}
