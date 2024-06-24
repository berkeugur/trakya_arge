import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trakya_arge/src/features/stock/data/repositories/stock_repository_impl.dart';
import 'package:trakya_arge/src/features/stock/presentation/bloc/stock_bloc.dart';

class DeleteStockHandler {
  final StockRepositoryImpl stockRepositoryImpl;

  DeleteStockHandler({required this.stockRepositoryImpl});

  Future<void> call(DeleteStockById event, Emitter<StockState> emit) async {
    emit(const StockState.loading());
    try {
      await stockRepositoryImpl.deleteStockById(event.id);
      emit(const StockState.operationSuccess());
    } catch (e) {
      emit(StockState.operationFailure(errors: [e.toString()]));
    }
  }
}
