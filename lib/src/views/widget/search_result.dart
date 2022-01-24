import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/src/logic/controller/job_controller.dart';

import 'package:job/src/views/widget/Job_list_item.dart';

import '../../logic/models/Job.dart';

class search_result extends StatelessWidget {
  search_result({Key? key, required this.criteria}) : super(key: key);
  final Map<String, dynamic> criteria;
  final JobController _jobcontroller = Get.find<JobController>();
  @override
  Widget build(BuildContext context) {
    final List<Job> _joblist = _jobcontroller.SearchByCriteria(criteria);
    return Container(
      child: Container(
        margin: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _joblist.length,
            itemBuilder: (BuildContext context, int index) {
              return JobListItem(
                job: _joblist[index],
              );
            }),
      ),
    );
  }
}
