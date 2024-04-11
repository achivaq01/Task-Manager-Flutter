


import 'package:flutter/cupertino.dart';

class Header extends StatefulWidget {
  const Header({super.key, required this.title, required this.titleSize});
  final String title;
  final double titleSize;

  @override
  State<StatefulWidget> createState() => HeaderState();
}

class HeaderState extends State<Header> {

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: TextStyle(
        fontSize: widget.titleSize
      ),
    );
  }

}