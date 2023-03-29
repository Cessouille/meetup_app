import 'package:flutter/material.dart';
import 'app_state.dart';
import 'widgets.dart';

class YesNoSelection extends StatelessWidget {
  const YesNoSelection(
      {super.key, required this.state, required this.onSelection});
  final Attending state;
  final void Function(Attending selection) onSelection;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          StyledButton(
            onPressed: () => onSelection(Attending.yes),
            highlighted: state == Attending.yes,
            child: const Text('OUI'),
          ),
          const SizedBox(width: 8),
          StyledButton(
            onPressed: () => onSelection(Attending.no),
            highlighted: state == Attending.no,
            child: const Text('NON'),
          ),
        ],
      ),
    );
  }
}
