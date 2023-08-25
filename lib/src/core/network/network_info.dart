import 'dart:io';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException {
      return false;
    }
    return false;
  }
}

void main() async {
  final networkInfo = NetworkInfoImpl();

  final isConnected = await networkInfo.isConnected;
  if (isConnected) {
    print('Internet connection is available.');
  } else {
    print('No internet connection.');
  }
}
