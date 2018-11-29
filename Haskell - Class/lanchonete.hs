import Control.Concurrent
import Control.Concurrent.MVar
import Control.Concurrent.STM

waitThread :: MVar Int -> IO()
waitThread fim = do
        f <- takeMVar fim
        if (f > 0)
        then do 
            putMVar fim f
            waitThread fim
        else return()
        
supplier :: TVar Int -> TVar Int -> TVar Int -> IO()
supplier pao carne tomate = do
                        atomically (do
                                writeTVar pao 30
                                writeTVar carne 30
                                writeTVar tomate 30
                                )
                        supplier pao carne tomate

producer :: TVar Int -> TVar Int -> TVar Int -> TVar Int -> MVar Bool -> IO()
producer pao carne tomate sanduiche faca = do
                                        f <- takeMVar faca
                                        atomically (do
                                                p <- readTVar pao
                                                c <- readTVar carne
                                                t <- readTVar tomate
                                                if (p <= 0 || c <= 0 || t <= 0)
                                                then retry
                                                else do
                                                        s <- readTVar sanduiche
                                                        writeTVar pao (p-1)
                                                        writeTVar carne (c-1)
                                                        writeTVar tomate (t-1)
                                                        writeTVar sanduiche (s+1)
                                                )
                                        putMVar faca f
                                        producer pao carne tomate sanduiche faca

main :: IO()                                        
main = do
    pao <- atomically $ newTVar 0
    carne <- atomically $ newTVar 0
    tomate <- atomically $ newTVar 0
    sanduiche <- atomically $ newTVar 0

    faca <- newMVar False

    forkIO(supplier pao carne tomate)
    forkIO(producer pao carne tomate sanduiche faca)
    forkIO(producer pao carne tomate sanduiche faca)

    threadDelay(100000)

    p <- atomically $ readTVar pao
    c <- atomically $ readTVar carne
    t <- atomically $ readTVar tomate
    s <- atomically $ readTVar sanduiche
    putStrLn $ "no_Pao: " ++ (show p) ++ " no_Carne: " ++ (show c) ++ " no_Tomate: " ++ (show t) ++ " no_Sanduiche: " ++ (show s)




