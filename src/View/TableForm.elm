module View.TableForm exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, colspan, selected)
import Html.Events exposing (onClick, onInput)
import Model exposing (..)
import Types exposing (..)
import Update exposing (Msg(..))


view : PromptsList a -> Html Msg
view (PromptsList model) =
    let
        rowHeader string =
            tr []
                [ td [ class "pb-1 pt-6", colspan 3 ] [ h2 [ class "bg-gray-100 text-2xl font-bold px-4 py-1" ] [ text string ] ]
                ]

        questionsForSection string list =
            List.indexedMap (viewQuestion string) list
    in
    table [ class "w-full" ] <|
        [ rowHeader "Engineering" ]
            ++ questionsForSection "Engineering" model.listEngineeringPrompts
            ++ [ rowHeader "Product" ]
            ++ questionsForSection "Product" model.listProductPrompts
            ++ [ rowHeader "Team Management" ]
            ++ questionsForSection "Team Management" model.listTeamManagementPrompts
            ++ [ rowHeader "Hiring" ]
            ++ questionsForSection "Hiring" model.listHiringPrompts
            ++ [ rowHeader "Engineering Onboarding" ]
            ++ questionsForSection "Engineering Onboarding" model.listEngineeringOnboardingPrompts
            ++ [ rowHeader "Engineering Retention" ]
            ++ questionsForSection "Engineering Retention" model.listEngineeringRetentionPrompts


viewQuestion : String -> Int -> Prompt a -> Html Msg
viewQuestion str i prompt =
    let
        skillEvent s =
            case skillFromString s of
                Just skill ->
                    SetSkill str i skill

                Nothing ->
                    UnsetSkill str i

        enjoymentEvent s =
            case enjoymentFromString s of
                Just enjoyment ->
                    SetEnjoyment str i enjoyment

                Nothing ->
                    UnsetEnjoyment str i

        mapWithDefault def f =
            Maybe.withDefault def << Maybe.map f

        buildSkillOption skill =
            option
                [ selected <|
                    mapWithDefault
                        False
                        ((==) skill)
                        (promptSkill prompt)
                ]
                [ text <| displaySkill skill ]

        buildEnjoymentOption enjoyment =
            option
                [ selected <|
                    mapWithDefault
                        False
                        ((==) enjoyment)
                        (promptEnjoyment prompt)
                ]
                [ text <| displayEnjoyment enjoyment ]

        selectClass =
            class "border border-gray-200 w-full text-sm px-2 py-1 rounded-md"

        emptyOption =
            option [] [ text "" ]
    in
    tr [ class "border-b border-gray-200" ]
        [ td [ class "py-1 px-4 w-2/3" ] [ text <| promptText prompt ]
        , td [ class "py-1 px-4 w-1/6" ] [ select [ selectClass, onInput skillEvent ] (emptyOption :: List.map buildSkillOption allSkills) ]
        , td [ class "py-1 px-4 w-1/6" ] [ select [ selectClass, onInput enjoymentEvent ] (emptyOption :: List.map buildEnjoymentOption allEnjoyments) ]
        ]
