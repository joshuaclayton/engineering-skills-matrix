module Update exposing (Msg(..), update)

import Model exposing (..)
import Types exposing (..)


type Msg
    = SetSkill String Int Skill
    | UnsetSkill String Int
    | SetEnjoyment String Int Enjoyment
    | UnsetEnjoyment String Int


update msg model =
    let
        (PromptsList prompts) =
            model.currentPrompts

        setCurrentPrompts v =
            { model | currentPrompts = PromptsList v }
    in
    case msg of
        SetSkill "Engineering" index skill ->
            setCurrentPrompts <| setSkill engineeringPromptsOfModel index skill prompts

        SetSkill "Product" index skill ->
            setCurrentPrompts <| setSkill productPromptsOfModel index skill prompts

        SetSkill "Team Management" index skill ->
            setCurrentPrompts <| setSkill teamManagementPromptsOfModel index skill prompts

        SetSkill "Hiring" index skill ->
            setCurrentPrompts <| setSkill hiringPromptsOfModel index skill prompts

        SetSkill "Engineering Onboarding" index skill ->
            setCurrentPrompts <| setSkill engineeringOnboardingPromptsOfModel index skill prompts

        SetSkill "Engineering Retention" index skill ->
            setCurrentPrompts <| setSkill engineeringRetentionPromptsOfModel index skill prompts

        UnsetSkill "Engineering" index ->
            setCurrentPrompts <| unsetSkill engineeringPromptsOfModel index prompts

        UnsetSkill "Product" index ->
            setCurrentPrompts <| unsetSkill productPromptsOfModel index prompts

        UnsetSkill "Team Management" index ->
            setCurrentPrompts <| unsetSkill teamManagementPromptsOfModel index prompts

        UnsetSkill "Hiring" index ->
            setCurrentPrompts <| unsetSkill hiringPromptsOfModel index prompts

        UnsetSkill "Engineering Onboarding" index ->
            setCurrentPrompts <| unsetSkill engineeringOnboardingPromptsOfModel index prompts

        UnsetSkill "Engineering Retention" index ->
            setCurrentPrompts <| unsetSkill engineeringRetentionPromptsOfModel index prompts

        SetEnjoyment "Engineering" index enjoyment ->
            setCurrentPrompts <| setEnjoyment engineeringPromptsOfModel index enjoyment prompts

        SetEnjoyment "Product" index enjoyment ->
            setCurrentPrompts <| setEnjoyment productPromptsOfModel index enjoyment prompts

        SetEnjoyment "Team Management" index enjoyment ->
            setCurrentPrompts <| setEnjoyment teamManagementPromptsOfModel index enjoyment prompts

        SetEnjoyment "Hiring" index enjoyment ->
            setCurrentPrompts <| setEnjoyment hiringPromptsOfModel index enjoyment prompts

        SetEnjoyment "Engineering Onboarding" index enjoyment ->
            setCurrentPrompts <| setEnjoyment engineeringOnboardingPromptsOfModel index enjoyment prompts

        SetEnjoyment "Engineering Retention" index enjoyment ->
            setCurrentPrompts <| setEnjoyment engineeringRetentionPromptsOfModel index enjoyment prompts

        UnsetEnjoyment "Engineering" index ->
            setCurrentPrompts <| unsetEnjoyment engineeringPromptsOfModel index prompts

        UnsetEnjoyment "Product" index ->
            setCurrentPrompts <| unsetEnjoyment productPromptsOfModel index prompts

        UnsetEnjoyment "Team Management" index ->
            setCurrentPrompts <| unsetEnjoyment teamManagementPromptsOfModel index prompts

        UnsetEnjoyment "Hiring" index ->
            setCurrentPrompts <| unsetEnjoyment hiringPromptsOfModel index prompts

        UnsetEnjoyment "Engineering Onboarding" index ->
            setCurrentPrompts <| unsetEnjoyment engineeringOnboardingPromptsOfModel index prompts

        UnsetEnjoyment "Engineering Retention" index ->
            setCurrentPrompts <| unsetEnjoyment engineeringRetentionPromptsOfModel index prompts

        SetSkill _ _ _ ->
            model

        UnsetSkill _ _ ->
            model

        SetEnjoyment _ _ _ ->
            model

        UnsetEnjoyment _ _ ->
            model
