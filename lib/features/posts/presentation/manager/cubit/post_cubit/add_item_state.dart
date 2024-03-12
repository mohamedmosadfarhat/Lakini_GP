

class AddItemState {}

class AddItemInitializing extends AddItemState {}

class AddItemLoading extends AddItemState {}

class AddItemSuccess extends AddItemState {
  AddItemSuccess();
}

class AddItemFailure extends AddItemState {

  AddItemFailure();
}

class AddImageLoading extends AddItemState{}
class AddImageSuccess extends AddItemState{}

