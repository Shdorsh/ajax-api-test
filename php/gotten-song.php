<?php
    $song = $_POST['song'];
    if(!$song) {
        die("Couldn't find the song");
    }
    $myResults = mysqli_query(mysqli_connect('localhost','root',null,'spotify_db'),'SELECT * FROM songs WHERE title LIKE "%' . $song . '%";');
    $myResults = mysqli_fetch_all($myResults,MYSQLI_ASSOC);
    echo json_encode($myResults);
?>