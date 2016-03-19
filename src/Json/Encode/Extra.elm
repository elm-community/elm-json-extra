module Json.Encode.Extra
  ( listOf
  ) where

{-| Convenience functions for encoding values as Json

# Lists
@docs listOf

-}

import Json.Encode as Encode


{-| Encodes a list of items based on the encoder for the item type

    someList =
      [1, 2, 3, 4, 5]

    encoded =
      EncodeExtra.listOf Encode.int someList
-}
listOf : (a -> Encode.Value) -> List a -> Encode.Value
listOf itemEncoder =
  List.map itemEncoder >> Encode.list


{-| Encodes a Maybe value with either the given encoder function or
Json.Encode.null in the Nothing case

    someMaybe =
      Just 5

    someOtherMaybe =
      Nothing

    encoded =
      EncodeExtra.maybeNull Encode.int someMaybe

    otherEncoded =
      EncodeExtra.maybeNull Encode.int someOtherMaybe
-}
maybeNull : (a -> Encode.Value) -> Maybe a -> Encode.Value
maybeNull justEncoder maybeValue =
  case maybeValue of
    Just value ->
      justEncoder value
    Nothing ->
      Encode.null
