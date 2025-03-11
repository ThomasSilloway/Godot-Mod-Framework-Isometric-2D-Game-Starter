- Godot Engine 4.4 documentation in English

  - [Home](https://docs.godotengine.org/en/stable/index.html)
  - [All classes](https://docs.godotengine.org/en/stable/classes/index.html)
  - TileMapLayer

* * *

# TileMapLayer [](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html\#tilemaplayer "Link to this heading")

**Inherits:** [Node2D](https://docs.godotengine.org/en/stable/classes/class_node2d.html#class-node2d) **<** [CanvasItem](https://docs.godotengine.org/en/stable/classes/class_canvasitem.html#class-canvasitem) **<** [Node](https://docs.godotengine.org/en/stable/classes/class_node.html#class-node) **<** [Object](https://docs.godotengine.org/en/stable/classes/class_object.html#class-object)

Node for 2D tile-based maps.

## Description [](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html\#description "Link to this heading")

Node for 2D tile-based maps. A **TileMapLayer** uses a [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset) which contain a list of tiles which are used to create grid-based maps. Unlike the [TileMap](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap) node, which is deprecated, **TileMapLayer** has only one layer of tiles. You can use several **TileMapLayer** to achieve the same result as a [TileMap](https://docs.godotengine.org/en/stable/classes/class_tilemap.html#class-tilemap) node.

For performance reasons, all TileMap updates are batched at the end of a frame. Notably, this means that scene tiles from a [TileSetScenesCollectionSource](https://docs.godotengine.org/en/stable/classes/class_tilesetscenescollectionsource.html#class-tilesetscenescollectionsource) may be initialized after their parent. This is only queued when inside the scene tree.

To force an update earlier on, call [update\_internals()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-update-internals).

**Note:** For performance and compatibility reasons, the coordinates serialized by **TileMapLayer** are limited to 16-bit signed integers, i.e. the range for X and Y coordinates is from `-32768` to `32767`. When saving tile data, tiles outside this range are wrapped.

## Tutorials [](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html\#tutorials "Link to this heading")

- [Using Tilemaps](https://docs.godotengine.org/en/stable/tutorials/2d/using_tilemaps.html)

- [2D Platformer Demo](https://godotengine.org/asset-library/asset/2727)

- [2D Isometric Demo](https://godotengine.org/asset-library/asset/2718)

- [2D Hexagonal Demo](https://godotengine.org/asset-library/asset/2717)

- [2D Grid-based Navigation with AStarGrid2D Demo](https://godotengine.org/asset-library/asset/2723)

- [2D Role Playing Game (RPG) Demo](https://godotengine.org/asset-library/asset/2729)

- [2D Kinematic Character Demo](https://godotengine.org/asset-library/asset/2719)

- [2D Dynamic TileMap Layers Demo](https://godotengine.org/asset-library/asset/2713)


## Properties [](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html\#properties "Link to this heading")

|     |     |     |
| --- | --- | --- |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [collision\_enabled](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-collision-enabled) | `true` |
| [DebugVisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#enum-tilemaplayer-debugvisibilitymode) | [collision\_visibility\_mode](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-collision-visibility-mode) | `0` |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [enabled](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-enabled) | `true` |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [navigation\_enabled](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-navigation-enabled) | `true` |
| [DebugVisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#enum-tilemaplayer-debugvisibilitymode) | [navigation\_visibility\_mode](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-navigation-visibility-mode) | `0` |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [occlusion\_enabled](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-occlusion-enabled) | `true` |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [rendering\_quadrant\_size](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-rendering-quadrant-size) | `16` |
| [PackedByteArray](https://docs.godotengine.org/en/stable/classes/class_packedbytearray.html#class-packedbytearray) | [tile\_map\_data](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-tile-map-data) | `PackedByteArray()` |
| [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset) | [tile\_set](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-tile-set) |  |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [use\_kinematic\_bodies](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-use-kinematic-bodies) | `false` |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [x\_draw\_order\_reversed](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-x-draw-order-reversed) | `false` |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [y\_sort\_origin](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-y-sort-origin) | `0` |

## Methods [](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html\#methods "Link to this heading")

|     |     |
| --- | --- |
| void | [\_tile\_data\_runtime\_update](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-private-method-tile-data-runtime-update)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), tile\_data: [TileData](https://docs.godotengine.org/en/stable/classes/class_tiledata.html#class-tiledata)) virtual |
| void | [\_update\_cells](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-private-method-update-cells)(coords: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\], forced\_cleanup: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool)) virtual |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [\_use\_tile\_data\_runtime\_update](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-private-method-use-tile-data-runtime-update)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) virtual |
| void | [clear](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-clear)() |
| void | [erase\_cell](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-erase-cell)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) |
| void | [fix\_invalid\_tiles](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-fix-invalid-tiles)() |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [get\_cell\_alternative\_tile](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-cell-alternative-tile)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const |
| [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) | [get\_cell\_atlas\_coords](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-cell-atlas-coords)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [get\_cell\_source\_id](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-cell-source-id)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const |
| [TileData](https://docs.godotengine.org/en/stable/classes/class_tiledata.html#class-tiledata) | [get\_cell\_tile\_data](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-cell-tile-data)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const |
| [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) | [get\_coords\_for\_body\_rid](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-coords-for-body-rid)(body: [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid)) const |
| [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid) | [get\_navigation\_map](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-navigation-map)() const |
| [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) | [get\_neighbor\_cell](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-neighbor-cell)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), neighbor: [CellNeighbor](https://docs.godotengine.org/en/stable/classes/class_tileset.html#enum-tileset-cellneighbor)) const |
| [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern) | [get\_pattern](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-pattern)(coords\_array: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\]) |
| [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\] | [get\_surrounding\_cells](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-surrounding-cells)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) |
| [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\] | [get\_used\_cells](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-used-cells)() const |
| [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\] | [get\_used\_cells\_by\_id](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-used-cells-by-id)(source\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1, atlas\_coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) = Vector2i(-1, -1), alternative\_tile: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1) const |
| [Rect2i](https://docs.godotengine.org/en/stable/classes/class_rect2i.html#class-rect2i) | [get\_used\_rect](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-used-rect)() const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [has\_body\_rid](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-has-body-rid)(body: [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid)) const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [is\_cell\_flipped\_h](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-is-cell-flipped-h)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [is\_cell\_flipped\_v](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-is-cell-flipped-v)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [is\_cell\_transposed](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-is-cell-transposed)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const |
| [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) | [local\_to\_map](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-local-to-map)(local\_position: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2)) const |
| [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) | [map\_pattern](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-map-pattern)(position\_in\_tilemap: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), coords\_in\_pattern: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), pattern: [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern)) |
| [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) | [map\_to\_local](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-map-to-local)(map\_position: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const |
| void | [notify\_runtime\_tile\_data\_update](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-notify-runtime-tile-data-update)() |
| void | [set\_cell](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-set-cell)(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), source\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1, atlas\_coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) = Vector2i(-1, -1), alternative\_tile: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = 0) |
| void | [set\_cells\_terrain\_connect](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-set-cells-terrain-connect)(cells: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\], terrain\_set: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), terrain: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), ignore\_empty\_terrains: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) |
| void | [set\_cells\_terrain\_path](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-set-cells-terrain-path)(path: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\], terrain\_set: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), terrain: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), ignore\_empty\_terrains: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) |
| void | [set\_navigation\_map](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-set-navigation-map)(map: [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid)) |
| void | [set\_pattern](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-set-pattern)(position: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), pattern: [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern)) |
| void | [update\_internals](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-update-internals)() |

* * *

## Signals [](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html\#signals "Link to this heading")

**changed**() [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-signal-changed)

Emitted when this **TileMapLayer**'s properties changes. This includes modified cells, properties, or changes made to its assigned [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset).

**Note:** This signal may be emitted very often when batch-modifying a **TileMapLayer**. Avoid executing complex processing in a connected function, and consider delaying it to the end of the frame instead (i.e. calling [Object.call\_deferred()](https://docs.godotengine.org/en/stable/classes/class_object.html#class-object-method-call-deferred)).

* * *

## Enumerations [](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html\#enumerations "Link to this heading")

enum **DebugVisibilityMode**: [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#enum-tilemaplayer-debugvisibilitymode)

[DebugVisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#enum-tilemaplayer-debugvisibilitymode) **DEBUG\_VISIBILITY\_MODE\_DEFAULT** = `0`

Hide the collisions or navigation debug shapes in the editor, and use the debug settings to determine their visibility in game (i.e. [SceneTree.debug\_collisions\_hint](https://docs.godotengine.org/en/stable/classes/class_scenetree.html#class-scenetree-property-debug-collisions-hint) or [SceneTree.debug\_navigation\_hint](https://docs.godotengine.org/en/stable/classes/class_scenetree.html#class-scenetree-property-debug-navigation-hint)).

[DebugVisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#enum-tilemaplayer-debugvisibilitymode) **DEBUG\_VISIBILITY\_MODE\_FORCE\_HIDE** = `2`

Always hide the collisions or navigation debug shapes.

[DebugVisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#enum-tilemaplayer-debugvisibilitymode) **DEBUG\_VISIBILITY\_MODE\_FORCE\_SHOW** = `1`

Always show the collisions or navigation debug shapes.

* * *

## Property Descriptions [](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html\#property-descriptions "Link to this heading")

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **collision\_enabled** = `true` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-collision-enabled)

- void **set\_collision\_enabled**(value: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool))

- [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_collision\_enabled**()


Enable or disable collisions.

* * *

[DebugVisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#enum-tilemaplayer-debugvisibilitymode) **collision\_visibility\_mode** = `0` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-collision-visibility-mode)

- void **set\_collision\_visibility\_mode**(value: [DebugVisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#enum-tilemaplayer-debugvisibilitymode))

- [DebugVisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#enum-tilemaplayer-debugvisibilitymode) **get\_collision\_visibility\_mode**()


Show or hide the **TileMapLayer**'s collision shapes. If set to [DEBUG\_VISIBILITY\_MODE\_DEFAULT](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-constant-debug-visibility-mode-default), this depends on the show collision debug settings.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **enabled** = `true` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-enabled)

- void **set\_enabled**(value: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool))

- [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_enabled**()


If `false`, disables this **TileMapLayer** completely (rendering, collision, navigation, scene tiles, etc.)

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **navigation\_enabled** = `true` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-navigation-enabled)

- void **set\_navigation\_enabled**(value: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool))

- [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_navigation\_enabled**()


If `true`, navigation regions are enabled.

* * *

[DebugVisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#enum-tilemaplayer-debugvisibilitymode) **navigation\_visibility\_mode** = `0` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-navigation-visibility-mode)

- void **set\_navigation\_visibility\_mode**(value: [DebugVisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#enum-tilemaplayer-debugvisibilitymode))

- [DebugVisibilityMode](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#enum-tilemaplayer-debugvisibilitymode) **get\_navigation\_visibility\_mode**()


Show or hide the **TileMapLayer**'s navigation meshes. If set to [DEBUG\_VISIBILITY\_MODE\_DEFAULT](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-constant-debug-visibility-mode-default), this depends on the show navigation debug settings.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **occlusion\_enabled** = `true` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-occlusion-enabled)

- void **set\_occlusion\_enabled**(value: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool))

- [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_occlusion\_enabled**()


Enable or disable light occlusion.

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **rendering\_quadrant\_size** = `16` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-rendering-quadrant-size)

- void **set\_rendering\_quadrant\_size**(value: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int))

- [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_rendering\_quadrant\_size**()


The **TileMapLayer**'s quadrant size. A quadrant is a group of tiles to be drawn together on a single canvas item, for optimization purposes. [rendering\_quadrant\_size](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-rendering-quadrant-size) defines the length of a square's side, in the map's coordinate system, that forms the quadrant. Thus, the default quadrant size groups together `16 * 16 = 256` tiles.

The quadrant size does not apply on a Y-sorted **TileMapLayer**, as tiles are grouped by Y position instead in that case.

**Note:** As quadrants are created according to the map's coordinate system, the quadrant's "square shape" might not look like square in the **TileMapLayer**'s local coordinate system.

* * *

[PackedByteArray](https://docs.godotengine.org/en/stable/classes/class_packedbytearray.html#class-packedbytearray) **tile\_map\_data** = `PackedByteArray()` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-tile-map-data)

- void **set\_tile\_map\_data\_from\_array**(value: [PackedByteArray](https://docs.godotengine.org/en/stable/classes/class_packedbytearray.html#class-packedbytearray))

- [PackedByteArray](https://docs.godotengine.org/en/stable/classes/class_packedbytearray.html#class-packedbytearray) **get\_tile\_map\_data\_as\_array**()


The raw tile map data as a byte array.

**Note:** The returned array is _copied_ and any changes to it will not update the original property value. See [PackedByteArray](https://docs.godotengine.org/en/stable/classes/class_packedbytearray.html#class-packedbytearray) for more details.

* * *

[TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset) **tile\_set** [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-tile-set)

- void **set\_tile\_set**(value: [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset))

- [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset) **get\_tile\_set**()


The [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset) used by this layer. The textures, collisions, and additional behavior of all available tiles are stored here.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **use\_kinematic\_bodies** = `false` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-use-kinematic-bodies)

- void **set\_use\_kinematic\_bodies**(value: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool))

- [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_using\_kinematic\_bodies**()


If `true`, this **TileMapLayer** collision shapes will be instantiated as kinematic bodies. This can be needed for moving **TileMapLayer** nodes (i.e. moving platforms).

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **x\_draw\_order\_reversed** = `false` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-x-draw-order-reversed)

- void **set\_x\_draw\_order\_reversed**(value: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool))

- [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_x\_draw\_order\_reversed**()


If [CanvasItem.y\_sort\_enabled](https://docs.godotengine.org/en/stable/classes/class_canvasitem.html#class-canvasitem-property-y-sort-enabled) is enabled, setting this to `true` will reverse the order the tiles are drawn on the X-axis.

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **y\_sort\_origin** = `0` [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-y-sort-origin)

- void **set\_y\_sort\_origin**(value: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int))

- [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_y\_sort\_origin**()


This Y-sort origin value is added to each tile's Y-sort origin value. This allows, for example, to fake a different height level. This can be useful for top-down view games.

* * *

## Method Descriptions [](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html\#method-descriptions "Link to this heading")

void **\_tile\_data\_runtime\_update**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), tile\_data: [TileData](https://docs.godotengine.org/en/stable/classes/class_tiledata.html#class-tiledata)) virtual [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-private-method-tile-data-runtime-update)

Called with a [TileData](https://docs.godotengine.org/en/stable/classes/class_tiledata.html#class-tiledata) object about to be used internally by the **TileMapLayer**, allowing its modification at runtime.

This method is only called if [\_use\_tile\_data\_runtime\_update()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-private-method-use-tile-data-runtime-update) is implemented and returns `true` for the given tile `coords`.

**Warning:** The `tile_data` object's sub-resources are the same as the one in the TileSet. Modifying them might impact the whole TileSet. Instead, make sure to duplicate those resources.

**Note:** If the properties of `tile_data` object should change over time, use [notify\_runtime\_tile\_data\_update()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-notify-runtime-tile-data-update) to notify the **TileMapLayer** it needs an update.

* * *

void **\_update\_cells**(coords: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\], forced\_cleanup: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool)) virtual [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-private-method-update-cells)

Called when this **TileMapLayer**'s cells need an internal update. This update may be caused from individual cells being modified or by a change in the [tile\_set](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-tile-set) (causing all cells to be queued for an update). The first call to this function is always for initializing all the **TileMapLayer**'s cells. `coords` contains the coordinates of all modified cells, roughly in the order they were modified. `forced_cleanup` is `true` when the **TileMapLayer**'s internals should be fully cleaned up. This is the case when:

- The layer is disabled;

- The layer is not visible;

- [tile\_set](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-tile-set) is set to `null`;

- The node is removed from the tree;

- The node is freed.


Note that any internal update happening while one of these conditions is verified is considered to be a "cleanup". See also [update\_internals()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-update-internals).

**Warning:** Implementing this method may degrade the **TileMapLayer**'s performance.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **\_use\_tile\_data\_runtime\_update**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) virtual [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-private-method-use-tile-data-runtime-update)

Should return `true` if the tile at coordinates `coords` requires a runtime update.

**Warning:** Make sure this function only returns `true` when needed. Any tile processed at runtime without a need for it will imply a significant performance penalty.

**Note:** If the result of this function should change, use [notify\_runtime\_tile\_data\_update()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-notify-runtime-tile-data-update) to notify the **TileMapLayer** it needs an update.

* * *

void **clear**() [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-clear)

Clears all cells.

* * *

void **erase\_cell**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-erase-cell)

Erases the cell at coordinates `coords`.

* * *

void **fix\_invalid\_tiles**() [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-fix-invalid-tiles)

Clears cells containing tiles that do not exist in the [tile\_set](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-property-tile-set).

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_cell\_alternative\_tile**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-cell-alternative-tile)

Returns the tile alternative ID of the cell at coordinates `coords`.

* * *

[Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) **get\_cell\_atlas\_coords**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-cell-atlas-coords)

Returns the tile atlas coordinates ID of the cell at coordinates `coords`. Returns `Vector2i(-1, -1)` if the cell does not exist.

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_cell\_source\_id**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-cell-source-id)

Returns the tile source ID of the cell at coordinates `coords`. Returns `-1` if the cell does not exist.

* * *

[TileData](https://docs.godotengine.org/en/stable/classes/class_tiledata.html#class-tiledata) **get\_cell\_tile\_data**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-cell-tile-data)

Returns the [TileData](https://docs.godotengine.org/en/stable/classes/class_tiledata.html#class-tiledata) object associated with the given cell, or `null` if the cell does not exist or is not a [TileSetAtlasSource](https://docs.godotengine.org/en/stable/classes/class_tilesetatlassource.html#class-tilesetatlassource).

```
func get_clicked_tile_power():
	var clicked_cell = tile_map_layer.local_to_map(tile_map_layer.get_local_mouse_position())
	var data = tile_map_layer.get_cell_tile_data(clicked_cell)
	if data:
		return data.get_custom_data("power")
	else:
		return 0

```

Copy to clipboard

* * *

[Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) **get\_coords\_for\_body\_rid**(body: [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-coords-for-body-rid)

Returns the coordinates of the tile for given physics body [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid). Such an [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid) can be retrieved from [KinematicCollision2D.get\_collider\_rid()](https://docs.godotengine.org/en/stable/classes/class_kinematiccollision2d.html#class-kinematiccollision2d-method-get-collider-rid), when colliding with a tile.

* * *

[RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid) **get\_navigation\_map**() const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-navigation-map)

Returns the [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid) of the [NavigationServer2D](https://docs.godotengine.org/en/stable/classes/class_navigationserver2d.html#class-navigationserver2d) navigation used by this **TileMapLayer**.

By default this returns the default [World2D](https://docs.godotengine.org/en/stable/classes/class_world2d.html#class-world2d) navigation map, unless a custom map was provided using [set\_navigation\_map()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-set-navigation-map).

* * *

[Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) **get\_neighbor\_cell**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), neighbor: [CellNeighbor](https://docs.godotengine.org/en/stable/classes/class_tileset.html#enum-tileset-cellneighbor)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-neighbor-cell)

Returns the neighboring cell to the one at coordinates `coords`, identified by the `neighbor` direction. This method takes into account the different layouts a TileMap can take.

* * *

[TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern) **get\_pattern**(coords\_array: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\]) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-pattern)

Creates and returns a new [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern) from the given array of cells. See also [set\_pattern()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-set-pattern).

* * *

[Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\] **get\_surrounding\_cells**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-surrounding-cells)

Returns the list of all neighboring cells to the one at `coords`. Any neighboring cell is one that is touching edges, so for a square cell 4 cells would be returned, for a hexagon 6 cells are returned.

* * *

[Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\] **get\_used\_cells**() const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-used-cells)

Returns a [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) array with the positions of all cells containing a tile. A cell is considered empty if its source identifier equals `-1`, its atlas coordinate identifier is `Vector2(-1, -1)` and its alternative identifier is `-1`.

* * *

[Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\] **get\_used\_cells\_by\_id**(source\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1, atlas\_coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) = Vector2i(-1, -1), alternative\_tile: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-used-cells-by-id)

Returns a [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) array with the positions of all cells containing a tile. Tiles may be filtered according to their source ( `source_id`), their atlas coordinates ( `atlas_coords`), or alternative id ( `alternative_tile`).

If a parameter has its value set to the default one, this parameter is not used to filter a cell. Thus, if all parameters have their respective default values, this method returns the same result as [get\_used\_cells()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-used-cells).

A cell is considered empty if its source identifier equals `-1`, its atlas coordinate identifier is `Vector2(-1, -1)` and its alternative identifier is `-1`.

* * *

[Rect2i](https://docs.godotengine.org/en/stable/classes/class_rect2i.html#class-rect2i) **get\_used\_rect**() const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-used-rect)

Returns a rectangle enclosing the used (non-empty) tiles of the map.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **has\_body\_rid**(body: [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-has-body-rid)

Returns whether the provided `body` [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid) belongs to one of this **TileMapLayer**'s cells.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_cell\_flipped\_h**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-is-cell-flipped-h)

Returns `true` if the cell at coordinates `coords` is flipped horizontally. The result is valid only for atlas sources.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_cell\_flipped\_v**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-is-cell-flipped-v)

Returns `true` if the cell at coordinates `coords` is flipped vertically. The result is valid only for atlas sources.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_cell\_transposed**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-is-cell-transposed)

Returns `true` if the cell at coordinates `coords` is transposed. The result is valid only for atlas sources.

* * *

[Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) **local\_to\_map**(local\_position: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-local-to-map)

Returns the map coordinates of the cell containing the given `local_position`. If `local_position` is in global coordinates, consider using [Node2D.to\_local()](https://docs.godotengine.org/en/stable/classes/class_node2d.html#class-node2d-method-to-local) before passing it to this method. See also [map\_to\_local()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-map-to-local).

* * *

[Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) **map\_pattern**(position\_in\_tilemap: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), coords\_in\_pattern: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), pattern: [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-map-pattern)

Returns for the given coordinates `coords_in_pattern` in a [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern) the corresponding cell coordinates if the pattern was pasted at the `position_in_tilemap` coordinates (see [set\_pattern()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-set-pattern)). This mapping is required as in half-offset tile shapes, the mapping might not work by calculating `position_in_tile_map + coords_in_pattern`.

* * *

[Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) **map\_to\_local**(map\_position: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-map-to-local)

Returns the centered position of a cell in the **TileMapLayer**'s local coordinate space. To convert the returned value into global coordinates, use [Node2D.to\_global()](https://docs.godotengine.org/en/stable/classes/class_node2d.html#class-node2d-method-to-global). See also [local\_to\_map()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-local-to-map).

**Note:** This may not correspond to the visual position of the tile, i.e. it ignores the [TileData.texture\_origin](https://docs.godotengine.org/en/stable/classes/class_tiledata.html#class-tiledata-property-texture-origin) property of individual tiles.

* * *

void **notify\_runtime\_tile\_data\_update**() [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-notify-runtime-tile-data-update)

Notifies the **TileMapLayer** node that calls to [\_use\_tile\_data\_runtime\_update()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-private-method-use-tile-data-runtime-update) or [\_tile\_data\_runtime\_update()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-private-method-tile-data-runtime-update) will lead to different results. This will thus trigger a **TileMapLayer** update.

**Warning:** Updating the **TileMapLayer** is computationally expensive and may impact performance. Try to limit the number of calls to this function to avoid unnecessary update.

**Note:** This does not trigger a direct update of the **TileMapLayer**, the update will be done at the end of the frame as usual (unless you call [update\_internals()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-update-internals)).

* * *

void **set\_cell**(coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), source\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = -1, atlas\_coords: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) = Vector2i(-1, -1), alternative\_tile: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) = 0) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-set-cell)

Sets the tile identifiers for the cell at coordinates `coords`. Each tile of the [TileSet](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset) is identified using three parts:

- The source identifier `source_id` identifies a [TileSetSource](https://docs.godotengine.org/en/stable/classes/class_tilesetsource.html#class-tilesetsource) identifier. See [TileSet.set\_source\_id()](https://docs.godotengine.org/en/stable/classes/class_tileset.html#class-tileset-method-set-source-id),

- The atlas coordinate identifier `atlas_coords` identifies a tile coordinates in the atlas (if the source is a [TileSetAtlasSource](https://docs.godotengine.org/en/stable/classes/class_tilesetatlassource.html#class-tilesetatlassource)). For [TileSetScenesCollectionSource](https://docs.godotengine.org/en/stable/classes/class_tilesetscenescollectionsource.html#class-tilesetscenescollectionsource) it should always be `Vector2i(0, 0)`,

- The alternative tile identifier `alternative_tile` identifies a tile alternative in the atlas (if the source is a [TileSetAtlasSource](https://docs.godotengine.org/en/stable/classes/class_tilesetatlassource.html#class-tilesetatlassource)), and the scene for a [TileSetScenesCollectionSource](https://docs.godotengine.org/en/stable/classes/class_tilesetscenescollectionsource.html#class-tilesetscenescollectionsource).


If `source_id` is set to `-1`, `atlas_coords` to `Vector2i(-1, -1)`, or `alternative_tile` to `-1`, the cell will be erased. An erased cell gets **all** its identifiers automatically set to their respective invalid values, namely `-1`, `Vector2i(-1, -1)` and `-1`.

* * *

void **set\_cells\_terrain\_connect**(cells: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\], terrain\_set: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), terrain: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), ignore\_empty\_terrains: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-set-cells-terrain-connect)

Update all the cells in the `cells` coordinates array so that they use the given `terrain` for the given `terrain_set`. If an updated cell has the same terrain as one of its neighboring cells, this function tries to join the two. This function might update neighboring tiles if needed to create correct terrain transitions.

If `ignore_empty_terrains` is `true`, empty terrains will be ignored when trying to find the best fitting tile for the given terrain constraints.

**Note:** To work correctly, this method requires the **TileMapLayer**'s TileSet to have terrains set up with all required terrain combinations. Otherwise, it may produce unexpected results.

* * *

void **set\_cells\_terrain\_path**(path: [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\], terrain\_set: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), terrain: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), ignore\_empty\_terrains: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-set-cells-terrain-path)

Update all the cells in the `path` coordinates array so that they use the given `terrain` for the given `terrain_set`. The function will also connect two successive cell in the path with the same terrain. This function might update neighboring tiles if needed to create correct terrain transitions.

If `ignore_empty_terrains` is `true`, empty terrains will be ignored when trying to find the best fitting tile for the given terrain constraints.

**Note:** To work correctly, this method requires the **TileMapLayer**'s TileSet to have terrains set up with all required terrain combinations. Otherwise, it may produce unexpected results.

* * *

void **set\_navigation\_map**(map: [RID](https://docs.godotengine.org/en/stable/classes/class_rid.html#class-rid)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-set-navigation-map)

Sets a custom `map` as a [NavigationServer2D](https://docs.godotengine.org/en/stable/classes/class_navigationserver2d.html#class-navigationserver2d) navigation map. If not set, uses the default [World2D](https://docs.godotengine.org/en/stable/classes/class_world2d.html#class-world2d) navigation map instead.

* * *

void **set\_pattern**(position: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), pattern: [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern)) [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-set-pattern)

Pastes the [TileMapPattern](https://docs.godotengine.org/en/stable/classes/class_tilemappattern.html#class-tilemappattern) at the given `position` in the tile map. See also [get\_pattern()](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-get-pattern).

* * *

void **update\_internals**() [🔗](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html#class-tilemaplayer-method-update-internals)

Triggers a direct update of the **TileMapLayer**. Usually, calling this function is not needed, as **TileMapLayer** node updates automatically when one of its properties or cells is modified.

However, for performance reasons, those updates are batched and delayed to the end of the frame. Calling this function will force the **TileMapLayer** to update right away instead.

**Warning:** Updating the **TileMapLayer** is computationally expensive and may impact performance. Try to limit the number of updates and how many tiles they impact.

[Previous](https://docs.godotengine.org/en/stable/classes/class_tilemap.html "TileMap") [Next](https://docs.godotengine.org/en/stable/classes/class_timer.html "Timer")

* * *
