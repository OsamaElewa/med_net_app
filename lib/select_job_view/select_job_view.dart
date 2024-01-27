import 'package:flutter/material.dart';
import 'package:mednet/select_job_view/widgets/jobs_list.dart';
import 'package:mednet/signup_view/signup_view.dart';

class SelectJobView extends StatelessWidget {
  const SelectJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Text('Create an account.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
              Text('please select your job for signing.',style: TextStyle(color: Colors.white,fontSize: 14),),
              SizedBox(height: 20,),
              JobsList(),
              SizedBox(height: 30,),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(

                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupView(),)),
                  child: Text('Continue',style: TextStyle(color: Colors.black,fontSize: 18),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
