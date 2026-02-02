import 'package:flutter/material.dart';
import '../constans.dart';

class CharacterCheckbox extends StatelessWidget {
  final String name;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CharacterCheckbox({
    required this.name,
    required this.value,
    required this.onChanged,
    super.key,
  });

  LinearGradient _buildGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: value
          ? [purpleExtraLight, purpleLight]
          : [purpleLightest, purpleExtraLight2],
    );
  }

  List<BoxShadow> _buildShadows() {
    return value
        ? [
            BoxShadow(
              color: purplePrimary,
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: purpleLight,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ]
        : [
            BoxShadow(
              color: purpleLight,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ];
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animDuration,
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: _buildGradient(),
        boxShadow: _buildShadows(),
        border: value ? Border.all(color: purplePrimary, width: 2) : null,
      ),
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.trailing,
        tileColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: value ? selectedTile : primaryPurple,
            letterSpacing: 0.3,
          ),
        ),
        value: value,
        onChanged: (newValue) => newValue != null ? onChanged(newValue) : null,
      ),
    );
  }
}
