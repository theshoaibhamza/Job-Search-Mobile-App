import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  return document.body?.text ?? '';
}

class JobDescriptionWidget extends StatefulWidget {
  final String descriptionHtml;

  const JobDescriptionWidget({super.key, required this.descriptionHtml});

  @override
  State<JobDescriptionWidget> createState() => _JobDescriptionWidgetState();
}

class _JobDescriptionWidgetState extends State<JobDescriptionWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final fullText = parseHtmlString(widget.descriptionHtml);
    final previewText =
        fullText.length > 200 ? fullText.substring(0, 200) + '...' : fullText;
    final displayText = _isExpanded ? fullText : previewText;

    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        style: const TextStyle(fontSize: 16, color: Colors.black),
        children: [
          TextSpan(text: displayText),
          if (fullText.length > 200)
            TextSpan(
              text: _isExpanded ? ' Read less' : ' Read more',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
            ),
        ],
      ),
    );
  }
}
