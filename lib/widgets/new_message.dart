import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewMessagesState();
  }
}

class _NewMessagesState extends State<NewMessages> {
  var _newMessageController = TextEditingController();

  @override
  void dispose() {
    _newMessageController.dispose();
    super.dispose();
  }

  void _submitMessage() {
    final enteredMessage = _newMessageController.text;
    if (enteredMessage.trim().isEmpty) {
      return;
    }
    print('send data to firebase');

    _newMessageController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
      child: Row(children: [
        Expanded(
          child: TextField(
            controller: _newMessageController,
            autocorrect: true,
            textCapitalization: TextCapitalization.sentences,
            enableSuggestions: true,
            decoration: const InputDecoration(labelText: 'Sens a message'),
          ),
        ),
        IconButton(
          color: Theme.of(context).primaryColor,
          icon: const Icon(Icons.send),
          onPressed: _submitMessage,
        )
      ]),
    );
  }
}
