import 'package:flutter/material.dart';
import 'package:mednet/network/local/cache_helper.dart';
import 'package:mednet/widget/bottom_nav_widgtes/rating_view/rate_details.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getData(key: 'doctorRating') != null? SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RateDetails(),)),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('rating:',style: TextStyle(color: Colors.black),),
                    Text(CacheHelper.getData(key: 'docRatingName'),style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    )
        :
        Center(
          child: Text('when the doctor rate the service it will appear here!',style: TextStyle(color: Colors.white),),
        )
    ;
  }
}
