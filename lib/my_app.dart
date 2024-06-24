import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_client/rest_api_client.dart';
import 'package:trakya_arge/src/core/router/router_config.dart';
import 'package:trakya_arge/src/features/stock/data/repositories/stock_repository_impl.dart';
import 'package:trakya_arge/src/features/stock/presentation/bloc/stock_bloc.dart';
import 'package:trakya_arge/src/features/stockType/data/repositories/stock_type_repository_impl.dart';
import 'package:trakya_arge/src/features/stockType/presentation/bloc/stock_type_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.apiClient});
  final RestApiClient apiClient;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => StockTypeRepositoryImpl(apiService: apiClient)),
          RepositoryProvider(create: (context) => StockRepositoryImpl(apiService: apiClient)),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => StockTypeBloc(
                stockTypeRepositoryImpl: context.read<StockTypeRepositoryImpl>(),
              )..add(const StockTypeEvent.loadStockTypes()),
            ),
            BlocProvider(
              create: (context) => StockBloc(
                stockRepositoryImpl: context.read<StockRepositoryImpl>(),
              )..add(const StockEvent.loadStocks()),
            ),
          ],
          child: MaterialApp.router(
            title: 'Trakya Arge App',
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            theme: ThemeData.light().copyWith(
                inputDecorationTheme: const InputDecorationTheme(
              focusedBorder: OutlineInputBorder(),
              border: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
              disabledBorder: OutlineInputBorder(),
              focusedErrorBorder: OutlineInputBorder(),
            )),
          ),
        ),
      ),
    );
  }
}
