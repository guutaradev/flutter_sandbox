import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox_project/app/game/game_main.dart';
import 'package:flutter_sandbox_project/app/screen/screen_id.dart';
import 'package:go_router/go_router.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameMain gameMain;

  @override
  void initState() {
    super.initState();

    gameMain = GameMain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(child: GameWidget(game: gameMain)),
          Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
              child: const Text("BACK TITLE"),
              onPressed: () {
                context.go(ScreenId.title.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
