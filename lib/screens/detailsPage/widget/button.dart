import 'package:flutter/material.dart';

class LiteButton extends StatefulWidget {
  const LiteButton({
    Key? key,
    required this.width,
    required this.height,
    required this.icon,
    required this.color,
    required this.callBack,
  }) : super(key: key);
  final double width;
  final double height;
  final Image icon;
  final Color color;
  final VoidCallback callBack;
  @override
  _LiteButtonState createState() => _LiteButtonState();
}

class _LiteButtonState extends State<LiteButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      width: widget.width,
      height: widget.height,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.all(widget.color),
        ),
        onPressed: widget.callBack,
        child: Center(child: widget.icon),
      ),
    );
  }
}
