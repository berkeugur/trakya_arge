import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trakya_arge/src/features/stockType/data/repositories/stock_type_repository_impl.dart';
import 'package:trakya_arge/src/features/stockType/presentation/bloc/stock_type_bloc.dart';

class LoadStockTypeByIdHandler {
  final StockTypeRepositoryImpl stockTypeRepositoryImpl;

  LoadStockTypeByIdHandler({required this.stockTypeRepositoryImpl});

  Future<void> call(LoadStockTypeById event, Emitter<StockTypeState> emit) async {
    emit(const StockTypeState.loading());
    try {
      final response = await stockTypeRepositoryImpl.getStockTypeById(event.id);
      if (response.data == null) {
        emit(const StockTypeState.operationFailure(errors: ["Data null"]));
      }
      emit(StockTypeState.loadedById(data: response.data!));
    } catch (e) {
      emit(StockTypeState.operationFailure(errors: [e.toString()]));
    }
  }
}
