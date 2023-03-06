import 'package:co_flutter_core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:louhie/features/auth/data/dto/user_dto.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sup;
import 'package:louhie/features/app/data/app_supbase_data_source.dart';

typedef RegisterResult = Either<sup.AuthResponse, Failure>;
final registerRequestProvider = FutureProvider.autoDispose
    .family<RegisterResult, UserDto>((ref, userDto) async {
  final PackageInfo packageInfo = sl<PackageInfo>();
  final sup.SupabaseClient client = sl<AppSupabaseDataSource>().supabaseClient;
  try {
    final response = await client.auth.signUp(
        email: userDto.email,
        password: userDto.password,
        emailRedirectTo: "${packageInfo.packageName}://reset-callback/");
    return Left(response);
  } on sup.AuthException catch (error, _) {
    return Right(ConnectionFailure());
  } catch (e) {
    return Right(ConnectionFailure());
  }
});
