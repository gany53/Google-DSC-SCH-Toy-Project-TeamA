import 'package:flutter/material.dart';
import 'package:gdsc_sch_teama_project/mainpage.dart';
import 'package:gdsc_sch_teama_project/view_myparticipation.dart';
import 'package:gdsc_sch_teama_project/view_mywriting.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:gdsc_sch_teama_project/view_participant.dart';

List<String> lists = [];
String s = '';

class postdetail extends StatefulWidget {
  const postdetail({Key? key}) : super(key: key);

  @override
  State<postdetail> createState() => view_postdetail();
}

class view_postdetail extends State<postdetail> {
  int count = 0;
  String sav = "not";
  TextEditingController title = TextEditingController(text: '$s');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                child: Text("참여 인원 보기"),
                onPressed: () {
                  //Get.to(MyHomePage());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => participant()));
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: TextField(
              controller: title,
              decoration: InputDecoration(
                  labelText: 'title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding: EdgeInsets.all(10)),
              onChanged: (text) {
                //onChanged를 이용하여 값 저장
                setState(() {
                  sav = text;
                });
              },
            ),
          ),

          SizedBox(height: 20),
          Row(children: [
            Text('작성자 : haneul'),
            SizedBox(width: 30),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.people),
            ),
            Text('$count/5'),
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5), //상하좌우 여백
            // 내용이 많으면 깨지니까 깨짐 방지
            child: SingleChildScrollView(
              // 11줄 이상 내용이 기재되어도 출력가능
              child: TextFormField(
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: 'contents',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0)),
                ),
              ),
            ),
          ),
          Row(children: [
            ElevatedButton(
              onPressed: () {
                lists.add('$sav');
                Get.to(main_page());
              },
              child: Text("참여"),
            ),
            SizedBox(width: 10), //사이 띄우기
            ElevatedButton(
              onPressed: () {
                Get.to(main_page());
              },
              child: Text("취소"),
            ),
            SizedBox(width: 10),
          ]),
        ],
      ),
    );
  }
}

// showDialog(
//   context: context,
//   barrierDismissible: false,
//   builder: (BuildContext context){
//     return AlertDialog(
//       content: Text("게시글을 등록하시겠습니까?"),
//       actions: [
//         TextButton(
//           child: Text('예'),
//           onPressed: (){
//             Navigator.of(context).pop();
//           },
//         ),
//         TextButton(
//           child: Text("아니오"),
//           onPressed: (){
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   },
// );