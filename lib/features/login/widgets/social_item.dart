import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SocialItem extends StatelessWidget {
  SocialItem({required this.image});

  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: HexColor('#F5F6F9'),
      ),
      padding: EdgeInsets.all(5),
      child: Image.asset(image),
    );
  }
}
