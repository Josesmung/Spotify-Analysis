library("shiny")
library("dplyr")
source("scripts/summary-table.R")

overview_page <- tabPanel(
  "Overview",
  titlePanel("Spotify Data Analysis: What Makes a Song Popular?"),
  p("Music is something that everyone can relate to, it is a universal topic
    of interest because just about everyone enjoys listening to music.
    Music is also a very diverse field with many different genres and
    subgenres of types of songs. Moreover, Spotify provides us with a large
    and up-to-date API that we can use to answer many data-driven questions
    relevant to music like how the danceability of the song affects
    its popularity. We can compare countries' top 50 songs track properties
    like danceability, valence, and speechiness with each other to see if
    there are any similiarities or differences. We can also count the number
    of songs that are in a certain key and further discriminate songs by
    whether they are explicit or not."),
  h2("Our Questions..."),
  p("Generally, we wanted to explore the", strong("correlation"), "between
    certain elements in songs and their popularity. Furthermore, we wanted
    to", strong("know specific elements about songs"), "and ",
    strong("understand patterns and trends"),
    "among the ", em("top 50 songs"), "on spotify."),
  HTML("<ul>
       <li> Is the correlation between specific elements of a song (i.e
       danceability, tempo, loudness, energy, and speechiness). And if there is
       a correlation, is it positive or negative? </li>
       <li> How does valence (musical positiveness) affect a song's popularity?
       </li>
       <li> Are songs more explicit if they are in a certain key? </li>
       </ul>"),

  h2("Here is data we worked with:",
  img("", src = paste0("https://wearedispatch.com/wp-content/uploads/2017",
                   "/09/spotify-logo-bar-black.png")),
  img("", src = "https://charts-images.scdn.co/REGIONAL_GLOBAL_DEFAULT.jpg")),
  h4(a("Spotify Global Top 50",
    href = "https://open.spotify.com/playlist/37i9dQZEVXbMDoHDwVN2tF")),
  img("", src = "https://i.ibb.co/mcC2bwC/lvM5w1u.png")
)

takeaway_page <- tabPanel(
  "Takeaways",
  titlePanel(strong("Things We Learned")),
  h2("Correlation?"),
  p("Looking to see if there is a relationship between certain
    aspects/elements of a song and its popularity."),
  p(strong("Danceability:"), "no appearent correlation"),
  p(strong("Tempo:"), "no appearent correlation"),
  p(strong("Loudness:"), "negative correlation, the less loud a song...
    possibility of lowered popularity"),
  p(strong("Energy:"), "no apparent correlation"),
  p(strong("Speechiness:"), "minimal positive correlation, the more vocabulary
    used in a song, the higher chance of popularity it has"),
  p("In total, we discovered that only 2 correlations from spotify's given
    song elements",
     strong("This means that if an artist were to focus on making a top selling
     track or album, they should focus particularly on their song's loudness
     and speechiness. This is because the only tangible correlations there are
     for a track being popular is a lowered loudness level and a higher
     speechiness level.")),
  h1(""),

  h2("Valence"),
  p("We tried to find relations between valence, a measure from 0.0 to
    1.0 used to describe the musical positiveness conveyed by a track
    and its popularity. We wanted this question answered because valence
    was a particularly interesting topic for us as it measures to cheeriness
    and general happiness of songs? Were songs that were happy more popular?
    Or were songs that were sadder more popular?"),
  p("Initially looking at the top 5-6 songs, there appears to be a trend
    in having a lower valence level and equating that to be a more
    popular song. However, this relationship is soon snuffed out. Looking
    at more than 10 songs at a time and comparing their heights for each bar
    chart shows that in the end, there is ultimately ",
    strong("no relationship between a song's valence and its popularity."),
    "The ", strong("valance levels have no clear pattern"), " whatsover"),

  h2("Explicitness and Keys"),
  p("Looking at a track's explicitness and comparing it to their key, we found
    2 surprising results/relatioships. First, we found that ",
    strong("tracks in a sharp key had less explicit lyrics"),
    "with the keys G# and A# having no explicit lyrics whatsover.
    Secondly, setting our keys at A as the base lowest note
    and going up to G# as the highest, we also found that ",
    strong("tracks with a lower key tend to have more
           explicit lyrics involved."))
)

chart2_page <- tabPanel(
  "Comparing Valence",
  # Show with a displayed title
  titlePanel("Comparing Valence Score of Top Songs"),
  sidebarLayout(
    sidebarPanel(
      # Select number of songs
      sliderInput(
        inputId = "num_songs",
        label = "Select Number of Songs",
        min = 1,
        max = 50,
        value = 1
      )
    ),
    mainPanel(
      # plotting output
      plotOutput("chart2")
    )
  )
)
chart3_page <- tabPanel(
  "Explicitness and Keys",
  titlePanel("Count of Songs That Are Explicit and In a Certain Key"),
  sidebarLayout(
    sidebarPanel(
      #explicit checkbox input
      checkboxGroupInput(
        inputId = "explicit",
        label = "Choose Whether Tracks Are Explicit or Not",
        choices = c("TRUE", "FALSE"),
        selected = c("TRUE", "FALSE")
      ),
      #key selecter
      selectInput(
        inputId = "key",
        label = "Choose Key to view",
        choices = top_50_data$key,
        selected = "G"
      )
    ),
    mainPanel(
      #plotting output
      plotOutput("chart3")
    )
  )
)

# Chart 1 UI Code
chart1_sidebar <- sidebarPanel(
  selectInput(
    inputId = "variable",
    label = "Choose Variable",
    choices = list(
      "Danceability" = "danceability",
      "Tempo" = "tempo",
      "Loudness" = "loudness",
      "Energy" = "energy",
      "Speechiness" = "speechiness"
    ),
    selected = "Danceability"
  )
)

chart1_main <- mainPanel(
  plotOutput("chart1")
)

chart1_tab <- tabPanel(
  title = "What Makes it Popular",
  titlePanel("A Look at Popularity"),
  chart1_sidebar,
  chart1_main
)

ui <- navbarPage(
  "Spotify Data Analysis",
  overview_page,
  chart1_tab,
  chart2_page,
  chart3_page,
  takeaway_page,
  includeCSS("styles.css")
)
