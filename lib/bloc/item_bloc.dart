import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql/database/database_helper.dart';
import 'item_event.dart';
import 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final DatabaseHelper databaseHelper;

  ItemBloc(this.databaseHelper) : super(ItemsLoading()) {
    on<LoadItems>(_onLoadItems);
    on<AddItem>(_onAddItem);
    on<UpdateItem>(_onUpdateItem);
    on<DeleteItem>(_onDeleteItem);
  }

  Future<void> _onLoadItems(LoadItems event, Emitter<ItemState> emit) async {
    try {
      final items = await databaseHelper.getItems();
      emit(ItemsLoaded(items));
    } catch (_) {
      emit(ItemOperationFailure());
    }
  }

  Future<void> _onAddItem(AddItem event, Emitter<ItemState> emit) async {
    try {
      await databaseHelper.insertItem({'name': event.name});
      final items = await databaseHelper.getItems();
      emit(ItemsLoaded(items));
    } catch (_) {
      emit(ItemOperationFailure());
    }
  }

  Future<void> _onUpdateItem(UpdateItem event, Emitter<ItemState> emit) async {
    try {
      await databaseHelper.updateItem({'id': event.id, 'name': event.name});
      final items = await databaseHelper.getItems();
      emit(ItemsLoaded(items));
    } catch (_) {
      emit(ItemOperationFailure());
    }
  }

  Future<void> _onDeleteItem(DeleteItem event, Emitter<ItemState> emit) async {
    try {
      await databaseHelper.deleteItem(event.id);
      final items = await databaseHelper.getItems();
      emit(ItemsLoaded(items));
    } catch (_) {
      emit(ItemOperationFailure());
    }
  }
}
