import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Chat(),
    );
  }
}

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  Set<int> selectedMessages = Set<int>();
  bool autoReplySent = false; // Flag to track whether auto-reply has been sent

  void _handleSubmitted(String text) {
    _messageController.clear();

    setState(() {
      int newIndex = _messages.length;

      _messages.insert(0, ChatMessage(
        index: newIndex,
        text: text,
        onDelete: () => _deleteMessage(newIndex),
        userName: 'User', // Set the user name for the user message
      ));

      // Check if auto-reply hasn't been sent yet
      if (!autoReplySent) {
        // Simulate a response from the server
        _messages.insert(0, ChatMessage(
          index: newIndex + 1,
          text: 'Thank you for your message!',
          onDelete: () => _deleteMessage(newIndex + 1),
          userName: 'Zain', // Set the user name for the auto-reply
        ));

        autoReplySent = true; // Set the flag to true after sending auto-reply
      }
    });
  }

  void _deleteMessage(int index) {
    setState(() {
      selectedMessages.remove(index);
      _messages.removeWhere((message) => message.index == index);
    });
  }

  void _deleteSelectedMessages() {
    setState(() {
      for (int index in selectedMessages) {
        _messages.removeWhere((message) => message.index == index);
      }
      selectedMessages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 100,
        scrolledUnderElevation: 88,

        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/1111.png"), // Replace with your image path
              radius: 25,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Zain Ali', style: TextStyle(fontSize: 16)),
                Text('Online', style: TextStyle(fontSize: 12, color: Colors.blue)),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _deleteSelectedMessages(),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) => _messages[index],
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).primaryIconTheme.color),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(

              child: TextField(

                controller: _messageController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'Send a message:',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send_sharp,color: Colors.blue,),
              onPressed: () => _handleSubmitted(_messageController.text),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final int index;
  final String text;
  final VoidCallback onDelete;
  final String userName;

  ChatMessage({
    required this.index,
    required this.text,
    required this.onDelete,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(index.toString()),
      onDismissed: (direction) {
        onDelete();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Text(userName),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(userName, style: Theme.of(context).textTheme.subtitle2),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
