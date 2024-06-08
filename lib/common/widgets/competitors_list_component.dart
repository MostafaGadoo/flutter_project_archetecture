import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

  class CompetitorsListComponent extends StatelessWidget {
  final String position;
  final String image;
  final String name;
  final String score;

  const CompetitorsListComponent({
    Key? key,
    required this.position,
    required this.image,
    required this.name,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          position,
          width: 40,
          height: 40,
        ),
        const SizedBox(
          width: 10,
        ),
         CircleAvatar(
          radius: 33,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            image,
          ),
          // child: SvgPicture.asset(
          //   'assets/images/winner1.svg',
          //   width: 70,
          //   height: 70,
          // ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          score,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFF666666),
          ),
        ),
      ],
    );
  }
}
