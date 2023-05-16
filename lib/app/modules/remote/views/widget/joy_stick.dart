import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as Math;

class JoyStick extends StatefulWidget {
  final double radius;
  final double stickRadius;
  final Function callback;

  const JoyStick(
      {Key? key,
      required this.radius,
      required this.stickRadius,
      required this.callback})
      : super(key: key);

  @override
  _JoyStickState createState() => _JoyStickState();
}

class _JoyStickState extends State<JoyStick> {
  final GlobalKey _joyStickContainer = GlobalKey();
  double yOff = 0, xOff = 0;
  double _x = 0, _y = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final RenderBox renderBoxWidget =
          _joyStickContainer.currentContext?.findRenderObject() as RenderBox;
      final offset = renderBoxWidget.localToGlobal(Offset.zero);

      xOff = offset.dx;
      yOff = offset.dy;
    });

    _centerStick();
  }

  void _centerStick() {
    setState(() {
      _x = widget.radius;
      _y = widget.radius;
    });

    _sendCoordinates(_x, _y);
  }

  int map(x, in_min, in_max, out_min, out_max) {
    return ((x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min)
        .floor();
  }

  void _onPointerMove(PointerEvent details) {
    final x = details.position.dx - xOff;
    final y = details.position.dy - yOff;
    if (isStickInside(x, y, widget.radius, widget.radius,
        widget.radius - widget.stickRadius)) {
      // x and y cordinates

      setState(() {
        _x = x;
        _y = y;
      });

      _sendCoordinates(x, y);
    }
  }

  void _onPointerUp(PointerUpEvent event) {
    _centerStick();
  }

  void _sendCoordinates(double x, double y) {
    double speed = y - widget.radius;
    double direction = x - widget.radius;

    var vSpeed = -1 *
        this.map(
            speed, 0, (widget.radius - widget.stickRadius).floor(), 0, 100);
    var vDirection = this.map(
        direction, 0, (widget.radius - widget.stickRadius).floor(), 0, 100);

    widget.callback(vDirection, vSpeed);
  }

  isStickInside(x, y, circleX, circleY, circleRadius) {
    var absX = Math.pow((x - circleX).abs(), 2.0);
    var absY = Math.pow((y - circleY).abs(), 2.0);
    return Math.sqrt(absX + absY) < circleRadius;
  }

  Widget build(BuildContext context) {
    return Container(
      width: widget.radius*3.5,
      height: widget.radius*3.5,
      // color: Colors.black26,
      child: Stack(
        alignment: Alignment.center,
        children: [

          Container(
            width: widget.radius*2.05,
            height: widget.radius*2.05,
            decoration: BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: Center(
              child: Listener(
                behavior: HitTestBehavior.opaque,
                onPointerMove: _onPointerMove,
                onPointerUp: _onPointerUp,
                child: Container(
                  key: _joyStickContainer,
                  width: widget.radius * 2,
                  height: widget.radius * 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.radius),
                    color: Color(0xff3b4882),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: _x - widget.stickRadius,
                        top: _y - widget.stickRadius,
                        child: Container(
                          width: widget.stickRadius * 2,
                          height: widget.stickRadius * 2,
                          decoration: BoxDecoration(
                            color: Color(0xff1f91e3),
                            borderRadius: BorderRadius.circular(widget.stickRadius),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.arrow_left_rounded,color: Colors.white,size: 100)),
          Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.arrow_right_rounded,color: Colors.white,size: 100)),
          Align(
              alignment: Alignment.bottomCenter,
              child: Icon(Icons.arrow_drop_down_rounded,color: Colors.white,size: 100)),
          Align(
              alignment: Alignment.topCenter,
              child: Icon(Icons.arrow_drop_up_rounded,color: Colors.white,size: 100)),
        ],
      ),
    );
  }
}
