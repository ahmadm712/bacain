class ServerException implements Exception {}

class NormalException implements Exception {
  NormalException({
    this.status,
    this.message,
  });

  String? status;
  String? message;

  factory NormalException.fromJson(Map<String, dynamic> json) =>
      NormalException(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
