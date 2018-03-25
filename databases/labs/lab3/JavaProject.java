import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.DB;
import com.mongodb.MongoException;
import java.net.UnknownHostException;

import java.util.Arrays;
import java.util.List;
import java.util.Set;

import static java.util.concurrent.TimeUnit.SECONDS;

// JDK 7 and above
public class JavaProject {  // Save as "JavaProject"
 
  public static void main(String[] args) {

    try {
	MongoClient mongoClient = new MongoClient( "127.0.0.1" , 27017 );

	DB db = mongoClient.getDB( "hollywood" );
	DBCollection collection = db.getCollection("actors");

	DBObject document = new BasicDBObject("actor", "Richard Gere")
                .append("born", "1949")
                .append("movies", Arrays.asList("Pretty Woman", "Runaway Bride", "Chicago"));

	// Prints the value of the document.
	System.out.println("document BEFORE insert = " + document);

	// Inserts the document into the collection in the database.
	collection.insert(document);

	// Prints the value of the document after inserted in the collection.
	System.out.println("document AFTER insert = " + document);

	// List collection	
	System.out.println("------List Collection------");
	BasicDBObject searchQuery = new BasicDBObject();
	searchQuery.put("born", "1949");
	DBCursor cursor = collection.find(searchQuery);
 
	while (cursor.hasNext()) {
	    System.out.println(cursor.next());
	}


	// Drop connection	
	collection.drop();

    } catch (UnknownHostException e) {
            e.printStackTrace();
	}	
 }
}
