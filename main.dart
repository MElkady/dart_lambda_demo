import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

class MyCustomEvent {
  factory MyCustomEvent.fromJson(Map<String, dynamic> json) {
    print("Got an event: $json");
    return MyCustomEvent();
  }

  const MyCustomEvent();
}

void main() async {
  final Handler successHandler = (context, event) async {
    return InvocationResult(context.requestId, "SUCCESS");
  };

  Runtime()
    ..registerEvent((Map<String, dynamic> json) => MyCustomEvent.fromJson(json))
    ..registerHandler("hello.handler", successHandler)
    ..invoke();
}
