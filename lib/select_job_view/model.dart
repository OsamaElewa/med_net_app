import 'package:flutter/material.dart';

class JobModel{
  final String jobName;
  final IconData icon;
  final int id;
  JobModel(this.jobName, this.id, this.icon);
}

List<JobModel> jobsList = [
  JobModel('Doctor', 0,Icons.person),
  JobModel('Service provider', 1,Icons.engineering),
];