import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trakya_arge/src/features/stockType/data/repositories/stock_type_repository_impl.dart';
import 'package:trakya_arge/src/features/stockType/presentation/bloc/stock_type_bloc.dart';

class LoadStockTypesHandler {
  final StockTypeRepositoryImpl stockTypeRepositoryImpl;

  LoadStockTypesHandler({required this.stockTypeRepositoryImpl});

  Future<void> call(LoadStockTypes event, Emitter<StockTypeState> emit) async {
    emit(const StockTypeState.loading());
    try {
      final response = await stockTypeRepositoryImpl.getStockTypes();
      if (response.data == null) {
        emit(const StockTypeState.operationFailure(errors: ["Data null"]));
      }
      emit(StockTypeState.loaded(data: response.data ?? []));
    } catch (e) {
      emit(StockTypeState.operationFailure(errors: [e.toString()]));
    }
  }
}
