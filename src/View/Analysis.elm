module View.Analysis exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Model exposing (PromptsGroupedByAttention, PromptsList(..), filterPromptsList, promptsGroupedByAttentionIsEmpty, promptsListEmpty)
import Types exposing (promptText)


view : PromptsList () -> Html a
view promptsList =
    let
        promptsGroupedByAttention =
            filterPromptsList promptsList

        viewPrompt grouping prompt =
            li [ class "flex flex-row space-x-4" ]
                [ strong [ class "font-semibold text-gray-500" ] [ text grouping ]
                , span [] [ text <| promptText prompt ]
                ]

        viewAttention (PromptsList inner) =
            div []
                [ ul [] (List.map (viewPrompt "Engineering") inner.listEngineeringPrompts)
                , ul [] (List.map (viewPrompt "Product") inner.listProductPrompts)
                , ul [] (List.map (viewPrompt "Team Management") inner.listTeamManagementPrompts)
                , ul [] (List.map (viewPrompt "Hiring") inner.listHiringPrompts)
                , ul [] (List.map (viewPrompt "Engineering Onboarding") inner.listEngineeringOnboardingPrompts)
                , ul [] (List.map (viewPrompt "Engineering Retention") inner.listEngineeringRetentionPrompts)
                ]

        groupHeader prompt =
            h2 [ class "text-2xl font-bold" ] [ text prompt ]

        fullSection value prompts =
            if promptsListEmpty prompts then
                text ""

            else
                div [ class "flex flex-col space-y-2" ]
                    [ groupHeader value
                    , div [ class "flex flex-wrap ml-4" ] [ viewAttention prompts ]
                    ]
    in
    if promptsGroupedByAttentionIsEmpty promptsGroupedByAttention then
        text ""

    else
        div [ class "m-12 px-8 py-6 rounded-md border border-gray-100 bg-gray-50 flex flex-col space-y-4" ]
            [ fullSection "Focus" promptsGroupedByAttention.focusPrompts
            , fullSection "Learn" promptsGroupedByAttention.learnPrompts
            , fullSection "Avoid" promptsGroupedByAttention.avoidPrompts
            ]
