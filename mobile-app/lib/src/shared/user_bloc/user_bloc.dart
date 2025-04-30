import '../../../core/services/local_storage.dart';
import '../../../core/utils/injector.dart';
import '../models/user/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<GetUserEvent>(_getUser);
    on<DeleteUserEvent>(_delete);
  }

  final LocalStorage _hiveStorage = injector<LocalStorage>();

  void _getUser(GetUserEvent event, Emitter<UserState> emit) async {
    await _hiveStorage.getUser().then((user) {
      emit(state.copyWith(user: user));
    });
  }

  void _delete(DeleteUserEvent event, Emitter<UserState> emit) async {
    await state.user?.delete();
  }
}
