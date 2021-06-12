import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "This is title",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry's standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type",
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 16, color: Colors.grey[400]),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Jun 12",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.grey[400], fontSize: 14),
          )
        ],
      ),
    );
  }
}
