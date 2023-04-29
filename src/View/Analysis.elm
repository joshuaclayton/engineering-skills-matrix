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
            li [ class "flex flex-col md:flex-row md:space-x-4" ]
                [ strong [ class "font-semibold text-gray-600" ] [ text grouping ]
                , span [] [ text <| promptText prompt ]
                ]

        viewAttention (PromptsList inner) =
            div []
                [ ul [ class "space-y-2" ] (List.map (viewPrompt "Engineering") inner.listEngineeringPrompts)
                , ul [ class "space-y-2" ] (List.map (viewPrompt "Product") inner.listProductPrompts)
                , ul [ class "space-y-2" ] (List.map (viewPrompt "Team Management") inner.listTeamManagementPrompts)
                , ul [ class "space-y-2" ] (List.map (viewPrompt "Hiring") inner.listHiringPrompts)
                , ul [ class "space-y-2" ] (List.map (viewPrompt "Engineering Onboarding") inner.listEngineeringOnboardingPrompts)
                , ul [ class "space-y-2" ] (List.map (viewPrompt "Engineering Retention") inner.listEngineeringRetentionPrompts)
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
        div [ class "p-4 md:m-12 md:px-8 md:py-6 md:rounded-md border border-gray-100 bg-gray-50 flex flex-col space-y-4" ]
            [ fullSection "Focus" promptsGroupedByAttention.focusPrompts
            , fullSection "Learn" promptsGroupedByAttention.learnPrompts
            , fullSection "Avoid" promptsGroupedByAttention.avoidPrompts
            ]
