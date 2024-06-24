import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trakya_arge/src/features/stockType/presentation/bloc/stock_type_bloc.dart';

class StockTypeCreateWidget extends HookWidget {
  const StockTypeCreateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final codeController = useTextEditingController();
    final nameController = useTextEditingController();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocListener(
        bloc: context.read<StockTypeBloc>(),
        listener: (context, state) {
          if (state is StockTypeStateOperationSuccess) {
            codeController.clear();
            nameController.clear();
            Navigator.pop(context);
          } else if (state is StockTypeStateOperationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("İşlem başarısız ${state.errors}"),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: codeController,
                decoration: const InputDecoration(labelText: "Kod"),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "İsim"),
              ),
              const SizedBox(height: 8),
              BlocBuilder<StockTypeBloc, StockTypeState>(
                builder: (context, state) {
                  if (state is StockTypeStateLoading) {
                    return const CircularProgressIndicator();
                  }
                  return FilledButton(
                    onPressed: () {
                      context.read<StockTypeBloc>().add(StockTypeEvent.createStockType(
                            codeController.text,
                            nameController.text,
                          ));
                    },
                    child: const Text("Ekle"),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
