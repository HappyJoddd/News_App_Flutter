import 'package:flutter/material.dart';

class Newstile extends StatelessWidget {
  final String imageUrl;
  final String time;
  final String title;
  final String author;
  const Newstile(
      {super.key,
      required this.imageUrl,
      required this.time,
      required this.title,
      required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: 13,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 10),
                    Text(author)
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  maxLines: 2,
                ),
                SizedBox(height: 15),
                Text(
                  time,
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
