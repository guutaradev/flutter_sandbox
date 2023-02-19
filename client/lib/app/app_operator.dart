import 'package:flutter/material.dart';
import 'package:flutter_sandbox_project/app/screen/game_screen.dart';
import 'package:flutter_sandbox_project/app/screen/screen_id.dart';
import 'package:flutter_sandbox_project/app/screen/title_screen.dart';
import 'package:go_router/go_router.dart';

class AppOperator extends StatefulWidget {
  const AppOperator({Key? key}) : super(key: key);

  @override
  State<AppOperator> createState() => _AppOperatorState();
}

class _AppOperatorState extends State<AppOperator> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    _router = GoRouter(routes: [
      GoRoute(
        path: ScreenId.title.id,
        pageBuilder: (context, state) {
          return buildPageWithDefaultTransition(
            state,
            const TitleScreen(),
          );
        },
      ),
      GoRoute(
        path: ScreenId.game.id,
        pageBuilder: (context, state) {
          return buildPageWithDefaultTransition(
            state,
            const GameScreen(),
          );
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Example",
      routerConfig: _router,
    );
  }

  CustomTransitionPage buildPageWithDefaultTransition<T>(
      GoRouterState state, Widget child) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
