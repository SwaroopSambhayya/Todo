import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;

  TaskCard({this.title, this.description, this.time});
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
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            description,
            overflow: TextOverflow.ellipsis,
            maxLines: 6,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 16, color: Colors.grey[400]),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            time,
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
