import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trakya_arge/src/features/stock/data/models/create_stock_model.dart';
import 'package:trakya_arge/src/features/stock/presentation/bloc/stock_bloc.dart';
import 'package:validatorless/validatorless.dart';

class StockAddWidget extends HookWidget {
  const StockAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final codeController = useTextEditingController();
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final statusValue = useValueNotifier(true);
    final stockTypeIdController = useTextEditingController();
    final typeIdController = useTextEditingController();
    final salesKDVController = useTextEditingController();
    final sackKiloController = useTextEditingController();
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: BlocBuilder<StockBloc, StockState>(
        builder: (context, state) {
          if (state is StockStateLoading) {
            return const CircularProgressIndicator();
          }
          return FloatingActionButton.extended(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                int? checkedStockTypeId = int.tryParse(stockTypeIdController.text);
                int? checkedType = int.tryParse(typeIdController.text);
                double? checkedSalesKdv = double.tryParse(salesKDVController.text);
                double? checkedSackilo = double.tryParse(sackKiloController.text);
                if (checkedStockTypeId == null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("StockTypeId geçerli bir tam sayı olmalıdır")));
                  return;
                }
                if (checkedType == null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Type geçerli bir tam sayı olmalıdır")));
                  return;
                }
                if (checkedSalesKdv == null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("SalesKdv geçerli bir sayı olmalıdır")));
                  return;
                }
                if (checkedSackilo == null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Sackilo geçerli bir sayı olmalıdır")));
                  return;
                }

                context.read<StockBloc>().add(
                      StockEvent.createStock(
                        CreateStockModel(
                          code: codeController.text,
                          name: nameController.text,
                          description: descriptionController.text,
                          status: statusValue.value,
                          stockTypeId: checkedStockTypeId,
                          type: checkedType,
                          salesKdv: checkedSalesKdv,
                          sackKilo: checkedSackilo,
                        ),
                      ),
                    );
              }
            },
            icon: const Icon(Icons.save),
            label: const Text("Ekle"),
          );
        },
      ),
      body: SingleChildScrollView(
        child: BlocListener(
          bloc: context.read<StockBloc>(),
          listener: (context, state) {
            if (state is StockStateOperationSuccess) {
              codeController.clear();
              nameController.clear();
              descriptionController.clear();
              statusValue.value = true;
              stockTypeIdController.clear();
              typeIdController.clear();
              salesKDVController.clear();
              sackKiloController.clear();

              Navigator.pop(context);
            } else if (state is StockStateOperationFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("İşlem başarısız ${state.errors}"),
                ),
              );
            }
          },
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    controller: codeController,
                    validator: Validatorless.multiple([
                      Validatorless.required("StockTypeId boş bırakılamaz"),
                    ]),
                    decoration: const InputDecoration(labelText: "Kod"),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: nameController,
                    validator: Validatorless.multiple([
                      Validatorless.required("StockTypeId boş bırakılamaz"),
                    ]),
                    decoration: const InputDecoration(labelText: "İsim"),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: descriptionController,
                    validator: Validatorless.multiple([
                      Validatorless.required("StockTypeId boş bırakılamaz"),
                    ]),
                    decoration: const InputDecoration(labelText: "Açıklama"),
                  ),
                  const SizedBox(height: 16),
                  ValueListenableBuilder(
                    valueListenable: statusValue,
                    builder: (context, val, wid) {
                      return Row(
                        children: [
                          const Text("Status "),
                          CupertinoSwitch(
                            value: statusValue.value,
                            onChanged: (val) {
                              statusValue.value = val;
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: stockTypeIdController,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.number("StockTypeId geçerli bir sayı olmalıdır"),
                        Validatorless.required("StockTypeId boş bırakılamaz"),
                      ],
                    ),
                    decoration: const InputDecoration(labelText: "Stock Type Id"),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: typeIdController,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.number("TypeId geçerli bir sayı olmalıdır"),
                        Validatorless.required("TypeId boş bırakılamaz"),
                      ],
                    ),
                    decoration: const InputDecoration(labelText: "Type Id"),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: salesKDVController,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.number("StockTypeId geçerli bir sayı olmalıdır"),
                        Validatorless.required("StockTypeId boş bırakılamaz"),
                      ],
                    ),
                    decoration: const InputDecoration(labelText: "Sales KDV"),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: sackKiloController,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.number("StockTypeId geçerli bir sayı olmalıdır"),
                        Validatorless.required("StockTypeId boş bırakılamaz"),
                      ],
                    ),
                    decoration: const InputDecoration(labelText: "Sackilo"),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
