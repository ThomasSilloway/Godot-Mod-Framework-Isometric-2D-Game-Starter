- Godot Engine 4.4 documentation in English

  - [Home](https://docs.godotengine.org/en/stable/index.html)
  - [All classes](https://docs.godotengine.org/en/stable/classes/index.html)
  - TileMap

* * *

# TileMap [](https://docs.godotengine.org/en/stable/classes/class_tilemap.html\#tilemap "Link to this heading")

**Deprecated:** Use multiple [TileMapLayer](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer) nodes instead. To convert a TileMap to a set of TileMapLayer nodes, open the TileMap bottom panel with the node selected, click the toolbox icon in the top-right corner and choose 'Extract TileMap layers as individual TileMapLayer nodes'.

**Inherits:** [Node2D](https://docs.godotengine.org/en/stable/classes/class_node2d.html#class-node2d) **<** [CanvasItem](https://docs.godotengine.org/en/stable/classes/class_canvasitem.html#class-canvasitem) **<** [Node](https://docs.godotengine.org/en/stable/classes/class_node.html#class-node) **<** [Object](https://docs.godotengine.org/en/stable/classes/class_object.html#class-object)

Node for 2D tile-based maps.

## Description [](https://docs.godotengine.org/en/stable/classes/class_tilemap.html\#description "Link to this heading")

Node for 2D tile-based maps. Tilemaps use a [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset) which contain a list of tiles which are used to create grid-based maps. A TileMap may have several layers, layouting tiles on top of each other.

For performance reasons, all TileMap updates are batched at the end of a frame. Notably, this means that scene tiles from a [TileSetScenesCollectionSource](https://docs.godotengine.org/en/stable/classes/class_tilesetscenescollectionsource.html#class-tilesetscenescollectionsource) may be initialized after their parent. This is only queued when inside the scene tree.

To force an update earlier on, call [update\_internals()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-update-internals).

**Note:** For performance and compatibility reasons, the coordinates serialized by **TileMap** are limited to 16-bit signed integers, i.e. the range for X and Y coordinates is from `-32768` to `32767`. When saving tile data, tiles outside this range are wrapped.

## Tutorials [](https://docs.godotengine.org/en/stable/classes/class_tilemap.html\#tutorials "Link to this heading")

- [Using Tilemaps](https://docs.godotengine.org/en/stable/tutorials/2d/using_tilemaps.html)

- [2D Platformer Demo](https://godotengine.org/asset-library/asset/2727)

- [2D Isometric Demo](https://godotengine.org/asset-library/asset/2718)

- [2D Hexagonal Demo](https://godotengine.org/asset-library/asset/2717)

- [2D Grid-based Navigation with AStarGrid2D Demo](https://godotengine.org/asset-library/asset/2723)

- [2D Role Playing Game (RPG) Demo](https://godotengine.org/asset-library/asset/2729)

- [2D Kinematic Character Demo](https://godotengine.org/asset-library/asset/2719)

- [2D Dynamic TileMap Layers Demo](https://godotengine.org/asset-library/asset/2713)


## Properties [](https://docs.godotengine.org/en/stable/classes/class_tilemap.html\#properties "Link to this heading")

|     |     |     |
| --- | --- | --- |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [collision\_animatable](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-property-collision-animatable) | `false` |
| [VisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#enum-tilemap-visibilitymode) | [collision\_visibility\_mode](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-property-collision-visibility-mode) | `0` |
| [VisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#enum-tilemap-visibilitymode) | [navigation\_visibility\_mode](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-property-navigation-visibility-mode) | `0` |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [rendering\_quadrant\_size](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-property-rendering-quadrant-size) | `16` |
| [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset) | [tile\_set](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-property-tile-set) |  |

## Methods [](https://docs.godotengine.org/en/stable/classes/class_tilemap.html\#methods "Link to this heading")

|     |     |
| --- | --- |
| void | [\_tile\_data\_runtime\_update](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-private-method-tile-data-runtime-update)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), tile\_data: [TileData](https://docs.godotengine.org/en/stable/classes/class_tiledata.html#class-tiledata)) virtual |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [\_use\_tile\_data\_runtime\_update](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-private-method-use-tile-data-runtime-update)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) virtual |
| void | [add\_layer](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-add-layer)(to\_position: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) |
| void | [clear](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-clear)() |
| void | [clear\_layer](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-clear-layer)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) |
| void | [erase\_cell](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-erase-cell)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) |
| void | [fix\_invalid\_tiles](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-fix-invalid-tiles)() |
| void | [force\_update](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-force-update)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1) |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [get\_cell\_alternative\_tile](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-cell-alternative-tile)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), use\_proxies: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const |
| [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) | [get\_cell\_atlas\_coords](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-cell-atlas-coords)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), use\_proxies: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [get\_cell\_source\_id](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-cell-source-id)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), use\_proxies: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const |
| [TileData](https://docs.godotengine.org/en/stable/classes/class_tiledata.html#class-tiledata) | [get\_cell\_tile\_data](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-cell-tile-data)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), use\_proxies: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const |
| [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) | [get\_coords\_for\_body\_rid](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-coords-for-body-rid)(body: [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid)) |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [get\_layer\_for\_body\_rid](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-for-body-rid)(body: [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid)) |
| [Color](https://docs.godotengine.org/en/stable/classes/class_color.html#class-color) | [get\_layer\_modulate](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-modulate)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html#class-string) | [get\_layer\_name](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-name)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid) | [get\_layer\_navigation\_map](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-navigation-map)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [get\_layer\_y\_sort\_origin](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-y-sort-origin)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [get\_layer\_z\_index](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-z-index)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [get\_layers\_count](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layers-count)() const |
| [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid) | [get\_navigation\_map](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-navigation-map)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) | [get\_neighbor\_cell](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-neighbor-cell)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), neighbor: [CellNeighbor](https://docs.godotengine.org/en/stable/classes/class_tileset.html#enum-tileset-cellneighbor)) const |
| [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern) | [get\_pattern](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-pattern)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords\_array: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\]) |
| [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\] | [get\_surrounding\_cells](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-surrounding-cells)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) |
| [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\] | [get\_used\_cells](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-used-cells)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\] | [get\_used\_cells\_by\_id](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-used-cells-by-id)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), source\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1, atlas\_coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) = Vector2i(-1, -1), alternative\_tile: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1) const |
| [Rect2i](https://docs.godotengine.org/en/stable/classes/class_rect2i.html#class-rect2i) | [get\_used\_rect](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-used-rect)() const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [is\_cell\_flipped\_h](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-is-cell-flipped-h)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), use\_proxies: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [is\_cell\_flipped\_v](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-is-cell-flipped-v)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), use\_proxies: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [is\_cell\_transposed](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-is-cell-transposed)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), use\_proxies: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [is\_layer\_enabled](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-is-layer-enabled)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [is\_layer\_navigation\_enabled](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-is-layer-navigation-enabled)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [is\_layer\_y\_sort\_enabled](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-is-layer-y-sort-enabled)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) | [local\_to\_map](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-local-to-map)(local\_position: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2)) const |
| [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) | [map\_pattern](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-map-pattern)(position\_in\_tilemap: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), coords\_in\_pattern: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), pattern: [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern)) |
| [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) | [map\_to\_local](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-map-to-local)(map\_position: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const |
| void | [move\_layer](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-move-layer)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), to\_position: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) |
| void | [notify\_runtime\_tile\_data\_update](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-notify-runtime-tile-data-update)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1) |
| void | [remove\_layer](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-remove-layer)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) |
| void | [set\_cell](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-cell)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), source\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1, atlas\_coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) = Vector2i(-1, -1), alternative\_tile: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = 0) |
| void | [set\_cells\_terrain\_connect](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-cells-terrain-connect)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), cells: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\], terrain\_set: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), terrain: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), ignore\_empty\_terrains: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) |
| void | [set\_cells\_terrain\_path](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-cells-terrain-path)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), path: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\], terrain\_set: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), terrain: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), ignore\_empty\_terrains: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) |
| void | [set\_layer\_enabled](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-enabled)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), enabled: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool)) |
| void | [set\_layer\_modulate](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-modulate)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), modulate: [Color](https://docs.godotengine.org/en/stable/classes/class_color.html#class-color)) |
| void | [set\_layer\_name](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-name)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html#class-string)) |
| void | [set\_layer\_navigation\_enabled](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-navigation-enabled)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), enabled: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool)) |
| void | [set\_layer\_navigation\_map](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-navigation-map)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), map: [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid)) |
| void | [set\_layer\_y\_sort\_enabled](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-y-sort-enabled)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), y\_sort\_enabled: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool)) |
| void | [set\_layer\_y\_sort\_origin](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-y-sort-origin)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), y\_sort\_origin: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) |
| void | [set\_layer\_z\_index](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-z-index)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), z\_index: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) |
| void | [set\_navigation\_map](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-navigation-map)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), map: [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid)) |
| void | [set\_pattern](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-pattern)(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), position: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), pattern: [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern)) |
| void | [update\_internals](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-update-internals)() |

* * *

## Signals [](https://docs.godotengine.org/en/stable/classes/class_tilemap.html\#signals "Link to this heading")

**changed**() [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-signal-changed)

Emitted when the [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset) of this TileMap changes.

* * *

## Enumerations [](https://docs.godotengine.org/en/stable/classes/class_tilemap.html\#enumerations "Link to this heading")

enum **VisibilityMode**: [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#enum-tilemap-visibilitymode)

[VisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#enum-tilemap-visibilitymode) **VISIBILITY\_MODE\_DEFAULT** = `0`

Use the debug settings to determine visibility.

[VisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#enum-tilemap-visibilitymode) **VISIBILITY\_MODE\_FORCE\_HIDE** = `2`

Always hide.

[VisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#enum-tilemap-visibilitymode) **VISIBILITY\_MODE\_FORCE\_SHOW** = `1`

Always show.

* * *

## Property Descriptions [](https://docs.godotengine.org/en/stable/classes/class_tilemap.html\#property-descriptions "Link to this heading")

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **collision\_animatable** = `false` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-property-collision-animatable)

- void **set\_collision\_animatable**(value: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool))

- [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_collision\_animatable**()


If enabled, the TileMap will see its collisions synced to the physics tick and change its collision type from static to kinematic. This is required to create TileMap-based moving platform.

**Note:** Enabling [collision\_animatable](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-property-collision-animatable) may have a small performance impact, only do it if the TileMap is moving and has colliding tiles.

* * *

[VisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#enum-tilemap-visibilitymode) **collision\_visibility\_mode** = `0` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-property-collision-visibility-mode)

- void **set\_collision\_visibility\_mode**(value: [VisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#enum-tilemap-visibilitymode))

- [VisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#enum-tilemap-visibilitymode) **get\_collision\_visibility\_mode**()


Show or hide the TileMap's collision shapes. If set to [VISIBILITY\_MODE\_DEFAULT](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-constant-visibility-mode-default), this depends on the show collision debug settings.

* * *

[VisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#enum-tilemap-visibilitymode) **navigation\_visibility\_mode** = `0` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-property-navigation-visibility-mode)

- void **set\_navigation\_visibility\_mode**(value: [VisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#enum-tilemap-visibilitymode))

- [VisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#enum-tilemap-visibilitymode) **get\_navigation\_visibility\_mode**()


Show or hide the TileMap's navigation meshes. If set to [VISIBILITY\_MODE\_DEFAULT](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-constant-visibility-mode-default), this depends on the show navigation debug settings.

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **rendering\_quadrant\_size** = `16` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-property-rendering-quadrant-size)

- void **set\_rendering\_quadrant\_size**(value: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int))

- [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_rendering\_quadrant\_size**()


The TileMap's quadrant size. A quadrant is a group of tiles to be drawn together on a single canvas item, for optimization purposes. [rendering\_quadrant\_size](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-property-rendering-quadrant-size) defines the length of a square's side, in the map's coordinate system, that forms the quadrant. Thus, the default quadrant size groups together `16 * 16 = 256` tiles.

The quadrant size does not apply on Y-sorted layers, as tiles are grouped by Y position instead in that case.

**Note:** As quadrants are created according to the map's coordinate system, the quadrant's "square shape" might not look like square in the TileMap's local coordinate system.

* * *

[TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset) **tile\_set** [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-property-tile-set)

- void **set\_tileset**(value: [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset))

- [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset) **get\_tileset**()


The [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset) used by this **TileMap**. The textures, collisions, and additional behavior of all available tiles are stored here.

* * *

## Method Descriptions [](https://docs.godotengine.org/en/stable/classes/class_tilemap.html\#method-descriptions "Link to this heading")

void **\_tile\_data\_runtime\_update**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), tile\_data: [TileData](https://docs.godotengine.org/en/stable/classes/class_tiledata.html#class-tiledata)) virtual [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-private-method-tile-data-runtime-update)

Called with a TileData object about to be used internally by the TileMap, allowing its modification at runtime.

This method is only called if [\_use\_tile\_data\_runtime\_update()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-private-method-use-tile-data-runtime-update) is implemented and returns `true` for the given tile `coords` and `layer`.

**Warning:** The `tile_data` object's sub-resources are the same as the one in the TileSet. Modifying them might impact the whole TileSet. Instead, make sure to duplicate those resources.

**Note:** If the properties of `tile_data` object should change over time, use [notify\_runtime\_tile\_data\_update()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-notify-runtime-tile-data-update) to notify the TileMap it needs an update.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **\_use\_tile\_data\_runtime\_update**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) virtual [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-private-method-use-tile-data-runtime-update)

Should return `true` if the tile at coordinates `coords` on layer `layer` requires a runtime update.

**Warning:** Make sure this function only return `true` when needed. Any tile processed at runtime without a need for it will imply a significant performance penalty.

**Note:** If the result of this function should changed, use [notify\_runtime\_tile\_data\_update()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-notify-runtime-tile-data-update) to notify the TileMap it needs an update.

* * *

void **add\_layer**(to\_position: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-add-layer)

Adds a layer at the given position `to_position` in the array. If `to_position` is negative, the position is counted from the end, with `-1` adding the layer at the end of the array.

* * *

void **clear**() [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-clear)

Clears all cells.

* * *

void **clear\_layer**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-clear-layer)

Clears all cells on the given layer.

If `layer` is negative, the layers are accessed from the last one.

* * *

void **erase\_cell**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-erase-cell)

Erases the cell on layer `layer` at coordinates `coords`.

If `layer` is negative, the layers are accessed from the last one.

* * *

void **fix\_invalid\_tiles**() [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-fix-invalid-tiles)

Clears cells that do not exist in the tileset.

* * *

void **force\_update**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-force-update)

**Deprecated:** Use [notify\_runtime\_tile\_data\_update()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-notify-runtime-tile-data-update) and/or [update\_internals()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-update-internals) instead.

Forces the TileMap and the layer `layer` to update.

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_cell\_alternative\_tile**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), use\_proxies: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-cell-alternative-tile)

Returns the tile alternative ID of the cell on layer `layer` at `coords`.

If `use_proxies` is `false`, ignores the [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset)'s tile proxies, returning the raw alternative identifier. See [TileSet.map\_tile\_proxy()](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset-method-map-tile-proxy).

If `layer` is negative, the layers are accessed from the last one.

* * *

[Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) **get\_cell\_atlas\_coords**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), use\_proxies: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-cell-atlas-coords)

Returns the tile atlas coordinates ID of the cell on layer `layer` at coordinates `coords`. Returns `Vector2i(-1, -1)` if the cell does not exist.

If `use_proxies` is `false`, ignores the [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset)'s tile proxies, returning the raw atlas coordinate identifier. See [TileSet.map\_tile\_proxy()](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset-method-map-tile-proxy).

If `layer` is negative, the layers are accessed from the last one.

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_cell\_source\_id**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), use\_proxies: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-cell-source-id)

Returns the tile source ID of the cell on layer `layer` at coordinates `coords`. Returns `-1` if the cell does not exist.

If `use_proxies` is `false`, ignores the [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset)'s tile proxies, returning the raw source identifier. See [TileSet.map\_tile\_proxy()](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset-method-map-tile-proxy).

If `layer` is negative, the layers are accessed from the last one.

* * *

[TileData](https://docs.godotengine.org/en/stable/classes/class_tiledata.html#class-tiledata) **get\_cell\_tile\_data**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), use\_proxies: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-cell-tile-data)

Returns the [TileData](https://docs.godotengine.org/en/stable/classes/class_tiledata.html#class-tiledata) object associated with the given cell, or `null` if the cell does not exist or is not a [TileSetAtlasSource](https://docs.godotengine.org/en/stable/classes/class_tilesetatlassource.html#class-tilesetatlassource).

If `layer` is negative, the layers are accessed from the last one.

```
func get_clicked_tile_power():
	var clicked_cell = tile_map.local_to_map(tile_map.get_local_mouse_position())
	var data = tile_map.get_cell_tile_data(0, clicked_cell)
	if data:
		return data.get_custom_data("power")
	else:
		return 0

```

Copy to clipboard

If `use_proxies` is `false`, ignores the [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset)'s tile proxies. See [TileSet.map\_tile\_proxy()](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset-method-map-tile-proxy).

* * *

[Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) **get\_coords\_for\_body\_rid**(body: [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-coords-for-body-rid)

Returns the coordinates of the tile for given physics body RID. Such RID can be retrieved from [KinematicCollision2D.get\_collider\_rid()](https://docs.godotengine.org/en/stable/classes/class_kinematiccollision2d.html#class-kinematiccollision2d-method-get-collider-rid), when colliding with a tile.

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_layer\_for\_body\_rid**(body: [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-for-body-rid)

Returns the tilemap layer of the tile for given physics body RID. Such RID can be retrieved from [KinematicCollision2D.get\_collider\_rid()](https://docs.godotengine.org/en/stable/classes/class_kinematiccollision2d.html#class-kinematiccollision2d-method-get-collider-rid), when colliding with a tile.

* * *

[Color](https://docs.godotengine.org/en/stable/classes/class_color.html#class-color) **get\_layer\_modulate**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-modulate)

Returns a TileMap layer's modulate.

If `layer` is negative, the layers are accessed from the last one.

* * *

[String](https://docs.godotengine.org/en/stable/classes/class_string.html#class-string) **get\_layer\_name**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-name)

Returns a TileMap layer's name.

If `layer` is negative, the layers are accessed from the last one.

* * *

[RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid) **get\_layer\_navigation\_map**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-navigation-map)

Returns the [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid) of the [NavigationServer2D](https://docs.godotengine.org/en/stable/classes/class_navigationserver2d.html#class-navigationserver2d) navigation map assigned to the specified TileMap layer `layer`.

By default the TileMap uses the default [World2D](https://docs.godotengine.org/en/stable/classes/class_world2d.html#class-world2d) navigation map for the first TileMap layer. For each additional TileMap layer a new navigation map is created for the additional layer.

In order to make [NavigationAgent2D](https://docs.godotengine.org/en/stable/classes/class_navigationagent2d.html#class-navigationagent2d) switch between TileMap layer navigation maps use [NavigationAgent2D.set\_navigation\_map()](https://docs.godotengine.org/en/stable/classes/class_navigationagent2d.html#class-navigationagent2d-method-set-navigation-map) with the navigation map received from [get\_layer\_navigation\_map()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-navigation-map).

If `layer` is negative, the layers are accessed from the last one.

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_layer\_y\_sort\_origin**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-y-sort-origin)

Returns a TileMap layer's Y sort origin.

If `layer` is negative, the layers are accessed from the last one.

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_layer\_z\_index**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-z-index)

Returns a TileMap layer's Z-index value.

If `layer` is negative, the layers are accessed from the last one.

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_layers\_count**() const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layers-count)

Returns the number of layers in the TileMap.

* * *

[RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid) **get\_navigation\_map**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-navigation-map)

**Deprecated:** Use [get\_layer\_navigation\_map()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-navigation-map) instead.

Returns the [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid) of the [NavigationServer2D](https://docs.godotengine.org/en/stable/classes/class_navigationserver2d.html#class-navigationserver2d) navigation map assigned to the specified TileMap layer `layer`.

* * *

[Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) **get\_neighbor\_cell**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), neighbor: [CellNeighbor](https://docs.godotengine.org/en/stable/classes/class_tileset.html#enum-tileset-cellneighbor)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-neighbor-cell)

Returns the neighboring cell to the one at coordinates `coords`, identified by the `neighbor` direction. This method takes into account the different layouts a TileMap can take.

* * *

[TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern) **get\_pattern**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords\_array: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\]) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-pattern)

Creates a new [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern) from the given layer and set of cells.

If `layer` is negative, the layers are accessed from the last one.

* * *

[Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\] **get\_surrounding\_cells**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-surrounding-cells)

Returns the list of all neighbourings cells to the one at `coords`.

* * *

[Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\] **get\_used\_cells**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-used-cells)

Returns a [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) array with the positions of all cells containing a tile in the given layer. A cell is considered empty if its source identifier equals -1, its atlas coordinates identifiers is `Vector2(-1, -1)` and its alternative identifier is -1.

If `layer` is negative, the layers are accessed from the last one.

* * *

[Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\] **get\_used\_cells\_by\_id**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), source\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1, atlas\_coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) = Vector2i(-1, -1), alternative\_tile: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-used-cells-by-id)

Returns a [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) array with the positions of all cells containing a tile in the given layer. Tiles may be filtered according to their source ( `source_id`), their atlas coordinates ( `atlas_coords`) or alternative id ( `alternative_tile`).

If a parameter has its value set to the default one, this parameter is not used to filter a cell. Thus, if all parameters have their respective default value, this method returns the same result as [get\_used\_cells()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-used-cells).

A cell is considered empty if its source identifier equals -1, its atlas coordinates identifiers is `Vector2(-1, -1)` and its alternative identifier is -1.

If `layer` is negative, the layers are accessed from the last one.

* * *

[Rect2i](https://docs.godotengine.org/en/stable/classes/class_rect2i.html#class-rect2i) **get\_used\_rect**() const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-used-rect)

Returns a rectangle enclosing the used (non-empty) tiles of the map, including all layers.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_cell\_flipped\_h**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), use\_proxies: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-is-cell-flipped-h)

Returns `true` if the cell on layer `layer` at coordinates `coords` is flipped horizontally. The result is valid only for atlas sources.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_cell\_flipped\_v**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), use\_proxies: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-is-cell-flipped-v)

Returns `true` if the cell on layer `layer` at coordinates `coords` is flipped vertically. The result is valid only for atlas sources.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_cell\_transposed**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), use\_proxies: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-is-cell-transposed)

Returns `true` if the cell on layer `layer` at coordinates `coords` is transposed. The result is valid only for atlas sources.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_layer\_enabled**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-is-layer-enabled)

Returns if a layer is enabled.

If `layer` is negative, the layers are accessed from the last one.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_layer\_navigation\_enabled**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-is-layer-navigation-enabled)

Returns if a layer's built-in navigation regions generation is enabled.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_layer\_y\_sort\_enabled**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-is-layer-y-sort-enabled)

Returns if a layer Y-sorts its tiles.

If `layer` is negative, the layers are accessed from the last one.

* * *

[Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) **local\_to\_map**(local\_position: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-local-to-map)

Returns the map coordinates of the cell containing the given `local_position`. If `local_position` is in global coordinates, consider using [Node2D.to\_local()](https://docs.godotengine.org/en/stable/classes/class_node2d.html#class-node2d-method-to-local) before passing it to this method. See also [map\_to\_local()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-map-to-local).

* * *

[Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) **map\_pattern**(position\_in\_tilemap: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), coords\_in\_pattern: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), pattern: [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-map-pattern)

Returns for the given coordinate `coords_in_pattern` in a [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern) the corresponding cell coordinates if the pattern was pasted at the `position_in_tilemap` coordinates (see [set\_pattern()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-pattern)). This mapping is required as in half-offset tile shapes, the mapping might not work by calculating `position_in_tile_map + coords_in_pattern`.

* * *

[Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) **map\_to\_local**(map\_position: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-map-to-local)

Returns the centered position of a cell in the TileMap's local coordinate space. To convert the returned value into global coordinates, use [Node2D.to\_global()](https://docs.godotengine.org/en/stable/classes/class_node2d.html#class-node2d-method-to-global). See also [local\_to\_map()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-local-to-map).

**Note:** This may not correspond to the visual position of the tile, i.e. it ignores the [TileData.texture\_origin](https://docs.godotengine.org/en/stable/classes/class_tiledata.html#class-tiledata-property-texture-origin) property of individual tiles.

* * *

void **move\_layer**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), to\_position: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-move-layer)

Moves the layer at index `layer` to the given position `to_position` in the array.

* * *

void **notify\_runtime\_tile\_data\_update**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-notify-runtime-tile-data-update)

Notifies the TileMap node that calls to [\_use\_tile\_data\_runtime\_update()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-private-method-use-tile-data-runtime-update) or [\_tile\_data\_runtime\_update()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-private-method-tile-data-runtime-update) will lead to different results. This will thus trigger a TileMap update.

If `layer` is provided, only notifies changes for the given layer. Providing the `layer` argument (when applicable) is usually preferred for performance reasons.

**Warning:** Updating the TileMap is computationally expensive and may impact performance. Try to limit the number of calls to this function to avoid unnecessary update.

**Note:** This does not trigger a direct update of the TileMap, the update will be done at the end of the frame as usual (unless you call [update\_internals()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-update-internals)).

* * *

void **remove\_layer**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-remove-layer)

Removes the layer at index `layer`.

* * *

void **set\_cell**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), source\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1, atlas\_coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) = Vector2i(-1, -1), alternative\_tile: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = 0) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-cell)

Sets the tile identifiers for the cell on layer `layer` at coordinates `coords`. Each tile of the [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset) is identified using three parts:

- The source identifier `source_id` identifies a [TileSetSource](https://docs.godotengine.org/en/stable/classes/class_tilesetsource.html#class-tilesetsource) identifier. See [TileSet.set\_source\_id()](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset-method-set-source-id),

- The atlas coordinates identifier `atlas_coords` identifies a tile coordinates in the atlas (if the source is a [TileSetAtlasSource](https://docs.godotengine.org/en/stable/classes/class_tilesetatlassource.html#class-tilesetatlassource)). For [TileSetScenesCollectionSource](https://docs.godotengine.org/en/stable/classes/class_tilesetscenescollectionsource.html#class-tilesetscenescollectionsource) it should always be `Vector2i(0, 0)`),

- The alternative tile identifier `alternative_tile` identifies a tile alternative in the atlas (if the source is a [TileSetAtlasSource](https://docs.godotengine.org/en/stable/classes/class_tilesetatlassource.html#class-tilesetatlassource)), and the scene for a [TileSetScenesCollectionSource](https://docs.godotengine.org/en/stable/classes/class_tilesetscenescollectionsource.html#class-tilesetscenescollectionsource).


If `source_id` is set to `-1`, `atlas_coords` to `Vector2i(-1, -1)` or `alternative_tile` to `-1`, the cell will be erased. An erased cell gets **all** its identifiers automatically set to their respective invalid values, namely `-1`, `Vector2i(-1, -1)` and `-1`.

If `layer` is negative, the layers are accessed from the last one.

* * *

void **set\_cells\_terrain\_connect**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), cells: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\], terrain\_set: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), terrain: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), ignore\_empty\_terrains: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-cells-terrain-connect)

Update all the cells in the `cells` coordinates array so that they use the given `terrain` for the given `terrain_set`. If an updated cell has the same terrain as one of its neighboring cells, this function tries to join the two. This function might update neighboring tiles if needed to create correct terrain transitions.

If `ignore_empty_terrains` is `true`, empty terrains will be ignored when trying to find the best fitting tile for the given terrain constraints.

If `layer` is negative, the layers are accessed from the last one.

**Note:** To work correctly, this method requires the TileMap's TileSet to have terrains set up with all required terrain combinations. Otherwise, it may produce unexpected results.

* * *

void **set\_cells\_terrain\_path**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), path: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\], terrain\_set: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), terrain: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), ignore\_empty\_terrains: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-cells-terrain-path)

Update all the cells in the `path` coordinates array so that they use the given `terrain` for the given `terrain_set`. The function will also connect two successive cell in the path with the same terrain. This function might update neighboring tiles if needed to create correct terrain transitions.

If `ignore_empty_terrains` is `true`, empty terrains will be ignored when trying to find the best fitting tile for the given terrain constraints.

If `layer` is negative, the layers are accessed from the last one.

**Note:** To work correctly, this method requires the TileMap's TileSet to have terrains set up with all required terrain combinations. Otherwise, it may produce unexpected results.

* * *

void **set\_layer\_enabled**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), enabled: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-enabled)

Enables or disables the layer `layer`. A disabled layer is not processed at all (no rendering, no physics, etc.).

If `layer` is negative, the layers are accessed from the last one.

* * *

void **set\_layer\_modulate**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), modulate: [Color](https://docs.godotengine.org/en/stable/classes/class_color.html#class-color)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-modulate)

Sets a layer's color. It will be multiplied by tile's color and TileMap's modulate.

If `layer` is negative, the layers are accessed from the last one.

* * *

void **set\_layer\_name**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), name: [String](https://docs.godotengine.org/en/stable/classes/class_string.html#class-string)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-name)

Sets a layer's name. This is mostly useful in the editor.

If `layer` is negative, the layers are accessed from the last one.

* * *

void **set\_layer\_navigation\_enabled**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), enabled: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-navigation-enabled)

Enables or disables a layer's built-in navigation regions generation. Disable this if you need to bake navigation regions from a TileMap using a [NavigationRegion2D](https://docs.godotengine.org/en/stable/classes/class_navigationregion2d.html#class-navigationregion2d) node.

* * *

void **set\_layer\_navigation\_map**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), map: [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-navigation-map)

Assigns `map` as a [NavigationServer2D](https://docs.godotengine.org/en/stable/classes/class_navigationserver2d.html#class-navigationserver2d) navigation map for the specified TileMap layer `layer`.

By default the TileMap uses the default [World2D](https://docs.godotengine.org/en/stable/classes/class_world2d.html#class-world2d) navigation map for the first TileMap layer. For each additional TileMap layer a new navigation map is created for the additional layer.

In order to make [NavigationAgent2D](https://docs.godotengine.org/en/stable/classes/class_navigationagent2d.html#class-navigationagent2d) switch between TileMap layer navigation maps use [NavigationAgent2D.set\_navigation\_map()](https://docs.godotengine.org/en/stable/classes/class_navigationagent2d.html#class-navigationagent2d-method-set-navigation-map) with the navigation map received from [get\_layer\_navigation\_map()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-get-layer-navigation-map).

If `layer` is negative, the layers are accessed from the last one.

* * *

void **set\_layer\_y\_sort\_enabled**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), y\_sort\_enabled: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-y-sort-enabled)

Enables or disables a layer's Y-sorting. If a layer is Y-sorted, the layer will behave as a CanvasItem node where each of its tile gets Y-sorted.

Y-sorted layers should usually be on different Z-index values than not Y-sorted layers, otherwise, each of those layer will be Y-sorted as whole with the Y-sorted one. This is usually an undesired behavior.

If `layer` is negative, the layers are accessed from the last one.

* * *

void **set\_layer\_y\_sort\_origin**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), y\_sort\_origin: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-y-sort-origin)

Sets a layer's Y-sort origin value. This Y-sort origin value is added to each tile's Y-sort origin value.

This allows, for example, to fake a different height level on each layer. This can be useful for top-down view games.

If `layer` is negative, the layers are accessed from the last one.

* * *

void **set\_layer\_z\_index**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), z\_index: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-z-index)

Sets a layers Z-index value. This Z-index is added to each tile's Z-index value.

If `layer` is negative, the layers are accessed from the last one.

* * *

void **set\_navigation\_map**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), map: [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-navigation-map)

**Deprecated:** Use [set\_layer\_navigation\_map()](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-layer-navigation-map) instead.

Assigns `map` as a [NavigationServer2D](https://docs.godotengine.org/en/stable/classes/class_navigationserver2d.html#class-navigationserver2d) navigation map for the specified TileMap layer `layer`.

* * *

void **set\_pattern**(layer: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), position: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), pattern: [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-set-pattern)

Paste the given [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern) at the given `position` and `layer` in the tile map.

If `layer` is negative, the layers are accessed from the last one.

* * *

void **update\_internals**() [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap-method-update-internals)

Triggers a direct update of the TileMap. Usually, calling this function is not needed, as TileMap node updates automatically when one of its properties or cells is modified.

However, for performance reasons, those updates are batched and delayed to the end of the frame. Calling this function will force the TileMap to update right away instead.

**Warning:** Updating the TileMap is computationally expensive and may impact performance. Try to limit the number of updates and how many tiles they impact.

[Previous](https://docs.godotengine.org/en/stable/classes/class_texturerect.html "TextureRect") [Next](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html "TileMapLayer")

* * *

