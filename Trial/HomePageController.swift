
import UIKit


class Stories: NSObject {
    var mName: String?
    var mLocation: String?
    var mdescription: String?
    var mImage: UIImage?
    var entityId: String?
    var myName: String?
    var number: NSNumber?
    var comments: NSArray?
    var metadata: KCSMetadata!
    
    
    
    
 override init(){
        
        super.init();
    }
    
    override func hostToKinveyPropertyMapping() -> [NSObject : AnyObject]! {
        return [
            "entityId": KCSEntityKeyId,
            "mName" : "name",
            "mdescription" : "description",
            "mLocation" : "location",
            "mImage" : "mImage",
            "myName" : "myName",
            "number" : "number",
            "comments": "comments",
            "metadata": KCSEntityKeyMetadata,
        
        ]
    }
    
    override class func kinveyPropertyToCollectionMapping() -> [NSObject : AnyObject]! {
        return [
            "mImage" : KCSFileStoreCollectionName,
            
        ]
    }
    
    override func referenceKinveyPropertiesOfObjectsToSave() -> [AnyObject]! {
        return ["mImage"]
    }
}


class HomePageController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    
    
    @IBOutlet weak var nameOutlet: UITextField!

    

    @IBOutlet weak var locationOutlet: UITextField!
    

    @IBOutlet weak var descriptionOutlet: UITextView!
    
    @IBOutlet var categoryOutlet: UITextField!
    
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
//        store.loadObjectWithID(
//            "56f623061b6974a80218d46d",
//            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
//                if errorOrNil == nil {
//                    NSLog("successful reload: %@", objectsOrNil[0] as! NSObject) // event updated
//                    
//                    print(objectsOrNil[0].mdescription)
//                    
//                    
//                } else {
//                    NSLog("error occurred: %@", errorOrNil)
//                }
//            },
//            withProgressBlock: nil
//        )
        
        
        imagePicker.delegate = self
        print(KCSUser.activeUser().username)
    }
    
    
    @IBAction func saveImageWithObject(sender: AnyObject) {
        
        let someImageStore = KCSLinkedAppdataStore.storeWithOptions([

            KCSStoreKeyCollectionName: "Stories",
            KCSStoreKeyCollectionTemplateClass : Stories.self
            ])
        
        
        let data = UIImageJPEGRepresentation(imageView.image!, 0.9)
        KCSFileStore.uploadData(data, options: nil, completionBlock: {(uploadInfo: KCSFile!, error: NSError!) -> Void in
            print ("hello")
            print("file id is\(uploadInfo.fileId)");
        
        
        
        let story = Stories()
            
            story.metadata = KCSMetadata()
        story.mName = self.nameOutlet.text
        story.mdescription = self.descriptionOutlet.text
        story.mLocation = self.locationOutlet.text
        story.mImage = self.imageView.image!
        story.myName = KCSUser.activeUser().username;
            story.number = 1;
            story.comments = ["no cmnts"];
            
            story.metadata.setGloballyReadable(true);
            
        
        //print(story.mImage)
        
     
        
        
        
        someImageStore.saveObject(story, withCompletionBlock: {

            (objectsOrNil:[AnyObject]!, errorOrNil: NSError!) -> Void in
            print("Image Object Saved")
            
            
            
            if errorOrNil != nil {
                //save failed
                NSLog("Save failed, with error: %@", errorOrNil.localizedFailureReason!)
            } else {
                //save was successful
                NSLog("Successfully saved event (id='%@').", (objectsOrNil[0] as! NSObject).kinveyObjectId())
            }
            },
            withProgressBlock: nil
            )
        
            
            }, progressBlock: nil)
    }
   
    
    @IBAction func TakePhotoButtonTapped(sender: AnyObject) {
        imagePicker.allowsEditing = false
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            presentViewController(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func loadImageButtonTapped(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleAspectFit
            imageView.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}


