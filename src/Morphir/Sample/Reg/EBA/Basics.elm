module Morphir.Sample.Reg.EBA.Basics exposing
    ( AssetCategoryCodes(..)
    , Balance
    , Entity
    , InsuranceType(..)
    , Ratio
    )

{-| Asset categories apply to the flows and are specified in the spec.
There are a bunch of them, but we're only concerned with these three in this example .
-}

import Morphir.Sample.Reg.Currency exposing (Currency(..))


type AssetCategoryCodes
    = Level1Assets
    | Level2aAssets
    | Level2bAssets


{-| Insurance type as specified in the spec.
There are a bunch of them, but we're only concerned with FDIC in this example .
-}
type InsuranceType
    = FDIC
    | Uninsured


type alias Entity =
    String


type alias Balance =
    Float


type alias Ratio =
    Float


{-| A ratio between 0 and 1
-}
type alias NormalisedRatio =
    Float


{-| A currency isn't always itself in 5G.
-}
fed5GCurrency : Currency -> Currency
fed5GCurrency currency =
    if List.member currency [ USD, EUR, GBP, CHF, JPY, AUD, CAD ] then
        currency

    else
        USD
