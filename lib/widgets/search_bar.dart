import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(29.0)),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search here..",
          icon: SvgPicture.asset("assets/icons/search.svg"),
        ),
      ),
    );
  }
}
