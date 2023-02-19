import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sandbox_project/app/model/direction_type.dart';

class ActorSpriteComp extends SpriteAnimationComponent with HasGameRef {
  late final SpriteAnimation _idleAnim;
  late final SpriteAnimation _walkAnim;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    size = Vector2(16, 16);
    anchor = Anchor.bottomCenter;

    await _loadAnimations().then((value) => playIdle());
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: await gameRef.images.load("image.png"), columns: 4, rows: 4);

    _idleAnim =
        spriteSheet.createAnimation(row: 0, stepTime: 0.5, from: 0, to: 1);

    _walkAnim = SpriteAnimation.spriteList(<Sprite>[
      spriteSheet.getSprite(0, 1),
      spriteSheet.getSprite(0, 0),
    ], stepTime: 0.2);
  }

  void playIdle() {
    if (animation == _idleAnim) return;
    _idleAnim.reset();
    animation = _idleAnim;
  }

  void playWalk() {
    if (animation == _walkAnim) return;
    _walkAnim.reset();
    animation = _walkAnim;
  }

  void updateDirection(DirectionType direction) {
    switch (direction) {
      case DirectionType.left:
        if (!isFlippedHorizontally) flipHorizontally();
        break;
      case DirectionType.right:
        if (isFlippedHorizontally) flipHorizontally();
        break;
    }
  }
}
