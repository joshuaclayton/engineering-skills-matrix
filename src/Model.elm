module Model exposing
    ( Engineering
    , EngineeringOnboarding
    , EngineeringRetention
    , Hiring
    , Model
    , Product
    , PromptsGroupedByAttention
    , PromptsList(..)
    , TeamManagement
    , engineeringOnboardingPromptsOfModel
    , engineeringPromptsOfModel
    , engineeringRetentionPromptsOfModel
    , filterPromptsList
    , hiringPromptsOfModel
    , productPromptsOfModel
    , promptsGroupedByAttentionIsEmpty
    , promptsListEmpty
    , setEnjoyment
    , setSkill
    , teamManagementPromptsOfModel
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
        { listEngineeringPrompts : List (Prompt Engineering)
        , listProductPrompts : List (Prompt Product)
        , listTeamManagementPrompts : List (Prompt TeamManagement)
        , listHiringPrompts : List (Prompt Hiring)
        , listEngineeringOnboardingPrompts : List (Prompt EngineeringOnboarding)
        , listEngineeringRetentionPrompts : List (Prompt EngineeringRetention)
        }


type Engineering
    = Engineering


type Product
    = Product


type TeamManagement
    = TeamManagement


type Hiring
    = Hiring


type EngineeringOnboarding
    = EngineeringOnboarding


type EngineeringRetention
    = EngineeringRetention


promptsListEmpty : PromptsList a -> Bool
promptsListEmpty (PromptsList promptsList) =
    List.isEmpty promptsList.listEngineeringPrompts
        && List.isEmpty promptsList.listProductPrompts
        && List.isEmpty promptsList.listTeamManagementPrompts
        && List.isEmpty promptsList.listHiringPrompts
        && List.isEmpty promptsList.listEngineeringOnboardingPrompts
        && List.isEmpty promptsList.listEngineeringRetentionPrompts


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
            { listEngineeringPrompts = List.filter focusPrompt list.listEngineeringPrompts
            , listProductPrompts = List.filter focusPrompt list.listProductPrompts
            , listTeamManagementPrompts = List.filter focusPrompt list.listTeamManagementPrompts
            , listHiringPrompts = List.filter focusPrompt list.listHiringPrompts
            , listEngineeringOnboardingPrompts = List.filter focusPrompt list.listEngineeringOnboardingPrompts
            , listEngineeringRetentionPrompts = List.filter focusPrompt list.listEngineeringRetentionPrompts
            }
    , continuePrompts =
        PromptsList
            { listEngineeringPrompts = List.filter continuePrompt list.listEngineeringPrompts
            , listProductPrompts = List.filter continuePrompt list.listProductPrompts
            , listTeamManagementPrompts = List.filter continuePrompt list.listTeamManagementPrompts
            , listHiringPrompts = List.filter continuePrompt list.listHiringPrompts
            , listEngineeringOnboardingPrompts = List.filter continuePrompt list.listEngineeringOnboardingPrompts
            , listEngineeringRetentionPrompts = List.filter continuePrompt list.listEngineeringRetentionPrompts
            }
    , learnPrompts =
        PromptsList
            { listEngineeringPrompts = List.filter learnPrompt list.listEngineeringPrompts
            , listProductPrompts = List.filter learnPrompt list.listProductPrompts
            , listTeamManagementPrompts = List.filter learnPrompt list.listTeamManagementPrompts
            , listHiringPrompts = List.filter learnPrompt list.listHiringPrompts
            , listEngineeringOnboardingPrompts = List.filter learnPrompt list.listEngineeringOnboardingPrompts
            , listEngineeringRetentionPrompts = List.filter learnPrompt list.listEngineeringRetentionPrompts
            }
    , avoidPrompts =
        PromptsList
            { listEngineeringPrompts = List.filter avoidPrompt list.listEngineeringPrompts
            , listProductPrompts = List.filter avoidPrompt list.listProductPrompts
            , listTeamManagementPrompts = List.filter avoidPrompt list.listTeamManagementPrompts
            , listHiringPrompts = List.filter avoidPrompt list.listHiringPrompts
            , listEngineeringOnboardingPrompts = List.filter avoidPrompt list.listEngineeringOnboardingPrompts
            , listEngineeringRetentionPrompts = List.filter avoidPrompt list.listEngineeringRetentionPrompts
            }
    }


engineeringPromptsOfModel : Lens { a | listEngineeringPrompts : List (Prompt Engineering) } (List (Prompt Engineering))
engineeringPromptsOfModel =
    Lens .listEngineeringPrompts (\f model -> { model | listEngineeringPrompts = f })


productPromptsOfModel : Lens { a | listProductPrompts : List (Prompt Product) } (List (Prompt Product))
productPromptsOfModel =
    Lens .listProductPrompts (\f model -> { model | listProductPrompts = f })


teamManagementPromptsOfModel : Lens { a | listTeamManagementPrompts : List (Prompt TeamManagement) } (List (Prompt TeamManagement))
teamManagementPromptsOfModel =
    Lens .listTeamManagementPrompts (\f model -> { model | listTeamManagementPrompts = f })


hiringPromptsOfModel : Lens { a | listHiringPrompts : List (Prompt Hiring) } (List (Prompt Hiring))
hiringPromptsOfModel =
    Lens .listHiringPrompts (\f model -> { model | listHiringPrompts = f })


engineeringOnboardingPromptsOfModel : Lens { a | listEngineeringOnboardingPrompts : List (Prompt EngineeringOnboarding) } (List (Prompt EngineeringOnboarding))
engineeringOnboardingPromptsOfModel =
    Lens .listEngineeringOnboardingPrompts (\f model -> { model | listEngineeringOnboardingPrompts = f })


engineeringRetentionPromptsOfModel : Lens { a | listEngineeringRetentionPrompts : List (Prompt EngineeringRetention) } (List (Prompt EngineeringRetention))
engineeringRetentionPromptsOfModel =
    Lens .listEngineeringRetentionPrompts (\f model -> { model | listEngineeringRetentionPrompts = f })


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
