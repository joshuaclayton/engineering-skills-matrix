module View exposing (view)

-- import Model exposing (..)
-- import Types exposing (..)

import Browser
import Html exposing (..)
import Update exposing (Msg)
import View.Analysis
import View.ExerciseInfo
import View.TableForm


view model =
    div []
        [ View.ExerciseInfo.view
        , View.TableForm.view model.currentPrompts
        , View.Analysis.view model.currentPrompts
        ]
