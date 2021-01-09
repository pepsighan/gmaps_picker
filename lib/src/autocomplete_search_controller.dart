import 'package:flutter/cupertino.dart';
import 'package:google_maps_place_picker/src/autocomplete_search.dart';

class SearchBarController extends ChangeNotifier {
  AutoCompleteSearchState _autoCompleteSearch;

  void attach(AutoCompleteSearchState searchWidget) {
    _autoCompleteSearch = searchWidget;
  }

  /// Just clears text.
  void clear() {
    _autoCompleteSearch.clearText();
  }

  /// Clear and remove focus (Dismiss keyboard)
  void reset() {
    _autoCompleteSearch.resetSearchBar();
  }

  void clearOverlay() {
    _autoCompleteSearch.clearOverlay();
  }
}