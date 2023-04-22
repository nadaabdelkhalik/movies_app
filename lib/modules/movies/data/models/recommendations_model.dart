import 'package:movies_app/modules/movies/domain/entities/recommendations.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({required super.id, super.backdropPat});
  factory RecommendationsModel.fromJson(Map<String, dynamic> json) {
    return RecommendationsModel(
      id: json['id'],
      backdropPat: json['backdrop_path'] ?? '/kqjL17yufvn90vLyXYpvtyrFfak.jpg',
    );
  }
}
