import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html
import Html.Events exposing (..)

main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }

-- MODEL

type alias Model =
  { message : String }

model : Model
model =
  { message = "cool"}

-- UPDATE

type Msg
  = ChangeMessage String

update : Msg -> Model -> Model
update msg model =
  case msg of
    ChangeMessage newMessage ->
      { model | message = newMessage }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ mainHeader model
    , body model
    ]

mainHeader model =
  header [ headerStyle ]
    [ ul []
      [ li [ headerLiStyle ]
        [text "Home"]
      , li [ headerLiStyle ]
        [text model.message]
      , li [ headerLiStyle ]
        [text "Learnin shit!"]
      , li [ headerLiStyle ]
        [text "Sweet Link!"]
      ]
    ]

body model =
  div [ bodyStyles ]
    [ h1 [] [ text ("Elm is " ++ model.message) ]
    , input [ placeholder model.message, onInput ChangeMessage ] []
    , p [] [ text model.message ]
    ]

-- Styles

headerStyle =
  style
    [ ("width", "100%")
    , ("height", "50px")
    , ("position", "fixed")
    , ("top", "0")
    , ("left", "0")
    , ("background", "#444")
    ]

headerLiStyle =
  style
    [ ("display", "inline-block")
    , ("padding", "0px 10px")
    ]

bodyStyles =
  style [ ("margin-top", "100px")]
