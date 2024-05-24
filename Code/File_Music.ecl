
EXPORT File_Music := MODULE
//http://millionsongdataset.com/
// MSD Layout
/* RecID             Unique Record ID
   song_id           The original song ID used by Echo Nest, not really used in this challenge 		
   title             song title 
   year              year song was released 
   song_hotness      download indicator (0 to 1) 
   artist_id         original artist id from musicbrainz.org 
   artist_name       artist name 
   artist_hotness    overall downloads of artist (0 to 1) 
   familiarity       search indicator of artist 
   release_id        Album id where song (title) exists
   release_name      name of release where song exists
   latitude          latitude where the song was recorded 
   Longitude         Longitude where the song was recorded 
   Location          where the song was recorded 
   key               Estimation of the key the song in in by Spotify
   key_conf          Confidence of the key estimation 
   loudness          General loudness of the track relative to -60db
   mode              Estimation of mode the song is in by Spotify 
   mode_conf         Confidence of the mode estimation 
   duration          Song duration in seconds  
   start_of_fade_out Fade out of song in seconds 
   end_of_fade_in    Fade in to song in seconds 
   tempo             tempo in beats per minute (BPM) 
   time_signature    number of beats per bar 
   time_signature_conf  Confidence of the time signature estimation 
   CntBars           Total Bars in the song
   AvgBarsConf       Bars_Analysis   
   BarsConfDev       Bars_Analysis
   AvgBarsStart      Bars_Analysis   
   BarsStartDev      Bars_Analysis
   CntBeats          Beats_Analysis
   AvgBeatsConf      Beats_Analysis   
   BeatsConfDev      Beats_Analysis
   AvgBeatsStart     Beats_Analysis   
   BeatsStartDev     Beats_Analysis
*/

EXPORT MSDLayout := RECORD
    UNSIGNED4 RecID;
    STRING18  song_id;		
    STRING    title;
    UNSIGNED4 year;
    REAL      song_hotness;
    STRING18  artist_id;
    STRING375 artist_name;
    REAL      artist_hotness;
    REAL      familiarity;
    INTEGER   release_id;
    STRING    release_name;
    REAL      latitude;
    REAL      longitude;
    STRING    location;
    REAL      key;
    REAL      key_conf;
    REAL      loudness;
    INTEGER   mode;
    REAL      mode_conf;
    REAL      duration;
    REAL      start_of_fade_out;
    REAL      end_of_fade_in;
    REAL      tempo;
    REAL      time_signature;
    REAL      time_signature_conf; 
    INTEGER   CntBars;      //Bars_Analysis
    REAL      AvgBarsConf;  //Bars_Analysis   
    REAL      BarsConfDev;  //Bars_Analysis
    REAL      AvgBarsStart; //Bars_Analysis   
    REAL      BarsStartDev; //Bars_Analysis
    INTEGER   CntBeats;     //Beats_Analysis
    REAL      AvgBeatsConf; //Beats_Analysis   
    REAL      BeatsConfDev; //Beats_Analysis
    REAL      AvgBeatsStart;//Beats_Analysis   
    REAL      BeatsStartDev;//Beats_Analysis		
END;
   
EXPORT MSDS  := DATASET('~MIL::IN::MillionSongs',MSDLayout,CSV(HEADING(1)));

END;