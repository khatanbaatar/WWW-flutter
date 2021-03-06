import 'package:flutter/material.dart';
import 'package:what_when_where/common/network_exception.dart';
import 'package:what_when_where/resources/dimensions.dart';
import 'package:what_when_where/resources/strings.dart';

class ErrorMessage extends StatelessWidget {
  final Function _retryFunction;
  final Color color;
  final Exception exception;
  final bool dense;

  const ErrorMessage({
    Key key,
    Function retryFunction,
    this.color,
    this.exception,
    this.dense = false,
  })  : this._retryFunction = retryFunction,
        assert(dense != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: Dimensions.defaultPadding * (dense ? 1 : 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              dense
                  ? Container()
                  : Text(
                      (exception is NetworkException)
                          ? Strings.noInternetError
                          : Strings.genericError,
                      textAlign: TextAlign.center,
                      style: color != null
                          ? Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(color: color)
                          : Theme.of(context).textTheme.subhead,
                    ),
              _retryFunction != null
                  ? IconButton(
                      iconSize: 56,
                      icon: Icon(
                        Icons.refresh,
                        color: color,
                      ),
                      onPressed: () => _retryFunction(),
                    )
                  : Container()
            ],
          ),
        ),
      );
}
