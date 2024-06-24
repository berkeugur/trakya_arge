import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trakya_arge/src/features/stock/data/repositories/stock_repository_impl.dart';
import 'package:trakya_arge/src/features/stock/presentation/bloc/stock_bloc.dart';

class LoadStocksHandler {
  final StockRepositoryImpl stockRepositoryImpl;

  LoadStocksHandler({required this.stockRepositoryImpl});

  Future<void> call(LoadStocks event, Emitter<StockState> emit) async {
    emit(const StockState.loading());
    try {
      final response = await stockRepositoryImpl.getStocks();
      if (response.data == null) {
        emit(const StockState.operationFailure(errors: ["Data null"]));
      }
      emit(StockState.loaded(data: response.data ?? []));
    } catch (e) {
      emit(StockState.operationFailure(errors: [e.toString()]));
    }
  }
}
