import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class JoystickComp extends JoystickComponent {
  JoystickComp(Paint knobPaint, Paint backgroundPaint, double knobSize,
      double backgroundSize, double left, double bottom)
      : super(
          background:
              CircleComponent(radius: backgroundSize, paint: backgroundPaint),
          knob: CircleComponent(radius: knobSize, paint: knobPaint),
          margin: EdgeInsets.only(left: left - backgroundSize, bottom: bottom),
        );
}
