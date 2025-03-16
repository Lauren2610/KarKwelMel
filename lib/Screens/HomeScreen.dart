import 'dart:async';

import 'package:flutter/material.dart';
import 'package:karkwelmel_fullstack_flutter/TolyMoly/Constants.dart';

import 'Navbar.dart';
import 'Setting.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomeScreen';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool status = false;
  Timer? countdownTimer;

  Duration myDuration = Duration(days: 5);
  Navbar navbar = Navbar();

  static const String id = "HomePage";

  void startTimer() {
    countdownTimer = Timer.periodic(
      Duration(seconds: 1),
      (_) => setCountDown(),
    );
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(days: 5));
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  DateTime today = DateTime.now();
  List<DateTime> finishedDateList = [];

  @override
  void initState() {
    super.initState();
    finishedDateList = [
      DateTime(today.year, today.month, today.day - 1),
      DateTime(today.year, today.month, today.day - 2),
    ];
  }

  showAddDialog() async {
    await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text("ဒီနေ့ဆေးသောက်ပြီးပြီ"),
            content: Text('မနက်ဖြန်အတွက်timerမှတ်မည်'),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: Colors.white,
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    finishedDateList.add(DateTime.now());
                    startTimer();
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: Colors.white,
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30.0, top: 30.0),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  child: Text("Today"),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                '21 Days Pill Reminder',
                style: TextStyle(
                  color: mainpinkcolor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Center(
            //     child: Container(
            //   // height: 400.0,
            //   child: ,
            // )),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, bottom: 30.0),
              child: Text(
                'Set Timer',
                style: TextStyle(
                  color: mainpinkcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   width: 200.0,
                //   height: 200.0,
                //   child: AnalogClock(
                //     decoration: BoxDecoration(
                //         border: Border.all(width: 2.0, color: Colors.black),
                //         color: Colors.transparent,
                //         shape: BoxShape.circle),
                //   ),
                // ), //TODO clock
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      // Step 8
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          '$hours:$minutes:$seconds',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Step 9
                      GestureDetector(
                        onTap: startTimer,
                        child: TextButton(
                          onPressed: () {
                            showAddDialog();
                          },
                          child: Container(
                            width: 130.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: mainkythwycolor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Pill Timer',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 8.0),
                                  Icon(
                                    Icons.timelapse,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Step 10
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              if (countdownTimer == null ||
                                  countdownTimer!.isActive) {
                                stopTimer();
                              }
                            },
                            child: Container(
                              width: 80.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: mainkythwycolor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 24.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Stop',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Step 11
                          TextButton(
                            onPressed: () {
                              resetTimer();
                            },
                            child: Container(
                              width: 80.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: mainkythwycolor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Restart',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(width: 8.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0, top: 100.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Protection types & prices ',
                      style: TextStyle(
                        color: mainpinkcolor,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 30.0,
                                bottom: 10.0,
                              ),
                              child: Container(
                                width: 250,
                                height: 400,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.asset(
                                        'assets/images/Condoms.jpg',
                                      ),
                                    ),
                                    SizedBox(height: 0, width: double.infinity),
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'Durex Airy (ကွန်ဒုံး) Price-around 2000mmk ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        MaterialButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Nearby",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          color: Colors.blueAccent,
                                        ),
                                        SizedBox(width: 20.0),
                                        // MaterialButton(
                                        //   onPressed: () {
                                        //     setState(() {
                                        //       Navigator.of(context).push(
                                        //           MaterialPageRoute(
                                        //               builder: (context) =>
                                        //                   readmore1()));
                                        //     });
                                        //   },
                                        //   child: Text("Read more"),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 30.0,
                                bottom: 10.0,
                              ),
                              child: Container(
                                width: 250,
                                height: 400,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.asset(
                                        'assets/images/Contraceptive.jpeg',
                                      ),
                                    ),
                                    SizedBox(height: 0, width: double.infinity),
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'Lydia Clair (၂၁ လုံးပါ ကိုယ်ဝန်တားဆေး)Price-around 10000mmk ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        MaterialButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Nearby",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          color: Colors.blueAccent,
                                        ),
                                        SizedBox(width: 20.0),
                                        // MaterialButton(
                                        //   onPressed: () {},
                                        //   child: Text("Read more",
                                        //       style: TextStyle(
                                        //           color:
                                        //               Colors.blueAccent)),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 30.0,
                                bottom: 10.0,
                              ),
                              child: Container(
                                width: 250,
                                height: 400,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.asset(
                                        'assets/images/Emer.jpg',
                                      ),
                                    ),
                                    SizedBox(height: 0, width: double.infinity),
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'Emergency_pills(အရေးပေါ် ပဋိသန္ဓေတားဆေး)Price-2000 ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        MaterialButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Nearby",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          color: Colors.blueAccent,
                                        ),
                                        SizedBox(width: 20.0),
                                        // MaterialButton(
                                        //   onPressed: () {},
                                        //   child: Text("Read more"),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// class NotificationApi {
//   static final _notification = FlutterLocalNotificationsPlugin();
//   static Future _notificationDetails() async {
//     return NotificationDetails(
//       iOS: DarwinNotificationDetails(),
//     );
//   }
//
//   static Future showNotification({
//     int? id = 0,
//     String? title,
//     String? body,
//     String? payload,
//   }) async {
//     _notification.show(id!, title, body, await _notificationDetails(),
//         payload: payload);
//   }
// }
//
// class MyCalendarWidget extends StatefulWidget {
//   final List<DateTime> finishedDateList;
//   const MyCalendarWidget({
//     Key? key,
//     required this.finishedDateList,
//   }) : super(key: key);
//
//   @override
//   State<MyCalendarWidget> createState() => _MyCalendarWidgetState();
// }
//
// class _MyCalendarWidgetState extends State<MyCalendarWidget> {
//   HeaderStyle headerStyle = const HeaderStyle(
//     formatButtonVisible: false,
//     titleCentered: true,
//   );
//   CalendarStyle calendarStyle = const CalendarStyle(
//       canMarkersOverflow: false,
//       markerSizeScale: 5,
//       markersAlignment: Alignment.bottomCenter);
//   DateTime selectedDay = DateTime.utc(2010);
//   DateTime focusedDay = DateTime.now();
//   DateTime today = DateTime.now();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   // HeaderStyle headerStyle = const HeaderStyle(
//   //   formatButtonVisible: false,
//   //   titleCentered: true,
//   // );
//   // CalendarStyle calendarStyle = const CalendarStyle(
//   //     canMarkersOverflow: false,
//   //     markerSizeScale: 5,
//   //     markersAlignment: Alignment.bottomCenter);
//
//   void _onDaySelected(DateTime select, DateTime focus) {
//     setState(() {
//       focusedDay = select;
//       // showAddDialog(select);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//         child: TableCalendar(
//           focusedDay: focusedDay,
//           firstDay: DateTime.utc(2010),
//           lastDay: DateTime.utc(2030),
//           headerStyle:
//               HeaderStyle(formatButtonVisible: false, titleCentered: true),
//           daysOfWeekVisible: true,
//           selectedDayPredicate: (day) => isSameDay(day, focusedDay),
//           calendarStyle: CalendarStyle(
//             selectedDecoration: BoxDecoration(color: mainpinkcolor),
//           ),
//           calendarBuilders: CalendarBuilders(
//             markerBuilder: (context, day, event) {
//               for (DateTime eventDate in widget.finishedDateList) {
//                 if (isSameDay(eventDate, day)) {
//                   if (isSameDay(day, DateTime.now())) {
//                     return Container(
//                       margin: EdgeInsets.all(6),
//                       // width: 20,
//                       // height: ,
//                       color: Colors.green,
//                       child: Center(
//                         child: Text(
//                           day.day.toString(),
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     );
//                   } else {
//                     return Container(
//                       margin: EdgeInsets.all(6),
//                       // width: 20,
//                       // height: ,
//                       color: Colors.green.shade300,
//                       child: Center(
//                         child: Text(
//                           day.day.toString(),
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     );
//                   }
//                 }
//               }
//             },
//           ),
//         ));
//   }
// }
