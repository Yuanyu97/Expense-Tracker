import "dart:io";

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String _text;
  final Function _handler;

  AdaptiveFlatButton(this._text, this._handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              _text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: _handler,
          )
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text(
              _text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: _handler,
          );
  }
}
