func :: Int -> Int -> Int
func x y = x*y

main = do
    putStrLn "Informe dois numeros"
    baseX <- getLine
    baseY <- getLine
    let x = (read baseX :: Int)
    let y = (read baseY :: Int)
    print (func x y)
    
    
    
    