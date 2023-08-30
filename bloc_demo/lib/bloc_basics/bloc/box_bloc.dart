import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/box.dart';
part 'box_event.dart';
part 'box_state.dart';

class BoxBloc extends Bloc<BoxEvent, BoxState> {
  BoxBloc() : super(BoxInitial()) {
    on<LoadBoxCounter>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      emit(const BoxLoaded(boxes: <Box>[]));
    });
    on<AddBox>((event, emit) {
      if (state is BoxLoaded) {
        final state = this.state as BoxLoaded;
        emit(BoxLoaded(boxes: List.from(state.boxes)..add(event.box)));
      }
    });
    on<RemoveBox>((event, emit) {
      if (state is BoxLoaded) {
        final state = this.state as BoxLoaded;
        emit(BoxLoaded(boxes: List.from(state.boxes)..remove(event.box)));
      }
    });
  }
}
