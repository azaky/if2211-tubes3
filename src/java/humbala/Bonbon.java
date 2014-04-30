package humbala;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.*;
import java.util.regex.*;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

/**
 *
 * @author Toshiba
 */
public class Bonbon {
    private ConfigurationBuilder cb;
    private Twitter twitter;

    public Bonbon() {
        cb = new ConfigurationBuilder();
        cb.setDebugEnabled(true)
                .setOAuthConsumerKey("bY3RaVuqzxNCKzDwXBvA")
                .setOAuthConsumerSecret("NmheZVfBwch4kxV3zjdjKPJvnX2bS41etPcnnUuyA")
                .setOAuthAccessToken("71545295-oiuSiTfwjwxudUBn3hJs1OtgDm4HtUjeFb9cgwaEH")
                .setOAuthAccessTokenSecret("7IDOPyQAB04pGKexoXNo0PVq6l8GoZNlAcSs5PRxqQ1sE")
                .setHttpProxyHost("cache.itb.ac.id")
                .setHttpProxyPort(8080)
                .setHttpProxyUser("tirtawr")
                .setHttpProxyPassword("satepadang");
        TwitterFactory tf = new TwitterFactory(cb.build());
        twitter = tf.getInstance();
    }
    
    public String haha() {
        return "Ronald Widjancok";
    }
    public List<String> getHaha(int k) {
        List<String> result = new ArrayList<String>();
        
        for (int i = 0; i < k; i++) {
            result.add("Entri ke-" + i);
        }
        
        return result;
    }
    
    public List<Status> getStatus() throws TwitterException {

        /* some suspicious code below */
        List<Status> statuses = twitter.getHomeTimeline();
        return statuses;
    }
    
    public QueryResult search(String keyword) throws TwitterException {
        Query query = new Query(keyword);
        return twitter.search(query);
    }
    
    /* REGEX COY */
    private static final String regex = "(?:[\\s^])(?:ja?la?n.?|di|ke|da?ri?|menuju|arah)(?: daerah| se?ki?ta?r| de?ka?t| |) (\\w*)";
    private static final Pattern regexPattern = Pattern.compile(regex);
    
    public static List<String> findPattern(String text) {
        List<String> result = new ArrayList<String>();
        Matcher regexMatcher = regexPattern.matcher(text);
        while (regexMatcher.find()) {
            result.add(regexMatcher.group(1));
        }
        
        return result;
    }
}
