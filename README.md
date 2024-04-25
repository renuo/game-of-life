# Variety: Game of Life

## Setup

```bash
bundle install
```

## Make your own game

```bash
cp -r ./example 00-<name>
```

Then edit the `game.rb` file in the new directory.

## Run

See a listing of all games and run one:

```bash
bin/run
```

You could also run a custom game like that:

```bash
GAME_PATH=<round_nr>-<name_1>-<name_2>/game ruby visualize.rb
```
