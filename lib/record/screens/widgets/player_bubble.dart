import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ui/record/cubit/record_cubit.dart';
import 'package:test_ui/record/cubit/record_states.dart';

class PlayerBubble extends StatelessWidget {
  const PlayerBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordCubit, RecordStates>(
      builder: (context, state) {
        var recordCubit = RecordCubit.get(context);
        return SizedBox(
          width: MediaQuery.sizeOf(context).width * .5 + 100,
          height: MediaQuery.sizeOf(context).height * .08,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.teal,
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 30,
                          child: StreamBuilder<int>(
                            stream: recordCubit
                                .playerController.onCurrentDurationChanged,
                            builder: (context, data) {
                              debugPrint(
                                  "all size is ${recordCubit.timeFormate(milliSeconds: recordCubit.playerController.maxDuration)}");
                              return data.hasData
                                  ? FittedBox(
                                      child: Text(
                                        recordCubit.timeFormate(
                                          milliSeconds: data.data!,
                                        ),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    )
                                  : FittedBox(
                                      child: Text(
                                        recordCubit.timeFormate(
                                          milliSeconds: 0,
                                        ),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        SizedBox(
                            width: 30,
                            child: FittedBox(
                              child: Text(
                                recordCubit.timeFormate(
                                  milliSeconds:
                                      recordCubit.playerController.maxDuration,
                                ),
                                style: const TextStyle(color: Colors.black),
                              ),
                            )),
                      ],
                    ),
                    StreamBuilder<PlayerState>(
                      stream: recordCubit.playerController.onPlayerStateChanged,
                      builder: (context, snapshot) {
                        return IconButton(
                          onPressed: recordCubit.stopOrPlayAudio,
                          icon: Icon(
                            snapshot.data == PlayerState.playing
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 30,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                    AudioFileWaveforms(
                      size: Size(
                        MediaQuery.sizeOf(context).width * .5,
                        MediaQuery.sizeOf(context).height * .07,
                      ),
                      playerController: recordCubit.playerController,
                      density: 1.5,
                      playerWaveStyle: const PlayerWaveStyle(
                        scaleFactor: .6,
                        fixedWaveColor: Colors.white30,
                        liveWaveColor: Colors.white,
                        waveCap: StrokeCap.butt,
                      ),
                    ),
                  ],
                ),
              ),
              PositionedDirectional(
                end: 10,
                top: 5,
                bottom: 5,
                child: GestureDetector(
                  onTap: () {
                    recordCubit.playerController.stopPlayer();
                  },
                  child: const CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      size: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
