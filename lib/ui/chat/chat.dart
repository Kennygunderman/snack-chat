import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ChatPage extends StatelessWidget {
  Widget _listItem() {
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
                        Text('Doritos Chat Room'),
                        Text('0 Users')
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

  @override
  Widget build(BuildContext context) {
    final items = [
      ["item 1", "item 2", "item 3", "item 4", "item 5"]
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Snack Chat'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return StickyHeader(
            header: Container(
              height: 100.0,
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Chat Rooms',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            content: Column(
              children:
                  items[index].map((e) => _listItem()).toList(growable: false),
            ),
          );
        },
      ),
    );
  }
}
