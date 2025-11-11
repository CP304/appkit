library core_analytics;

// Platzhalter – Implementierung aktivieren nach Firebase-Setup.
class Analytics {
  static Future<void> init() async {
    // await Firebase.initializeApp();
    // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
  static Future<void> log(String name, [Map<String, Object?> params = const {}]) async {
    // await FirebaseAnalytics.instance.logEvent(name: name, parameters: params);
  }
}
