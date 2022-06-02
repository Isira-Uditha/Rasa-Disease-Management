import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sidma_app/models/response.dart';

Container buildChatBar({required Function(dynamic message, dynamic check) callbackFunction}) {
  final TextEditingController _requestController = TextEditingController();
  String getRequest = "";
  String getRes = "";

  Future getResponse(String message) async{
    var res = <Response>[];
    var url = Uri.parse('http://192.168.1.3/webhooks/rest/webhook');
    var response = await http.post(url, body: jsonEncode(<String, String>{'sender': '' , 'message': message}));
    Iterable list = json.decode(response.body);
    res = list.map((model) => Response.fromJson(model)).toList();
    for(var i = 0; i < res.length; i++){
      callbackFunction(res[i].text,false);
    }
  }

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    color: Colors.white,
    height: 100,
    child: Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.grey[500],
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type your message ...',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                    controller: _requestController,
                    onSubmitted:(val) {
                      callbackFunction(val,true);
                      getResponse(val);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        const CircleAvatar(
          backgroundColor: Color(0xff7C7B9B),
          child: Icon(
            Icons.mic,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}