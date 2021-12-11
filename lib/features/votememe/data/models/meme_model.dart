import 'package:memevoter/core/interface/models/base_network_model.dart';
import 'package:memevoter/features/votememe/domain/entities/meme.dart';
import 'package:json_annotation/json_annotation.dart';
part 'meme_model.g.dart';

@JsonSerializable()
class MemeModel extends BaseNetworkModel<MemeModel> implements Meme {
  @override
  @JsonKey(name: 'box_count')
  late final int boxCount;

  @override
  late final int height;

  @override
  late final String id;

  @override
  late final String name;

  @override
  late final String url;

  @override
  late final int width;

  @override
  @JsonKey(ignore: true)
  int score = 0;

  @override
  @JsonKey(ignore: true)
  late int rank;

  @override
  MemeModel fromJson(Map<String, dynamic> json) {
    return _$MemeModelFromJson(json);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemeModel && runtimeType == other.runtimeType && id == other.id;
  @override
  int get hashCode => id.hashCode;
}
