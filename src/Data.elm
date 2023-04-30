module Data exposing (..)

import Model exposing (Hiring, Product, SoftwareDevelopment, TeamManagement, TeammateOnboarding, TeammateRetention)
import Types exposing (Prompt, buildQuestion)


softwareDevelopmentPrompts : List (Prompt SoftwareDevelopment)
softwareDevelopmentPrompts =
    [ buildQuestion "Feature development"
    , buildQuestion "Refactoring / architecture"
    , buildQuestion "Fixing bugs"
    , buildQuestion "Application performance (measurement / telemetry / RCA)"
    , buildQuestion "Infrastructure / DevOps"
    , buildQuestion "Pair programming / rubber-ducking to help others"
    , buildQuestion "Conducting code review"
    , buildQuestion "Conducting code spikes / POCs"
    , buildQuestion "Improving developer experience"
    , buildQuestion "Coaching other teammates on any software development activities"
    , buildQuestion "Consulting across different product teams on technical challenges"
    ]


productPrompts : List (Prompt Product)
productPrompts =
    [ buildQuestion "Scoping work to fit within a timebox / pushing towards a minimum viable version of a feature"
    , buildQuestion "Estimating software development work"
    , buildQuestion "Participating in customer calls"
    , buildQuestion "Conducting generative or evaluative research"
    , buildQuestion "Consulting across different product teams on product challenges"
    , buildQuestion "Coaching other teammates on any product activities"
    ]


teamManagementPrompts : List (Prompt TeamManagement)
teamManagementPrompts =
    [ buildQuestion "Identifying opportunities for individuals to grow in skills they're interested in"
    , buildQuestion "Working with teammates to plan out career growth"
    , buildQuestion "Managing employees going through a PIP"
    , buildQuestion "Coaching other teammates on any team management activities"
    ]


hiringPrompts : List (Prompt Hiring)
hiringPrompts =
    [ buildQuestion "Developing new interviews"
    , buildQuestion "Recruiting / outreach activities"
    , buildQuestion "Conducting initial candidate screens"
    , buildQuestion "Conducting non-technical interviews"
    , buildQuestion "Conducting technical interviews"
    , buildQuestion "Coaching other teammates on any hiring activities"
    ]


teammateOnboardingPrompts : List (Prompt TeammateOnboarding)
teammateOnboardingPrompts =
    [ buildQuestion "Developing onboarding processes"
    , buildQuestion "Developing onboarding material"
    , buildQuestion "Participating as an onboarding guide"
    ]


teammateRetentionPrompts : List (Prompt TeammateRetention)
teammateRetentionPrompts =
    [ buildQuestion "Developing skills (focused on an individual)"
    , buildQuestion "Developing skills (focused on a team)"
    , buildQuestion "Supporting high-performing software development culture"
    , buildQuestion "Planning / executing on team-building activities"
    ]
