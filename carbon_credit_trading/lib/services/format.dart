import 'package:flutter/material.dart';

List<TextSpan> highlightMatches(String text, String query, Color highlightColor) {
  if (query.isEmpty) {
    return [TextSpan(text: text)];
  }

  final RegExp regex = RegExp(RegExp.escape(query), caseSensitive: false);
  final Iterable<Match> matches = regex.allMatches(text);

  if (matches.isEmpty) {
    return [TextSpan(text: text)];
  }

  int start = 0;
  List<TextSpan> spans = [];

  for (Match match in matches) {
    if (match.start > start) {
      spans.add(TextSpan(text: text.substring(start, match.start)));
    }
    spans.add(TextSpan(
      text: text.substring(match.start, match.end),
      style: TextStyle(
        backgroundColor: highlightColor, 
      ),
    ));
    start = match.end;
  }

  if (start < text.length) {
    spans.add(TextSpan(text: text.substring(start)));
  }

  return spans;
}