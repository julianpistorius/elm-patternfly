module Main exposing (..)

import Browser
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src, style)
import Html.Events exposing (onClick)



---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = SubmitForm
    | ResetForm
    | Cancel
    | CheckFields
    | LoadLink
    | Beep
    | ControlSomething


type ButtonType
    = Submit
    | Reset
    | Button


type ButtonVariant
    = Primary
    | Secondary
    | Tertiary
    | Danger
    | Link
    | Plain
    | Control


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


pfButton : ButtonType -> ButtonVariant -> String -> Html ()
pfButton buttonType buttonVariant label =
    let
        buttonTypeText =
            case buttonType of
                Submit ->
                    "submit"

                Reset ->
                    "reset"

                Button ->
                    "button"

        buttonVariantText =
            case buttonVariant of
                Primary ->
                    "pf-m-primary"

                Secondary ->
                    "pf-m-secondary"

                Tertiary ->
                    "pf-m-tertiary"

                Danger ->
                    "pf-m-danger"

                Link ->
                    "pf-m-link"

                Plain ->
                    "pf-m-plain"

                Control ->
                    "pf-m-control"
    in
    Html.button
        [ Html.Attributes.type_ buttonTypeText
        , Html.Attributes.class "pf-c-button"
        , Html.Attributes.class buttonVariantText
        , onClick ()
        ]
        [ text label ]


view : Model -> Html Msg
view model =
    div []
        [ img
            [ src "/logo.svg"
            , style "margin" "20px 0"
            , style "max-width" "200px"
            ]
            []
        , h1 [] [ text "Various buttons" ]
        , div []
            [ Html.map (\_ -> SubmitForm) (pfButton Submit Primary "Submit form")
            , Html.map (\_ -> ResetForm) (pfButton Reset Secondary "Reset form")
            , Html.map (\_ -> CheckFields) (pfButton Button Tertiary "Check fields")
            , Html.map (\_ -> Cancel) (pfButton Button Danger "Cancel")
            , Html.map (\_ -> LoadLink) (pfButton Button Link "Link")
            , Html.map (\_ -> Beep) (pfButton Button Plain "Beep")
            , Html.map (\_ -> ControlSomething) (pfButton Button Control "Control Something")
            ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
