/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import IGListKit

class Message: NSObject, DateSortable, NSCopying {

  public func copy(with zone: NSZone? = nil) -> Any {
        let copy = Message(date: self.date, text: self.text, user: self.user)
      copy.id = self.id
    return copy
  }

  var id: UInt32
  var date: Date
  var text: String
  let user: User
  
  init(date: Date, text: String, user: User) {
    self.date = date
    self.text = text
    self.user = user
    self.id = arc4random()
  }

//  override var description: String {
//    return "\(self) = \(self.text) - \(self.date)"
//  }
  
}

extension Message: IGListDiffable {

  public func diffIdentifier() -> NSObjectProtocol {
    return self.id as NSObjectProtocol
  }

  public func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
    guard let to = object as? Message else {return false}

    return self.text == to.text


  }
}

