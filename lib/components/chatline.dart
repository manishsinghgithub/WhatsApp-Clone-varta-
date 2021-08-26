import 'package:flutter/material.dart';

Widget chatTile(
    String imgUrl, String userName, String msg, String date, bool seen) {
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imgUrl),
            radius: 28,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    userName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )),
                  Text(date)
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text(msg)),
                  if (seen)
                    Icon(
                      Icons.check_circle,
                      size: 17,
                      color: Colors.green,
                    ),
                  if (!seen)
                    Icon(
                      Icons.check_circle_outline,
                      size: 17,
                      color: Colors.green,
                    )
                ],
              )
            ],
          )),
        ],
      ),
    ),
  );
}
