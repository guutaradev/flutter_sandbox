import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sandbox_project/app/component/actor_comp.dart';
import 'package:flutter_sandbox_project/app/component/joystick_comp.dart';
import 'package:flutter_sandbox_project/app/model/actor.dart';

class GameMain extends FlameGame with HasGameRef, HasDraggables {
  late final JoystickComp _joystickComp;
  final _fieldLayer = Component();
  final _uiLayer = Component()..positionType = PositionType.viewport;
  late Actor _actor;

  @override
  Color backgroundColor() => const Color.fromRGBO(130, 140, 130, 1.0);

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Layers
    await add(_fieldLayer);
    await add(_uiLayer);

    // Actor
    _actor = Actor(Vector2(100, 100));
    final actorComp = ActorComp(_actor);
    await add(actorComp);

    // Dummy
    final dummyComp = ActorComp(Actor(Vector2(150, 100)));
    await add(dummyComp);

    // Joystick
    await _createJoystick();

    // Camera
    camera.zoom = gameRef.size.x / 128;
    camera.followComponent(actorComp);
  }

  Future<void> _createJoystick() async {
    final knobPaint = BasicPalette.white.withAlpha(200).paint();
    final backgroundPaint = BasicPalette.white.withAlpha(50).paint();
    final joystickX = gameRef.size.x / 2;
    _joystickComp =
        JoystickComp(knobPaint, backgroundPaint, 30, 60, joystickX, 60);
    await _uiLayer.add(_joystickComp);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (!_joystickComp.delta.isZero()) {
      _actor.moveByVelocity(_joystickComp.delta.normalized() * 50 * dt);
    }
  }
}
