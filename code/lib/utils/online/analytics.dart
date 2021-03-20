import 'package:flutter/foundation.dart';
import '../../consts/global.dart';
import 'package:usage/usage_io.dart';
import 'package:usage/usage_html.dart';

AnalyticsIO analytics = kIsWeb
    ? AnalyticsHtml(
        kAnalyticsId,
        kAppName,
        kAppVer,
      )
    : AnalyticsIO(
        kAnalyticsId,
        kAppName,
        kAppVer,
      );

void logEvent({@required String category, @required String action}) =>
    analytics.sendEvent(category, action);
