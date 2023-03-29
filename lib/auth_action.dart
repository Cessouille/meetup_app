import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets.dart';

class AuthAction extends StatelessWidget {
  const AuthAction({
    super.key,
    required this.loggedIn,
    required this.signOut,
  });

  final bool loggedIn;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 8),
          child: StyledButton(
              onPressed: () {
                !loggedIn ? context.push('/sign-in') : signOut();
              },
              highlighted: true,
              child:
                  !loggedIn ? const Text('RSVP') : const Text('Déconnexion')),
        ),
        Visibility(
          visible: loggedIn,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 8),
            child: StyledButton(
              onPressed: () {
                context.push('/profile');
              },
              highlighted: true,
              child: const Text('Profile'),
            ),
          ),
        ),
      ],
    );
  }
}
