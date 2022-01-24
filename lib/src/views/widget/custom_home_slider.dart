import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/src/logic/controller/job_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class custom_home_slider extends StatefulWidget {
  custom_home_slider({Key? key, required this.textData}) : super(key: key);
  final Map<String, dynamic> textData;
  @override
  _custom_home_sliderState createState() => _custom_home_sliderState();
}

class _custom_home_sliderState extends State<custom_home_slider> {
  late final Map<String, dynamic> _textData;
  bool _isloading = false;
  int _intial = 0;
  CarouselController carouselController = CarouselController();
  Future<void> _ChangeSlide() async {
    if (_intial < 2) {
      carouselController.nextPage();
    } else {
      setState(() {
        _isloading = true;
      });
      await Get.put(JobController()).getData().then((value) {
        Navigator.popAndPushNamed(context, "/src/views/ui/Master");
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textData = widget.textData;
  }

  @override
  Widget build(BuildContext context) {
    return (_isloading)
        ? const CircularProgressIndicator(
            color: Colors.red,
          )
        : Column(
            children: [
              CarouselSlider(
                items: _textData.entries
                    .map((e) => Container(
                          child: Text(
                            e.value.toString(),
                            textAlign: TextAlign.center,
                            maxLines: 5,
                            style: const TextStyle(
                              fontSize: 25,
                              fontFamily: "DancingScript",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          alignment: Alignment.center,
                        ))
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  disableCenter: true,
                  initialPage: _intial,
                  onPageChanged: (index, reason) =>
                      setState(() => _intial = index),
                ),
                carouselController: carouselController,
              ),
              AnimatedSmoothIndicator(
                activeIndex: _intial,
                effect: const ScaleEffect(),
                count: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _ChangeSlide,
                    child: const Text("TIẾP"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                  )
                ],
              ),
            ],
          );
  }
}
