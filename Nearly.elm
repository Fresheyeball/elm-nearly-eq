module Nearly exposing (..)

{-|

@docs nearly, (~=), epsillon

-}

{-|
Nearly is used to curry an epsillon into a fuzzy equality.
For example:

```
True == let toThreePlaces = nearly 0.0001
        in 0.1234588 `toThreePlaces` 0.1234565
```
-}
nearly : Float -> Float -> Float -> Bool
nearly epsillon a b =
  let
    diff =
      abs (a - b)
  in
    if a == b then
      True
    else if diff <= epsillon then
      True
    else
      diff <= epsillon * min (abs a) (abs b)


{-|
epsillon
-}
epsillon : Float
epsillon = 1.0e-5


{-|
Pre-baked fuzzy equality, with `1.0e-5` as epsillon.
```
(~=) = nearly 1.0e-5
```
-}
(~=) : Float -> Float -> Bool
(~=) = nearly epsillon
infixr 6 ~=
