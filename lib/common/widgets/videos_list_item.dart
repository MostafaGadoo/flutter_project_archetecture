import 'package:flutter/material.dart';

class VideosListItem extends StatelessWidget {
  final String? number;
  final String? title;
  final String? duration;
  const VideosListItem({
    Key? key,
    required this.number,
    required this.title,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: const Color(0xFFF2F8FF),
          child: Text(
            number ?? '02',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF016BDD),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? 'Identify the basics',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xFF121212),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              'Video . ${duration ?? '15 mins'}',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF999999),
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.check_circle,
          color: Color(0xFF68C151),
          size: 32,
        )
      ],
    );
  }
}
