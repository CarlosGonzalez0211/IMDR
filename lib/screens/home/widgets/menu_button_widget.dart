import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const MenuButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  bool _isTapped = false; // State to track if button is tapped

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isTapped = true; // Change state to tapped
        });
        widget.onTap();
        // Optionally, you can reset the state after a certain delay:
        Future.delayed(const Duration(milliseconds: 200), () {
          setState(() {
            _isTapped = false; // Reset state to not tapped
          });
        });
      },
      onHighlightChanged: (value) {
        setState(() {
          _isTapped = value; // Update state to reflect highlight change
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 30.0,
            color: _isTapped ? Theme.of(context).colorScheme.secondary : Colors.black, // Change color on tap
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 80,
              ),
              child: Text(
                widget.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                  color: _isTapped ? Theme.of(context).colorScheme.secondary : Colors.grey[700], // Change text color on tap
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
