part of 'game_cubit.dart';

class GameState extends Equatable {
  const GameState({
    this.word = '',
    this.numberOfLetters = 0,
    this.remainingOpportunities = 6,
    this.uncoveredLetters = 0,
    this.progress = '',
    this.lostOpportunities = 0,
    this.buttonStatus = const [],
  });

  final String word;
  final int numberOfLetters;
  final int remainingOpportunities;
  final int uncoveredLetters;
  final String progress;
  final int lostOpportunities;
  final List<bool> buttonStatus;

  @override
  List<Object?> get props => [
        word,
        numberOfLetters,
        remainingOpportunities,
        uncoveredLetters,
        progress,
        lostOpportunities,
        buttonStatus,
      ];

  GameState copyWith({
    required String word,
    required int numberOfLetters,
    required int remainingOpportunities,
    required int uncoveredLetters,
    required String progress,
    required int lostOpportunities,
    required List<bool> buttonStatus,
  }) {
    return GameState(
      word: word,
      numberOfLetters: numberOfLetters,
      remainingOpportunities: remainingOpportunities,
      uncoveredLetters: uncoveredLetters,
      progress: progress,
      lostOpportunities: lostOpportunities,
      buttonStatus: buttonStatus,
    );
  }
}
