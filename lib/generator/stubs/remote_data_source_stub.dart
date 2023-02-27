String remoteDataSourceStub({required String name}) => '''
import 'package:louhie/core/data_soruce.dart';
import 'package:louhie/core/api_client.dart';

class ${name}RemoteDataSource extends DataSource {
  final ApiClient _client;

  ${name}RemoteDataSource(this._client);
 }
''';
