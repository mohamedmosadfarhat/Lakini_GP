part of 'generate_description_cubit.dart';

sealed class GenerateDescriptionState {
  const GenerateDescriptionState();
}

final class GenerateDescriptionInitial extends GenerateDescriptionState {}

final class GenerateDescriptionLoading extends GenerateDescriptionState {}

final class GenerateDescriptionSuccess extends GenerateDescriptionState {
  final List<GenerateDesc> data;
  const GenerateDescriptionSuccess({required this.data});
}

final class GenerateDescriptionFailure extends GenerateDescriptionState {
  final String errorMessage;

  const GenerateDescriptionFailure(this.errorMessage);
}
