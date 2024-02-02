import 'package:flutter/material.dart';
import 'package:mednet/network/local/cache_helper.dart';
import 'package:mednet/select_job_view/model.dart';
import 'package:mednet/select_job_view/widgets/jobs_list_item.dart';

class JobsList extends StatefulWidget {
  const JobsList({super.key});

  @override
  State<JobsList> createState() => _JobsListState();
}

class _JobsListState extends State<JobsList> {
  int? activeIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: ListView.separated(
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              activeIndex = index;
              CacheHelper.saveData(key: 'jobId', value: index);
              print(CacheHelper.getData(key: 'jobId'));
              setState(() {});
            },
              child: JobsListItem(model: jobsList[index],isActive: index == activeIndex )),
          separatorBuilder: (context, index) => SizedBox(height: 15,),
          itemCount: 2),
    );
  }
}
