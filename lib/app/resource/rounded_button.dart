import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final Widget? icon;
  final Function()? onPress;
  final Color buttonColor;
  final double width;
  final double borderWidth;
  final double height;
  final BorderRadius? borderRadius;
  final double? elevation;

  RoundedButton(
      {Key? key,
      this.title = 'Button',
      this.borderWidth = 1,
      this.width = double.infinity,
      this.height = 26,
      this.borderRadius,
        this.elevation = 0,
      this.style,
      this.buttonColor = Colors.black,
      this.icon,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: width, height: height),
        child: icon == null ? _normalButton() : _iconButton());
  }

  Widget _normalButton() {
    return ElevatedButton(
        child: Text(title, style: _defaultTextStyle()),
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          elevation: elevation,
          padding: EdgeInsets.all(4.0),
          side: BorderSide(width: borderWidth, color: Color(0xFFB6B4B4)),
          shape: new RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12.0),
          ),
        ));
  }

  Widget _iconButton() {
    return ElevatedButton.icon(
      icon: icon ?? Container(),
      label: Text(title, style: _defaultTextStyle()),
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        elevation: elevation,
        padding: EdgeInsets.all(4.0),
        side: BorderSide(width: borderWidth, color: Color(0xFFB6B4B4)),
        shape: new RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  TextStyle _defaultTextStyle(){
    return style ?? TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.normal);
  }
}
