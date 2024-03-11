import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Users Group Code

class UsersGroup {
  static String baseUrl = 'https://x8ki-letl-twmt.n7.xano.io/api:H1NcPhNd/auth';
  static Map<String, String> headers = {};
  static NewAccountCall newAccountCall = NewAccountCall();
  static GetMeCall getMeCall = GetMeCall();
  static LoginCall loginCall = LoginCall();
}

class NewAccountCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "$name",
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'NewAccount',
      apiUrl: '${UsersGroup.baseUrl}/signup',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  dynamic authToken(dynamic response) => getJsonField(
        response,
        r'''$.authToken''',
      );
}

class GetMeCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetMe',
      apiUrl: '${UsersGroup.baseUrl}/me',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? nomeUsuario(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? emailUsuario(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${UsersGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  String? authToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.authToken''',
      ));
}

/// End Users Group Code

/// Start ListShopping Group Code

class ListShoppingGroup {
  static String baseUrl = 'https://x8ki-letl-twmt.n7.xano.io/api:H1NcPhNd';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer [authToken]',
  };
  static GetCreatedListByUserCall getCreatedListByUserCall =
      GetCreatedListByUserCall();
}

class GetCreatedListByUserCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetCreatedListByUser',
      apiUrl: '${ListShoppingGroup.baseUrl}/createdlist',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  String? nameList(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].nameList''',
      ));
  List? itemList(dynamic response) => getJsonField(
        response,
        r'''$[:].itemsList''',
        true,
      ) as List?;
  List? itemListDetail(dynamic response) => getJsonField(
        response,
        r'''$[:].itemsList[:].itemDetail''',
        true,
      ) as List?;
}

/// End ListShopping Group Code

/// Start Categories Group Code

class CategoriesGroup {
  static String baseUrl = 'https://x8ki-letl-twmt.n7.xano.io/api:H1NcPhNd';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [authToken]',
  };
  static GetCategoriesCall getCategoriesCall = GetCategoriesCall();
  static GetItemsByCategoryCall getItemsByCategoryCall =
      GetItemsByCategoryCall();
}

class GetCategoriesCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetCategories',
      apiUrl: '${CategoriesGroup.baseUrl}/categories',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? nameCategories(dynamic response) => (getJsonField(
        response,
        r'''$[:].name_categories''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? pathUrl(dynamic response) => (getJsonField(
        response,
        r'''$[:].image.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imagePath(dynamic response) => (getJsonField(
        response,
        r'''$[:].image.path''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? image(dynamic response) => getJsonField(
        response,
        r'''$[:].image''',
        true,
      ) as List?;
  List<String>? imageAccess(dynamic response) => (getJsonField(
        response,
        r'''$[:].image.access''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetItemsByCategoryCall {
  Future<ApiCallResponse> call({
    int? categoriesId,
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetItemsByCategory',
      apiUrl: '${CategoriesGroup.baseUrl}/itemslists',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {
        'categories_id': categoriesId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  int? categoryID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].categories_id''',
      ));
  List? itemTitle(dynamic response) => getJsonField(
        response,
        r'''$[:].itemTitle''',
        true,
      ) as List?;
  List<String>? listaItem(dynamic response) => (getJsonField(
        response,
        r'''$[:].itemTitle[:].itemTitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Categories Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
