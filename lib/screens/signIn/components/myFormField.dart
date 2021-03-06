import 'package:flutter/material.dart';

class MyFormField extends StatefulWidget {
  final TextEditingController textController;
  final String label;
  final bool secureText;
  final String placeholderText;
  final Function validate;
  final int maxLines;
  final IconData suffixIcon;
  final bool shouldFloat;
  final Function suffixIconPressed;
  MyFormField(
      {this.textController,
      this.label,
      this.secureText = false,
      this.placeholderText,
      this.validate,
      this.shouldFloat = false,
      this.maxLines,
      this.suffixIcon,
      this.suffixIconPressed});

  @override
  _MyFormFieldState createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: TextFormField(
        controller: widget.textController,
        maxLines: widget.maxLines,
        style: Theme.of(context).textTheme.bodyText1,
        obscureText: widget.secureText,
        decoration: InputDecoration(
          labelText: widget.label,
          suffixIcon: IconButton(
              color: Colors.grey[400],
              icon: Icon(
                widget.suffixIcon,
              ),
              onPressed: widget.suffixIconPressed),
          floatingLabelBehavior: widget.shouldFloat
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.auto,
          contentPadding: EdgeInsets.only(top: 25, bottom: 25, left: 20),
          labelStyle: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontSize: 18, color: Colors.grey[400]),
          filled: true,
          fillColor: Theme.of(context).accentColor,
          hintText: widget.placeholderText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.grey[400]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
        ),
        validator: widget.validate,
      ),
    );
  }
}
