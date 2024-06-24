import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trakya_arge/src/features/stock/data/repositories/stock_repository_impl.dart';
import 'package:trakya_arge/src/features/stock/presentation/bloc/stock_bloc.dart';

class CreateStockHandler {
  final StockRepositoryImpl stockRepositoryImpl;

  CreateStockHandler({required this.stockRepositoryImpl});

  Future<void> call(CreateStock event, Emitter<StockState> emit) async {
    emit(const StockState.loading());
    try {
      await stockRepositoryImpl.postStock(event.createStock);
      emit(const StockState.operationSuccess());
    } catch (e) {
      emit(StockState.operationFailure(errors: [e.toString()]));
    }
  }
}
