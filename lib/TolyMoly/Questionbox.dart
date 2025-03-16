import 'package:flutter/material.dart';
import 'package:karkwelmel_fullstack_flutter/TolyMoly/Dialogbox.dart';

import 'Constants.dart';

class Questionbox extends StatefulWidget {
  Questionbox({
    this.press,
    @required this.question,
    this.cmtno,
    this.likeno,
    this.name,
    this.color,
  });
  VoidCallback? press;
  String? question;
  String? cmtno;
  String? likeno;
  String? name;
  Color? color;

  @override
  State<Questionbox> createState() => _QuestionboxState();
}

class _QuestionboxState extends State<Questionbox> {
  Icon hearticon = inactiveheart;
  void changeIcon() {
    if (hearticon == inactiveheart) {
      setState(() {
        hearticon = activeheart;
      });
    } else {
      setState(() {
        hearticon = inactiveheart;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: widget.color,
                ),
                child: Icon(Icons.person),
              ),
              SizedBox(width: 10.0),
              Text(widget.name!),
            ],
          ),
          SizedBox(height: 5.0),
          Text(widget.question!),
          SizedBox(height: 10.0),
          Row(
            children: [
              TextButton(
                child: hearticon,
                onPressed: () {
                  changeIcon();
                },
              ),
              Text(widget.likeno!),
              SizedBox(width: 50.0),
              TextButton(
                child: Icon(Icons.comment_outlined),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialogbox(
                        cmtTitle:
                            ' ညီမက new mem ပါ သိချင်တာလေးရှိလို့ပါPeriod ဖြစ်ပြီးသွားတဲ့တစ်ပတ်လောက်အတွင်းမှာ HS ဖြစ်ရင် ကိုယ်၀န်မရနိုင်တာမျိူးရှိလားဟင် (condom မသုံးဘဲနေမိရင်တောင်)ကိုယ်၀န်မရအောင် သားဥကြွေတဲ့ရက်ဘာညာတွက်ပြီး HS လို့ရလားတကယ်သေချာသိချင်လို့ မေးတာမို့အမှားပါရင်ခွင့်လွှတ်ပေးပါနော်',
                      );
                    },
                  );
                },
              ),
              Text(widget.cmtno!),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}

class Commentbox extends StatelessWidget {
  const Commentbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300.0,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Write a comment',
                  border: InputBorder.none,
                  constraints: BoxConstraints(minWidth: 50.0, maxWidth: 190.0),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Icon(Icons.send, color: Colors.blueAccent),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Usercomments extends StatelessWidget {
  const Usercomments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: mainyellow,
                ),
                child: Icon(Icons.person),
              ),
              SizedBox(width: 10.0),
              Text('Volunteer'),
            ],
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('No it cant'),
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
