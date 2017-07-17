//
//  ButtonToolbarItem.swift
//  Vienna
//
//  Copyright 2017
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  https://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Cocoa
import os.log

/// A toolbar item with a button as its view. The toolbar item responds to
/// validation requests.
class ButtonToolbarItem: NSToolbarItem {

    // The default implementation of this method does nothing. Overriding this
    // will allow any responder object to validate the toolbar item.
    override func validate() {
        guard let action = action else {
            return
        }

        guard let responder = NSApp.target(forAction: action, to: target, from: self) else {
            if #available(macOS 10.12, *) {
                os_log("Toolbar item with identifier '%@' has no responder", type: .debug, itemIdentifier)
            }

            return
        }

        if (responder as AnyObject).responds(to: #selector(validateToolbarItem(_:))) {
            isEnabled = (responder as AnyObject).validateToolbarItem(self)
        }
    }

}