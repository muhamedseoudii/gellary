class GalleryResponse {
  final String status;
  final Data data;
  final String message;

  GalleryResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GalleryResponse.fromJson(Map<String, dynamic> json) {
    return GalleryResponse(
      status: json['status'],
      data: Data.fromJson(json['data']),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
      'message': message,
    };
  }
}

class Data {
  final List<String> images;

  Data({required this.images});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      images: List<String>.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
    };
  }
}
