module SideBar.Styles exposing
    ( Background(..)
    , Opacity(..)
    , collapseIcon
    , column
    , hamburgerIcon
    , hamburgerMenu
    , iconGroup
    , opacityAttr
    , pipeline
    , pipelineFavourite
    , pipelineIcon
    , pipelineName
    , sideBar
    , team
    , teamHeader
    , teamIcon
    , teamName
    , tooltip
    , tooltipBody
    )

import Assets
import Colors
import Html
import Html.Attributes as Attr exposing (style)
import Views.Icon as Icon


sideBar : List (Html.Attribute msg)
sideBar =
    [ style "border-right" <| "1px solid " ++ Colors.frame
    , style "background-color" Colors.sideBar
    , style "width" "275px"
    , style "overflow-y" "auto"
    , style "height" "100%"
    , style "flex-shrink" "0"
    , style "box-sizing" "border-box"
    , style "padding-bottom" "10px"
    , style "-webkit-overflow-scrolling" "touch"
    ]


column : List (Html.Attribute msg)
column =
    [ style "display" "flex"
    , style "flex-direction" "column"
    ]


teamHeader : { a | background : Background } -> List (Html.Attribute msg)
teamHeader { background } =
    [ style "display" "flex"
    , style "cursor" "pointer"
    , style "align-items" "center"
    , backgroundAttr background
    ]


iconGroup : List (Html.Attribute msg)
iconGroup =
    [ style "width" "54px"
    , style "display" "flex"
    , style "align-items" "center"
    , style "justify-content" "space-between"
    , style "padding" "5px"
    , style "box-sizing" "border-box"
    , style "flex-shrink" "0"
    ]


type Opacity
    = Dim
    | GreyedOut
    | Bright


opacityAttr : Opacity -> Html.Attribute msg
opacityAttr opacity =
    style "opacity" <|
        case opacity of
            Dim ->
                "0.3"

            GreyedOut ->
                "0.7"

            Bright ->
                "1"


teamIcon : Opacity -> Html.Html msg
teamIcon opacity =
    Icon.icon
        { sizePx = 18
        , image = Assets.PeopleIcon
        }
        [ style "margin-left" "8px"
        , style "background-size" "contain"
        , style "flex-shrink" "0"
        , opacityAttr opacity
        ]


collapseIcon : { opacity : Opacity, asset : Assets.Asset } -> Html.Html msg
collapseIcon { opacity, asset } =
    Icon.icon
        { sizePx = 10
        , image = asset
        }
        [ style "margin-left" "10px"
        , style "flex-shrink" "0"
        , opacityAttr opacity
        ]


teamName :
    { a | opacity : Opacity }
    -> List (Html.Attribute msg)
teamName { opacity } =
    [ style "font-size" "14px"
    , style "padding" "5px 2.5px"
    , style "margin-left" "5px"
    , style "white-space" "nowrap"
    , style "overflow" "hidden"
    , style "text-overflow" "ellipsis"
    , style "flex-grow" "1"
    , opacityAttr opacity
    ]


type Background
    = Dark
    | Light
    | Invisible


backgroundAttr : Background -> Html.Attribute msg
backgroundAttr background =
    style "background-color" <|
        case background of
            Dark ->
                Colors.sideBarActive

            Light ->
                Colors.sideBarHovered

            Invisible ->
                "inherit"


pipelineName :
    { a | opacity : Opacity }
    -> List (Html.Attribute msg)
pipelineName { opacity } =
    [ style "font-size" "14px"
    , style "white-space" "nowrap"
    , style "overflow" "hidden"
    , style "text-overflow" "ellipsis"
    , style "padding" "5px 2.5px"
    , style "margin-left" "5px"
    , style "flex-grow" "1"
    , opacityAttr opacity
    ]


hamburgerMenu :
    { isSideBarOpen : Bool, isClickable : Bool }
    -> List (Html.Attribute msg)
hamburgerMenu { isSideBarOpen, isClickable } =
    [ style "border-right" <| "1px solid " ++ Colors.frame
    , style "opacity" "1"
    , style "cursor" <|
        if isClickable then
            "pointer"

        else
            "default"
    , style "background-color" <|
        if isSideBarOpen then
            Colors.sideBar

        else
            Colors.frame
    ]


hamburgerIcon : { isHovered : Bool, isActive : Bool } -> List (Html.Attribute msg)
hamburgerIcon { isHovered, isActive } =
    [ style "opacity" <|
        if isActive || isHovered then
            "1"

        else
            "0.5"
    ]


team : List (Html.Attribute msg)
team =
    [ style "padding-top" "5px", style "line-height" "1.2" ] ++ column


pipeline : { a | background : Background } -> List (Html.Attribute msg)
pipeline { background } =
    [ style "display" "flex"
    , style "align-items" "center"
    , style "margin-top" "2px"
    , backgroundAttr background
    ]


pipelineIcon : { asset : Assets.Asset, opacity : Opacity } -> List (Html.Attribute msg)
pipelineIcon { asset, opacity } =
    [ style "background-image" <|
        Assets.backgroundImage <|
            Just asset
    , style "background-repeat" "no-repeat"
    , style "height" "18px"
    , style "width" "18px"
    , style "background-size" "contain"
    , style "background-position" "center"
    , style "margin-left" "28px"
    , style "flex-shrink" "0"
    , opacityAttr opacity
    ]


pipelineFavourite : { opacity : Opacity, filled : Bool } -> List (Html.Attribute msg)
pipelineFavourite fav =
    [ style "background-image" <|
        Assets.backgroundImage <|
            Just <|
                if fav.filled then
                    Assets.StarIconFilled

                else
                    Assets.StarIconUnfilled
    , style "background-repeat" "no-repeat"
    , style "background-position" "50% 50%"
    , style "height" "16px"
    , style "width" "16px"
    , style "background-size" "contain"
    , style "margin-left" "28px"
    , style "flex-shrink" "0"
    , opacityAttr fav.opacity
    , Attr.attribute "aria-label" "Favorite Icon"
    ]


tooltip : Float -> Float -> List (Html.Attribute msg)
tooltip top left =
    [ style "position" "fixed"
    , style "left" <| String.fromFloat left ++ "px"
    , style "top" <| String.fromFloat top ++ "px"
    , style "margin-top" "-15px"
    , style "z-index" "1"
    , style "display" "flex"
    ]


tooltipBody : List (Html.Attribute msg)
tooltipBody =
    [ style "background-color" Colors.frame
    , style "padding-right" "10px"
    , style "font-size" "12px"
    , style "display" "flex"
    , style "align-items" "center"
    , style "height" "30px"
    ]
