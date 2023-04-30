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
            li [ class "sticky top-0 md:relative" ]
                [ h2 [ class "bg-gray-100 text-2xl font-bold px-4 py-1" ] [ text string ]
                ]

        questionsForSection string list =
            List.indexedMap (viewQuestion string) list
    in
    ul [ class "w-full" ] <|
        [ rowHeader "Software Development" ]
            ++ questionsForSection "Software Development" model.listSoftwareDevelopmentPrompts
            ++ [ rowHeader "Product" ]
            ++ questionsForSection "Product" model.listProductPrompts
            ++ [ rowHeader "Team Management" ]
            ++ questionsForSection "Team Management" model.listTeamManagementPrompts
            ++ [ rowHeader "Hiring" ]
            ++ questionsForSection "Hiring" model.listHiringPrompts
            ++ [ rowHeader "Teammate Onboarding" ]
            ++ questionsForSection "Teammate Onboarding" model.listTeammateOnboardingPrompts
            ++ [ rowHeader "Teammate Retention" ]
            ++ questionsForSection "Teammate Retention" model.listTeammateRetentionPrompts


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
    li [ class "border-b border-gray-200 flex flex-col space-y-4 md:space-y-0 md:flex-row px-4 py-4" ]
        [ div [ class "w-full md:w-2/3" ] [ text <| promptText prompt ]
        , div [ class "w-full md:w-1/3 flex space-x-4" ]
            [ span [ class "block w-1/2" ] [ select [ selectClass, onInput skillEvent ] (emptyOption :: List.map buildSkillOption allSkills) ]
            , span [ class "block w-1/2" ] [ select [ selectClass, onInput enjoymentEvent ] (emptyOption :: List.map buildEnjoymentOption allEnjoyments) ]
            ]
        ]
