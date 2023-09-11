import 'package:bloc/bloc.dart';
import 'package:cubit_travel_app/models/data_model.dart';
import 'package:cubit_travel_app/views/nav_views/home_view.dart';
import 'package:equatable/equatable.dart';

part 'app_cubits_state.dart';

class AppCubits extends Cubit<AppCubitsState> {
  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
  }

  Future<void> getData() async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(LoadedState(DataModel.mockDataList));
  }

  detailView(DataModel place) {
    emit(DetailState(place));
  }

  homeView() {
    emit(LoadedState(DataModel.mockDataList));
  }
}
