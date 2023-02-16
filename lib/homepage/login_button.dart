import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'dart:ui';
import 'package:velocity_x/velocity_x.dart';

class LoginButton extends StatelessWidget {
  final IconData icon;
  final String textInside;
  final  VoidCallback onTap;
  const LoginButton(
      {super.key,
      required this.icon,
      required this.textInside,
      required this.onTap,
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Icon(icon),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo.shade400,
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 20.0,
          ),
          shape: const StadiumBorder(),
        ),
        onPressed: onTap,
        label: textInside.text.lg.bold.make().pOnly(left: 8));
  }
}

// class LoginButton extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onTap;
//   final String textInside;
//   //final Color color;
//   const LoginButton(
//       {super.key,
//       required this.icon,
//       required this.onTap,
//       required this.textInside,
//       });

//   @override
//   Widget build(BuildContext context) {
//         return ElevatedButton.icon(
//         icon: Icon(icon),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.indigo.shade400,
//           padding: const EdgeInsets.symmetric(
//             horizontal: 30.0,
//             vertical: 20.0,
//           ),
//           shape: const StadiumBorder(),
//         ),
//         onPressed: onTap,
//         label: textInside.text.lg.bold.make().pOnly(left: 8));
//   }
// }
// ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// //import 'dart:ui';

// class LoginButton extends StatelessWidget {
//   final String textInside;
//   final VoidCallback onTap;
//   //final bool loading;
//   //final Color color;
//   const LoginButton(
//       {super.key,
//       required this.textInside,
//       required this.onTap,
//       //required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 2.0),
//         child: Container(
//             height: 80,
//             width: 200,
//             //width: double.infinity,
//             decoration: BoxDecoration(
//               color: Colors.indigo.shade400,
//               borderRadius: BorderRadius.circular(70),
//             ),
//             child: Center(
//               child: Text(
//                       textInside,
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//             )),
//       ),
//     );
//   }
// }
