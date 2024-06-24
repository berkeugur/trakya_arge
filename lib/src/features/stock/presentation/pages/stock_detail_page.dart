import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trakya_arge/src/features/stock/presentation/bloc/stock_bloc.dart';
import 'package:trakya_arge/src/features/stock/presentation/widgets/stock_detail_widget.dart';

class StockDetailPage extends StatelessWidget {
  final String id;
  const StockDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<StockBloc>().add(LoadStockById(id));

    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          context.read<StockBloc>().add(const LoadStocks());
        }
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.read<StockBloc>().add(const LoadStocks());
                context.pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: Text("Stock id: $id"),
          ),
          body: BlocBuilder<StockBloc, StockState>(
            bloc: context.read<StockBloc>(),
            builder: (context, state) {
              return state.when(
                initial: () => const CircularProgressIndicator(),
                loading: () => const CircularProgressIndicator(),
                loaded: (types) => const CircularProgressIndicator(),
                loadedById: (type) => StockDetailWidget(stock: type),
                operationSuccess: () => const CircularProgressIndicator(),
                operationFailure: (err) => Text(err.toString()),
              );
            },
          )),
    );
  }
}
