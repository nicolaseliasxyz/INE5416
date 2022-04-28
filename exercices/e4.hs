xor :: Bool -> Bool -> Bool
xor x y =
    if ((not(x) && y) || (x && not(y))) then
        True
    else
        False

main = do
    putStrLn "Digite dois valores booleanos"
    baseX <- getLine
    baseY <- getLine
    let x = (read baseX :: Bool)
    let y = (read baseY :: Bool)
    print (xor x y)