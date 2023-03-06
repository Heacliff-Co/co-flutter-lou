import 'package:bloc/bloc.dart';
import 'package:louhie/features/app/data/app_supbase_data_source.dart';
import 'package:equatable/equatable.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.supabase) : super(LogoutInitial());

  final AppSupabaseDataSource supabase;

  void logout() async {
    emit(const LogoutLoading());
    await supabase.supabaseClient.auth.signOut();
    emit(const LogoutSuccess(""));
  }
}
