import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  String answer;
  bool forced;
  String imageUrl;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.imageUrl
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) =>
    YesNoModel(answer: json['answer'], forced: json['forced'], imageUrl: json['image']);


  Message toMessageEntity() => Message(
    text: answer == 'yes' ? 'Si': 'No',
     fromWho: FromWho.other,
     url: imageUrl
    );

}