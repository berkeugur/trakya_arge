import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trakya_arge/src/features/stockType/data/models/stock_type_model.dart';
import 'package:trakya_arge/src/features/stockType/data/repositories/stock_type_repository_impl.dart';
import 'package:trakya_arge/src/features/stockType/presentation/bloc/handlers/create_stock_type_handler.dart';
import 'package:trakya_arge/src/features/stockType/presentation/bloc/handlers/delete_stock_type_handler.dart';
import 'package:trakya_arge/src/features/stockType/presentation/bloc/handlers/load_stock_type_by_id_handler.dart';
import 'package:trakya_arge/src/features/stockType/presentation/bloc/handlers/load_stock_types_handler.dart';
import 'package:trakya_arge/src/features/stockType/presentation/bloc/handlers/update_stock_type_handler.dart';

part 'stock_type_event.dart';
part 'stock_type_state.dart';
part 'stock_type_bloc.freezed.dart';

class StockTypeBloc extends Bloc<StockTypeEvent, StockTypeState> {
  final StockTypeRepositoryImpl stockTypeRepositoryImpl;

  StockTypeBloc({required this.stockTypeRepositoryImpl}) : super(const StockTypeState.loading()) {
    final CreateStockTypeHandler createStockTypeHandler = CreateStockTypeHandler(
      stockTypeRepositoryImpl: stockTypeRepositoryImpl,
    );
    final LoadStockTypesHandler loadStockTypesHandler = LoadStockTypesHandler(
      stockTypeRepositoryImpl: stockTypeRepositoryImpl,
    );

    final DeleteStockTypeHandler deleteStockTypeHandler = DeleteStockTypeHandler(
      stockTypeRepositoryImpl: stockTypeRepositoryImpl,
    );

    final LoadStockTypeByIdHandler loadStockTypeByIdHandler = LoadStockTypeByIdHandler(
      stockTypeRepositoryImpl: stockTypeRepositoryImpl,
    );

    final UpdateStockTypeHandler updateStockTypeHandler = UpdateStockTypeHandler(
      stockTypeRepositoryImpl: stockTypeRepositoryImpl,
    );

    on<CreateStockType>((event, emit) => createStockTypeHandler.call(event, emit));
    on<LoadStockTypes>((event, emit) => loadStockTypesHandler.call(event, emit));
    on<DeleteStockTypeById>((event, emit) => deleteStockTypeHandler.call(event, emit));
    on<LoadStockTypeById>((event, emit) => loadStockTypeByIdHandler.call(event, emit));
    on<UpdateStockType>((event, emit) => updateStockTypeHandler.call(event, emit));
  }
}
