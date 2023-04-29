module Data exposing (..)

import Model exposing (Engineering, EngineeringOnboarding, EngineeringRetention, Hiring, Product, TeamManagement)
import Types exposing (Prompt, buildQuestion)


engineeringPrompts : List (Prompt Engineering)
engineeringPrompts =
    [ buildQuestion "Feature development"
    , buildQuestion "Refactoring / architecture"
    , buildQuestion "Fixing bugs"
    , buildQuestion "Application performance (measurement / telemetry / RCA)"
    , buildQuestion "Infrastructure / DevOps"
    , buildQuestion "Pair programming / rubber-ducking to help others"
    , buildQuestion "Conducting code review"
    , buildQuestion "Conducting code spikes / POCs"
    , buildQuestion "Improving developer experience"
    , buildQuestion "Coaching other teammates on any engineering activities"
    , buildQuestion "Consulting across different product teams on technical challenges"
    ]


productPrompts : List (Prompt Product)
productPrompts =
    [ buildQuestion "Scoping work to fit within a timebox / pushing towards a minimum viable version of a feature"
    , buildQuestion "Estimating engineering work"
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


engineeringOnboardingPrompts : List (Prompt EngineeringOnboarding)
engineeringOnboardingPrompts =
    [ buildQuestion "Developing onboarding processes"
    , buildQuestion "Developing onboarding material"
    , buildQuestion "Participating as an onboarding guide"
    ]


engineeringRetentionPrompts : List (Prompt EngineeringRetention)
engineeringRetentionPrompts =
    [ buildQuestion "Developing skills (focused on an individual)"
    , buildQuestion "Developing skills (focused on a team)"
    , buildQuestion "Supporting high-performing engineering culture"
    , buildQuestion "Planning / executing on team-building activities"
    ]
