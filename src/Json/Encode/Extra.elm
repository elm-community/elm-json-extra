module Json.Encode.Extra
  ( listOf
  ) where

{-| Convenience functions for encoding values as Json

# Lists
@docs listOf

-}

import Json.Encode as Encode

{-| Easily create an encoder for a list of items given an encoder for the type
of the item.

    import Json.Encode exposing (string)
    import Json.Encode.Extra exposing (listOf)

    encodeStringList =
      listOf string
-}
listOf : (a -> Encode.Value) -> List a -> Encode.Value
listOf itemEncoder =
  List.map itemEncoder >> Encode.list
