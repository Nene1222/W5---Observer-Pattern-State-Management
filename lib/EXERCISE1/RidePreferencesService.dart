import 'RidePreferencesListener.dart';

class RidePreferencesService {
  RidePreference? _currentPreference;
  final List<RidePreferencesListener> _listeners = [];

  void addListener(RidePreferencesListener listener) {
    _listeners.add(listener);
  }

  void removeListener(RidePreferencesListener listener) {
    _listeners.remove(listener);
  }

  void notifyListeners() {
    for (var listener in _listeners) {
      if (_currentPreference != null) {
        listener.onPreferenceSelected(_currentPreference!);
      }
    }
  }

  void selectPreference(RidePreference preference) {
    _currentPreference = preference;
    notifyListeners();
  }
}