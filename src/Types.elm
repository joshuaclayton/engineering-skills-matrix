module Types exposing
    ( Attention(..)
    , Enjoyment(..)
    , Prompt
    , Skill(..)
    , allEnjoyments
    , allSkills
    , buildQuestion
    , displayAttention
    , displayEnjoyment
    , displaySkill
    , enjoymentFromString
    , promptAttention
    , promptEnjoyment
    , promptSkill
    , promptText
    , setEnjoymentForPrompt
    , setSkillForPrompt
    , skillFromString
    , unsetEnjoymentForPrompt
    , unsetSkillForPrompt
    )


type Prompt a
    = Question String
    | EnjoymentAnswer String Enjoyment
    | SkillAnswer String Skill
    | FullAnswer String Enjoyment Skill
    | NoExperience String


type Enjoyment
    = Love
    | Like
    | DontLike


type Skill
    = Mentor
    | Practitioner
    | Apprentice


type Attention
    = Focus
    | Continue
    | Learn
    | Avoid


promptAttention : Prompt a -> Maybe Attention
promptAttention prompt =
    case prompt of
        Question _ ->
            Nothing

        EnjoymentAnswer _ _ ->
            Nothing

        SkillAnswer _ skill ->
            Nothing

        FullAnswer _ enjoyment skill ->
            Just <| determineAttention enjoyment skill

        NoExperience _ ->
            Just Learn


promptSkill : Prompt a -> Maybe Skill
promptSkill prompt =
    case prompt of
        Question _ ->
            Nothing

        EnjoymentAnswer _ _ ->
            Nothing

        SkillAnswer _ skill ->
            Just skill

        FullAnswer _ _ skill ->
            Just skill

        NoExperience _ ->
            Nothing


promptEnjoyment : Prompt a -> Maybe Enjoyment
promptEnjoyment prompt =
    case prompt of
        Question _ ->
            Nothing

        EnjoymentAnswer _ enjoyment ->
            Just enjoyment

        SkillAnswer _ _ ->
            Nothing

        FullAnswer _ enjoyment _ ->
            Just enjoyment

        NoExperience _ ->
            Nothing


determineAttention : Enjoyment -> Skill -> Attention
determineAttention enjoyment skill =
    case ( enjoyment, skill ) of
        ( Love, Mentor ) ->
            Focus

        ( Love, Practitioner ) ->
            Focus

        ( Love, Apprentice ) ->
            Learn

        ( Like, Mentor ) ->
            Continue

        ( Like, Practitioner ) ->
            Continue

        ( Like, Apprentice ) ->
            Learn

        ( DontLike, Mentor ) ->
            Avoid

        ( DontLike, Practitioner ) ->
            Avoid

        ( DontLike, Apprentice ) ->
            Avoid


allSkills : List Skill
allSkills =
    [ Mentor
    , Practitioner
    , Apprentice
    ]


allEnjoyments : List Enjoyment
allEnjoyments =
    [ Love
    , Like
    , DontLike
    ]


setSkillForPrompt : Prompt a -> Skill -> Prompt a
setSkillForPrompt prompt skill =
    case prompt of
        Question question ->
            SkillAnswer question skill

        EnjoymentAnswer question enjoyment ->
            FullAnswer question enjoyment skill

        SkillAnswer question _ ->
            SkillAnswer question skill

        FullAnswer question enjoyment _ ->
            FullAnswer question enjoyment skill

        NoExperience question ->
            SkillAnswer question skill


unsetSkillForPrompt : Prompt a -> Prompt a
unsetSkillForPrompt prompt =
    case prompt of
        Question question ->
            Question question

        EnjoymentAnswer question enjoyment ->
            EnjoymentAnswer question enjoyment

        SkillAnswer question _ ->
            Question question

        FullAnswer question enjoyment _ ->
            EnjoymentAnswer question enjoyment

        NoExperience question ->
            NoExperience question


setEnjoymentForPrompt : Prompt a -> Enjoyment -> Prompt a
setEnjoymentForPrompt prompt enjoyment =
    case prompt of
        Question question ->
            EnjoymentAnswer question enjoyment

        EnjoymentAnswer question _ ->
            EnjoymentAnswer question enjoyment

        SkillAnswer question skill ->
            FullAnswer question enjoyment skill

        FullAnswer question _ skill ->
            FullAnswer question enjoyment skill

        NoExperience question ->
            EnjoymentAnswer question enjoyment


unsetEnjoymentForPrompt : Prompt a -> Prompt a
unsetEnjoymentForPrompt prompt =
    case prompt of
        Question question ->
            Question question

        EnjoymentAnswer question _ ->
            Question question

        SkillAnswer question skill ->
            SkillAnswer question skill

        FullAnswer question _ skill ->
            SkillAnswer question skill

        NoExperience question ->
            NoExperience question


buildQuestion : String -> Prompt a
buildQuestion =
    Question


promptText : Prompt a -> String
promptText prompt =
    case prompt of
        Question question ->
            question

        EnjoymentAnswer question _ ->
            question

        SkillAnswer question _ ->
            question

        FullAnswer question _ _ ->
            question

        NoExperience question ->
            question


skillFromString : String -> Maybe Skill
skillFromString str =
    case str of
        "Mentor" ->
            Just Mentor

        "Practitioner" ->
            Just Practitioner

        "Apprentice" ->
            Just Apprentice

        _ ->
            Nothing


enjoymentFromString : String -> Maybe Enjoyment
enjoymentFromString str =
    case str of
        "Love" ->
            Just Love

        "Like" ->
            Just Like

        "Don't Like" ->
            Just DontLike

        _ ->
            Nothing


displaySkill : Skill -> String
displaySkill skill =
    case skill of
        Mentor ->
            "Mentor"

        Practitioner ->
            "Practitioner"

        Apprentice ->
            "Apprentice"


displayEnjoyment : Enjoyment -> String
displayEnjoyment enjoyment =
    case enjoyment of
        Love ->
            "Love"

        Like ->
            "Like"

        DontLike ->
            "Don't Like"


displayAttention : Attention -> String
displayAttention attention =
    case attention of
        Focus ->
            "Focus"

        Continue ->
            "Continue"

        Learn ->
            "Learn"

        Avoid ->
            "Avoid"
