import 'package:ellipsis_care/core/services/hive_storage_service.dart';
import 'package:ellipsis_care/core/utils/injector.dart';
import 'package:ellipsis_care/src/shared/models/user/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<GetUserEvent>(_getUser);
    on<DeleteUserEvent>(_delete);
  }

  final HiveStorageService _hiveStorage = injector<HiveStorageService>();

  void _getUser(GetUserEvent event, Emitter<UserState> emit) async {
    await _hiveStorage.getUser().then((user) {
      emit(state.copyWith(user: user));
    });
  }

  void _delete(DeleteUserEvent event, Emitter<UserState> emit) async {
    await state.user?.delete();
  }
}
