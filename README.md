[Link to Final Deliverable](https://josesmung.shinyapps.io/Info-201-project-AC4-Spotify-Analysis/)
# Domain of interest: Music (Spotify)
## Why are you interested in this field/domain?
Music is something that everyone can relate to, it is a universal topic of interest because just about everyone enjoys listening to music. Music is also a very diverse field, with many different genres and subgenres of types of songs. Moreover, Spotify provides us with a large and up-to-date API that we can use to answer our data-driven questions.
## What other examples of data driven project have you found related to this domain (share at least 3)?
This [Spotify Music Data Analysis Trend](https://github.com/AsTimeGoesBy111/Spotify-Music-Data-Analysis) hosted on GitHub attempts to predict a song's popularity by using machine learning algorithms that analyze popular music trends over the past 20 years via Spotify's API. 10000 tracks were randomly extracted from the API for each year for the analysis of the 20 year time frame. The study found songs with **energy/loudness** slightly increased, and **valence** slightly decreased tend to have a higher popularity with general consumers. The study was published in 2017.

This project on [Song Popularity Predictor](https://towardsdatascience.com/song-popularity-predictor-1ef69735e380) demonstrated the possibility of predicting music hotness, identified trends in popular music, and developed feature extraction tools using Spotify’s API. Music hotness depends on multiple features like **tempo**, **artist familiarity**, **mode**, **loudness**, and **artist hotness**. The project found that hit songs had on average a score of 121.96 on tempo, 0.61 on artist familiarity, 0.25 on mode, -9.8 on loudness, and 0.43 on artist hotness.

The purpose of this project [Spotify Artist Analysis](https://github.com/khanhnamle1994/spotify-artists-analysis) is to analyze how similar or different is music that different artists on Spotify produce in terms of **danceability**, **energy**, **key**, **loudness**, **mode**, **speechiness**, **acousticness**, **instrumentalness**, **liveness**, **valence**, **tempo**, and **duration**.  The focus is on disentangling music taste of 50 different artists from a wide range of genres and to also identify different clusters of artists that share a similar musical style.

## What data-driven questions do you hope to answer about this domain (share at least 3)?
- Do album covers of songs affect track popularity?
- Will a song be more popular if it is in minor key or major key?
- How likely is it for a song to gain more popularity after its release?
- What aspects of a song (ex. tempo, valence, loudness) make it more likely to be popular?
- What physical aspects of a song (ex. tempo, valence, loudness) make it more like to be popular?
- Does a song's subject matter (the lyrics) make it more popular?


# Our data
[Spotify API link](https://developer.spotify.com/documentation/web-api/reference/tracks/) - Spotify is a music streaming service.
They have an abundant amount of data that they have collected and are publicly available to developers through their API service. Some data that they share are valence of the music, albums, genres, and dancability. Through these data sets we can ask interesting questions
such as do album covers of songs affect track popularity? We wont know the specifics of number of columns and rows because
each API data we call will have a different dimension to it.

[Apple Music API link](https://developer.apple.com/documentation/applemusicapi) -
This data was collected by the company Apple who run Apple music and manage all their own personal data. The data features
anything from albums name, artists, songs and music video. The rows and columns all vary depending on what API data you
pull. We can ask a variety of questions due to the massive api that apple provides us with. An interesting question
to look at would be rating trends of a specific genre and artist over the years.

[Billboard 1964-2015 Songs + Lyrics](https://www.kaggle.com/rakannimer/billboard-lyrics) - This data was downloaded from kaggle, the data frame for this set data has 6 colomns (Rank, Song, Artist, Year, Lyrics, Source) and 5101 rows. Since this data set gives the top songs from 1964-2015, it can answer our question to if the subject matter/lyrics of a song will make it more popular because it focuses on song popularity and shows each song's lyrics. Data was collected through xml and RCurl packages with Wikipedia's entry for each Billboard Year-End Hot 100 Songs
