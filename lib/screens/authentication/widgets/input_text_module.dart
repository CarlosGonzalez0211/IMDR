import 'package:flutter/material.dart';

class RoundedInputWidget extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  const RoundedInputWidget({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<RoundedInputWidget> createState() => _RoundedInputWidgetState();
}

class _RoundedInputWidgetState extends State<RoundedInputWidget> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isPassword ? IconButton(
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: _togglePasswordVisibility,
          ) : null,
          filled: true,
          fillColor: Colors.grey[300],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        ),
        obscureText: _obscureText,
        keyboardType: widget.isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
      ),
    );
  }
}
