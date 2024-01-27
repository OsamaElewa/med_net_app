import 'package:flutter/material.dart';
import 'package:mednet/select_job_view/model.dart';

class JobsListItem extends StatelessWidget {
  const JobsListItem({super.key, required this.model, required this.isActive});
  final JobModel model;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.50, color: isActive? Colors.amber : Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: isActive?  Colors.amber: Colors.transparent,
            blurRadius: 4,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      duration: const Duration(milliseconds: 300),
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Row(
              children: [
                Icon(model.icon,size: 80,color: Colors.white,),
                SizedBox(width: 7,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Signingup as a',style: TextStyle(color: Colors.white,fontSize: 14),),
                    Text(model.jobName,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_outlined,size: 25,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
