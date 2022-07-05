import 'package:flutter/foundation.dart';

class UniversalProvider with ChangeNotifier {
  bool _showReviewDialog = false;

  bool _showAdds = false;

  bool get showReviewDialog{
    return _showReviewDialog;
  }

  bool get showAdds => _showAdds;

  void toggleReviewDialogToFalse(){
    _showReviewDialog = false;
  }

  void ToshowAddsOrNot(bool passvalue){
    if(kDebugMode) {
      print('Enter in ToshowAddsOrNot');
    }
    _showAdds = passvalue;
    if(kDebugMode) {
      print('ToshowAddsOrNot Result ${_showAdds}');
    }
  }

}