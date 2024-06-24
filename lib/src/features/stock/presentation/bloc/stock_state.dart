part of 'stock_bloc.dart';

@freezed
class StockState with _$StockState {
  const factory StockState.initial() = StockStateInitial;
  const factory StockState.loading() = StockStateLoading;
  const factory StockState.loaded({required List<StockModel> data}) = StockStateLoaded;
  const factory StockState.loadedById({required StockModel data}) = StockStateLoadedById;
  const factory StockState.operationSuccess() = StockStateOperationSuccess;
  const factory StockState.operationFailure({required List<String> errors}) = StockStateOperationFailure;
}
