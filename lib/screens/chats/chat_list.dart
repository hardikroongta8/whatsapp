import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
          ),
          title: Text('Hardik Roongta'),
          isThreeLine: false,
          subtitle: Text('Where are you?', maxLines: 1,),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('19:05', style: TextStyle(fontSize: 12),),
              CircleAvatar(
                radius: 10,
                child: Text('5', style: TextStyle(fontSize: 12),),
              )
            ],
          ),
        ),
      ),
    );
  }
}