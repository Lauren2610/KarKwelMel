import 'package:flutter/material.dart';
import 'package:karkwelmel_fullstack_flutter/TolyMoly/Constants.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 30.0,
                  right: 30.0,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Sex Educational',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: mainkythwycolor,
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Articles',
                        style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                          color: mainpinkcolor,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    ArticleBox(
                      title: 'ကွန်ဒုံးဘယ်လိုသုံးကြမလဲ',
                      color: mainkythwycolor,
                      press: () {},
                    ),
                    SizedBox(height: 10.0),
                    ArticleBox(
                      title: 'OC pill ဆိုတာဘာလဲ',
                      color: maincolor,
                      press: () {},
                    ),
                    SizedBox(height: 10.0),
                    ArticleBox(
                      title: 'Emergency pill နှင့် ကောင်းကျိုးဆိုးကျိုးများ',
                      color: mainkythwycolor,
                      press: () {},
                    ),
                    SizedBox(height: 10.0),
                    ArticleBox(
                      title: 'ရေရှည်ကိုယ်ဝန်တားကြမယ်',
                      color: maincolor,
                      press: () {},
                    ),
                    SizedBox(height: 10.0),
                    ArticleBox(
                      title: 'လွဲမှားနေသော သားဆက်ခြားနည်းများ',
                      color: mainkythwycolor,
                      press: () {},
                    ),
                    SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 250.0),
                      child: Text(
                        'Movies',
                        style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                          color: mainpinkcolor,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      width: 400.0,
                      height: 200.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Image.asset('assets/images/movie1.jpg'),
                            SizedBox(width: 50.0),
                            Image.asset('assets/images/movie2.jpg'),
                            SizedBox(width: 50.0),
                            Image.asset('assets/images/movie3.jpg'),
                            SizedBox(width: 50.0),
                            Image.asset('assets/images/movie4.jpg'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 200.0),
                      child: Text(
                        'Social Platforms',
                        style: TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                          color: mainpinkcolor,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      width: 400.0,
                      height: 200.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Image.asset('assets/images/platform1.JPG'),
                            SizedBox(width: 50.0),
                            Image.asset('assets/images/platform2.JPG'),
                            SizedBox(height: 20.0),
                            Text('Hello ဆရာဝန်'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleBox extends StatelessWidget {
  ArticleBox({this.title, this.color, this.press});
  String? title;
  Color? color;
  VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 360.0,
        height: 70.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: color,
        ),
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
