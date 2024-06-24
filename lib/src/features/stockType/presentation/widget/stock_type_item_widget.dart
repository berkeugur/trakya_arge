import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trakya_arge/src/features/stockType/data/models/stock_type_model.dart';
import 'package:trakya_arge/src/features/stockType/presentation/bloc/stock_type_bloc.dart';
import 'package:trakya_arge/src/features/stockType/presentation/widget/stock_type_update_widget.dart';

class StockTypeListItem extends StatelessWidget {
  final StockTypeModel stockTypeModel;
  const StockTypeListItem({
    super.key,
    required this.stockTypeModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await context.pushNamed("/stock-types/", pathParameters: {"id": stockTypeModel.id.toString()});
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          title: Text(stockTypeModel.name),
          subtitle: Text("Code:${stockTypeModel.code}"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.outlined(
                onPressed: () async {
                  await context.pushNamed("/stock-types/", pathParameters: {"id": stockTypeModel.id.toString()});
                },
                icon: const Icon(Icons.remove_red_eye),
              ),
              IconButton.outlined(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    builder: (context) {
                      return StockTypeUpdateWidget(stockType: stockTypeModel);
                    },
                  );
                },
                icon: const Icon(Icons.edit),
              ),
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
                            context.read<StockTypeBloc>().add(DeleteStockTypeById(stockTypeModel.id.toString()));
                            Navigator.of(context).pop();
                          },
                          child: const Text("Sil"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
