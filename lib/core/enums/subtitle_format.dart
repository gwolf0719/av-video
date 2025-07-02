enum SubtitleFormat {
  srt,
  vtt,
  ass,
  ssa,
  sub,
  sbv;

  String get displayName {
    switch (this) {
      case SubtitleFormat.srt:
        return 'SRT';
      case SubtitleFormat.vtt:
        return 'WebVTT';
      case SubtitleFormat.ass:
        return 'ASS';
      case SubtitleFormat.ssa:
        return 'SSA';
      case SubtitleFormat.sub:
        return 'SUB';
      case SubtitleFormat.sbv:
        return 'SBV';
    }
  }

  String get fileExtension {
    switch (this) {
      case SubtitleFormat.srt:
        return '.srt';
      case SubtitleFormat.vtt:
        return '.vtt';
      case SubtitleFormat.ass:
        return '.ass';
      case SubtitleFormat.ssa:
        return '.ssa';
      case SubtitleFormat.sub:
        return '.sub';
      case SubtitleFormat.sbv:
        return '.sbv';
    }
  }

  String get mimeType {
    switch (this) {
      case SubtitleFormat.srt:
        return 'text/srt';
      case SubtitleFormat.vtt:
        return 'text/vtt';
      case SubtitleFormat.ass:
        return 'text/ass';
      case SubtitleFormat.ssa:
        return 'text/ssa';
      case SubtitleFormat.sub:
        return 'text/sub';
      case SubtitleFormat.sbv:
        return 'text/sbv';
    }
  }
} 