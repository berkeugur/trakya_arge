part of 'stock_bloc.dart';

@freezed
class StockEvent with _$StockEvent {
  const factory StockEvent.loadStockById(String id) = LoadStockById;
  const factory StockEvent.loadStocks() = LoadStocks;
  const factory StockEvent.createStock(CreateStockModel createStock) = CreateStock;
  const factory StockEvent.deleteStockById(String id) = DeleteStockById;
  const factory StockEvent.updateStock(StockModel stock) = UpdateStock;
}
