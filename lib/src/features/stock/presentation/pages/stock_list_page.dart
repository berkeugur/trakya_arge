import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trakya_arge/src/features/stock/data/mock/stock_mock_data.dart';
import 'package:trakya_arge/src/features/stock/data/models/stock_model.dart';
import 'package:trakya_arge/src/features/stock/presentation/bloc/stock_bloc.dart';
import 'package:trakya_arge/src/features/stock/presentation/widgets/stock_add_widget.dart';
import 'package:trakya_arge/src/features/stock/presentation/widgets/stock_update_widget.dart';

class StockListPage extends StatelessWidget {
  const StockListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            showDragHandle: true,
            isScrollControlled: true,
            builder: (context) {
              return Container(
                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .8),
                child: const StockAddWidget(),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<StockBloc, StockState>(
        listener: (context, state) {
          if (state is StockStateOperationSuccess) {
            context.read<StockBloc>().add(const StockEvent.loadStocks());
          }
        },
        builder: (context, state) {
          return state.when(
            initial: () => const CircularProgressIndicator(),
            loading: () => Skeletonizer(
              enabled: true,
              containersColor: Colors.grey.shade200,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: StockMockData.stockModelList.length,
                prototypeItem: StockListItem(stockModel: StockMockData.stockModelList.first),
                itemBuilder: (context, index) {
                  return StockListItem(
                    stockModel: StockMockData.stockModelList[index],
                  );
                },
              ),
            ),
            loaded: (stocks) => RefreshIndicator(
              onRefresh: () {
                context.read<StockBloc>().add(const LoadStocks());
                return Future.value();
              },
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: stocks.length,
                prototypeItem: StockListItem(stockModel: StockMockData.stockModelList.first),
                itemBuilder: (context, index) {
                  return StockListItem(
                    stockModel: stocks[index],
                  );
                },
              ),
            ),
            loadedById: (stock) => const CircularProgressIndicator(),
            operationSuccess: () => const CircularProgressIndicator(),
            operationFailure: (errors) => const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class StockListItem extends StatelessWidget {
  const StockListItem({
    super.key,
    required this.stockModel,
  });
  final StockModel stockModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stockModel.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description: ${stockModel.description}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "Code: ${stockModel.code}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "KDV: ${stockModel.salesKdv}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "SACKKILO: ${stockModel.sackKilo}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "TYPE: ${stockModel.type}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton.outlined(
                  onPressed: () async {
                    await context.pushNamed(
                      "/stocks/",
                      pathParameters: {"id": stockModel.id.toString()},
                    );
                  },
                  icon: const Icon(Icons.remove_red_eye)),
              IconButton.outlined(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Emin Misiniz?"),
                        content: const Text("Bu işlem geri alınamaz. Stok tipini silmek istediğinize emin misiniz?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("iptal"),
                          ),
                          FilledButton(
                            onPressed: () {
                              context.read<StockBloc>().add(DeleteStockById(stockModel.id.toString()));
                              Navigator.of(context).pop();
                            },
                            child: const Text("Sil"),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete)),
              IconButton.outlined(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      isScrollControlled: true,
                      builder: (context) {
                        return Container(
                          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .8),
                          child: StockUpdateWidget(
                            stockModel: stockModel,
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.edit)),
            ],
          )
        ],
      ),
    );
  }
}
