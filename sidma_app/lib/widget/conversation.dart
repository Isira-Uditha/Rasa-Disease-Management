import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sipfaa_app/models/message_model.dart';
class Conversation extends StatefulWidget {
  final List<Message> getMessageList;
  const Conversation({Key? key, required this.getMessageList}) : super(key: key);

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.getMessageList.length,
        itemBuilder: (context, int index) {
          final message = widget.getMessageList[index];
          bool isMe = message.check;
          return Column(
            children: [
              Row(
                mainAxisAlignment: isMe
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  if (!isMe)
                    const CircleAvatar(
                      backgroundImage:
                      AssetImage("assets/robot.png"),
                      radius: 16,
                      backgroundColor: Color(0xff809b7b),
                    ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.all(12),
                    constraints: BoxConstraints(
                        maxWidth:
                        MediaQuery.of(context).size.width *
                            0.6),
                    decoration: BoxDecoration(
                        color: isMe
                            ? const Color(0xd5809b7b)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16),
                          topRight: const Radius.circular(16),
                          bottomLeft:
                          Radius.circular(isMe ? 12 : 0),
                          bottomRight:
                          Radius.circular(isMe ? 0 : 12),
                        )),
                    child: isMe
                        ? Text(
                      widget.getMessageList[index].text,
                      style: TextStyle(color: Colors.white),
                    )
                        : Text(widget.getMessageList[index].text,
                        style:
                        TextStyle(color: Colors.grey[800])),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: isMe
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (!isMe)
                      const SizedBox(
                        width: 40,
                      ),
                    Icon(
                      Icons.done_all,
                      size: 15,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      DateFormat("hh:mm:ss a").format(DateTime.now()),
                      style: TextStyle(color: Colors.grey[400],fontSize: 11),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}


