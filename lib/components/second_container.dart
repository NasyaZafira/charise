import 'package:flutter/material.dart';

class SecondContainer extends StatefulWidget {
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  SecondContainer(
      {required this.child, required this.borderRadius, required this.padding});

  @override
  _SecondContainerState createState() => _SecondContainerState();
}

class _SecondContainerState extends State<SecondContainer> {
  // bool _isPressed = false;
  //
  // void _onPointerDown(PointerDownEvent event) {
  //   setState(() {
  //     _isPressed = true;
  //   });
  // }
  //
  // void _onPointerUp(PointerUpEvent event) {
  //   setState(() {
  //     _isPressed = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Listener(
      // onPointerDown: _onPointerDown,
      // onPointerUp: _onPointerUp,
      child: Container(
        margin: EdgeInsets.only(left: 25, right: 25, top: 15),
        padding: widget.padding,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: widget.borderRadius,
          boxShadow:
          // _isPressed
          //     ? null
          //     :
          [
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
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
