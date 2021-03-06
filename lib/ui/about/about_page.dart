import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:what_when_where/constants.dart';
import 'package:what_when_where/redux/app/state.dart';
import 'package:what_when_where/redux/misc/actions.dart';
import 'package:what_when_where/resources/dimensions.dart';
import 'package:what_when_where/resources/strings.dart';

class AboutPage extends StatelessWidget {
  static const String routeName = 'about';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      );

  Widget _buildAppBar(BuildContext context) => AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0.0,
      );

  Widget _buildBody(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.defaultSidePadding * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: _buildImageSection(context),
            ),
            _buildBottomSection(context),
          ],
        ),
      );

  Widget _buildImageSection(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Dimensions.defaultSidePadding * 5),
        child: Center(
          child: Hero(
            tag: 'owl',
            child: SvgPicture.asset(
              'assets/owl.svg',
              fit: BoxFit.fitHeight,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      );

  Widget _buildBottomSection(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            Constants.appNameLong,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(color: Theme.of(context).accentColor),
          ),
          IconButton(
            icon: const Icon(Icons.email),
            tooltip: Strings.emailDevelopers,
            color: Theme.of(context).accentColor,
            onPressed: () => _sendEmail(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Dimensions.defaultSpacing * 5),
            child: RichText(
              textAlign: TextAlign.center,
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${Strings.questionsDatabasePrefix}\n',
                    style: Theme.of(context).textTheme.body2,
                  ),
                  TextSpan(
                    text: Strings.questionsDatabaseName,
                    style: Theme.of(context).textTheme.body2.copyWith(
                        color: Theme.of(context).accentColor,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _openDatabaseInBrowser(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  void _openDatabaseInBrowser(BuildContext context) =>
      StoreProvider.of<AppState>(context).dispatch(BrowseDatabase());

  void _sendEmail(BuildContext context) =>
      StoreProvider.of<AppState>(context).dispatch(EmailDevelopers());
}
