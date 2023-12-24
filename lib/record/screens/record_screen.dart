import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_ui/record/cubit/record_cubit.dart';
import 'package:test_ui/record/cubit/record_states.dart';
import 'package:test_ui/record/screens/widgets/player_bubble.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => RecordCubit()
          ..initControllers()
          ..getRecordPath(),
        child: BlocBuilder<RecordCubit, RecordStates>(
          builder: (context, state) {
            var cubit = RecordCubit.get(context);
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (cubit.playerController.playerState !=
                                PlayerState.stopped &&
                            cubit.isRecording == false)
                          const PlayerBubble(),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: cubit.isRecording
                              ? AudioWaveforms(
                                  size: Size(
                                    MediaQuery.sizeOf(context).width * .5 + 40,
                                    MediaQuery.sizeOf(context).height * .06 -
                                        15,
                                  ),
                                  recorderController: cubit.recorderController,
                                  waveStyle: const WaveStyle(
                                    waveColor: Colors.white,
                                    extendWaveform: true,
                                    showMiddleLine: false,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.teal,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        if (cubit.playerController.playerState ==
                            PlayerState.stopped)
                          const Spacer(),
                        if (cubit.playerController.playerState ==
                            PlayerState.stopped)
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .06,
                            width: 50,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.teal,
                              ),
                              child: cubit.isRecording
                                  ? GestureDetector(
                                      onTap: cubit.stopOrPlayRecord,
                                      child: const Icon(
                                        Icons.stop,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: cubit.stopOrPlayRecord,
                                        child: SvgPicture.asset(
                                          'assets/images/ic_voice.svg',
                                          height: 20,
                                          width: 20,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
