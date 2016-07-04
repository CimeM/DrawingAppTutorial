//
//  ViewController.swift
//  drawingapp
//
//  Created by Martin Cimerman on 04/07/16.
//  Copyright © 2016 MartinCimerman. All rights reserved.
//

import UIKit
import TouchDraw

class ViewController: UIViewController, TouchDrawViewDelegate {
    
    var localColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)

    @IBOutlet var colorButton: UIButton!
    
    @IBOutlet weak var drawView: TouchDrawView!
    
    @IBOutlet var navBar: UINavigationBar!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navbuttonsSetup()
        drawView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - TouchDrawViewDelegate
    
    func undoEnabled() {
        //  self.undoButton.enabled = true
    }
    
    func undoDisabled() {
        // self.undoButton.enabled = false
    }
    
    func redoEnabled() {
        // self.redoButton.enabled = true
    }
    
    func redoDisabled() {
        // self.redoButton.enabled = false
    }
    
    func clearEnabled() {
        // self.clearButton.enabled = true
    }
    
    func clearDisabled() {
        //self.clearButton.enabled = false
    }
    
    func navbuttonsSetup() {
        
        self.navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 320, height: 60))
        self.view.addSubview(navBar);
        
        let navItem = UINavigationItem(title: "drawApp");
        
        let undoButton = UIBarButtonItem(title: "<", style: .Done , target: self, action: #selector(ViewController.undo))
        let redoButton = UIBarButtonItem(title: ">", style: .Done , target: self, action: #selector(ViewController.redo))
        let clearButton = UIBarButtonItem(title: "Clear", style: .Done , target: self, action: #selector(ViewController.clear))
        
        navItem.leftBarButtonItems = [undoButton, redoButton]
        navItem.rightBarButtonItem = clearButton
        self.navBar.setItems([navItem], animated: false);
        
    }
    
    func done(){
        self.performSegueWithIdentifier("unwindToTranslatorVC", sender: self)
        // TBD fix segue
        //self.navigationController?.popViewControllerAnimated(true)
        
    }
    func undo() {
        drawView.undo()
    }
    
    func clear() {
        drawView.clearDrawing()
    }
    
    @IBAction func redo(sender: AnyObject) {
        drawView.redo()
    }
    
    @IBAction func penButton(sender: UIButton) {
        
        drawView.setColor(localColor)
        drawView.setWidth(CGFloat(5))
    }
    
    @IBAction func flukiButton(sender: UIButton) {
        drawView.setColor(localColor)
        drawView.setWidth(CGFloat(10))
    }
    
    @IBAction func pencilButton(sender: UIButton) {
        drawView.setColor(localColor)
        drawView.setWidth(CGFloat(0.5))
    }
    
    @IBAction func eraserButton(sender: UIButton) {
        drawView.setWidth(CGFloat(70))
        drawView.setColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1.0))
        
    }
    @IBAction func colorButton(sender: UIButton) {
        let r = CGFloat(random() % 255) / 255
        let g = CGFloat(random() % 255) / 255
        let b = CGFloat(random() % 255) / 255
        
        localColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        self.colorButton.backgroundColor = localColor
        drawView.setColor(localColor)
        
    }

}

