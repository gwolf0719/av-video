import 'package:equatable/equatable.dart';
import '../../core/enums/subtitle_format.dart';

class SubtitleEntity extends Equatable {
  final String id;
  final String languageCode;
  final String languageName;
  final String url;
  final SubtitleFormat format;
  final bool isDefault;
  
  const SubtitleEntity({
    required this.id,
    required this.languageCode,
    required this.languageName,
    required this.url,
    required this.format,
    this.isDefault = false,
  });
  
  @override
  List<Object?> get props => [
    id,
    languageCode,
    languageName,
    url,
    format,
    isDefault,
  ];
} 