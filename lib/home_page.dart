import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meetup_app/app_state.dart';
import 'package:meetup_app/auth_action.dart';
import 'package:meetup_app/guest_book.dart';
import 'package:meetup_app/widgets.dart';
import 'package:meetup_app/yes_no_selection.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Meetup'),
      ),
      body: ListView(
        children: [
          Image.asset('assets/header.png'),
          const IconAndDetail(
            Icons.calendar_month,
            '1er avril',
          ),
          const IconAndDetail(
            Icons.location_city,
            'Annecy',
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) {
              return AuthAction(
                loggedIn: appState.loggedIn,
                signOut: () {
                  FirebaseAuth.instance.signOut();
                },
              );
            },
          ),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 4,
            endIndent: 4,
            color: Colors.grey,
          ),
          const Header('Au programme'),
          const Paragraph(
            "Rejoignez-nous pour une journée pleine de démos, d'échanges et de pizza",
          ),
          Consumer<ApplicationState>(builder: (context, appState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (appState.attendees >= 2)
                  Paragraph('${appState.attendees} participants')
                else if (appState.attendees == 1)
                  const Paragraph('1 participant')
                else
                  const Paragraph('Aucun participant'),
                if (appState.loggedIn) ...[
                  YesNoSelection(
                    state: appState.attending,
                    onSelection: (attending) => appState.attending = attending,
                  ),
                  const Header('Discussion'),
                  GuestBook(
                    addMessage: (message) =>
                        appState.addMessageToGuestBook(message),
                    messages: appState.guestBookMessages,
                  ),
                ],
              ],
            );
          }),
        ],
      ),
    );
  }
}
