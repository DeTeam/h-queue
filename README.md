# Haskell queue

This is an example app of how one can use TQueue (STM stuff) to create workers in separate threads and pass actions inside. It's also possible to use Control.Concurrent.Chan, I just preferred STM in this case.

Read the source. It's very simple.

## How to run

1. `git clone git@github.com:DeTeam/h-queue.git h-queue && cd h-queue`
2. `cabal sandbox init`
3. `cabal configure && cabal build`
4. `dist/build/h-queue/h-queue`