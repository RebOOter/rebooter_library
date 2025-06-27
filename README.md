# Rebooter Library (RL)

A utility library for Dwarf Fortress DFHack scripts that provides various helper functions for item management, unit tracking, job creation, and stockpile management.

## Table of Contents

- [Lua Utilities](#lua-utilities)
- [Logging Utilities](#logging-utilities)
- [Item Processing](#item-processing)
- [Jobs Processing](#jobs-processing)
- [Building Processing](#building-processing)
- [Units Processing](#units-processing)
- [DFHack Utilities](#dfhack-utilities)

## Lua Utilities

Utility functions for working with Lua tables and values.

### `RL.get_keys_as_strings(tbl)`
Converts all keys in a table to string representations and returns them as an array.

### `RL.check_if_any(tbl, value)`
Checks if any element in the table matches the given value.

### `RL.check_all_same(tbl, value)`
Checks if all elements in the table match the given value. Returns false if table is empty.

### `RL.make_all_keys_lower(tbl)`
Returns a new array with all elements converted to lowercase.

### `RL.count_table(table)`
Counts the number of entries in a table.

## Logging Utilities

### `RL.print_log_mod(key, message)`
Prints a formatted log message with a key prefix.

## Item Processing

Functions for identifying and processing different types of items.

### Material Identification Functions

- `RL.isRefuseBodyPart(item)` - Checks if item is a refuse body part (scale, feather, cartilage, claw, nerve)
- `RL.isTooth(item)` - Checks if item is a tooth
- `RL.isSkull(item)` - Checks if item is a skull
- `RL.isBone(item)` - Checks if item is a bone
- `RL.isShell(item)` - Checks if item is a shell
- `RL.isHorn(item)` - Checks if item is a horn
- `RL.isHoof(item)` - Checks if item is a hoof
- `RL.isHair(item)` - Checks if item is hair
- `RL.isWool(item)` - Checks if item is wool

### Stockpile Item Storage

#### `RL.isItemCouldBeStored(item, stockpile)`
Checks if an item could be stored in the specified stockpile and returns coordinates where to put this item. Does not check quality filters of the stockpile. Time-consuming operation because of a lot of ifs.

## Jobs Processing

Functions for creating and managing jobs and laborers.

### `RL.isCoordUsedByOtherJobs(coord)`
Checks if coordinates are already targeted by other jobs.

### `RL.unitIsAvailable(unit)`
Checks if a unit is available for a job (not currently working, not caged or chained, not in active military duty).

### `RL.availableLaborer(unit, unit_labor, workshop, burrow)`
Checks if a unit has the specified labor enabled, is available, can access the building, and is assigned to the given burrow.

### `RL.findAvailableLaborer(workshop, burrow)`
Finds a citizen who can perform work at the specified workshop and is assigned to the given burrow.

### `RL.itemHasJob(item)`
Checks if an item already has a job attached to it.

### `RL.createJobAndAssignUnit(job_type, job_pos, building, burrow, item)`
Creates a job of the specified type at the given position, linked to the building, for the item, and assigns an available unit to it. If there's a wheelbarrow, use it to bring the item.

## Building Processing

Functions for working with buildings, especially stockpiles.

### `RL.collectAllTiles(building)`
Collects all map tiles occupied by a building.

### `RL.findAnyTile(building)`
Finds any tile occupied by a building.

### `RL.findWheelbarrow(stockpile)`
Finds an available wheelbarrow assigned to a stockpile.

### `RL.stockpileHasFreeTile(stockpile)`
Checks if a stockpile has any free tiles without items or pending jobs. Could be use to store items that should occupy the whole tile.


### `RL.stockpileHasAnyAvailableSpace(stockpile)`
Checks if a stockpile has both free tiles and is configured to accept any materials.

## Units Processing

Functions for managing and inspecting units (dwarves, animals, etc).

### `RL.canAccessBuilding(unit, building)`
Checks if a unit can path to a building.

### `RL.isAssignedToBurrow(unit, burrow)`
Checks if a unit is assigned to a specified burrow.

### `RL.collectDeathReason(unit)`
Returns the cause of death and killer name (if applicable) for a dead unit.

## DFHack Utilities

Miscellaneous utilities for debugging and UI display.

### `RL.printall_error(table)`
Prints all elements of a table in a safe way to the stderr.log file. Useful for debugging.

### `RL.split_text_with_newlines(text, max_len, color)`
Splits text into lines of a maximum length with color formatting for UI display.

### `RL.count_lines(text_chunk)`
Counts the number of lines in a text chunk for UI layout purposes.
