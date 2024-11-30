// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState({this.user});
  final UserInformationModel? user;

  UserState copyWith({UserInformationModel? user}) {
    return UserState(user: user ?? this.user);
  }

  @override
  List<Object?> get props => [user];
}
