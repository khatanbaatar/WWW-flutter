import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:what_when_where/db_chgk_info/models/question.dart';
import 'package:what_when_where/db_chgk_info/models/tour.dart';
import 'package:what_when_where/db_chgk_info/models/tournament.dart';

abstract class NavigationAction {}

@immutable
class OpenImage extends NavigationAction {
  final BuildContext context;
  final String imageUrl;

  OpenImage({@required this.context, @required this.imageUrl});

  @override
  String toString() => '$OpenImage imageUrl ="$imageUrl"';
}

@immutable
class OpenTourInfo extends NavigationAction {
  final BuildContext context;
  final Tour tour;

  OpenTourInfo({this.context, this.tour});

  @override
  String toString() =>
      '$OpenTourInfo tour.id = "${tour.id}", tour.title = "${tour.title}"';
}

@immutable
class OpenTournamentInfo extends NavigationAction {
  final BuildContext context;
  final Tournament tournament;

  OpenTournamentInfo({this.context, this.tournament});

  @override
  String toString() =>
      '$OpenTournamentInfo tournament.id = "${tournament.id}", tournament.title = "${tournament.title}"';
}

@immutable
class OpenQuestions extends NavigationAction {
  final BuildContext context;
  final Iterable<Question> questions;
  final int selectedQuestionIndex;

  OpenQuestions(this.context, this.questions, this.selectedQuestionIndex);

  @override
  String toString() =>
      '$OpenQuestions questions.length = "${questions.length}", selectedQuestionIndex = "$selectedQuestionIndex"';
}

@immutable
class OpenTournament extends NavigationAction {
  final BuildContext context;
  final Tournament tournament;

  OpenTournament(this.context, this.tournament);

  @override
  String toString() =>
      '$OpenTournament tournament.textId = "${tournament.textId}", tournament.title = "${tournament.title}"';
}

@immutable
class OpenAboutPage extends NavigationAction {
  final BuildContext context;

  OpenAboutPage(this.context);

  @override
  String toString() => '$OpenAboutPage';
}

@immutable
class OpenSearchPage extends NavigationAction {
  final BuildContext context;

  OpenSearchPage(this.context);

  @override
  String toString() => '$OpenSearchPage';
}

@immutable
class OpenSettingsPage extends NavigationAction {
  final BuildContext context;

  OpenSettingsPage(this.context);

  @override
  String toString() => '$OpenSettingsPage';
}

@immutable
class OpenRandomQuestionsPage extends NavigationAction {
  final BuildContext context;

  OpenRandomQuestionsPage(this.context);

  @override
  String toString() => '$OpenRandomQuestionsPage';
}

@immutable
class OpenTournamentsTreePage extends NavigationAction {
  final BuildContext context;

  OpenTournamentsTreePage({@required this.context});

  @override
  String toString() => '$OpenTournamentsTreePage';
}

@immutable
class OpenTournamentsSubTreePage extends NavigationAction {
  final BuildContext context;
  final String rootId;
  final String title;

  OpenTournamentsSubTreePage({
    @required this.context,
    @required this.rootId,
    this.title,
  });

  @override
  String toString() =>
      '$OpenTournamentsSubTreePage rootId = "$rootId", title = "$title"';
}
