import 'package:flutter/cupertino.dart';

class WordModel {
  int? word_id;
  String? word;
  String? pronounce;
  String? meaning;

  WordModel({ @required this.word_id, @required this.word, @required this.pronounce, @required this.meaning });

  // From Json
  WordModel.fromJson(json):
        word_id = json['word_id'],
        word =  json['word'],
        pronounce = json['pronounce'],
        meaning= json['meaning'];


  // to Json
  toJson()
  {
    return {
      "word_id": this.word_id,
      "word": this.word,
      "pronounce": this.pronounce,
      "meaning": this.meaning
    };

  }
}