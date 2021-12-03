import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(const GameState());

  void newGame(String word) {
    final progress = StringBuffer();
    for (var i = 0; i < word.length; i++) {
      if (word[i] != ' ') {
        progress.write('_');
      } else {
        progress.write(' ');
      }
    }
    emit(
      state.copyWith(
        word: word.toUpperCase(),
        numberOfLetters: word.replaceAll(' ', '').length,
        remainingOpportunities: 6,
        uncoveredLetters: 0,
        progress: progress.toString(),
        lostOpportunities: 0,
        buttonStatus: List.filled(26, true),
      ),
    );
  }

  void letterPressed(String newLetter, int index) {
    var updatedButtonStatus = state.buttonStatus;
    updatedButtonStatus[index] = false;
    updatedButtonStatus = updatedButtonStatus;

    if (state.word.contains(newLetter) && !state.progress.contains(newLetter)) {
      var updatedProgress = state.progress;
      var updatedUncoveredLetters = state.uncoveredLetters;
      for (var i = 0; i < state.word.length; i++) {
        if (newLetter == state.word[i]) {
          updatedProgress = updatedProgress.substring(0, i) +
              newLetter +
              updatedProgress.substring(i + 1, state.word.length);
          updatedUncoveredLetters += 1;
        }
      }
      emit(
        state.copyWith(
          word: state.word,
          numberOfLetters: state.numberOfLetters,
          remainingOpportunities: state.remainingOpportunities,
          uncoveredLetters: updatedUncoveredLetters,
          progress: updatedProgress,
          lostOpportunities: state.lostOpportunities,
          buttonStatus: updatedButtonStatus,
        ),
      );
    } else if (!state.progress.contains(newLetter)) {
      emit(
        state.copyWith(
          word: state.word,
          numberOfLetters: state.numberOfLetters,
          remainingOpportunities: state.remainingOpportunities - 1,
          uncoveredLetters: state.uncoveredLetters,
          progress: state.progress,
          lostOpportunities: state.lostOpportunities + 1,
          buttonStatus: updatedButtonStatus,
        ),
      );
    }

    if (hasWon()) {
      emit(
        state.copyWith(
          word: state.word,
          numberOfLetters: state.numberOfLetters,
          remainingOpportunities: state.remainingOpportunities,
          uncoveredLetters: state.uncoveredLetters,
          progress: state.word,
          lostOpportunities: state.lostOpportunities,
          buttonStatus: state.buttonStatus,
        ),
      );
    }

    if (hasLost()) {
      emit(
        state.copyWith(
          word: state.word,
          numberOfLetters: state.numberOfLetters,
          remainingOpportunities: state.remainingOpportunities,
          uncoveredLetters: state.uncoveredLetters,
          progress: state.word,
          lostOpportunities: state.lostOpportunities,
          buttonStatus: state.buttonStatus,
        ),
      );
    }
  }

  bool hasWon() {
    return state.uncoveredLetters == state.numberOfLetters &&
        state.progress != '';
  }

  bool hasLost() {
    return state.remainingOpportunities == 0;
  }

  bool isActive(int index) {
    return state.buttonStatus[index] == true;
  }
}
