absolut :: Int -> Int
absolut x =
    if x < 0 then
        (-x)
    else
        x

main = do
    putStrLn "Digite um numero"
    baseX <- getLine
    let x = (read baseX :: Int)
    print (absolut x)