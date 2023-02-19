import 'package:flutter/material.dart';
import 'package:flutter_sandbox_project/app/screen/screen_id.dart';
import 'package:go_router/go_router.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black87,
          ),
          Center(
            child: ElevatedButton(
              child: const Text("START EXAMPLE"),
              onPressed: () {
                context.go(ScreenId.game.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
