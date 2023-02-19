import 'package:flame/components.dart';
import 'package:flutter_sandbox_project/app/model/direction_type.dart';
import 'package:rxdart/rxdart.dart';

class Actor {
  Vector2 position;
  final direction = BehaviorSubject<DirectionType>.seeded(DirectionType.right);

  Actor(this.position);

  void moveByVelocity(Vector2 v) {
    position.add(v);
  }
}
