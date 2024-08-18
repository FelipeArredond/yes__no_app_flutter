import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: "Hola Billie!", fromWho: FromWho.mine),
    Message(text: "Como grabaste CHIHIRO", fromWho: FromWho.mine),
  ];

  Future<void> sendMessage(String text) async {
    if(text.isNotEmpty){
      final newMessage = Message(text: text, fromWho: FromWho.mine);
      messages.add(newMessage);
      notifyListeners();
      moveScrollToBottom();
    }

    if(text.endsWith('?')) {
      otherReply();
    }
  }

  Future<void> otherReply() async {
    final message = await getYesNoAnswer.getAnswer();
    messages.add(message);
    notifyListeners();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }

}