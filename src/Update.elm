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
        SetSkill "Software Development" index skill ->
            setCurrentPrompts <| setSkill softwareDevelopmentPromptsOfModel index skill prompts

        SetSkill "Product" index skill ->
            setCurrentPrompts <| setSkill productPromptsOfModel index skill prompts

        SetSkill "Team Management" index skill ->
            setCurrentPrompts <| setSkill teamManagementPromptsOfModel index skill prompts

        SetSkill "Hiring" index skill ->
            setCurrentPrompts <| setSkill hiringPromptsOfModel index skill prompts

        SetSkill "Teammate Onboarding" index skill ->
            setCurrentPrompts <| setSkill teammateOnboardingPromptsOfModel index skill prompts

        SetSkill "Teammate Retention" index skill ->
            setCurrentPrompts <| setSkill teammateRetentionPromptsOfModel index skill prompts

        UnsetSkill "Software Development" index ->
            setCurrentPrompts <| unsetSkill softwareDevelopmentPromptsOfModel index prompts

        UnsetSkill "Product" index ->
            setCurrentPrompts <| unsetSkill productPromptsOfModel index prompts

        UnsetSkill "Team Management" index ->
            setCurrentPrompts <| unsetSkill teamManagementPromptsOfModel index prompts

        UnsetSkill "Hiring" index ->
            setCurrentPrompts <| unsetSkill hiringPromptsOfModel index prompts

        UnsetSkill "Teammate Onboarding" index ->
            setCurrentPrompts <| unsetSkill teammateOnboardingPromptsOfModel index prompts

        UnsetSkill "Teammate Retention" index ->
            setCurrentPrompts <| unsetSkill teammateRetentionPromptsOfModel index prompts

        SetEnjoyment "Software Development" index enjoyment ->
            setCurrentPrompts <| setEnjoyment softwareDevelopmentPromptsOfModel index enjoyment prompts

        SetEnjoyment "Product" index enjoyment ->
            setCurrentPrompts <| setEnjoyment productPromptsOfModel index enjoyment prompts

        SetEnjoyment "Team Management" index enjoyment ->
            setCurrentPrompts <| setEnjoyment teamManagementPromptsOfModel index enjoyment prompts

        SetEnjoyment "Hiring" index enjoyment ->
            setCurrentPrompts <| setEnjoyment hiringPromptsOfModel index enjoyment prompts

        SetEnjoyment "Teammate Onboarding" index enjoyment ->
            setCurrentPrompts <| setEnjoyment teammateOnboardingPromptsOfModel index enjoyment prompts

        SetEnjoyment "Teammate Retention" index enjoyment ->
            setCurrentPrompts <| setEnjoyment teammateRetentionPromptsOfModel index enjoyment prompts

        UnsetEnjoyment "Software Development" index ->
            setCurrentPrompts <| unsetEnjoyment softwareDevelopmentPromptsOfModel index prompts

        UnsetEnjoyment "Product" index ->
            setCurrentPrompts <| unsetEnjoyment productPromptsOfModel index prompts

        UnsetEnjoyment "Team Management" index ->
            setCurrentPrompts <| unsetEnjoyment teamManagementPromptsOfModel index prompts

        UnsetEnjoyment "Hiring" index ->
            setCurrentPrompts <| unsetEnjoyment hiringPromptsOfModel index prompts

        UnsetEnjoyment "Teammate Onboarding" index ->
            setCurrentPrompts <| unsetEnjoyment teammateOnboardingPromptsOfModel index prompts

        UnsetEnjoyment "Teammate Retention" index ->
            setCurrentPrompts <| unsetEnjoyment teammateRetentionPromptsOfModel index prompts

        SetSkill _ _ _ ->
            model

        UnsetSkill _ _ ->
            model

        SetEnjoyment _ _ _ ->
            model

        UnsetEnjoyment _ _ ->
            model
