

import UIKit

class MainDisplayController:UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {

    

    
    @IBAction func addStoryAction(sender: AnyObject) {
        
        self.performSegueWithIdentifier("addDress", sender: self)
        
    }
    
    
    @IBAction func SeeMore(sender: AnyObject) {
        
        
        //self.performSegueWithIdentifier("paymentShow", sender: self)
        
    }
   
    
    

    @IBOutlet weak var mCollectionView:UICollectionView!;
    

    
    var valueFromQuery: [Stories] = []
    var clotharray: [Stories] = [Stories]();
  // var item1: Stories = Stories(name: "Preksha", category: "Yehi", size: "S", price:12, image: UIImage(named: "Image")!);
    
    
    
    
    
    override func viewDidLoad() {
        
        let collection = KCSCollection(fromString: "Stories", ofClass: Stories.self)
        let store = KCSAppdataStore(collection: collection, options: nil)
        store.queryWithQuery(
            KCSQuery(onField: "number", usingConditional: KCSQueryConditional.KCSGreaterThan, forValue:0),
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                
                if errorOrNil == nil {
                    //NSLog("successful reload: %@", objectsOrNil as! NSObject) // event updated
                    
                    self.valueFromQuery = objectsOrNil as! NSObject as! [Stories]
                    //print(self.valueFromQuery)
                    
                    
                    print(self.valueFromQuery)
                    
                    
                    self.mCollectionView.reloadData()
                    
                    
                } else {
                    NSLog("error occurred: %@", errorOrNil)
                }
                
            },
            withProgressBlock: nil
        )

        
        //clotharray.append(item1);
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        let collection = KCSCollection(fromString: "Stories", ofClass: Stories.self)
        let store = KCSAppdataStore(collection: collection, options: nil)
        store.queryWithQuery(
            KCSQuery(onField: "number", usingConditional: KCSQueryConditional.KCSGreaterThan, forValue:0),
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                
                if errorOrNil == nil {
                    //NSLog("successful reload: %@", objectsOrNil as! NSObject) // event updated
                    
                    self.valueFromQuery = objectsOrNil as! NSObject as! [Stories]
                    //print(self.valueFromQuery)
                    
                    
                    print(self.valueFromQuery)
                    
                    self.mCollectionView.reloadData()
                    
                    
                } else {
                    NSLog("error occurred: %@", errorOrNil)
                }
                
            },
            withProgressBlock: nil
        )
        
  
        
        print (UIImage(named: "Image"));
        
        //clotharray.append(item1);
        super.viewWillAppear(true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "paymentShow" {
            if let indexPaths = self.mCollectionView.indexPathsForSelectedItems(){
                print (indexPaths);
                let indexPath = indexPaths[0]
        
                let object = valueFromQuery[indexPath.row]
                let nextController = segue.destinationViewController  as! DetailController
                nextController.detailItem = object
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.valueFromQuery.count;
    }
    
    
      func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! mCollectionViewCell;
        
        var cloth = valueFromQuery[indexPath.row];
        
        cell.mImageView.image = cloth.mImage
        cell.mNameView.text = String(cloth.mName!)
        cell.mLocationView.text = cloth.mLocation
        cell.mDescriptionView.text = cloth.mdescription
        return cell;
    }
    
    
    @IBAction func SmallAction(sender: AnyObject) {
        
        
        print(1)
        
        let collection = KCSCollection(fromString: "Stories", ofClass: Stories.self)
        let store = KCSAppdataStore(collection: collection, options: nil)
        store.queryWithQuery(
            KCSQuery(onField: "size", withExactMatchForValue: "S"),
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                
                if errorOrNil == nil {
                    //NSLog("successful reload: %@", objectsOrNil as! NSObject) // event updated
                    
                    self.valueFromQuery = objectsOrNil as! NSObject as! [Stories]
                    //print(self.valueFromQuery)
                    
                    
                    //print(self.valueFromQuery)
                    
                    self.mCollectionView.reloadData()
                    
                    
                } else {
                    NSLog("error occurred: %@", errorOrNil)
                }
                
            },
            withProgressBlock: nil
        )
        
    }
    
    
    
    
    
    
    @IBAction func allStories(sender: AnyObject) {
        
        let collection = KCSCollection(fromString: "Stories", ofClass: Stories.self)
        let store = KCSAppdataStore(collection: collection, options: nil)
        store.queryWithQuery(
            KCSQuery(onField: "number", usingConditional: KCSQueryConditional.KCSGreaterThan, forValue:0),
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                
                if errorOrNil == nil {
                    //NSLog("successful reload: %@", objectsOrNil as! NSObject) // event updated
                    
                    self.valueFromQuery = objectsOrNil as! NSObject as! [Stories]
                    //print(self.valueFromQuery)
                    
                    
                    //print(self.valueFromQuery)
                    
                    self.mCollectionView.reloadData()
                    
                    
                } else {
                    NSLog("error occurred: %@", errorOrNil)
                }
                
            },
            withProgressBlock: nil
        )
        
        
    }
    
    
    
    
    
    
    
    @IBAction func myStories(sender: AnyObject) {
        
        
        
        
        
        let collection = KCSCollection(fromString: "Stories", ofClass: Stories.self)
        let store = KCSAppdataStore(collection: collection, options: nil)
        store.queryWithQuery(
            KCSQuery(onField: "myName", withExactMatchForValue: KCSUser.activeUser().username),
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                
                if errorOrNil == nil {
                    //NSLog("successful reload: %@", objectsOrNil as! NSObject) // event updated
                    
                    self.valueFromQuery = objectsOrNil as! NSObject as! [Stories]
                    //print(self.valueFromQuery)
                    
                    
                    //print(self.valueFromQuery)
                    
                    self.mCollectionView.reloadData()
                    
                    
                } else {
                    NSLog("error occurred: %@", errorOrNil)
                }
                
            },
            withProgressBlock: nil
        )
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func MediumAction(sender: AnyObject) {
        let collection = KCSCollection(fromString: "Stories", ofClass: Stories.self)
        let store = KCSAppdataStore(collection: collection, options: nil)
        store.queryWithQuery(
            KCSQuery(onField: "size", withExactMatchForValue: "M"),
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                
                if errorOrNil == nil {
                    //NSLog("successful reload: %@", objectsOrNil as! NSObject) // event updated
                    
                    self.valueFromQuery = objectsOrNil as! NSObject as! [Stories]
                    //print(self.valueFromQuery)
                    
                    
                    //print(self.valueFromQuery)
                    
                    self.mCollectionView.reloadData()
                    
                    
                } else {
                    NSLog("error occurred: %@", errorOrNil)
                }
                
            },
            withProgressBlock: nil
        )
        
        
    }
    
    @IBAction func LargeAction(sender: AnyObject) {
        
        let collection = KCSCollection(fromString: "Stories", ofClass: Stories.self)
        let store = KCSAppdataStore(collection: collection, options: nil)
        store.queryWithQuery(
            KCSQuery(onField: "size", withExactMatchForValue: "L"),
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                
                if errorOrNil == nil {
                    //NSLog("successful reload: %@", objectsOrNil as! NSObject) // event updated
                    
                    self.valueFromQuery = objectsOrNil as! NSObject as! [Stories]
                    //print(self.valueFromQuery)
                    
                    
                    //print(self.valueFromQuery)
                    
                    self.mCollectionView.reloadData()
                    
                    
                } else {
                    NSLog("error occurred: %@", errorOrNil)
                }
                
            },
            withProgressBlock: nil
        )
    }
    
    
    @IBAction func MenAction(sender: AnyObject) {
        
        let collection = KCSCollection(fromString: "Stories", ofClass: Stories.self)
        let store = KCSAppdataStore(collection: collection, options: nil)
        store.queryWithQuery(
            KCSQuery(onField: "category", withExactMatchForValue: "Men"),
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                
                if errorOrNil == nil {
                    //NSLog("successful reload: %@", objectsOrNil as! NSObject) // event updated
                    
                    self.valueFromQuery = objectsOrNil as! NSObject as! [Stories]
                    //print(self.valueFromQuery)
                    
                    
                    //print(self.valueFromQuery)
                    
                    self.mCollectionView.reloadData()
                    
                    
                } else {
                    NSLog("error occurred: %@", errorOrNil)
                }
                
            },
            withProgressBlock: nil
        )
    }
    
    @IBAction func WomenAction(sender: AnyObject) {
        
        let collection = KCSCollection(fromString: "Stories", ofClass: Stories.self)
        let store = KCSAppdataStore(collection: collection, options: nil)
        store.queryWithQuery(
            KCSQuery(onField: "category", withExactMatchForValue: "Women"),
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                
                if errorOrNil == nil {
                    //NSLog("successful reload: %@", objectsOrNil as! NSObject) // event updated
                    
                    self.valueFromQuery = objectsOrNil as! NSObject as! [Stories]
                    //print(self.valueFromQuery)
                    
                    
                    //print(self.valueFromQuery)
                    
                    self.mCollectionView.reloadData()
                    
                    
                } else {
                    NSLog("error occurred: %@", errorOrNil)
                }
                
            },
            withProgressBlock: nil
        )
        
    }
    
    @IBAction func AllAction(sender: AnyObject) {
        let collection = KCSCollection(fromString: "Stories", ofClass: Stories.self)
        let store = KCSAppdataStore(collection: collection, options: nil)
        store.queryWithQuery(
            KCSQuery(onField: "price", usingConditional: KCSQueryConditional.KCSGreaterThan, forValue:0),
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                
                if errorOrNil == nil {
                    //NSLog("successful reload: %@", objectsOrNil as! NSObject) // event updated
                    
                    self.valueFromQuery = objectsOrNil as! NSObject as! [Stories]
                    //print(self.valueFromQuery)
                    
                    
                    //print(self.valueFromQuery)
                    
                    self.mCollectionView.reloadData()
                    
                    
                } else {
                    NSLog("error occurred: %@", errorOrNil)
                }
            },
            withProgressBlock: nil
        )
    }
}

