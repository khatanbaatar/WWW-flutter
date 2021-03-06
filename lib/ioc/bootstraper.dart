import 'package:dioc/dioc.dart';
import 'package:what_when_where/ioc/container.dart';
import 'package:what_when_where/services/analytics.dart';
import 'package:what_when_where/services/browsing.dart';
import 'package:what_when_where/services/navigation.dart';
import 'package:what_when_where/services/preferences.dart';
import 'package:what_when_where/services/sharing.dart';
import 'package:what_when_where/services/sound.dart';
import 'package:what_when_where/services/url_launcher.dart';
import 'package:what_when_where/services/vibrating.dart';

class Bootstrapper {
  static final Bootstrapper _instance = Bootstrapper._();

  factory Bootstrapper() => _instance;

  Bootstrapper._();

  Container get _container => WWWIoC.container;

  void init() {
    _container.register<IAnalyticsService>((c) => AnalyticsService.ioc(),
        defaultMode: InjectMode.singleton);
    _container.register<ISharingService>((c) => SharingService.ioc(),
        defaultMode: InjectMode.singleton);
    _container.register<IBrowsingService>((c) => BrowsingService.ioc(),
        defaultMode: InjectMode.singleton);
    _container.register<INavigationService>((c) => NavigationService.ioc(),
        defaultMode: InjectMode.singleton);
    _container.register<IUrlLauncher>((c) => UrlLauncher.ioc(),
        defaultMode: InjectMode.singleton);
    _container.register<IPreferences>((c) => Preferences.ioc(),
        defaultMode: InjectMode.singleton);
    _container.register<IVibratingService>((c) => VibratingService.ioc(),
        defaultMode: InjectMode.singleton);
    _container.register<ISoundService>((c) => SoundService.ioc(),
        defaultMode: InjectMode.singleton);
  }
}
