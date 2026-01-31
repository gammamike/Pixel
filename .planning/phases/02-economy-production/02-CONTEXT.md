# Phase 2: Economy & Production - Context

**Gathered:** 2026-01-31
**Status:** Ready for planning

<domain>
## Phase Boundary

Production chain system where players extract resources from map nodes, place factories on a strategic grid, and convert extracted resources into military equipment. Extraction produces finished goods (resources), and factories combine multiple resources to create military equipment for the frontline.

**Simplified 2-tier chain:** Extraction Camps → Resources (finished goods) → Factories → Military Equipment

</domain>

<decisions>
## Implementation Decisions

### Resource Extraction Mechanics
- **Resource distribution**: Each map tile contains 1-3 resource types with quality levels (+, ++, +++)
- **Quality system**: Quality affects extraction efficiency - + = 1x, ++ = 1.5x, +++ = 2x production rate
- **Visibility**: Resource types and quality levels visible on tiles before placing extractors
- **Extraction method**: Players build "Extraction Camp" buildings on tiles to extract resources
- **Extractor scope**: One extraction camp per tile extracts ALL 1-3 resources present on that tile
- **Depletion**: Resources never deplete - quality determines ongoing extraction efficiency
- **Extractor types**: Universal "Extraction Camp" building for all resource types (not resource-specific buildings)

### Factory Placement & Grid System
- **Grid integration**: Factories and extraction camps share same strategic map grid (unified grid)
- **Tile stacking**: Multiple buildings can be placed on the same tile
- **Map size**: Large strategic map (40x40+ tiles)
- **Navigation**: Both pan/drag and minimap for navigating large map
- **Construction costs**: Buildings require resources to construct
- **Construction time**: Buildings take multiple turns to complete (not instant)
- **Demolition**: Players can demolish buildings anytime for full flexibility

### Production Chain Design
- **Chain structure**: Extraction Camps produce resources (finished goods) → Factories convert resources into military equipment
- **Recipe complexity**: Factories combine multiple resources (2-3 inputs) to produce one equipment type
- **Recipe visibility**: All production recipes shown upfront to players before building
- **Factory variety**: Few factory types for Phase 2 (2-3 types total) - proof of concept
- **Resource shortage handling**: Factories use partial production - produce reduced output with whatever resources are available
- **Production efficiency**: Simplified for Phase 2 - all factories run at fixed 100% efficiency (no ramp-up)
- **Resource routing**: Factories auto-pull resources from global inventory (no manual assignment)
- **Production visibility**: Both map indicators (icon/badge on factory tile) AND detailed panels show what's being produced

### Resource Inventory & UI
- **Display location**: Both top bar (always visible) AND detailed panel in Factories tab
- **Top bar display**: Shows just current count for each resource type (simple, clean)
- **Storage limits**: Per-resource capacity limits (each resource has its own max storage)
- **Detailed panel**: Visual bars/graphs showing storage fill and production/consumption rates

### Claude's Discretion
- Specific 5-10 resource types to include (military-industrial appropriate)
- Exact 2-3 factory types and their recipes
- Tile stacking visualization method (icons, overlay, cycling)
- Construction time durations for buildings
- Specific demolition refund policy (full/partial/no refund)
- Exact visual style for extraction camps and factories (detailed sprites/tiles)
- Minimap design and pan controls implementation
- Resource bar/graph visual design in detailed panel

</decisions>

<specifics>
## Specific Ideas

- **Inspiration**: Production efficiency ramp-up system inspired by Hearts of Iron 4 (factories start low efficiency, ramp to cap over time) - DEFERRED to Phase 4 (Research), Phase 2 uses fixed efficiency
- **Visual style**: Extraction camps and factories should use detailed sprites/tiles (not simple icons)
- **Map navigation**: Full navigation suite for 40x40+ map - both pan/drag and minimap click-to-jump

</specifics>

<deferred>
## Deferred Ideas

- **Specific extractor types** (mine for iron, well for oil, etc.) - noted for future enhancement, Phase 2 uses universal Extraction Camp
- **Production efficiency ramp-up system** - Factories starting at low efficiency and ramping up over time, with upgradeable caps through research - deferred to Phase 4 (Research & Technology)
- **Factory upgrades** - deferred to Phase 4 along with efficiency system

</deferred>

---

*Phase: 02-economy-production*
*Context gathered: 2026-01-31*
