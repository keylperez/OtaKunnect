-- Display the total number of views per channel. Show Channel ID, name, and number of views.
SELECT c.channelID, c.name, COUNT(*)
FROM Channel c, VideoViews vv, video v
WHERE c.channelID = v.channelID AND vw.video=v.videoid
GROUP BY c.channelID

-- Display the total number of videos per channel. Display channel ID, name, and number of videos. Include channels that has no videos yet.

SELECT c.channelID, c.name, COUNT(*) as `Total Videos`
FROM Channel c, Video v
WHERE c.channelID = v.channelID
GROUP BY c.channelID

-- Display the total number of views per video. Display video title and number of views

SELECT v.title, COUNT(*) as `Video Views`
FROM Video v, VideoViews vv
WHERE v.videoID = vw.video
GROUP BY v.videoID

-- Videos that have been seen by user 1 and user 2. Display the username, channel name and video title. Arrange by user then channel in ascending order.
SELECT u.usernmae, c.Name, v.Title
FROM User u, Chaannel c, Video v, VideoViews vv
WHERE v.ChanelID=c.ChanelID
    AND vv.video=v.VideoID
    AND vv.UserID=u.UserID
    AND u.UserID in (1, 2)
    ORDER BY u.username, c.name;

-- Assuming each view earns the channel 0.001 USD. Create a query that would display the total revenue per channel.
SELECT SUM(COUNT(*)*0.001)
FROM Channel c, VideoViews vv, video v
WHERE c.channelID = v.channelID AND vw.video=v.videoid
GROUP BY c.channelID

-- Which video is the top viewed in 2011?
SELECT v.Title
FROM Video v, VideoViews vv
WHERE v.VideoID = vw.Video AND 