import 'package:flutter/material.dart';

import '../constants/size.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.3,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    Key? key,
  }):super(key: key);

  final String image , title , subTitle;
  final double imageHeight;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(image),
          height: size.height * imageHeight,
        ),
          Text(
           title,
          style: const TextStyle(fontSize: defaultfontsize),
        ),
          Text(subTitle),
      ],
    );
  }
}