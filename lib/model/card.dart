import 'package:flutter/material.dart';

// class ItemCard extends StatelessWidget {
//   final Color color;
//   final String text;

//   const ItemCard({required this.color, required this.text});
//   Widget BuildContext(BuildContext context, {required MaterialColor color, required String text}) {
//     return Container(
//       width: 150.0, 
//       height: 140.0,
//       margin: EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//     );
//   }
// }
class ItemCard extends StatelessWidget {
  final Color color;
  final String text;
  final double width, height;

  const ItemCard({required this.color, required this.text, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}