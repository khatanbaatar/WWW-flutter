import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:what_when_where/db_chgk_info/models/tour.dart';
import 'package:what_when_where/redux/app/state.dart';
import 'package:what_when_where/redux/sharing/actions.dart';
import 'package:what_when_where/resources/strings.dart';
import 'package:what_when_where/services/browsing.dart';
import 'package:what_when_where/ui/tour_questions/tour_details_about_dialog.dart';

class TourQuestionsPageMenu {
  final Tour tour;

  TourQuestionsPageMenu({@required this.tour});

  Widget createAppBarMenuAction(BuildContext context) => IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: () => _showMenu(context),
      );

  void _showMenu(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _createBrowseTourMenuItem(context),
              _createShareTourMenuItem(context),
              _createAboutTourMenuItem(context),
            ],
          ));

  Widget _createBrowseTourMenuItem(BuildContext context) => ListTile(
        leading: const Icon(Icons.open_in_browser),
        title: const Text(Strings.browse),
        onTap: () => _openInBrowser(context),
      );

  Widget _createShareTourMenuItem(BuildContext context) => ListTile(
        leading: const Icon(Icons.share),
        title: const Text(Strings.share),
        onTap: () => _shareQuestion(context),
      );

  Widget _createAboutTourMenuItem(BuildContext context) => ListTile(
        leading: const Icon(Icons.info_outline),
        title: const Text(Strings.aboutTour),
        onTap: () => _openAboutTourDialog(context),
      );

  void _openInBrowser(BuildContext context) {
    Navigator.pop(context);
    BrowsingService().browseTour(tour);
  }

  void _shareQuestion(BuildContext context) {
    Navigator.pop(context);

    var store = StoreProvider.of<AppState>(context);
    store.dispatch(
        ShareQuestion(store.state.questionsState.currentQuestion.question));
  }

  void _openAboutTourDialog(BuildContext context) {
    Navigator.pop(context);
    TourDetailsAboutDialog(tour: tour).show(context);
  }
}
