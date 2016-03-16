import Html exposing (..)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)
import StartApp.Simple exposing (start)

-- Models

type alias Model =
  { cards : List Card}

type alias Card =
  { name : String
  , url : String }

-- Views

view : Signal.Address Action -> Card -> Html
view address card =
  div []
    [ div []
      [ text card.name]
    , div []
      [ img [src card.url]
        [text "img"] ]
    , div []
      [ button [ onClick address Lee ]
        [ text "Leeroy" ] ]
    , div []
      [ button [ onClick address Cho ]
        [ text "Cho" ] ]
    ]

-- Updates

type Action = Lee | Cho

update action card =
  case action of
    Lee ->
      leeroy
    Cho ->
      cho

-- MAIN

leeroy : Card
leeroy =
  { name = "Leeroy Jenkins"
  , url = "http://wow.zamimg.com/images/hearthstone/cards/enus/original/EX1_116.png"}

cho : Card
cho =
  { name = "Lorewalker Cho"
  , url = "http://wow.zamimg.com/images/hearthstone/cards/enus/original/EX1_100.png"}

main =
  start
    { model = leeroy
    , update = update
    , view = view
    }
