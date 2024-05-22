import 'package:flutter/material.dart';
import 'package:mytagcall/constant/constant.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(widget.content),
      ),
    );
  }
}
