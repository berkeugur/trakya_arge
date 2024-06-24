import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trakya_arge/src/features/stockType/presentation/bloc/stock_type_bloc.dart';
import 'package:trakya_arge/src/features/stockType/presentation/widget/stock_type_detail_widget.dart';

class StockTypeDetailPage extends StatelessWidget {
  final String id;
  const StockTypeDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<StockTypeBloc>().add(LoadStockTypeById(id));

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.read<StockTypeBloc>().add(const LoadStockTypes());
              context.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text("Stock Type: $id"),
        ),
        body: BlocBuilder<StockTypeBloc, StockTypeState>(
          bloc: context.read<StockTypeBloc>(),
          builder: (context, state) {
            return state.when(
              initial: () => const CircularProgressIndicator(),
              loading: () => const CircularProgressIndicator(),
              loaded: (types) => const CircularProgressIndicator(),
              loadedById: (type) => StockTypeDetailWidget(stockType: type),
              operationSuccess: () => const CircularProgressIndicator(),
              operationFailure: (err) => Text(err.toString()),
            );
          },
        ));
  }
}
