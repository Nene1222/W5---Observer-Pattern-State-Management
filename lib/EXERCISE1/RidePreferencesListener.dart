abstract class RidePreferencesListener {
  void onPreferenceSelected(RidePreference selectedPreference);
}

enum RidePreference {
  economy,
  comfort,
  luxury,
}