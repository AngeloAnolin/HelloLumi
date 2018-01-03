module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Navigation exposing (Location)
import UrlParser exposing ((</>))

main : Program Never Model Msg
main = 
    Navigation.program UrlChange
        { view = view
        , update = update
        , subscriptions = always Sub.none
        , init = init
        }


type alias Model = 
    { page: Page
    }


type Page
    = Home
    | WhyLumi
    | FittingIn
    | LifeChanging
    | Philosophies
    | AligningFurther
    | InSummary
    | NotFound


init: Location -> ( Model, Cmd Msg )
init location =
    let 
        ( model, urlCmd ) = 
            urlUpdate location { page = Home }
    in
        ( model, Cmd.batch [ urlCmd ] )

type Msg 
    = UrlChange Location


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        UrlChange location ->
            urlUpdate location model


urlUpdate : Navigation.Location -> Model -> ( Model, Cmd Msg )
urlUpdate location model = 
    case decode location of
        Nothing ->
            ( { model | page = NotFound }, Cmd.none )

        Just route ->
            ( { model | page = route }, Cmd.none )


decode : Location -> Maybe Page
decode location =
    UrlParser.parseHash routeParser location


routeParser : UrlParser.Parser (Page -> a) a
routeParser =
    UrlParser.oneOf
        [ UrlParser.map Home UrlParser.top
        , UrlParser.map WhyLumi (UrlParser.s "why-lumi")
        , UrlParser.map FittingIn (UrlParser.s "fitting-in")
        , UrlParser.map LifeChanging (UrlParser.s "life-changing")
        , UrlParser.map Philosophies (UrlParser.s "philosophies-on-software")
        , UrlParser.map AligningFurther (UrlParser.s "aligning-further")
        , UrlParser.map InSummary (UrlParser.s "in-summary")
        ]


view : Model -> Html Msg
view model =
    div []
        [ mainContent model
        ]


mainContent : Model -> Html Msg
mainContent model = 
    div [] <|
        case model.page of
            Home ->
                pageHome model
            WhyLumi ->
                helloLumi model
            FittingIn ->
                fittingIn model
            LifeChanging ->
                lifeChanging model
            Philosophies ->
                philosophiesOnSoftware model
            AligningFurther ->
                aligningFurther model
            InSummary ->
                inSummary model
            NotFound ->
                pageNotFound model

pageHome : Model -> List ( Html Msg )
pageHome model = 
    [ div [] 
        [ div []
            [ div [ class "color-change", id "left"] [] 
            , div [ class "color-change", id "right"] [] 
            , div [ class "color-change", id "top"] 
                [ img [ class "home", src "home.png" ] []
                ] 
            , div [ class "color-change", id "bottom"] []
            , div [ class "navigation"] 
                [ table [] 
                    [ tbody [] 
                        [ tr [] 
                            [ td [ class "intro active" ] 
                                [ a [ href "#why-lumi"] [ text "Why Lumi?" ] 
                                ]
                            ]
                        , tr [] 
                            [ td [ class "preface active" ]
                                [ a [ href "#fitting-in"] [ text "Fitting In" ] 
                                ]
                            ]
                        , tr [] 
                            [ td [ class "rules active" ]
                                [ a [ href "#life-changing"] [ text "Life-Changing" ] 
                                ]
                            ]
                        , tr [] 
                            [ td [ class "communication active" ]
                                [ a [ href "#philosophies-on-software"] [ text "Philosophies on Software Development" ] 
                                ]
                            ]
                        , tr [] 
                            [ td [ class "structure active" ]
                                [ a [ href "#aligning-further"] [ text "Aligning Further" ] 
                                ]
                            ]
                        , tr [] 
                            [ td [ class "value active" ]
                                [ a [ href "#in-summary"] [ text "In Summary" ] 
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]
    

helloLumi : Model -> List ( Html Msg )
helloLumi model = 
    [ div [] 
        [ div [ class "color-change", id "top"] 
            [ a [ href "/" ] 
                [ img [ class "home", src "assets/home.png" ] [] ] 
            ] 
        , div [ id "preface" ] 
            [ div [ class "layout-full", id "divWhyLumi" ]
                [ div [ class "header" ] 
                    [ h1 [] [ text "Why Lumi" ]
                    , img [ class "preface", src "assets/1_one.jpg"] []
                    ]
                , div [ class "text-container" ]
                    [ p [] [ text "Hello Lumi. I am Angelo and I'd like to help your company tackle some technical challenges as a Front-End Developer." ]
                    , p [] [ text "Caring about work that matters; Empowering your people to have a large impact in the present and the future of the company; Indepence and flexibility; these are but few of the things that makes a company stand out and be a dream destination for anybody wanting to make a difference." ]
                    , p [] [ text "The packages you are producing aren't glamorous, but they are world-class. The software that helps build these products is constantly pushing the envelope of what technology has to offer. The chance to learn and make an impact along those lines is something that I cannot simply overlook." ]
                    ]
                ]
            ]
        ]
    ]

fittingIn : Model -> List ( Html Msg )    
fittingIn model = 
    [ div [] 
        [ div [ class "color-change", id "top"] 
            [ a [ href "/" ] 
                [ img [ class "home", src "assets/home.png" ] [] ] 
            ] 
        , div [ id "preface" ] 
            [ div [ class "layout-full", id "divFittingIn" ]
                [ div [ class "header" ] 
                    [ h1 [] [ text "Fitting In" ]
                    , img [ class "preface", src "assets/2_two.jpg"] []
                    ]
                , div [ class "text-container" ]
                    [ h4 [] [ text "How Would I be a good fit at Lumi?" ]
                    , p [] [ text "I have this relentless drive to always do stuff. I would advocate lots of interaction with the awesome people at Lumi and try to resolve some of the smaller challenges that allow me to have a grasp of the big picture." ]
                    , p [] [ text "From there, I would focus on resolving bigger issues which would accelerate my learning and contribution to the team. This will be performed under the guidance of senior people at Lumi, ensuring that I adhere to the standards and best practices relevant to the company and technology employed." ]
                    , p [] [ text "There would be bigger challenges I foresee - and that would involve a lot of collaboration not just from the technical people but from leadership and strategy people as well. I see myself being part of that group in the future tackling the challenges." ]
                    , p [] [ text "Of course, at the end of the day, being accepted and deemed fit will come from a fair assessment of the team on my performance and contribution. Regardless of the outcome, I relish to get the feedback on how I can further improve."]
                    ]
                ]
            ]
        ]
    ]

lifeChanging : Model -> List ( Html Msg )
lifeChanging model =    
    [ div [] 
        [ div [ class "color-change", id "top"] 
            [ a [ href "/" ] 
                [ img [ class "home", src "assets/home.png" ] [] ] 
            ] 
        , div [ id "preface" ] 
            [ div [ class "layout-full", id "divLifeChanging" ]
                [ div [ class "header" ] 
                    [ h1 [] [ text "Working with Lumi could be Life-Changing" ]
                    , img [ class "preface", src "assets/3_three.jpg"] []
                    ]
                , div [ class "text-container" ]
                    [ h4 [] [ text "Some reasons I could think why working for Lumi could alter my life (for the better)" ]
                    , ul [] 
                        [ li [ ] [ text "Autonomy - Working at your pace anywhere and anytime aligned with the direction of the organization is the prime ingredient towards delivering stuff that has relevant value." ]
                        , li [ ] [ text "Flexibility - Unless I know there is something important that needs to be done, I can structure my schedule so that I work when I can be most productive and contributing." ]
                        , li [ ] [ text "Focus - Having the autonomy and flexibility means that I can focus and direct my energy towards the important. Less distractions and hassles from commuting to office chaos and politics means my focus is zeroed in on the task at hand." ]
                        , li [ ] [ text "Trust - allowing people to work remotely is an essence of trust. By being trusted, I acknowldege a sense of maintaining a high level of confidence afforded by my colleagues and the company." ]
                        ]
                    , p [] [ text "We spend more than a third of our lives at work - doing meaningful stuff in an organization that supports it means changing your life for the better." ]
                    ]
                ]
            ]
        ]
    ]

philosophiesOnSoftware : Model -> List ( Html Msg )
philosophiesOnSoftware model = 
    [ div [] 
        [ div [ class "color-change", id "top"] 
            [ a [ href "/" ] 
                [ img [ class "home", src "assets/home.png" ] [] ] 
            ] 
        , div [ id "preface" ] 
            [ div [ class "layout-full", id "divPhilosophies" ]
                [ div [ class "header" ] 
                    [ h1 [] [ text "Philosophies on Software Development" ]
                    , img [ class "preface", src "assets/4_four.jpg"] []
                    ]
                , div [ class "text-container" ]
                    [ h4 [] [ text "Some quick thoughts on software" ]
                    , p [] [ text "I have been an advocate of lean and minimum viable product (MVP) models with regards to developing software. The reason? Business and technology evolves and a lot of times, it needs to go with what your software does." ]
                    , p [] [ text "Furthermore, there\'s too many stories of failed software projects and the common denominator for most of them I have observed is the length of time it takes for them to be released. Rather than shipping one big set of features, it will be better to release and iterate in smaller chunks where the software becomes better defined and suited to the needs of the business." ]
                    , p [] [ text "In essence though, these all rely on people who passionately care backed by an environment with sound engineering principles, solid infrastructure setup, and a constant thrust to deliver and make meaningful impact." ]
                    ]
                ]
            ]
        ]

    ]

aligningFurther : Model -> List ( Html Msg )
aligningFurther model =
    [ div [] 
        [ div [ class "color-change", id "top"] 
            [ a [ href "/" ] 
                [ img [ class "home", src "assets/home.png" ] [] ] 
            ] 
        , div [ id "preface" ] 
            [ div [ class "layout-full", id "divAligningFurther" ]
                [ div [ class "header" ] 
                    [ h1 [] [ text "Aligning Further" ]
                    , img [ class "preface", src "assets/5_five.jpg"] []
                    ]
                , div [ class "text-container" ]
                    [ h4 [] [ text "Here's my take on some of your questions while reviewing my application" ]
                    , p [] [ text "Curiosity. I am quite new to functional programming and I'd say this is not one of my comfort zone. Nonetheless, I took on the challenge knowing that Lumi is shifting towards a more functional paradigm. I've scratched the surface and wrote this site using a functional language. Allow me to learn and adapt further and make tangible contributions to your technology vision." ]
                    , p [] [ text "Communication. I affirm that good and empathic communication at all levels in an organization equates to a higher degree of success. Being able to understand and collaborate on challenges is a must to ensure issues are resolved and everyone is on the same page." ]
                    , p [] [ text "Empathy. People make up the success of any company. We may have differing opinions on how to do stuff, but at the end of the day, having a resolution that is acceptable for everyone is the fundamentals we'd stick in." ]
                    , p [] [ text "Work Ethic. I respect the work, and the possible chance afforded to me to do great stuff. Alongside this comes the notion of being mindful of the impact of my work and bringing a level of enthusiasm that can outshine the sun." ]
                    , p [] [ text "Good Taste. Diligence and care in writing software is something I have always practiced. Having that sense of responsibility means that every code I write, every commit I make and every software I deploy means that I am making an elegant experience and bringing solid contributions to the success of Lumi." ]
                    ]
                ]
            ]
        ]

    ]

inSummary : Model -> List ( Html Msg )    
inSummary model =
    [ div [] 
        [ div [ class "color-change", id "top"] 
            [ a [ href "/" ] 
                [ img [ class "home", src "assets/home.png" ] [] ] 
            ] 
        , div [ id "preface" ] 
            [ div [ class "layout-full", id "divInSummary" ]
                [ div [ class "header" ] 
                    [ h1 [] [ text "In Summary (Résumé)" ]
                    , img [ class "preface", src "assets/6_six.jpg"] []
                    ]
                , div [ class "text-container" ]
                    [ p [] [ text "Thank you for taking the time to read through my spiels. I could go on and on, but I would reserve those when I (hope) I am considered worthy to be working with your awesome team. Briefly is a summary of what I \'ve been engaged with." ]
                    , h2 [] [ text "Work Experiences" ]
                    , h5 [] [ text "Systems Analyst - City of Edmonton (April 2012 - Present)" ]
                    , p [] [ text "Working for the local government, I am fortunate to have taken different roles, ranging from developing software, researching software usability, and outlining recommended workflows, providing end user support, finding bugs that stops the users from using the system and engaging clients across different business units to address their technology requirements. I have also been assigned in high-impact software projects and pride myself in being able to deliver the outcome required for its success. I’ve also been involved heavily in the adoption of cloud-based email and productivity software that everyone in the city now uses and have explored the software capabilities to automate the migration of all users." ]
                    , h5 [] [ text "Senior Programmer - Paterson GlobalFoods Inc. (February 2010 - February 2012)" ]
                    , p [] [ text "My time with Paterson has been characterized with leading multiple software projects, engaging internal users and business, documentation, and training for released software and providing technical support across different systems. Delivering web and mobile solutions has allowed the company to harness technology to fully support the business and ensured that different locations can access data and be up-to-date with information required to operate their units." ]
                    , p [] [ text "" ]
                    , p [] [ text "" ]
                    ]
                ]
            ]
        ]

    ]


pageNotFound : Model -> List ( Html Msg )    
pageNotFound model = 
    [ div [] 
        [ div [ class "color-change", id "top"] 
            [ a [ href "/" ] 
                [ img [ class "home", src "assets/home.png" ] [] ] 
            ] 
        , div [ id "preface" ] 
            [ div [ class "layout-full", id "divNotFound" ]
                [ div [ class "header" ] 
                    [ h1 [] [ text "Ooops.. You Stumbled Somewhere" ]
                    , img [ class "preface", src "assets/7_seven.jpg"] []
                    ]
                , div [ class "text-container" ]
                    [ h4 [] [ text "Likely you are still looking to know more about me.." ]
                    , p [] [ text "I'd be happy to answer any further questions. Best way to go from here is to contact me via email and I'd be sure to respond right away." ]
                    , a [ href "mailto: angelo.anolin@gmail.com" ] [ text "angelo.anolin@gmail.com" ]
                    , p [] [ text "Source code for this résumé can be found on Github." ]
                    , a [ href "https://github.com/AngeloAnolin", target "_blank" ] [ text "Github" ]
                    ]
                ]
            ]
        ]

    ]



{- main = 
  div []
    [ div [ class "color-change", id "left"] [] 
    , div [ class "color-change", id "right"] [] 
    , div [ class "color-change", id "top"] 
        [ img [ class "home", src "home.png" ] []
        ] 
    , div [ class "color-change", id "bottom"] []
    , div [ class "navigation"] 
        [ table [] 
            [ tbody [] 
                [ tr [] 
                     [ td [ class "intro active" ] 
                        [ a [ href "#introduction"] [ text "Introduction" ] 
                        ]
                     ]
                , tr [] 
                     [ td [ class "preface active" ]
                        [ a [ href "#preface"] [ text "Preface" ] 
                        ]
                     ]
                , tr [] 
                     [ td [ class "rules active" ]
                        [ a [ href "#rules"] [ text "Rules" ] 
                        ]
                     ]
                , tr [] 
                     [ td [ class "communication active" ]
                        [ a [ href "#communication"] [ text "Communication" ] 
                        ]
                     ]
                , tr [] 
                     [ td [ class "structure active" ]
                        [ a [ href "#structure"] [ text "Structure" ] 
                        ]
                     ]
                , tr [] 
                     [ td [ class "value active" ]
                        [ a [ href "#what-we-value"] [ text "Values" ] 
                        ]
                     ]
                , tr [] 
                     [ td [ class "space active" ]
                        [ a [ href "#space"] [ text "Space" ] 
                        ]
                     ]
                ]
            ]
        ]
    , div [ id "introduction" ]
        [ div [ class "layout full", id "24649e"]
            [ div [ class "header" ] 
                [ h1 [] [text "Introduction" ]
                , img [ class "preface", src "preface.jpg" ] []
                ]
            , div [ class "text-container"]
                [ p [] [ text "Not every company has the opportunity to meaningfully and directly impact individuals in a way that makes their lives tangibly better. Lots of companies believe that through a series of semi-connected transactions they are improving something or inventing something new and, in that moment, they are making someone’s life better. Other companies subscribe to the philosophy that through making their company a success they are improving the lives of the people who work there by providing a steady paycheck and benefits. Much of that sentiment is what makes building a company, really, any company at all, a justifiable effort. Otherwise, we’d all be working for riskless giant enterprises or the government." ] 
                , p [] [ text "But occasionally companies are born that get to tackle something different, something that transcends the usual beliefs about capitalism and the economy, and something that has the chance to create new opportunities for millions. That is what we’re building at Zaarly." ] 
                , p [] [ text "We are building something that could quite literally create a new economy and transform lives by connecting people. We work for those people. If we do our job well, we’ll create something that matters as much to them as it does to us, and all of our lives will be better for it." ] 
                ]
            ]
        ]
    , div [ id "preface" ] 
        [ div [ class "layout full", id "b1ab87"]
            [ div [ class "header"] 
                [ h1 [] [ text "Preface" ]
                , img [ class "preface", src "preface.jpg" ] []
                ]
            ,  div [ class "text-container"]
                [ p [] [ text "Preface 1" ] 
                , p [] [ text "Preface 2" ] 
                , p [] [ text "Preface 3" ] 
                ]
            ]
        ]
    ] -}
