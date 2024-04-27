import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/menu_button_widget.dart';

class HorizontalMenuModule extends StatelessWidget {
  const HorizontalMenuModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16), // Add padding as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute items evenly in the row
        children: <Widget>[
          MenuButton(
            icon: FontAwesomeIcons.heartPulse,
            label: 'Health Highlights',
            onTap: () {
              // TODO: Implement callback
            },
          ),
          MenuButton(
            icon: FontAwesomeIcons.userNurse,
            label: 'Find A Doctor',
            onTap: () {
              // TODO: Implement callback
            },
          ),
          MenuButton(
            icon: FontAwesomeIcons.prescription,
            label: 'Medicine',
            onTap: () {
              // TODO: Implement callback
            },
          ),
          MenuButton(
            icon: FontAwesomeIcons.fileWaveform,
            label: 'Medical Records',
            onTap: () {
              // TODO: Implement callback
            },
          ),
        ],
      ),
    );
  }
}
