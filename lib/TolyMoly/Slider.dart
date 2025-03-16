// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_kar_kwel_ml/TolyMoly/Constants.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:flutter/material.dart';
//
// class Slider extends StatefulWidget {
//   const Slider({Key? key}) : super(key: key);
//
//   @override
//   State<Slider> createState() => _SliderState();
// }
//
// class _SliderState extends State<Slider> {
//   int activeIndex = 0;
//   final urlImages = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           CarouselSlider.builder(
//               itemCount: urlImages.length,
//               itemBuilder: (context, index, realIndex) {
//                 final urlImages = urlImages[index];
//                 return buildImage(urllmage, index);
//               },
//               options: CarouselOptions(height: 200.0,onPageChanged: (index,reason){
//                 setState(() {
//                   activeIndex = index;
//                 });
//               }),
//
//           ),
//           SizedBox(height: 10.0,),buildIndicator()
//         ],
//       ),
//     );
//   }
// }
//
// Widget buildIndicator() {AnimatedSmoothIndicator(activeIndex: activeIndex, count: urlImages.length,effect: ExpandingDotsEffect(dotWidth: 15,activeDotColor: mainkythwycolor),)}
// Widget buildImage(String urllmage, int index) {
//   Container(
//       margin: EdgeInsets.symmetric(horizontal: 5),
//       child: Image.asset(urllmage, fit: BoxFit.cover));
// }
