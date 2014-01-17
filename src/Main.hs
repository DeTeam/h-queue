module Main where

import System.Random (randomRIO)
import Control.Concurrent (threadDelay)

import HQueue.Worker (createWorker)
import HQueue.Queue (initQueue, pushToQueue)

fakeJob :: String -> IO ()
fakeJob userData = randomDelay >>= threadDelay >> putStrLn userData
  where minDelay =  2 * 1000 * 1000
        maxDelay =  10 * 1000 * 1000
        randomDelay = randomRIO (minDelay, maxDelay)

handleUserInput queue = do
    putStrLn "Enter some data, please:"
    line <- getLine
    push $ fakeJob line
    handleUserInput queue
  where push = pushToQueue queue

main = do
  queue <- initQueue
  createWorker queue
  createWorker queue
  createWorker queue
  handleUserInput queue