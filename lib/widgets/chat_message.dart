import 'package:flutter/material.dart';

final List<String> items = [
  "Apple 🍎",
  "Banana 🍌",
  "Cherry 🍒",
  "Mango 🥭",
  "Pineapple 🍍"
];

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  Stream<List<String>> getItemsStream() async* {
    await Future.delayed(Duration(seconds: 1)); // Simulate delay
    yield items; // Emit the list
  }

  @override
  Widget build(BuildContext context) {
    final Stream<List<String>> itemsStream = getItemsStream();

    return StreamBuilder(
        stream: itemsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Show loading
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              reverse: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]),
                );
              },
            );
          }
        });
  }
}
