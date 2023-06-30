//
//  InfoChildTableViewCell.swift
//

import UIKit

class InfoChildTableViewCell: UITableViewCell {
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var iconImageView: UIImageView!

  @IBOutlet var chevronImgView: UIImageView!
  @IBOutlet var toggleSwitch: UISwitch!

  var section: Section?
  var parentSection: Section?
  
  var languageCode: String {
    guard let parentSection = parentSection,
          case .specificLang(let lang) = parentSection.sectionState else { return "all"}
    
    return lang
  }
  
  var togglePurpose: UserInteractiveState {
    guard let section = section,
          case .none(let action) = section.sectionState else { return .none}
    
    return action
  }

  func configureCell(for section: Section) {
    self.section = section
    titleLabel.text = section.sectionTitle
    iconImageView.image = UIImage.availableIconImage(with: section.imageString)

    if !section.hasToggle {
      toggleSwitch.isHidden = true
    } else {
      chevronImgView.isHidden = true
    }
    
    toggleSwitch.onTintColor = .init(.commandKey).withAlphaComponent(0.4)
    toggleSwitch.thumbTintColor = toggleSwitch.isOn ? .init(.commandKey) : .lightGray
  }
  
  @IBAction func switchDidChange(_ sender: UISwitch) {
    switch togglePurpose {
    case .toggleCommaAndPeriod:
      let dictionaryKey = languageCode + "CommaAndPeriod"
      
    case .none: break
    }
    
    toggleSwitch.thumbTintColor = toggleSwitch.isOn ? .init(.commandKey) : .lightGray
  }
  
  func fetchSwitchStateForCell() {
    
  }
}
