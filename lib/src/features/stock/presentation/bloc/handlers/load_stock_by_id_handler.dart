import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trakya_arge/src/features/stock/data/repositories/stock_repository_impl.dart';
import 'package:trakya_arge/src/features/stock/presentation/bloc/stock_bloc.dart';

class LoadStockByIdHandler {
  final StockRepositoryImpl stockRepositoryImpl;

  LoadStockByIdHandler({required this.stockRepositoryImpl});

  Future<void> call(LoadStockById event, Emitter<StockState> emit) async {
    emit(const StockState.loading());
    try {
      final response = await stockRepositoryImpl.getStockById(event.id);
      if (response.data == null) {
        emit(const StockState.operationFailure(errors: ["Data null"]));
      }
      emit(StockState.loadedById(data: response.data!));
    } catch (e) {
      emit(StockState.operationFailure(errors: [e.toString()]));
    }
  }
}
