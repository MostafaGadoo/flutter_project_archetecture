import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardComponent extends StatefulWidget {
  final String commentNumber;
  final String userPicture;
  final String postBody;
  final String userName;
  final String postPicture;

  const CardComponent({
    Key? key,
    required this.postBody,
    required this.userPicture,
    required this.commentNumber,
    required this.userName,
    required this.postPicture,
  }) : super(key: key);

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {

  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Image(
                    image:
                    AssetImage(widget.userPicture)),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: TextStyle(
                        fontSize: 15.w,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      '2h',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
                widget.postBody,
                style: TextStyle(
                  fontSize: 14.w,
                  height: 1.2,
                  letterSpacing: 0.5,
                )),
            SizedBox(
              height: 8.h,
            ),
            Image(
              image: AssetImage(widget.postPicture),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.w,
              ),
              child: Row(
                children: [
                  const Image(
                      image: AssetImage(
                          'assets/images/frame_1815.png')),
                  const Expanded(
                    child: Text(
                      'Fady Ibrahim and 3 others',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    '${widget.commentNumber} Comments',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onLongPress: () {
                    setState(() {
                      _showReactContainer(context);
                      debugPrint('Long Pressed');
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.thumb_up_alt_outlined,
                        size: 30.w,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Like',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.w,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.message_outlined,
                      size: 30.w,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Comment',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.w,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.share_outlined,
                      size: 30.w,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Share',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.w,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }



  void _showReactContainer(BuildContext context) {
    // Create an overlay entry to display the react container
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        bottom: 100, // Adjust the position as needed
        left: MediaQuery.of(context).size.width / 2 - 50, // Center horizontally
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () {
                  // Handle react action (like, in this case)
                  _overlayEntry!.remove(); // Remove the react container
                  _showSnackBar(context, 'Liked'); // Show a feedback message
                },
              ),
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  // Handle react action (love, in this case)
                  _overlayEntry!.remove(); // Remove the react container
                  _showSnackBar(context, 'Loved'); // Show a feedback message
                },
              ),
              // Add more react options here
            ],
          ),
        ),
      ),
    );

    // Insert the overlay entry into the overlay
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}



