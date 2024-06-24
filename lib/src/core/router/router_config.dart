import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trakya_arge/src/features/navbar/scaffold_with_navbar.dart';
import 'package:trakya_arge/src/features/stock/presentation/pages/stock_detail_page.dart';
import 'package:trakya_arge/src/features/stock/presentation/pages/stock_list_page.dart';
import 'package:trakya_arge/src/features/stockType/presentation/pages/stock_type_detail_page.dart';
import 'package:trakya_arge/src/features/stockType/presentation/pages/stock_type_page.dart';
import 'package:trakya_arge/src/shared/no_content_widget.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/stock-list",
  routes: [
    ShellRoute(
      navigatorKey: GlobalKey<NavigatorState>(),
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          name: '/stock-list',
          path: '/stock-list',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: StockListPage(),
          ),
        ),
        GoRoute(
          name: "/stock-types",
          path: '/stock-types',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: StockTypePage(),
          ),
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: "/stock-types/",
      path: '/stock-types/:id',
      pageBuilder: (context, state) {
        if (state.pathParameters["id"] == null) {
          return const NoTransitionPage(
            child: NoContentWidget(),
          );
        } else {
          return NoTransitionPage(
            child: StockTypeDetailPage(
              id: state.pathParameters["id"]!,
            ),
          );
        }
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      name: '/stocks/',
      path: '/stocks/:id',
      pageBuilder: (context, state) {
        if (state.pathParameters["id"] == null) {
          return const NoTransitionPage(
            child: NoContentWidget(),
          );
        } else {
          return NoTransitionPage(
            child: StockDetailPage(id: state.pathParameters["id"]!),
          );
        }
      },
    ),
  ],
);
