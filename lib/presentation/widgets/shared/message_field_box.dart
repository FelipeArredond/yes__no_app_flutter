import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(20)
    );
    final inputDecoration = InputDecoration(
        hintText: 'End your message with a ??',
        filled: true,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            print('pressed');
          }, 
        ),
      );

      final textController = TextEditingController();
      final focusNode = FocusNode();
    
    return TextFormField(
      decoration: inputDecoration,
      controller: textController,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        final textValue = textController.value.text;
        print('Hola perra $textValue');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}