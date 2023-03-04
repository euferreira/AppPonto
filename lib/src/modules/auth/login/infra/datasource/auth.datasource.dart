import '../../domain/entity/auth.entity.dart';
import '../iauth.datasource.dart';

class AuthDatasource implements IAuthDataSource {
  @override
  Future<AuthEntity> auth(AuthParams params) async {
    throw UnimplementedError("Not implemented yet");
  }
}
