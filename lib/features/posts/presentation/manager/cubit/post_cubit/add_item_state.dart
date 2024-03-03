import 'package:lakini_gp/features/posts/data/models/item_model.dart';

class AddItemState {}

class AddItemInitializing extends AddItemState {}

class AddItemLoading extends AddItemState {}

class AddItemSuccess extends AddItemState {
  AddItemSuccess();
}

class AddItemFailure extends AddItemState {
  final String message;
  AddItemFailure({required this.message});
}
