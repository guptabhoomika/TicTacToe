import 'package:flutter/material.dart';
class ShowDialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actionText ="Reset";
  ShowDialog({this.title,this.content,this.callback});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          onPressed: callback,
          child: Text(actionText),
          color: Colors.white,
        )
      ],
    );
  }
}