# XMAS Guessing Game

A Flutter project.

Shield: [![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg

### Illustrations

The main page illustrations are made by Drakkatz (Instagram @drakkatz_design)

## Getting Started

This project is an adaptation of the classic Hangman, but with a Christmas theme. You can choose your favourite tradition and play a game of guessing words related to that tradition. Please note that the words will appear in the original language of the tradition.

At the moment there are three traditions:
- Father Christmas, from the United States.
- O Apalpador, from Galicia (Spain).
- The Three Wise Men, from Spain.

I know that Father Christmas and Los Reyes Magos are celebrated in more regions, but I tried to bring it closer to those where they are the main celebration of these holidays.

You can learn about the different traditions in the About section. The legend or tradition is written in the original language of the tradition, and if it is different from English, in English as well.

## Collaboration

If you want to collaborate in the project and contribute the tradition of your village or region you need to do the following:
- Add in ```main.dart``` the option of the new tradition in the dropdown, indicating the locale of the language in which the words will appear (for example, "Santa Claus (EN)")
- Add the following resources in the ```/img``` directory: image for the main screen representing the lore, images representing the lore for the game. There must be 7 images, with the name ```1-locale.png```. Image 0 represents the initial state, and image 6 is the end.
- Add the list of words in the ```/res``` directory using the name ```words_locale.txt```.
- Add in the about section (```about.dart```) a new entry to explain the new tradition.
