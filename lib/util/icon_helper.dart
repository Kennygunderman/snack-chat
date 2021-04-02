import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snack_chat/ui/chat/icon/chat_icons.dart';

class IconInfo {
  Color color;
  IconData iconData;
  IconInfo({this.iconData, this.color});
}

class IconHelper {
  final List<String> _iconMessages = [
    ':chip:',
    ':banana:',
    ':ice_cream:',
    ':cheeto:',
    ':cookie:'
  ];

  IconInfo getIconFromIconName(String iconName) {
    switch (iconName) {
      case 'chip':
        return IconInfo(iconData: ChatIcons.chip, color: Colors.red);
      case 'banana':
        return IconInfo(iconData: ChatIcons.banana, color: Colors.yellow);
      case 'ice_cream':
        return IconInfo(iconData: ChatIcons.ice_cream_cone, color: Colors.orange);
      case 'cheeto':
        return IconInfo(iconData: ChatIcons.cheeto, color: Colors.deepOrange);
      case 'cookie':
        return IconInfo(iconData: ChatIcons.cookies, color: Colors.brown);
    }
    return null;
  }

  String getMessageFromIconName(String iconName) {
    switch (iconName) {
      case 'chip':
        return _iconMessages[0];
      case 'banana':
        return _iconMessages[1];
      case 'ice_cream':
        return _iconMessages[2];
      case 'cheeto':
        return _iconMessages[3];
      case 'cookie':
        return _iconMessages[4];
    }
    return null;
  }

  IconInfo getIconFromMessage(String message) {
    switch (message) {
      case ':chip:':
        return IconInfo(iconData: ChatIcons.chip, color: Colors.red);
      case ':banana:':
        return IconInfo(iconData: ChatIcons.banana, color: Colors.yellow);
      case ':ice_cream:':
        return IconInfo(iconData: ChatIcons.ice_cream_cone, color: Colors.orange);
      case ':cheeto:':
        return IconInfo(iconData: ChatIcons.cheeto, color: Colors.deepOrange);
      case ':cookie:':
        return IconInfo(iconData: ChatIcons.cookies, color: Colors.brown);
    }
    return null;
  }

  bool isIcon(String message) {
    return _iconMessages.contains(message);
  }
}
