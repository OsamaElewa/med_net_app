import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingSystem extends StatefulWidget {
  final id;
  const RatingSystem({super.key, this.id});

  @override
  RatingSystemState createState() => RatingSystemState(id);
}

class RatingSystemState extends State<RatingSystem> {
  final id;
  int rating = 0;

  RatingSystemState(this.id);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Rate Us',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 10),
              Row(
                children: List.generate(
                  5,
                      (index) =>
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            rating = index + 1;
                          });
                        },
                        child: Icon(
                          Icons.star,
                          color: index < rating ? Colors.orange : Colors.grey,
                        ),
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'your rate: $rating',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
