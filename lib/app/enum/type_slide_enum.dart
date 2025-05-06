enum TypeSlideEnum {
  quiz,
  board,
  narrative;

  String get display {
    switch (this) {
      case TypeSlideEnum.quiz:
        return 'quiz';
      case TypeSlideEnum.board:
        return 'board';
      case TypeSlideEnum.narrative:
        return 'narrative';
      }
  }

  String get displayTitle {
    switch (this) {
      case TypeSlideEnum.quiz:
        return 'Quiz';
      case TypeSlideEnum.board:
        return 'Board';
      case TypeSlideEnum.narrative:
        return 'Narrative';
      }
  }
}
