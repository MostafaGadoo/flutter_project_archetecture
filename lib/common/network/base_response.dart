class BaseResponse<T> {
  DateTime timestamp;
  int utcOffset;
  bool success;
  int code;
  String message;
  String txnId;
  T data;

  BaseResponse({
    required this.timestamp,
    required this.utcOffset,
    required this.success,
    required this.code,
    required this.data,
    required this.message,
    required this.txnId,
  });

  factory BaseResponse.fromJson(json, BaseObject target) {
    return BaseResponse(
      timestamp: json['timestamp'],
      utcOffset: json['utcOffset'],
      success: json['success'],
      code: json['code'],
      txnId: json['txnId'],
      message: json['message'],
      data: target.fromJson(json['data']),
    );
  }
}

abstract class BaseObject<T> {
  T fromJson(json);
}
