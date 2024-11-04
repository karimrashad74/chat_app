import 'package:chat/core/themes/colors_app.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final Function(String) onSendMessage;

  const InputText({Key? key, required this.onSendMessage}) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  final TextEditingController _controller = TextEditingController();
  bool _isTextEmpty = true;
  bool _isEmojiVisible = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTextEmpty = _controller.text.isEmpty;
      });
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.onSendMessage(_controller.text);
      _controller.clear();
      setState(() {
        _isEmojiVisible = false; 
      });
    }
  }

  void _onEmojiSelected(Emoji emoji) {
    setState(() {
      _controller.text += emoji.emoji; 
      _isEmojiVisible = false; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Message",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isEmojiVisible =
                              !_isEmojiVisible; 
                        });
                      },
                      icon:
                          const Icon(Icons.emoji_emotions, color: Colors.grey),
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon:
                              const Icon(Icons.attach_file, color: Colors.grey),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon:
                              const Icon(Icons.camera_alt, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: ColorApp.primaryColor,
              ),
              child: IconButton(
                icon: Icon(
                  _isTextEmpty ? Icons.mic : Icons.send,
                  color: Colors.grey,
                ),
                onPressed: _isTextEmpty ? null : _sendMessage,
              ),
            ),
          ],
        ),
        if (_isEmojiVisible) 
          SizedBox(
            height: 250, 
            child: EmojiPicker(
              onEmojiSelected: (category, emoji) {
                _onEmojiSelected(emoji);
              },
            ),
          ),
      ],
    );
  }
}
