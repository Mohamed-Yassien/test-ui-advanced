import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_ui/record/cubit/record_states.dart';

class RecordCubit extends Cubit<RecordStates> {
  RecordCubit() : super(RecordInitialState());

  static RecordCubit get(context) => BlocProvider.of(context);

  bool isRecording = false;

  late RecorderController recorderController;
  late PlayerController playerController;

  String savedPath = 'umrah-record.aac';

  String? recordPath;

  getRecordPath() async {
    var appDir = await getApplicationDocumentsDirectory();
    recordPath = "${appDir.path}/$savedPath";
    emit(ChangeRecordState());
  }

  initControllers() async {
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..sampleRate = 16000;

    emit(ChangeRecordState());

    playerController = PlayerController()
      ..addListener(
        () {
          debugPrint("current state is ${playerController.playerState}");
          emit(
            ListenToPlayerState(),
          );
        },
      );
  }

  stopOrPlayAudio() async {
    debugPrint("playing");
    playerController.playerState == PlayerState.playing
        ? await playerController.pausePlayer()
        : await playerController.startPlayer(finishMode: FinishMode.pause);
    emit(ChangeAudioState());
  }

  stopOrPlayRecord() async {
    if (isRecording) {
      recorderController.reset();
      var path = await recorderController.stop();
      if (path != null) {
        await playerController.preparePlayer(recordPath ?? '');
      }
    } else {
      await recorderController.record(recordPath);
    }
    isRecording = !isRecording;
    emit(ChangeRecordState());
  }

  String timeFormate({
    required int milliSeconds,
  }) {
    var date = DateTime.fromMillisecondsSinceEpoch(milliSeconds);
    var time = DateFormat(DateFormat.MINUTE_SECOND).format(date);
    return time;
  }
}
