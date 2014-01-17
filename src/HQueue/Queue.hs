module HQueue.Queue where

import Control.Concurrent.STM (atomically)
import Control.Concurrent.STM.TQueue (newTQueueIO, writeTQueue)

-- | Init the queue, we use TQueue with IO actions inside
initQueue = newTQueueIO

-- | IO action for pushing stuff into queue
pushToQueue queue job = atomically . (writeTQueue queue) $ job