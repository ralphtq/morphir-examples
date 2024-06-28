module Morphir.Sample.Reg.EBA.Product exposing (..)

type alias ProductId =
    String


type ProductType
    = Cash
    | Equity
    | Bond
    | Other -- There are way more...


type alias Product =
    { productId : ProductId
    , productType : ProductType
    , isHQLA : Bool
    }
