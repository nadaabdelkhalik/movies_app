import 'package:movies_app/modules/movies/domain/entities/recommendations.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({required super.id, super.backdropPath});
  factory RecommendationsModel.fromJson(Map<String, dynamic> json) {
    return RecommendationsModel(
      id: json['id'],
      backdropPath: json['backdrop_path'] ?? "",
    );
  }
}
