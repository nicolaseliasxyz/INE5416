calcTriangle :: Float -> Float -> Float
calcTriangle base height = base * height / 2

main = do
    putStrLn "Digite a base, depois a altura do triangulo"
    baseBase <- getLine
    baseHeight <- getLine
    let base = (read baseBase :: Float)
    let height = (read baseHeight :: Float)
    print (calcTriangle base height)