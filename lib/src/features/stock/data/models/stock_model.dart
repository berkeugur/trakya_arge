// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:trakya_arge/src/features/stockType/data/models/stock_type_model.dart';

part 'stock_model.freezed.dart';
part 'stock_model.g.dart';

@freezed
class StockModel with _$StockModel {
  const factory StockModel({
    @JsonKey(name: "stockType") StockTypeModel? stockType,
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "code") required String code,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "status") required bool status,
    @JsonKey(name: "stockTypeId") required int stockTypeId,
    @JsonKey(name: "type") required int type,
    @JsonKey(name: "salesKDV") required double salesKdv,
    @JsonKey(name: "sackKilo") required double sackKilo,
  }) = _StockModel;

  factory StockModel.fromJson(Map<String, dynamic> json) => _$StockModelFromJson(json);
}
