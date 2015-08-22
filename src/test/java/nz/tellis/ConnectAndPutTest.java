package nz.tellis;

import com.couchbase.client.java.Bucket;
import com.couchbase.client.java.Cluster;
import com.couchbase.client.java.CouchbaseCluster;
import com.couchbase.client.java.document.JsonDocument;
import com.couchbase.client.java.document.json.JsonObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.junit.Assert.assertTrue;

public class ConnectAndPutTest {

    private static final Logger LOG = LoggerFactory.getLogger(ConnectAndPutTest.class);

    Cluster cluster;
    Bucket bucket;

    @Before
    public void connectToCouchbase() {
        cluster = CouchbaseCluster.create();
        bucket = cluster.openBucket("test");
    }

    @Test
    public void shouldPutInCouchbase() {
        bucket.upsert(JsonDocument.create("test", JsonObject.create().put("date", true)));
        JsonDocument document = bucket.get("test");
        LOG.info("Found: {}", document.toString());
        assertTrue(document.content().getBoolean("date"));
    }

    @After
    public void disconnect() {
        cluster.disconnect();
    }
}
