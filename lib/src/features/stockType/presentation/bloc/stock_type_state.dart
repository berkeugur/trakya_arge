part of 'stock_type_bloc.dart';

@freezed
class StockTypeState with _$StockTypeState {
  const factory StockTypeState.initial() = StockTypeStateInitial;
  const factory StockTypeState.loading() = StockTypeStateLoading;
  const factory StockTypeState.loaded({required List<StockTypeModel> data}) = StockTypeStateLoaded;
  const factory StockTypeState.loadedById({required StockTypeModel data}) = StockTypeStateLoadedById;
  const factory StockTypeState.operationSuccess() = StockTypeStateOperationSuccess;
  const factory StockTypeState.operationFailure({required List<String> errors}) = StockTypeStateOperationFailure;
}
