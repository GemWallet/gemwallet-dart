# gemwallet-dart

[![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=Dart&logoColor=white)](https://dart.dev)
[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev)

`gemwallet-dart` is a Dart package that provides bindings to the [`GemWallet`](https://gemwallet.app/) API, enabling developers to interact with GemWallet in Dart applications.

## Features

This package is designed to facilitate interaction with the GemWallet API, providing functionality such as:

- Checking if the GemWallet is installed
- Retrieving the wallet address and public key
- Getting the network information
- Signing and submitting transactions
- Signing messages

## Installation

To use the `gemwallet-dart` package, include it in your `pubspec.yaml`:

```yaml
dependencies:
  gemwallet:
    git: https://github.com/GemWallet/gemwallet-dart.git
```

## Usage

Here are some examples of how to use the bindings provided by `gemwallet-dart`.

### Checking if the Wallet is Installed

```dart
import 'package:gemwallet/gemwallet.dart';

void main() async {
  final response = await GemWalletApi.isInstalled();
  if (response.result.isInstalled) {
    print('GemWallet is installed.');
  } else {
    print('GemWallet is not installed.');
  }
}
```

### Getting the Wallet Address

```dart
import 'package:gemwallet/gemwallet.dart';

void main() async {
  final response = await GemWalletApi.getAddress();
  print('Wallet address: ${response.result.address}');
}
```

### Signing and Submitting a Transaction

```dart
import 'package:gemwallet/gemwallet.dart';

void main() async {
  Transaction transaction = Transaction(
    TransactionType: 'Payment',
    Account: 'account_string',
    Destination: 'destination_string',
    Amount: '100',
  );

  SubmitTransactionRequest request = SubmitTransactionRequest(
    transaction: transaction,
  );

  final response = await GemWalletApi.submitTransaction(request);
  print('Transaction hash: ${response.result.hash}');
}
```

### Signing a Message

```dart
import 'package:gemwallet/gemwallet.dart';

void main() async {
  final response = await GemWalletApi.signMessage('message_to_sign');
  print('Signed message: ${response.result.signedMessage}');
}
```

## Contributing

Contributions to `gemwallet-dart` are welcome! To contribute, please fork the repository and submit a pull request. Before submitting a pull request, please ensure your code follows the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).

## License

`gemwallet-dart` is licensed under the BSD-3-Clause License. See the LICENSE file for more information.
```
