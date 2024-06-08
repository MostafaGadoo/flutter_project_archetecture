import 'package:flutter/material.dart';

class QAndAListComponent extends StatelessWidget {
  String? text;
  String? image;
  String? author;
  String? date;

  QAndAListComponent({
    Key? key,
    this.text,
    this.image,
    this.author,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text!,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Row(
            children: [
              Image(image: AssetImage(image!)),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author!,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    date!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.thumb_up_alt_outlined,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Like',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '12',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.messenger_outline_rounded,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Reply',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '3',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
