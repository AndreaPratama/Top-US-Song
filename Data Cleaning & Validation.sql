


SELECT
    ts.Artist_Name,
    a.ID,
    COALESCE(a.Gender, 'N/A') AS Gender,
    a.Age,
    COALESCE(a.Country, 'N/A') AS Country,
    a.Popularity,
    a.Followers,
    COUNT( CASE WHEN ts.Artist_Song_Rank = 1 THEN 1 ELSE NULL END) AS Total_Top_1_Songs,
    ts.Artist_Song_Rank,
    ts.Track_Name,
    ts.Is_Playable,
    a.Genres,
    ts.Album_Name,
    ts.Total_Album_Tracks,
    ts.Is_Explicit,
    CASE
        WHEN ts.Is_Explicit = 1 THEN 'True'
        WHEN ts.Is_Explicit = 0 THEN 'False'
        ELSE 'Unknown'
    END AS Is_Explicit_Text,
    ts.Song_Duration,
    ts.Track_Number,
    ts.Release_Date,
    CASE
        WHEN a.Popularity >= 90 THEN 'Superstar'
        WHEN a.Popularity >= 80 THEN 'Star'
        WHEN a.Popularity >= 70 THEN 'Popular'
        WHEN a.Popularity >= 60 THEN 'Well-known'
        WHEN a.Popularity >= 50 THEN 'Recognizable'
        WHEN a.Popularity >= 40 THEN 'Average'
        WHEN a.Popularity >= 30 THEN 'Local'
        WHEN a.Popularity >= 20 THEN 'Niche'
        WHEN a.Popularity >= 10 THEN 'Underground'
        ELSE 'Unknown'
    END AS Popularity_Label,
    COUNT(DISTINCT ts.Track_Name) AS Total_Song_Releases
INTO Artis_Top_Song_US_New
FROM
    Artists AS a
JOIN
    Top_Songs_US AS ts
ON
    a.Name = ts.Artist_Name
GROUP BY
    ts.Artist_Name, a.ID, a.Gender, a.Age, a.Country, a.Popularity, a.Followers,
    ts.Artist_Song_Rank, ts.Track_Name, ts.Is_Playable, a.Genres,
    ts.Album_Name, ts.Total_Album_Tracks, ts.Is_Explicit, ts.Song_Duration,
    ts.Track_Number, ts.Release_Date,
    CASE
        WHEN a.Popularity >= 90 THEN 'Superstar'
        WHEN a.Popularity >= 80 THEN 'Star'
        WHEN a.Popularity >= 70 THEN 'Popular'
        WHEN a.Popularity >= 60 THEN 'Well-known'
        WHEN a.Popularity >= 50 THEN 'Recognizable'
        WHEN a.Popularity >= 40 THEN 'Average'
        WHEN a.Popularity >= 30 THEN 'Local'
        WHEN a.Popularity >= 20 THEN 'Niche'
        WHEN a.Popularity >= 10 THEN 'Underground'
        ELSE 'Unknown'
    END;