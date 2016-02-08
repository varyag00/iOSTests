//
//  ViewController.swift
//  ChartsTest
//
//  Created by Dan Gonzalez on 2016-02-04.
//  Copyright © 2016 Dan Gonzalez. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate {
    
    //MARK: Attributes
    @IBOutlet weak var lineChartView: LineChartView!
    
    let months = ["Jan" , "Feb", "Mar", "Apr", "May", "June", "July", "August", "Sept", "Oct", "Nov", "Dec"]

    //vars that "hold month-to-month" data amounts
    let dollars1 = [1453.0,2352,5431,1442,5451,6486,1173,5678,9234,1345,9411,2212]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //1 set delegate for our view to this ViewController
        self.lineChartView.delegate = self
        
        //2 set a description for the chart
        self.lineChartView.descriptionText = "Tap node for details!"
        
        //3 set us up colours
        self.lineChartView.descriptionTextColor = UIColor.whiteColor()
        self.lineChartView.gridBackgroundColor = UIColor.darkGrayColor()
        
        //4 give user feedback to indicate no data loaded
        self.lineChartView.noDataText = "No data has been provided!"
        
        //5 set chart data source (custom function i'm about to make)
        setChartData(months)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChartData(months:[String]){
        
        //1 create an array of data entries
        var yVals1:[ChartDataEntry] = [ChartDataEntry]()
        
        for var i = 0; i < months.count; i++ {
            yVals1.append(ChartDataEntry(value: dollars1[i], xIndex: i))
        }
        
        //2 - create data set with our array and then FORMAT it properly so it makes sense
        let set1:LineChartDataSet = LineChartDataSet(yVals: yVals1, label: "First set of data")
        
        //line will correlate with left axis values
        set1.axisDependency = .Left
        //50% opacity
        set1.setColor(UIColor.redColor().colorWithAlphaComponent(0.5))
        //dark red circle
        set1.setCircleColor(UIColor.redColor())
        //width, circle radius, fill opacity, fill color, hilight color
        set1.lineWidth = 2.0
        set1.circleRadius = 6.0 // the radius of the node circle
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.redColor()
        set1.highlightColor = UIColor.whiteColor()
        set1.drawCircleHoleEnabled = true           //dunno what this does
        
        //3 Create an array to store our LineChartDataSets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        
        //4 pass our months in for our x-axis label value along wiht our dataSets
        let data: LineChartData = LineChartData(xVals: months, dataSets: dataSets)
        data.setValueTextColor(UIColor.whiteColor())

        //5 finally set our data
        self.lineChartView.data = data
    }


}
















