import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mednet/constants/show_snack_bar.dart';
import 'package:mednet/network/local/cache_helper.dart';

class RatingBottomSheet extends StatelessWidget {
  const RatingBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16.h,
          ),
          ///// rating
          RatingBar.builder(
            initialRating: 3,
            itemCount: 5,
            minRating: 1.0,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.red,
                  );
                case 1:
                  return const Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.redAccent,
                  );
                case 2:
                  return const Icon(
                    Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
                case 3:
                  return const Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.lightGreen,
                  );
                case 4:
                  return const Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.green,
                  );
                default:
                  return Container();
              }
            },
            onRatingUpdate: (rating) {
              print(rating);
              CacheHelper.saveData(key: 'doctorRating', value: rating);
              CacheHelper.saveData(key: 'docRatingName', value: CacheHelper.getData(key: 'regName'));
            },
          ),
          ///// rating
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  showSuccessSnackBar(context: context, message: 'the rating is sent successfully');
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black),
                )),
          ),
        ],
      ),
    );
  }
}
