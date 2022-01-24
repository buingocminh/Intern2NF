import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/src/logic/controller/job_controller.dart';
import 'package:job/src/views/widget/custom_footer.dart';
import 'package:job/src/views/widget/custom_header.dart';

import 'package:job/src/views/widget/search_result.dart';

class Job_searching extends StatefulWidget {
  const Job_searching({Key? key}) : super(key: key);

  @override
  _Job_searchingState createState() => _Job_searchingState();
}

class _Job_searchingState extends State<Job_searching> {
  bool _result = false;
  bool _isloading = false;
  late List<String> _city;
  late JobController _jobController;
  Map<String, dynamic> criteria = {
    "city": "",
    "jobtyple": "fulltime",
    "mostview": false,
    "hisalary": false,
    "newest": false,
    "noexp": false,
  };
  String? _jobsection;
  @override
  void didChangeDependencies() {
    _jobController = Get.find<JobController>();
    _city = _jobController.ProvineList;
    _jobsection = _jobController.JobSection;
    criteria["city"] = _city[0];
    super.didChangeDependencies();
  }

  void _search() async {
    print(criteria);
    print(_jobsection);
    setState(() {
      _isloading = true;
    });
    await _jobController.getData().then((value) => setState(() {
          _result = true;
          _isloading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //header
            custom_header(),
            //Main
            (_isloading)
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                : (_result)
                    ? Expanded(child: search_result(criteria: criteria))
                    : Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 50, right: 50),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    FittedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Radio(
                                                value: "fulltime",
                                                groupValue:
                                                    criteria["jobtyple"],
                                                onChanged: (val) =>
                                                    setState(() {
                                                  criteria["jobtyple"] = val;
                                                }),
                                              ),
                                              const Text("Toàn thời gian"),
                                            ],
                                          ),
                                          Row(children: [
                                            Radio(
                                              value: "parttime",
                                              groupValue: criteria["jobtyple"],
                                              onChanged: (val) => setState(() {
                                                criteria["jobtyple"] = val;
                                              }),
                                            ),
                                            const Text("Bán thời gian")
                                          ]),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          value: criteria["mostview"] ?? false,
                                          onChanged: (val) => setState(() {
                                            criteria["mostview"] = val;
                                          }),
                                          title: const Text("Xem nhiều nhất"),
                                        ),
                                        CheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          value: criteria["hisalary"] ?? false,
                                          onChanged: (val) => setState(() {
                                            criteria["hisalary"] = val;
                                          }),
                                          title: const Text("Lương cao nhất"),
                                        ),
                                        CheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          value: criteria["newest"] ??
                                              false, //_criteria["newest"],
                                          onChanged: (val) => setState(() {
                                            criteria["newest"] = val;
                                          }),
                                          title: const Text("Mới nhất"),
                                        ),
                                        CheckboxListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          value: criteria["noexp"] ?? false,
                                          onChanged: (val) => setState(() {
                                            criteria["noexp"] = val;
                                          }),
                                          title: const Text(
                                              "Không yêu cầu kinh nghiệm"),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: DropdownButton(
                                            isExpanded: true,
                                            value: criteria["city"].toString(),
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: _city.map((String item) {
                                              return DropdownMenuItem(
                                                value: item,
                                                child: Text(item),
                                              );
                                            }).toList(),
                                            onChanged: (Object? value) {
                                              setState(() {
                                                criteria['city'] =
                                                    value.toString();
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: _search,
                                          child: const Text("Tìm Kiếm"),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.red)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Custom_footer(),
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
