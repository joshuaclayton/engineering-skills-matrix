module Model exposing
    ( Hiring
    , Model
    , Product
    , PromptsGroupedByAttention
    , PromptsList(..)
    , SoftwareDevelopment
    , TeamManagement
    , TeammateOnboarding
    , TeammateRetention
    , filterPromptsList
    , hiringPromptsOfModel
    , productPromptsOfModel
    , promptsGroupedByAttentionIsEmpty
    , promptsListEmpty
    , setEnjoyment
    , setSkill
    , softwareDevelopmentPromptsOfModel
    , teamManagementPromptsOfModel
    , teammateOnboardingPromptsOfModel
    , teammateRetentionPromptsOfModel
    , unsetEnjoyment
    , unsetSkill
    )

import List.Extra as List
import Monocle.Lens exposing (Lens)
import Types exposing (..)


type alias Model =
    { currentPrompts : PromptsList () }


type PromptsList a
    = PromptsList
        { listSoftwareDevelopmentPrompts : List (Prompt SoftwareDevelopment)
        , listProductPrompts : List (Prompt Product)
        , listTeamManagementPrompts : List (Prompt TeamManagement)
        , listHiringPrompts : List (Prompt Hiring)
        , listTeammateOnboardingPrompts : List (Prompt TeammateOnboarding)
        , listTeammateRetentionPrompts : List (Prompt TeammateRetention)
        }


type SoftwareDevelopment
    = SoftwareDevelopment


type Product
    = Product


type TeamManagement
    = TeamManagement


type Hiring
    = Hiring


type TeammateOnboarding
    = TeammateOnboarding


type TeammateRetention
    = TeammateRetention


promptsListEmpty : PromptsList a -> Bool
promptsListEmpty (PromptsList promptsList) =
    List.isEmpty promptsList.listSoftwareDevelopmentPrompts
        && List.isEmpty promptsList.listProductPrompts
        && List.isEmpty promptsList.listTeamManagementPrompts
        && List.isEmpty promptsList.listHiringPrompts
        && List.isEmpty promptsList.listTeammateOnboardingPrompts
        && List.isEmpty promptsList.listTeammateRetentionPrompts


type alias PromptsGroupedByAttention =
    { focusPrompts : PromptsList Attention
    , continuePrompts : PromptsList Attention
    , learnPrompts : PromptsList Attention
    , avoidPrompts : PromptsList Attention
    }


promptsGroupedByAttentionIsEmpty : PromptsGroupedByAttention -> Bool
promptsGroupedByAttentionIsEmpty prompts =
    promptsListEmpty prompts.focusPrompts
        && promptsListEmpty prompts.learnPrompts
        && promptsListEmpty prompts.avoidPrompts


filterPromptsList : PromptsList () -> PromptsGroupedByAttention
filterPromptsList (PromptsList list) =
    let
        focusPrompt prompt =
            promptAttention prompt == Just Focus

        continuePrompt prompt =
            promptAttention prompt == Just Continue

        learnPrompt prompt =
            promptAttention prompt == Just Learn

        avoidPrompt prompt =
            promptAttention prompt == Just Avoid
    in
    { focusPrompts =
        PromptsList
            { listSoftwareDevelopmentPrompts = List.filter focusPrompt list.listSoftwareDevelopmentPrompts
            , listProductPrompts = List.filter focusPrompt list.listProductPrompts
            , listTeamManagementPrompts = List.filter focusPrompt list.listTeamManagementPrompts
            , listHiringPrompts = List.filter focusPrompt list.listHiringPrompts
            , listTeammateOnboardingPrompts = List.filter focusPrompt list.listTeammateOnboardingPrompts
            , listTeammateRetentionPrompts = List.filter focusPrompt list.listTeammateRetentionPrompts
            }
    , continuePrompts =
        PromptsList
            { listSoftwareDevelopmentPrompts = List.filter continuePrompt list.listSoftwareDevelopmentPrompts
            , listProductPrompts = List.filter continuePrompt list.listProductPrompts
            , listTeamManagementPrompts = List.filter continuePrompt list.listTeamManagementPrompts
            , listHiringPrompts = List.filter continuePrompt list.listHiringPrompts
            , listTeammateOnboardingPrompts = List.filter continuePrompt list.listTeammateOnboardingPrompts
            , listTeammateRetentionPrompts = List.filter continuePrompt list.listTeammateRetentionPrompts
            }
    , learnPrompts =
        PromptsList
            { listSoftwareDevelopmentPrompts = List.filter learnPrompt list.listSoftwareDevelopmentPrompts
            , listProductPrompts = List.filter learnPrompt list.listProductPrompts
            , listTeamManagementPrompts = List.filter learnPrompt list.listTeamManagementPrompts
            , listHiringPrompts = List.filter learnPrompt list.listHiringPrompts
            , listTeammateOnboardingPrompts = List.filter learnPrompt list.listTeammateOnboardingPrompts
            , listTeammateRetentionPrompts = List.filter learnPrompt list.listTeammateRetentionPrompts
            }
    , avoidPrompts =
        PromptsList
            { listSoftwareDevelopmentPrompts = List.filter avoidPrompt list.listSoftwareDevelopmentPrompts
            , listProductPrompts = List.filter avoidPrompt list.listProductPrompts
            , listTeamManagementPrompts = List.filter avoidPrompt list.listTeamManagementPrompts
            , listHiringPrompts = List.filter avoidPrompt list.listHiringPrompts
            , listTeammateOnboardingPrompts = List.filter avoidPrompt list.listTeammateOnboardingPrompts
            , listTeammateRetentionPrompts = List.filter avoidPrompt list.listTeammateRetentionPrompts
            }
    }


softwareDevelopmentPromptsOfModel : Lens { a | listSoftwareDevelopmentPrompts : List (Prompt SoftwareDevelopment) } (List (Prompt SoftwareDevelopment))
softwareDevelopmentPromptsOfModel =
    Lens .listSoftwareDevelopmentPrompts (\f model -> { model | listSoftwareDevelopmentPrompts = f })


productPromptsOfModel : Lens { a | listProductPrompts : List (Prompt Product) } (List (Prompt Product))
productPromptsOfModel =
    Lens .listProductPrompts (\f model -> { model | listProductPrompts = f })


teamManagementPromptsOfModel : Lens { a | listTeamManagementPrompts : List (Prompt TeamManagement) } (List (Prompt TeamManagement))
teamManagementPromptsOfModel =
    Lens .listTeamManagementPrompts (\f model -> { model | listTeamManagementPrompts = f })


hiringPromptsOfModel : Lens { a | listHiringPrompts : List (Prompt Hiring) } (List (Prompt Hiring))
hiringPromptsOfModel =
    Lens .listHiringPrompts (\f model -> { model | listHiringPrompts = f })


teammateOnboardingPromptsOfModel : Lens { a | listTeammateOnboardingPrompts : List (Prompt TeammateOnboarding) } (List (Prompt TeammateOnboarding))
teammateOnboardingPromptsOfModel =
    Lens .listTeammateOnboardingPrompts (\f model -> { model | listTeammateOnboardingPrompts = f })


teammateRetentionPromptsOfModel : Lens { a | listTeammateRetentionPrompts : List (Prompt TeammateRetention) } (List (Prompt TeammateRetention))
teammateRetentionPromptsOfModel =
    Lens .listTeammateRetentionPrompts (\f model -> { model | listTeammateRetentionPrompts = f })


setSkill : Lens b (List (Prompt a)) -> Int -> Skill -> b -> b
setSkill lens index skill model =
    let
        promptToUpdate =
            List.getAt index (lens.get model)

        prompts =
            promptToUpdate
                |> Maybe.map (\prompt -> setSkillForPrompt prompt skill)
                |> Maybe.map (\prompt -> List.setAt index prompt (lens.get model))
                |> Maybe.withDefault (lens.get model)
    in
    lens.set prompts model


unsetSkill : Lens b (List (Prompt a)) -> Int -> b -> b
unsetSkill lens index model =
    let
        promptToUpdate =
            List.getAt index (lens.get model)

        prompts =
            promptToUpdate
                |> Maybe.map (\prompt -> unsetSkillForPrompt prompt)
                |> Maybe.map (\prompt -> List.setAt index prompt (lens.get model))
                |> Maybe.withDefault (lens.get model)
    in
    lens.set prompts model


unsetEnjoyment : Lens b (List (Prompt a)) -> Int -> b -> b
unsetEnjoyment lens index model =
    let
        promptToUpdate =
            List.getAt index (lens.get model)

        prompts =
            promptToUpdate
                |> Maybe.map (\prompt -> unsetEnjoymentForPrompt prompt)
                |> Maybe.map (\prompt -> List.setAt index prompt (lens.get model))
                |> Maybe.withDefault (lens.get model)
    in
    lens.set prompts model


setEnjoyment : Lens b (List (Prompt a)) -> Int -> Enjoyment -> b -> b
setEnjoyment lens index enjoyment model =
    let
        promptToUpdate =
            List.getAt index (lens.get model)

        prompts =
            promptToUpdate
                |> Maybe.map (\prompt -> setEnjoymentForPrompt prompt enjoyment)
                |> Maybe.map (\prompt -> List.setAt index prompt (lens.get model))
                |> Maybe.withDefault (lens.get model)
    in
    lens.set prompts model
