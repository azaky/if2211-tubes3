/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package humbala;

import twitter4j.Query;

/**
 *
 * @author Toshiba
 */
public class NewClass {
    public void main(String[] args) {
/*
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true)
				.setOAuthConsumerKey("bY3RaVuqzxNCKzDwXBvA")
				.setOAuthConsumerSecret("NmheZVfBwch4kxV3zjdjKPJvnX2bS41etPcnnUuyA")
				.setOAuthAccessToken("71545295-oiuSiTfwjwxudUBn3hJs1OtgDm4HtUjeFb9cgwaEH")
				.setOAuthAccessTokenSecret("7IDOPyQAB04pGKexoXNo0PVq6l8GoZNlAcSs5PRxqQ1sE");
		TwitterFactory tf = new TwitterFactory(cb.build());
		Twitter twitter = tf.getInstance();

		List<Status> statuses = twitter.getHomeTimeline();
		System.out.println("Showing home timeline.");
		for (Status status : statuses) {
			System.out.println(status.getUser().getName() + ":"
					+ status.getText());
		}

		System.out.println("");
		Query query = new Query("ITB");
		QueryResult result = twitter.search(query);
		for (Status status : result.getTweets()) {
			System.out.println("@" + status.getUser().getScreenName() + ":"
					+ status.getText());
		}        
*/
    }
}
