module View.ExerciseInfo exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)


view : Html a
view =
    div [ class "p-4 flex flex-col space-y-4" ]
        [ h1 [ class "text-3xl md:text-5xl font-extrabold md:pt-8" ] [ text "Software Development Skills Matrix" ]
        , p []
            [ text "The Software Development Skills Matrix is a tool to help you identify your strengths, weaknesses, and areas of interest as a software developer. "
            , text "It is geared towards software developers operating at least at a mid+ level who are contemplating career paths into team management, team lead, or senior technical (e.g. staff+) roles."
            ]
        , div [ class "border border-blue-200 bg-blue-100 p-4 rounded-md flex flex-col space-y-4" ]
            [ h2 [ class "text-2xl font-bold" ] [ text "How to use this tool" ]
            , p [] [ text "The matrix is broken up into six sections:" ]
            , ul [ class "list-disc list-inside pl-2" ]
                [ li [] [ text "Software Development" ]
                , li [] [ text "Product" ]
                , li [] [ text "Team Management" ]
                , li [] [ text "Hiring" ]
                , li [] [ text "Teammate Onboarding" ]
                , li [] [ text "Teammate Retention" ]
                ]
            , p [] [ text "For each section, you'll be asked to rate your skill and enjoyment for each task." ]
            , h2 [ class "text-2xl font-bold" ] [ text "Rating Your Skills" ]
            , p [] [ text "An apprentice is someone who is just starting to learn a skill and may need considerable guidance, while a practitioner is proficient at doing the work themselves. A mentor is someone who could teach others." ]
            , h2 [ class "text-2xl font-bold" ] [ text "Rating Your Enjoyment" ]
            , p [] [ text "Mark a responsibility as \"Love\" if you're invigorated or excited by this work and would be comfortable spending up to 50% of your work week on responsibilities like these. Mark a responsibility as \"Don't Like\" if you don't enjoy this work or dread doing this type of work." ]
            ]
        ]
