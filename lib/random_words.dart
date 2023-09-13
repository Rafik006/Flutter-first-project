// ignore_for_file: unused_import

import 'package:flutter/material.dart'; // this is allows me to use material design
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordPair = <WordPair>[];
  final _savedWordPairs = Set<WordPair>();
  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();
        final index = item ~/ 2;
        if (index >= _randomWordPair.length) {
          _randomWordPair.addAll(generateWordPairs().take(100));
        }
        return _buildRow(_randomWordPair[index]);
      },
    );
  }

  Widget _buildRow(WordPair word) {
    final _alreadySavedWords = _savedWordPairs.contains(word);
    return ListTile(
      title: Text(word.asPascalCase,
          style: TextStyle(
            color: Colors.purple,
            fontSize: 20,
          )),
      trailing: Icon(
          _alreadySavedWords ? Icons.favorite : Icons.favorite_border,
          color: _alreadySavedWords ? Colors.red : null),
      onTap: () {
        setState(() {
          if (_alreadySavedWords) {
            _savedWordPairs.remove(word);
          } else {
            _savedWordPairs.add(word);
          }
        });
      },
    );
  }
void _pushSaved(){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context){
        final Iterable<ListTile> tiles=
        _savedWordPairs.map((WordPair word){
          return ListTile(
            title: Text(word.asPascalCase,style: TextStyle(fontSize: 16),),
          );
        });
        final divided=ListTile.divideTiles(
          context:context, 
          tiles:tiles
        ).toList();
        return Scaffold(
          appBar: AppBar(title:Text("Saved Word")),
          body: ListView(
            children: divided,
          ),
        );
      }
    )
  );
}
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("WordPair Generator 2"),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],),
        body: _buildList());
  }
}
