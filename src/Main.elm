module Main exposing (main)

import Browser
import Data exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class, colspan, selected)
import Html.Events exposing (onClick, onInput)
import List.Extra as List
import Model exposing (..)
import Monocle.Lens exposing (Lens)
import Types exposing (..)
import Update exposing (update)
import View exposing (view)


main =
    Browser.sandbox
        { init =
            { currentPrompts =
                PromptsList
                    { listSoftwareDevelopmentPrompts = softwareDevelopmentPrompts
                    , listProductPrompts = productPrompts
                    , listTeamManagementPrompts = teamManagementPrompts
                    , listHiringPrompts = hiringPrompts
                    , listTeammateOnboardingPrompts = teammateOnboardingPrompts
                    , listTeammateRetentionPrompts = teammateRetentionPrompts
                    }
            }
        , update = update
        , view = view
        }
