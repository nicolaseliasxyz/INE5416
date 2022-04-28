formTriangle :: Float -> Float
formTriangle x y z =
    -- alterar para formado if else e colocar a condição do if no else, e ficar if else if else
    if x > y && x > z then
        if x > (y - z) then
            True
    if y > x && y > z then
        if y > (x - z) then
            True
    if z > y && z > x then
        if z > (x - y) then
            True
    else
        False

main = do
    putStrLn "Digite tres numeros"
    baseX <- getLine
    baseY <- getLine
    baseZ <- getLine
    let x = (read baseX :: Float)
    let y = (read baseX :: Float)
    let z = (read baseX :: Float)
    print (formTriangle x y z)