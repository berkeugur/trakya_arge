import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trakya_arge/src/features/stockType/data/mock/stock_type_mock_data.dart';
import 'package:trakya_arge/src/features/stockType/presentation/bloc/stock_type_bloc.dart';
import 'package:trakya_arge/src/features/stockType/presentation/widget/stock_type_create_widget.dart';
import 'package:trakya_arge/src/features/stockType/presentation/widget/stock_type_item_widget.dart';

class StockTypePage extends HookWidget {
  const StockTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stok Tipleri"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            showDragHandle: true,
            builder: (context) {
              return const StockTypeCreateWidget();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<StockTypeBloc, StockTypeState>(
        listener: (context, state) {
          if (state is StockTypeStateOperationSuccess) {
            context.read<StockTypeBloc>().add(const StockTypeEvent.loadStockTypes());
          }
        },
        builder: (context, state) {
          return state.when(
            initial: () => ErrorWidget(
              Exception("initial state is not implemented"),
            ),
            loading: () => Skeletonizer(
              containersColor: Colors.grey.shade200,
              enabled: true,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: StockTypeMockData.stockTypeList.length,
                prototypeItem: StockTypeListItem(stockTypeModel: StockTypeMockData.stockTypeList.first),
                itemBuilder: (context, index) {
                  return StockTypeListItem(stockTypeModel: StockTypeMockData.stockTypeList[index]);
                },
              ),
            ),
            loaded: (types) {
              return RefreshIndicator(
                onRefresh: () {
                  context.read<StockTypeBloc>().add(const StockTypeEvent.loadStockTypes());
                  return Future.value();
                },
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: types.length,
                  prototypeItem: StockTypeListItem(stockTypeModel: StockTypeMockData.stockTypeList.first),
                  itemBuilder: (context, index) {
                    return StockTypeListItem(stockTypeModel: types[index]);
                  },
                ),
              );
            },
            loadedById: (type) {
              return ErrorWidget(
                Exception("operationSuccess state is not implemented"),
              );
            },
            operationSuccess: () => ErrorWidget(
              Exception("operationSuccess state is not implemented"),
            ),
            operationFailure: (errors) => Column(
              children: List.generate(errors.length, (index) => Text(errors[index])),
            ),
          );
        },
      ),
    );
  }
}
