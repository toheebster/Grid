//
//  LayoutArrangement.swift
//  ExyteGrid
//
//  Created by Denis Obukhov on 16.04.2020.
//  Copyright © 2020 Exyte. All rights reserved.
//

import CoreGraphics

/// Encapsulates the arranged items and total columns and rows count of a grid view
struct LayoutArrangement: Equatable, Hashable {
  var columnsCount: Int
  var rowsCount: Int
  let items: [ArrangedItem]
  private var _itemsMap: [AnyHashable?: ArrangedItem]
  
  init(columnsCount: Int, rowsCount: Int, items: [ArrangedItem]) {
    self.columnsCount = columnsCount
    self.rowsCount = rowsCount
    self.items = items
    var __items = Dictionary<AnyHashable?, ArrangedItem>(minimumCapacity: items.count)
    items.forEach { __items[$0.gridElement.id] = $0 }
    self._itemsMap = __items
  }
  
  static var zero = LayoutArrangement(columnsCount: 0, rowsCount: 0, items: [])
  
  subscript(gridElement: GridElement) -> ArrangedItem? {
//    items.first(where: { $0.gridElement == gridElement })
    _itemsMap[gridElement.id]
  }
}
