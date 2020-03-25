module Main exposing (..)

import Browser
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)



---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp
    | Left
    | Right
    | SubmitForm
    | ResetForm
    | Cancel


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


viewButton : String -> Html ()
viewButton name =
    Html.button [ onClick () ] [ text name ]


submitButton : String -> Html ()
submitButton name =
    Html.button
        [ Html.Attributes.type_ "submit"
        , onClick ()
        ]
        [ text name ]


pfButton : ButtonType -> ButtonVariant -> String -> Html ()
pfButton buttonType buttonVariant name =
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
        ]
        [ text name ]


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [ text "Your Elm App is working!" ]
        , div []
            [ Html.map (\_ -> Left) (viewButton "Left")
            , Html.map (\_ -> Right) (viewButton "Right")
            , Html.map (\_ -> SubmitForm) (submitButton "Submit form")
            , Html.map (\_ -> SubmitForm) (pfButton Submit Primary "Submit form")
            , Html.map (\_ -> ResetForm) (pfButton Reset Secondary "Reset form")
            , Html.map (\_ -> Cancel) (pfButton Button Secondary "Cancel")
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
