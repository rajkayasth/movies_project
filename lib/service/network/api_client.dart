import '../../utils/exports.dart';

class ApiClient {
  Dio? _dio;
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal() {
    _dio = Dio();

    // Configure the base options for Dio
    BaseOptions baseOption = BaseOptions(
      // Timeout for connecting to the server
      connectTimeout: const Duration(seconds: 60),

      // Timeout for receiving a response from the server
      receiveTimeout: const Duration(seconds: 60),

      // Timeout for sending data to the server
      sendTimeout: const Duration(seconds: 60),

      // The base URL for all the API requests
      baseUrl: 'https://api.themoviedb.org/3',
      // Set your base URL here
      // baseUrl: "https://jsonplaceholder.typicode.com/",
    );
    _dio?.options = baseOption;
    _dio?.interceptors.add(
      AwesomeDioInterceptor(
        logRequestHeaders: true,
        logRequestTimeout: true,
        logResponseHeaders: true,
      ),
    );
  }

  // Function to show error dialog
  Future<void> _showErrorDialog(String errorMessage) async {
    return showDialog(
      context: MainConfig.context, // Assuming you have access to the context
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showLoading(bool showLoader) async {
    if (showLoader) {
      await EasyLoading.show();
    }
  }

  Future<void> _dismissLoading(bool dismissLoader) async {
    if (dismissLoader) {
      await EasyLoading.dismiss();
    }
  }

  /// Function to check the internet connection
  FutureOr<bool> _checkInternet() async {
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    }
    return false;
  }

  /// Show a custom dialog if there is no internet connection
  Future<void> _showNoInternetDialog() async {
    return showDialog(
      context: MainConfig.context, // Assuming you have access to the context
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No Internet Connection'),
          content: Text('Please check your internet connection and try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<Response?> get(String endUrl,
      {Map<String, dynamic>? params, CancelToken? cancelToken}) async {
    bool isConnected = await _checkInternet();
    if (!isConnected) {
      await _showNoInternetDialog();
      throw Exception('No internet connection');
    }

    try {
      await _showLoading(true);

      Response? response = await _dio?.get(
        endUrl,
        queryParameters: params,
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMzI3ZDU5Y2Q5ODUwNzU2YjhmMDMxMWVhZTA2MGMyMiIsIm5iZiI6MTc0MTc1NjcwOS4xMTAwMDAxLCJzdWIiOiI2N2QxMTkyNTQzNGM5OGM4ZWM4MTVlMWMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.-ZABwXLTrEKSR56nZX8zdk-UDw7GJDhLkaFlCDnVGjs',
            'accept': 'application/json',
          },
        ),
      );
      await _dismissLoading(true);

      return response;
    } on DioException catch (e) {
      await _dismissLoading(true);
      String errorMessage = 'Failed to load data: ${e.message}';
      await _showErrorDialog(errorMessage); // Show error dialog
      throw Exception(errorMessage);
    }
  }

  Future<Response> post(String endUrl,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      CancelToken? cancelToken}) async {
    bool isConnected = await _checkInternet();
    if (!isConnected) {
      await _showNoInternetDialog();
      throw Exception('No internet connection');
    }

    try {
      Response response = await _dio!.post(
        endUrl,
        data: data,
        queryParameters: params,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      String errorMessage = 'Failed to post data: ${e.message}';
      await _showErrorDialog(errorMessage); // Show error dialog
      throw Exception(errorMessage);
    }
  }

  Future<Response> put(String endUrl,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      CancelToken? cancelToken}) async {
    bool isConnected = await _checkInternet();
    if (!isConnected) {
      await _showNoInternetDialog();
      throw Exception('No internet connection');
    }

    try {
      Response response = await _dio!.put(
        endUrl,
        data: data,
        queryParameters: params,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      String errorMessage = 'Failed to update data: ${e.message}';
      await _showErrorDialog(errorMessage); // Show error dialog
      throw Exception(errorMessage);
    }
  }

  Future<Response> delete(String endUrl,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      CancelToken? cancelToken}) async {
    bool isConnected = await _checkInternet();
    if (!isConnected) {
      await _showNoInternetDialog();
      throw Exception('No internet connection');
    }

    try {
      Response response = await _dio!.delete(
        endUrl,
        data: data,
        queryParameters: params,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      String errorMessage = 'Failed to delete data: ${e.message}';
      await _showErrorDialog(errorMessage); // Show error dialog
      throw Exception(errorMessage);
    }
  }

  // Optionally, you can cancel requests
  void cancelRequests({CancelToken? cancelToken}) {
    cancelToken?.cancel('Request canceled');
  }
}
