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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(CacheHelper.getData(key: 'doctorRating') == 1.0)
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red,
                        size: 150),
                    Text('very bad',style: TextStyle(color: Colors.white),),
                  ],
                ),
              if(CacheHelper.getData(key: 'doctorRating') == 2.0)
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.redAccent,
                        size: 150),
                    Text('bad',style: TextStyle(color: Colors.white),),
                  ],
                ),
              if(CacheHelper.getData(key: 'doctorRating') == 3.0)
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                        Icons.sentiment_neutral,
                        color: Colors.amber,
                        size: 150),
                    Text('good',style: TextStyle(color: Colors.white),),
                  ],
                ),
              if(CacheHelper.getData(key: 'doctorRating') == 4.0)
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.lightGreen,
                        size: 50),
                    Text('very good',style: TextStyle(color: Colors.white),),
                  ],
                ),
              if(CacheHelper.getData(key: 'doctorRating') == 5.0)
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.green,
                        size: 150),
                    Text('excellent',style: TextStyle(color: Colors.white),),
                  ],
                ),

            ],
          ),
        ),
      ),
    );
  }
}
