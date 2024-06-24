import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:trakya_arge/src/features/stock/data/models/create_stock_model.dart';
import 'package:trakya_arge/src/features/stock/data/models/stock_model.dart';
import 'package:trakya_arge/src/features/stock/data/repositories/stock_repository_impl.dart';
import 'package:trakya_arge/src/features/stock/presentation/bloc/handlers/create_stock_handler.dart';
import 'package:trakya_arge/src/features/stock/presentation/bloc/handlers/delete_stock_handler.dart';
import 'package:trakya_arge/src/features/stock/presentation/bloc/handlers/load_stock_by_id_handler.dart';
import 'package:trakya_arge/src/features/stock/presentation/bloc/handlers/load_stocks_handler.dart';
import 'package:trakya_arge/src/features/stock/presentation/bloc/handlers/update_stock_handler.dart';

part 'stock_bloc.freezed.dart';
part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final StockRepositoryImpl stockRepositoryImpl;

  StockBloc({required this.stockRepositoryImpl}) : super(const StockState.loading()) {
    final CreateStockHandler createStockHandler = CreateStockHandler(
      stockRepositoryImpl: stockRepositoryImpl,
    );
    final LoadStocksHandler loadStocksHandler = LoadStocksHandler(
      stockRepositoryImpl: stockRepositoryImpl,
    );

    final DeleteStockHandler deleteStockHandler = DeleteStockHandler(
      stockRepositoryImpl: stockRepositoryImpl,
    );

    final LoadStockByIdHandler loadStockByIdHandler = LoadStockByIdHandler(
      stockRepositoryImpl: stockRepositoryImpl,
    );

    final UpdateStockHandler updateStockHandler = UpdateStockHandler(
      stockRepositoryImpl: stockRepositoryImpl,
    );

    on<CreateStock>((event, emit) => createStockHandler.call(event, emit));
    on<LoadStocks>((event, emit) => loadStocksHandler.call(event, emit));
    on<DeleteStockById>((event, emit) => deleteStockHandler.call(event, emit));
    on<LoadStockById>((event, emit) => loadStockByIdHandler.call(event, emit));
    on<UpdateStock>((event, emit) => updateStockHandler.call(event, emit));
  }
}
