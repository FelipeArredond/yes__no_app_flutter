import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged onValue;
  
  const MessageFieldBox({
    super.key,
    required this.onValue
  });

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(20)
    );
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final inputDecoration = InputDecoration(
        hintText: 'End your message with a ??',
        filled: true,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            onValue(textController.value.text);
          }, 
        ),
      );
    
    return TextFormField(
      decoration: inputDecoration,
      controller: textController,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        onValue(textController.value.text);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}