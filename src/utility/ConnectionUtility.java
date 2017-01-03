package utility;

import java.net.HttpURLConnection;
import java.net.URL;

public abstract class ConnectionUtility {
	HttpURLConnection connection;
	public HttpURLConnection openConnection(String url, String method, String query) throws Exception {
		URL address;
		if ((query != null && !query.isEmpty()) && method == "GET")
			address = new URL(url + query);
		else
			address = new URL(url);
		HttpURLConnection connection = (HttpURLConnection) address.openConnection();
		if (method == "POST") {
			connection.setReadTimeout(10000);
			connection.setConnectTimeout(15000);
			connection.setDoInput(true);
			connection.setDoOutput(true);
			connection.setRequestMethod("POST");
		} else {
			connection.setRequestMethod("GET");
		}
		return connection;
	}
}
