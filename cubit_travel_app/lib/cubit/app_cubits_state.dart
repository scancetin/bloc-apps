part of 'app_cubits_cubit.dart';

sealed class AppCubitsState extends Equatable {
  const AppCubitsState();

  @override
  List<Object> get props => [];
}

final class InitialState extends AppCubitsState {
  @override
  List<Object> get props => [];
}

final class WelcomeState extends AppCubitsState {
  @override
  List<Object> get props => [];
}

final class LoadingState extends AppCubitsState {
  @override
  List<Object> get props => [];
}

final class LoadedState extends AppCubitsState {
  final List<DataModel> dataModels;
  const LoadedState(this.dataModels);

  @override
  List<Object> get props => [dataModels];
}

final class DetailState extends AppCubitsState {
  final DataModel place;
  const DetailState(this.place);

  @override
  List<Object> get props => [place];
}
