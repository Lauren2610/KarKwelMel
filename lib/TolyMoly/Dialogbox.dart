import 'package:flutter/material.dart';
import 'Questionbox.dart';
import 'Constants.dart';

class Dialogbox extends StatelessWidget {
  @override
  Dialogbox({this.cmtTitle});
  String? cmtTitle;

  Widget build(BuildContext context) {
    Icon hearticon = inactiveheart;
    Icon righticon() {
      return hearticon == inactiveheart
          ? hearticon = activeheart
          : hearticon = inactiveheart;
    }

    return Dialog(
      child: Container(
          width: double.infinity,
          height: 800.0,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: maincolor),
                            child: Icon(Icons.person),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Cappuchino')
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(cmtTitle!),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          TextButton(
                            child: hearticon,
                            onPressed: () {
                              righticon();
                            },
                          ),
                          Text('2.7k'),
                          SizedBox(
                            width: 50.0,
                          ),
                          TextButton(
                              child: Icon(Icons.comment_outlined),
                              onPressed: () {}),
                          Text('1')
                        ],
                      ),
                    ],
                  ),
                ),
                Commentbox(),
                Usercomments(),
              ],
            ),
          )),
    );
  }
}
