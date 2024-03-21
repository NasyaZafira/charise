import 'package:flutter/material.dart';

class NeuButton extends StatefulWidget {
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  NeuButton(
      {required this.child, required this.borderRadius, required this.padding});

  @override
  _NeuButtonState createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: widget.borderRadius,
            boxShadow: _isPressed
                ? null
                : [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5.0, -5.0),
                      blurRadius: 17.0,
                      spreadRadius: -8,
                    ),
                    BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        offset: Offset(7 , 7),
                        blurRadius: 10,
                        spreadRadius: -3
                    )
                  ]),
        child: widget.child,
      ),
    );
  }
}
