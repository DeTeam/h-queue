module HQueue.Worker where


import Control.Concurrent (forkIO)
import Control.Concurrent.STM (atomically)
import Control.Concurrent.STM.TQueue (readTQueue)

-- | Create a handler in a separate thread (using forkIO).
--   Get the action from the queue passed, execute it
createWorker queue = forkIO processJob
  where processJob = do
          action <- atomically . readTQueue $ queue
          action
          processJob