//
//  BasicForecastTableViewCell.swift
//  NOAA Forecast
//
//  Created by Kaelin Osmun on 3/29/16.
//  Copyright © 2016 Kaelin Osmun. All rights reserved.
//

import UIKit

class BasicForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var dayOfTheWeek: UILabel!
    
    @IBOutlet weak var basicWeather: UILabel!
    
    @IBOutlet weak var temperature: UILabel!
    
    @IBOutlet weak var windChill: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
