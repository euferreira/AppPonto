import '../../domain/entity/auth.entity.dart';
import '../../domain/iauth.repository.dart';
import '../iauth.datasource.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDataSource dataSource;

  AuthRepository({required this.dataSource});

  @override
  Future<AuthEntity> auth(AuthParams params) async {
    final result = await dataSource.auth(params);
    return result;
  }
}
