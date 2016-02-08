//
//  ViewController.swift
//  T6E2
//
//  Created by Jorge Marquez Torres on 2/2/16.
//  Copyright © 2016 jmarquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var filePath: NSString = ""
    var fileNameAndPath = NSURL()
    var image = CIImage()

    override func viewDidLoad() {
        image = CIImage(image: UIImage(named: "caras")!)!
        let context = CIContext(options: nil)
        let options = NSDictionary(object: CIDetectorAccuracyHigh, forKey: CIDetectorAccuracy)
        let detector = CIDetector(ofType: CIDetectorTypeFace, context: context, options: options as? [String : AnyObject])
        let features: NSArray = detector.featuresInImage(image, options: [CIDetectorSmile:true,CIDetectorEyeBlink:true])
        let imageView = UIImageView(image: UIImage(named: "caras")!)
        self.view.addSubview(imageView)
        //Vista auxiliar que luego invertiremos.
        let vistAux = UIView(frame: imageView.frame)
        for faceFeature in features {
            //Detección
            //let smile = faceFeature.hasSmile
            //var rightEyeBlinking = faceFeature.rightEyeClosed
            //var leftEyeBlinking = faceFeature.leftEyeClosed
            //Localizar la cara
            let faceRect = faceFeature.bounds
            let faceView = UIView(frame: faceRect)
            faceView.layer.borderWidth = 2
            faceView.layer.borderColor = UIColor.redColor().CGColor
            //var faceWidth:CGFloat = faceRect.size.width
            vistAux.addSubview(faceView)
        }
        self.view.addSubview(vistAux)
        //Invertimos el Eje de Coordenadas
        vistAux.transform = CGAffineTransformMakeScale(1, -1)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

