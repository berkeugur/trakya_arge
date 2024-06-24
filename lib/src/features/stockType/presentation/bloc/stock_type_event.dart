part of 'stock_type_bloc.dart';

@freezed
class StockTypeEvent with _$StockTypeEvent {
  const factory StockTypeEvent.loadStockTypeById(String id) = LoadStockTypeById;
  const factory StockTypeEvent.loadStockTypes() = LoadStockTypes;
  const factory StockTypeEvent.createStockType(String code, String name) = CreateStockType;
  const factory StockTypeEvent.deleteStockTypeById(String id) = DeleteStockTypeById;
  const factory StockTypeEvent.updateStockType(StockTypeModel stockType) = UpdateStockType;
}
