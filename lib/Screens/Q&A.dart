import 'package:flutter/material.dart';
import 'package:karkwelmel_fullstack_flutter/TolyMoly/Constants.dart';
import 'package:karkwelmel_fullstack_flutter/TolyMoly/Questionbox.dart';

class QA extends StatefulWidget {
  const QA({Key? key}) : super(key: key);

  @override
  State<QA> createState() => _QAState();
}

class _QAState extends State<QA> {
  String? messages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF1F6),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, top: 20.0),
                      child: Text(
                        'Explore',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 172.0),
                    GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   showDialog(
                        //       context: context,
                        //       builder: (context) {
                        //         return PostDialog();
                        //       });
                        // });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 35.0),
                        child: Icon(
                          Icons.photo,
                          color: Colors.green.shade500,
                          size: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0, width: double.infinity),
              Container(
                width: 340.0,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search the related questions',
                        border: InputBorder.none,
                        constraints: BoxConstraints(
                          minWidth: 100.0,
                          maxWidth: 250.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              SizedBox(width: double.infinity, height: 50.0),
              Column(
                children: [
                  Questionbox(
                    question:
                        'ညီမက new mem ပါ သိချင်တာလေးရှိလို့ပါPeriod ဖြစ်ပြီးသွားတဲ့တစ်ပတ်လောက်အတွင်းမှာ HS ဖြစ်ရင် ကိုယ်၀န်မရနိုင်တာမျိူးရှိလားဟင် (condom မသုံးဘဲနေမိရင်တောင်)ကိုယ်၀န်မရအောင် သားဥကြွေတဲ့ရက်ဘာညာတွက်ပြီး HS လို့ရလားတကယ်သေချာသိချင်လို့ မေးတာမို့အမှားပါရင်ခွင့်လွှတ်ပေးပါနော်',
                    likeno: '2.7k',
                    cmtno: '1',
                    name: 'Capuccino',
                    color: maincolor,
                  ),
                  SizedBox(height: 30.0, width: double.infinity),
                  Questionbox(
                    question:
                        'ကျွန်မcontraceptiveဆေးသောက်လာတာနှစ်လရှိပါပြီ မနေ့ကတစ်ရက်သောက်ဖို့မေ့သွားတာအားနိသင်ပြယ်သွားနိုင်လားရှင့်။',
                    likeno: '1.2k',
                    cmtno: '3',
                    name: 'Lazy bee',
                    color: mainyellow,
                  ),
                  SizedBox(height: 30.0, width: double.infinity),
                  Questionbox(
                    question:
                        '၃လတားဆေးထိုးထားတာရာသီမလာတာသုံးနှစ်ရှိပါပြီ. အခုမှရာသီလာတော့ကိုယ်ဝန်များတည်နိုင်လား ဖြေကြားပေးပါဦးရှင်',
                    likeno: '1.1k',
                    cmtno: '3',
                    name: 'Boosy Panda',
                    color: Colors.blueAccent.shade200,
                  ),
                  SizedBox(height: 30.0, width: double.infinity),
                  Questionbox(
                    question:
                        'အပျိုကြီးတွေ တားဆေး သောက်ရတယ်ဆိုတာ တကယ်လားရှင့် အဲဒါသိချင်ပါတယ်ကြားဖူးနားဝဆို အလုံးတည်မှာစိုးလို့ကာကွယ်တဲ့အနေနဲ့သောက်ရတာလို့ပါအဲလိုဆို ကိုယ်လည်း အသက် ၃၀ မို့ သောက်မလို့ပါ အဒေါ်အပျိုကြီး အလုံးတည်တာ အလုံးအကြီးကြီးပါပဲ အဲဒါကိုကြောက်လို့ပါရှင့်',
                    likeno: '1k',
                    name: 'Wolfie Wolf',
                    color: Colors.green.shade200,
                    cmtno: '3',
                  ),
                  SizedBox(height: 30.0, width: double.infinity),
                  Questionbox(
                    question:
                        'OC pill တားဆေးကိုဘယ်လောက်ကြာကြာသောက်သောက် ရပ်လိုက်ရင် ကလေးတန်းရနိုင်ပါလားရှင်',
                    likeno: '672',
                    name: 'Nerdy Pig',
                    color: Colors.pinkAccent.shade100,
                    cmtno: '2',
                  ),
                  SizedBox(height: 30.0, width: double.infinity),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
