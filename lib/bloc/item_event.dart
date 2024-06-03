import 'package:equatable/equatable.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class LoadItems extends ItemEvent {}

class AddItem extends ItemEvent {
  final String name;

  const AddItem(this.name);

  @override
  List<Object> get props => [name];
}

class UpdateItem extends ItemEvent {
  final int id;
  final String name;

  const UpdateItem(this.id, this.name);

  @override
  List<Object> get props => [id, name];
}

class DeleteItem extends ItemEvent {
  final int id;

  const DeleteItem(this.id);

  @override
  List<Object> get props => [id];
}
