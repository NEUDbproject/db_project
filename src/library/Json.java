package library;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Array;

import javax.json.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import model.CourseraAbstract;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Json {
	/*Author: Wei Zhang*/
	/*get api info from url and send back course list*/
	public CourseraAbstract[] getApiInfo(String surl){
		try{
			URL url = new URL(surl);
			
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("GET");
			InputStream in = connection.getInputStream();
			InputStreamReader isr = new InputStreamReader(in);
			BufferedReader reader = new BufferedReader(isr);
			String out;
			StringBuffer json = new StringBuffer();
			while((out = reader.readLine()) != null)
			{
				json.append(out);
			}
			
			JSONObject jObject  = new JSONObject(json.toString());
			JSONArray data = jObject.getJSONArray("elements"); // get data object
			String projectname = data.toString();
			
			ObjectMapper mapper = new ObjectMapper();
			return mapper.readValue(projectname, CourseraAbstract[].class);
		}catch(IOException e){
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
