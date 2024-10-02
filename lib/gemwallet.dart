@JS('GemWalletApi')
library gemwallet_api;

import 'package:js/js.dart';
import 'package:node_interop/util.dart';

class GemWalletApi {
  static Future<Response> submitTransaction(
      SubmitTransactionRequest request) async {
    return await promiseToFuture(_submitTransaction(request));
  }

  static Future<Response> getAddress() async {
    return await promiseToFuture(_getAddress());
  }

  static Future<Response> isInstalled() async {
    return await promiseToFuture(_isInstalled());
  }

  static Future<Response> getPublicKey() async {
    return await promiseToFuture(_getPublicKey());
  }

  static Future<Response> getNetwork() async {
    return await promiseToFuture(_getNetwork());
  }

  static Future<Response> signMessage(String message, bool? isHex) async {
    return await promiseToFuture(_signMessage(message, isHex));
  }
}

@JS('submitTransaction')
external dynamic _submitTransaction(SubmitTransactionRequest request);

@JS('getAddress')
external dynamic _getAddress();

@JS('isInstalled')
external dynamic _isInstalled();

@JS('getPublicKey')
external dynamic _getPublicKey();

@JS('getNetwork')
external dynamic _getNetwork();

@JS('signMessage')
external dynamic _signMessage(String message, bool? isHex);

@JS()
@anonymous
class Memo {
  external factory Memo({
    String MemoData,
    String MemoType,
  });
}

@JS()
@anonymous
class Transaction {
  external factory Transaction({
    String? TransactionType,
    String? Destination,
    String? Amount,
    String? Account,
    String? Channel,
    String? NFTokenSellOffer,
    int? SettleDelay,
    String? PublicKey,
    List<Memo> Memos,
  });
  // Other fields for other types would go here.
}

@JS()
@anonymous
class SubmitTransactionRequest {
  external factory SubmitTransactionRequest({
    Transaction transaction,
  });
}

@JS()
@anonymous
class Response {
  external Result get result;
}

@JS()
@anonymous
class Result {
  external String get hash;
  external String get address;
  external String get publicKey;
  external String get network;
  external String get chain;
  external String get signedMessage;
  external bool get isInstalled;
}
