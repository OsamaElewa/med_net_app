import 'package:flutter/material.dart';
import 'package:mednet/network/local/cache_helper.dart';

class RateDetails extends StatelessWidget {
  const RateDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rating name:',style: TextStyle(color: Colors.black),),
                SizedBox(height: 10,),
                Text(CacheHelper.getData(key: 'docRatingName'),style: TextStyle(color: Colors.white),),
                SizedBox(height: 20,),
                Text('Description Rating:',style: TextStyle(color: Colors.black),),
                SizedBox(height: 10,),
                Text(CacheHelper.getData(key: 'docDescRating'),style: TextStyle(color: Colors.white),),
                SizedBox(height: 20,),
                const Text('Complain:',style: TextStyle(color: Colors.black),),
                SizedBox(height: 10,),
                Text(CacheHelper.getData(key: 'docComplianRating'),style: TextStyle(color: Colors.white),),
                SizedBox(height: 20,),
                const Text('Satisfy Rating:',style: TextStyle(color: Colors.black),),
                SizedBox(height: 10,),
                Text(CacheHelper.getData(key: 'docSatisfyRating'),style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
