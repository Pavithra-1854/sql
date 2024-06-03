import 'package:equatable/equatable.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemsLoading extends ItemState {}

class ItemsLoaded extends ItemState {
  final List<Map<String, dynamic>> items;

  const ItemsLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class ItemOperationFailure extends ItemState {}
