import 'RidePreferencesListener.dart';

class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference selectedPreference) {
    print('Preference changed to: $selectedPreference');
  }
}