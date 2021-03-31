import 'dart:developer';
import 'package:flutter/material.dart';

class ChatRoomListItem extends StatelessWidget {
  final String title;
  final int numUsers;
  ChatRoomListItem({Key key, this.title, this.numUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 8, right: 8, left: 8),
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              log("Do something");
            },
            child: SizedBox(
              height: 100,
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[500],
                          border: Border.all(
                            color: Colors.blue[500],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.all_inclusive_rounded),
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title),
                        Text(numUsers.toString())
                      ],
                    ),
                  ]),
                  Spacer(),
                  Icon(Icons.navigate_next),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
