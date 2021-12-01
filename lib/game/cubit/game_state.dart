part of 'game_cubit.dart';

class GameState extends Equatable {
  const GameState({
    this.word = '',
    this.remainingOpportunities = 6,
    this.uncoveredLetters = 0,
  });

  final String word;
  final int remainingOpportunities;
  final int uncoveredLetters;


  @override
  List<Object?> get props => [word, remainingOpportunities, uncoveredLetters];

  GameState copyWith({
    required String word,
    required int remainingOpportunities,
    required int uncoveredLetters,
  }) {
    return GameState(
      word: word,
      remainingOpportunities: remainingOpportunities,
      uncoveredLetters: uncoveredLetters,
    );
  }
}
