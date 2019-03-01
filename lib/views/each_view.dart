import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class EachView extends StatefulWidget {
  final String _title;
  EachView(this._title);

  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Center(
        child: Text(wordPair.asPascalCase),
      ),
    );
  }
}
