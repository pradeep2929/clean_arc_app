import 'package:alchemy/app/resource/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? prefixIcon;
  final Widget? postfixIcon;
  final String? hint;
  final Function()? onSearch;
  final Function()? onFilter;
  final double height;
  final double bottomMargin;

  SearchBar(
      {Key? key,
      this.postfixIcon,
      this.prefixIcon,
      this.height = 72,
      this.bottomMargin = 24,
      this.hint,
      this.onFilter,
      this.onSearch})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState(
      hint: this.hint,
      onSearch: this.onSearch,
      postfixIcon: this.postfixIcon,
      prefixIcon: this.prefixIcon,
      onFilter: this.onFilter);

  @override
  Size get preferredSize => Size(double.infinity, this.height);
}

class _SearchBarState extends State<SearchBar> {
  Widget? prefixIcon;
  Widget? postfixIcon;
  String? hint;
  Function()? onSearch;
  Function()? onFilter;


  _SearchBarState(
      {this.hint,
      this.onSearch,
      this.onFilter,
      this.prefixIcon,
      this.postfixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: EdgeInsets.only(bottom: 25, left: 18, right: 18),
      child: TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            fillColor: Colors.white.withOpacity(0.08),
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20.0),
            ),
            prefixIcon: prefixIcon ?? Icon(Icons.search, color: Colors.white),
            hintText: hint ?? 'search'.tr,
            hintStyle: TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
            suffixIcon: postfixIcon ?? Padding(padding: EdgeInsets.only(right: 20) , child :Icon(Icons.filter_list, color: Colors.white))),
      ),
    );
  }
}
