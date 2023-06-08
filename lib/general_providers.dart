import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seezioneprodotto/view_model/seezione_vm.dart';

final ChangeNotifierProvider<SeezioneViewModel> seezioneProvider =
    ChangeNotifierProvider<SeezioneViewModel>((ref) {
  return SeezioneViewModel(ref);
});
