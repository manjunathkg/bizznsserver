package cms.jcr;

import java.util.Arrays;
import javax.jcr.Node;
import javax.jcr.PathNotFoundException;
import javax.jcr.Repository;
import javax.jcr.RepositoryException;
import javax.jcr.Session;
import javax.jcr.Value;
import javax.jcr.ValueFactory;
import javax.jcr.ValueFormatException;
import javax.jcr.observation.Event;
import javax.jcr.observation.EventIterator;
import javax.jcr.observation.EventListener;
import javax.jcr.observation.ObservationManager;
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Reference;
import org.apache.sling.jcr.api.SlingRepository;
import org.osgi.service.component.ComponentContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/** Listen for JCR event and create a tag
 * structure for Bizzns CMS tagging system **/

@Component(metatype = false, immediate = true)
public class TagGenerator implements EventListener {

    @Property(value = "Tag Generator Service")
    static final String DESCRIPTION = "service.description";
    @Property(value = "Bizzns CMS")
    static final String VENDOR = "service.vendor";
    private Session session;
    private ObservationManager observationManager;
    private final String CONTENT_PATH = "/content/bizzns/cms";
    private final String TAG_PATH="/content/tags";

    @Reference
    private SlingRepository repository;

    private static final Logger log = LoggerFactory.getLogger(TagGenerator.class);

    protected void activate(ComponentContext context) throws Exception {
        log.info("bizzns :: cms :: core :: TagGenerator :: active");
        String contentPath = CONTENT_PATH;
        
        session = repository.loginAdministrative(null);
        if (repository.getDescriptor(Repository.OPTION_OBSERVATION_SUPPORTED).equals("true")) {
        	log.error("**** KGM : TagGenerator :: activate :: Inside if ");
            observationManager = session.getWorkspace().getObservationManager();
            observationManager.addEventListener(this, Event.NODE_ADDED, contentPath, true, null, null, false);
        }else{
        	log.error("**** KGM : TagGenerator :: activate :: Repository was not observable");
        }
    }

    protected void deactivate(ComponentContext componentContext) throws RepositoryException {
        log.info("bizzns :: cms :: core :: TagGenerator :: deactivate");
        if (observationManager != null) {
            observationManager.removeEventListener(this);
        }
        if (session != null) {
            session.logout();
            session = null;
        }
    }

    public void onEvent(EventIterator events) {
    	log.info("bizzns :: cms :: core :: TagGenerator :: onEvent :: " + events.toString() );
        while (events.hasNext()) {
            Event event = events.nextEvent();
            try {
                log.info("new upload: {}", event.getPath());
                Node addedNode = session.getRootNode().getNode(event.getPath().substring(1));
                processAddedNode(addedNode);
                log.info("bizzns :: cms :: core :: TagGenerator :: onEvent :: finished processing of {}", event.getPath());
            } catch (Exception e) {
                log.error(e.getMessage(), e);
            }
        }
    }

    private void processAddedNode(Node addedNode) throws RepositoryException {
        log.info("bizzns :: cms :: core :: TagGenerator :: processAddedNode :: method called");
        Value[] tagValues=null;
        try{
            tagValues=addedNode.getProperty("tag").getValues();
        }
        catch(PathNotFoundException pnfe) {
            log.info("No tag found for this entry");
            return;
        }
        catch(ValueFormatException vfe) {
            //Single property found
            Value tagValue=addedNode.getProperty("tag").getValue();
            tagValues=new Value[1];
            tagValues[0]=tagValue;
        }
        String UUID=addedNode.getUUID();
        log.info("New content available with UUID: "+UUID+" and path: "+addedNode.getPath());
        log.info("TAG_PATH = " + TAG_PATH);
        Node tagsRootNode = session.getRootNode().getNode(TAG_PATH.substring(1));

        
        log.info("tagsRootNode = " + tagsRootNode.getPath());
        log.info(tagsRootNode.getProperty("sling:resourceType").getString());
        log.info(tagsRootNode.getName());
        for(int i=0;i<tagValues.length;i++) {
            //ADD +1 TO COUNT PROPERTY
            if (tagsRootNode.hasNode(tagValues[i].getString())) {
                log.info("Tag value: "+tagValues[i].getString());
                Node tagNode=tagsRootNode.getNode(tagValues[i].getString());
                int count=Integer.parseInt(tagNode.getProperty("count").getValue().getString())+1;
                Value[] UUIDs=null;
                
                try{
                    UUIDs=tagNode.getProperty("UUIDs").getValues();
                }
                catch(ValueFormatException vfe) {
                    //Single UUID found
                    Value singleUUID=tagNode.getProperty("UUIDs").getValue();
                    UUIDs=new Value[1];
                    UUIDs[0]=singleUUID;
                }
                
                ValueFactory valueFactory=session.getValueFactory();
                Value value=valueFactory.createValue(UUID);
                UUIDs=Arrays.copyOf(UUIDs,UUIDs.length+1);
                UUIDs[UUIDs.length-1]=value;

                tagNode.setProperty("count", count);
                tagNode.setProperty("UUIDs", UUIDs);
                tagsRootNode.save();
                log.info("Tag node updated");
            }
            //CREATE NEW NODE WITH COUNT 1
            else {
                log.info("New tag value: "+tagValues[i].getString());
                Node newTagNode = tagsRootNode.addNode(tagValues[i].getString());
                newTagNode.setProperty("count", 1);
                ValueFactory valueFactory=session.getValueFactory();
                Value value=valueFactory.createValue(UUID);
                newTagNode.setProperty("UUIDs", new Value[]{value});
                tagsRootNode.save();
                log.info("New tag node created");
            }
        }

    }

    
}
