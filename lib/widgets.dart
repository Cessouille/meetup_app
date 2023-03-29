import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(this.heading, {super.key});

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(heading, style: const TextStyle(fontSize: 24)),
    );
  }
}

class Paragraph extends StatelessWidget {
  const Paragraph(this.content, {super.key});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(content, style: const TextStyle(fontSize: 18)),
    );
  }
}

class IconAndDetail extends StatelessWidget {
  const IconAndDetail(this.icon, this.detail, {super.key});

  final IconData icon;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(detail, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class StyledButton extends StatelessWidget {
  const StyledButton({
    required this.child,
    required this.onPressed,
    this.highlighted = false,
    super.key,
  });

  final Widget child;
  final void Function() onPressed;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = OutlinedButton.styleFrom(
      side: BorderSide(color: theme.colorScheme.primary),
      backgroundColor:
          highlighted ? theme.colorScheme.primary : theme.colorScheme.secondary,
      foregroundColor: highlighted
          ? theme.colorScheme.onPrimary
          : theme.colorScheme.onSecondary,
    );

    return OutlinedButton(
      style: style,
      onPressed: onPressed,
      child: child,
    );
  }
}
