import 'package:flutter/material.dart';

// class RoundedButton extends StatelessWidget {
//
//   final String buttonName;
//   final VoidCallback? onTap;
//
//   final double height;
//   final double width;
//   final double bottomMargin;
//   final double borderWidth;
//   final Color buttonColor;
//   final double fontSize;
//
//   //passing props in react style
//   RoundedButton(
//       {this.buttonName = 'Button',
//         this.onTap,
//         this.height = 50,
//         this.bottomMargin = 10.0,
//         this.borderWidth = 0.0,
//         this.width = 300,
//         this.buttonColor = Colors.blue,
//         this.fontSize = 16});
//
//   static RoundedButton example(){
//     return RoundedButton(
//       buttonName: "ENTRAR",
//       onTap: (){},
//       width: 300,
//       height: 50.0,
//       bottomMargin: 10.0,
//       borderWidth: 0.0,
//       buttonColor: Colors.blue,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (borderWidth != 0.0)
//       return (new InkWell(
//         onTap: onTap,
//         child: new Container(
//           width: width,
//           height: height,
//           margin: new EdgeInsets.only(bottom: bottomMargin),
//           alignment: FractionalOffset.center,
//           decoration: new BoxDecoration(
//               color: buttonColor,
//               borderRadius: new BorderRadius.all(const Radius.circular(25.0)),
//               border: new Border.all(
//                   color: const Color.fromRGBO(221, 221, 221, 1.0),
//                   width: borderWidth)),
//           child: new Text(buttonName, style: TextStyle(
//               color: const Color(0XFFFFFFFF),
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold)),
//         ),
//       ));
//     else
//       return (new InkWell(
//         onTap: onTap,
//         child: new Container(
//           width: width,
//           height: height,
//           margin: new EdgeInsets.only(bottom: bottomMargin),
//           alignment: FractionalOffset.center,
//           decoration: new BoxDecoration(
//             color: buttonColor,
//             borderRadius: new BorderRadius.all(const Radius.circular(25.0)),
//           ),
//           child: new Text(buttonName, style: TextStyle(
//               color: const Color(0XFFFFFFFF),
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold)),
//         ),
//       ));
//   }
// }