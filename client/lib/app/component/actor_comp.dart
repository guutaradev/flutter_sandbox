import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_sandbox_project/app/component/actor_sprite_comp.dart';
import 'package:flutter_sandbox_project/app/model/actor.dart';
import 'package:flutter_sandbox_project/app/model/direction_type.dart';

class ActorComp extends PositionComponent with HasGameRef {
  final Actor _actor;
  late final ActorSpriteComp _spriteComp;
  late Vector2 _prevPosition;

  ActorComp(this._actor);

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Shadow
    await _createShadow();

    // ActorSprite
    _spriteComp = ActorSpriteComp();
    await add(_spriteComp);

    position = _actor.position;
    _prevPosition = position.clone();
    _updatePriority();
  }

  void _updatePriority() {
    priority = position.y.toInt();
  }

  Future<void> _createShadow() async {
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: await gameRef.images.load("image.png"), columns: 4, rows: 4);
    final sprite = spriteSheet.getSprite(0, 2);
    final spriteComp = SpriteComponent(sprite: sprite)
      ..anchor = Anchor.bottomCenter
      ..opacity = 0.25;
    await add(spriteComp);
  }

  @override
  void update(double dt) {
    super.update(dt);

    _updatePosition();
  }

  void _updatePosition() {
    // Flip
    final positionDiff = (position - _prevPosition);
    if (positionDiff.x > 0) {
      _spriteComp.updateDirection(DirectionType.right);
    } else if (positionDiff.x < 0) {
      _spriteComp.updateDirection(DirectionType.left);
    }

    // Animation
    if (_prevPosition.distanceTo(position) > 0) {
      _spriteComp.playWalk();
      _updatePriority();
    } else {
      _spriteComp.playIdle();
    }

    _prevPosition = position.clone();
    position = _actor.position;
  }
}
