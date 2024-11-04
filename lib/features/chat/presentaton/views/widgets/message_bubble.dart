import 'package:chat/core/themes/colors_app.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatefulWidget {
  final String message;
  final VoidCallback onDelete;
  final ValueChanged<String> onEdit;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  _MessageBubbleState createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool isEditing = false;
  late TextEditingController _editController;

  @override
  void initState() {
    super.initState();
    _editController = TextEditingController(text: widget.message);
  }

  @override
  void dispose() {
    _editController.dispose();
    super.dispose();
  }

  void _showOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit, color: ColorApp.primaryColor),
                title: const Text('تعديل'),
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {
                    isEditing = true;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('حذف'),
                onTap: () {
                  Navigator.of(context).pop();
                  widget.onDelete();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveEdit() {
    widget.onEdit(_editController.text);
    setState(() {
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _showOptionsMenu(context),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: isEditing
              ? Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _editController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.check, color: Colors.white),
                      onPressed: _saveEdit,
                    ),
                  ],
                )
              : Text(
                  widget.message,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
