package Util;

import java.io.StringWriter;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpointConfig;

@ServerEndpoint(value="/ServerEndpoint", configurator=ServerConfig.class)
public class ServerEndpoint {
	static Set<Session> chatUsers = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void handleOpen(ServerEndpointConfig endConfig, Session userSession) {
		userSession.getUserProperties().put("username", endConfig.getUserProperties().get("username"));
		chatUsers.add(userSession);
	}
	
	@OnMessage
	public void handleMessage(String message, Session userSession) {
		String username = (String) userSession.getUserProperties().get("username");
		
		if(username != null) {
			chatUsers.stream().forEach(x -> {
				try {
					x.getBasicRemote().sendText(buildJsonObject(username, message));
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			});
		}
	}
	
	@OnClose
	public void handleClose(Session userSession) {
		chatUsers.remove(userSession);
	}
	
	@OnError
	public void handleError(Throwable t) {
		
	}
	
	private String buildJsonObject(String username, String message) {
		JsonObject jsonObject = Json.createObjectBuilder().add("message", username + ": " + message).build();
		StringWriter stringWriter = new StringWriter();
		
		try(JsonWriter jsonWriter = Json.createWriter(stringWriter)) {
			jsonWriter.write(jsonObject);
		}
		
		return stringWriter.toString();
	}
}
