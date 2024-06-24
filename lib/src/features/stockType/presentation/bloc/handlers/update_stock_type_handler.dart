import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trakya_arge/src/features/stockType/data/repositories/stock_type_repository_impl.dart';
import 'package:trakya_arge/src/features/stockType/presentation/bloc/stock_type_bloc.dart';

class UpdateStockTypeHandler {
  final StockTypeRepositoryImpl stockTypeRepositoryImpl;

  UpdateStockTypeHandler({required this.stockTypeRepositoryImpl});

  Future<void> call(UpdateStockType event, Emitter<StockTypeState> emit) async {
    emit(const StockTypeState.loading());
    try {
      await stockTypeRepositoryImpl.putStockType(event.stockType);
      emit(const StockTypeState.operationSuccess());
    } catch (e) {
      emit(StockTypeState.operationFailure(errors: [e.toString()]));
    }
  }
}
