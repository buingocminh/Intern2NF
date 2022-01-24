import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:job/src/logic/controller/job_controller.dart';

import '../../logic/models/Job.dart';

class JobListItem extends StatelessWidget {
  final Job job;
  final JobController _jobController = Get.find<JobController>();
  JobListItem({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _jobController.IncreaseView(job.ID.toString());
        Navigator.pushNamed(context, "/src/view/ui/job_info_screen",
            arguments: job.ID);
        //print("tap");
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              job.Name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(intl.NumberFormat.decimalPattern().format(job.Price),
                    style: TextStyle(
                      color: Colors.red,
                    )),
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Colors.grey,
                    ),
                    Text(
                      job.Location,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
