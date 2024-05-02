part of 'generate_image_cubit.dart';

sealed class GenerateImageState {
  const GenerateImageState();
}

final class GenerateImageInitial extends GenerateImageState {}

final class GenerateImageLoading extends GenerateImageState {}

final class GenerateImageSuccess extends GenerateImageState {
  final List<String> images;

  const GenerateImageSuccess({required this.images});
}

final class GenerateImageFailure extends GenerateImageState {
  final String errorMessage;

  const GenerateImageFailure(this.errorMessage);
}
