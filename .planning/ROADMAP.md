# Roadmap: Pixel

## Overview

This roadmap delivers a turn-based military production simulator in four phases. Each phase builds on the previous, starting with foundational turn-based infrastructure, then adding production chains, logistics systems, and research progression. The approach validates the core optimization loop before expanding features, following dependency ordering to prevent cascading bugs.

## Phases

**Phase Numbering:**
- Integer phases (1, 2, 3): Planned milestone work
- Decimal phases (2.1, 2.2): Urgent insertions (marked with INSERTED)

Decimal phases appear between their surrounding integers in numeric order.

- [x] **Phase 1: Foundation & Core Systems** - Turn-based infrastructure and basic gameplay loop
- [ ] **Phase 2: Economy & Production** - Multi-tier resource chains and factory management
- [ ] **Phase 3: Logistics & Supply** - Convoy system and frontline supply management
- [ ] **Phase 4: Research & Technology** - Tech tree and progression system

## Phase Details

### Phase 1: Foundation & Core Systems
**Goal**: Establish turn-based game infrastructure with save/load, event logging, and tabbed UI navigation (sandbox mode -- no victory/defeat conditions)
**Depends on**: Nothing (first phase)
**Requirements**: CORE-01, CORE-02, CORE-05, CORE-06, CORE-07, UI-01, UI-07 (CORE-03/04 deferred -- sandbox mode per context discussion)
**Success Criteria** (what must be TRUE):
  1. Player can advance turns and see turn counter increment
  2. Player can save game at any point and reload to exact state
  3. Text log displays game events each turn
  4. Menu system allows navigation between different game pages
  5. Toast notifications provide feedback for save/load/autosave actions
**Plans**: 4 plans

Plans:
- [x] 01-01-PLAN.md -- Godot project setup and autoload singletons (GameState, GameEvents, SaveManager, SaveGame)
- [x] 01-02-PLAN.md -- Main UI framework with MenuBar, TabContainer, and turn counter display
- [x] 01-03-PLAN.md -- Event log panel and toast notification system
- [x] 01-04-PLAN.md -- Save/load event log persistence, integration testing, and visual verification

### Phase 2: Economy & Production
**Goal**: Complete production chain system with resource extraction, factories, and multi-tier chains
**Depends on**: Phase 1
**Requirements**: ECON-01, ECON-02, ECON-03, ECON-04, ECON-05, ECON-06, ECON-07, ECON-08, UI-02, UI-03, UI-06
**Success Criteria** (what must be TRUE):
  1. Player can extract raw materials from map-based resource nodes
  2. Player can place factories on grid-based map
  3. Factories consume input resources and produce output products each turn
  4. Production chains transform raw materials into finished goods (2-tier minimum)
  5. Resource inventory displays all 5-10 resource types with current quantities and storage capacity
  6. Player can see which factories are active and what they're producing
**Plans**: TBD

Plans:
- (Plans will be created during phase planning)

### Phase 3: Logistics & Supply
**Goal**: Implement convoy system to transport supplies from production to strategic frontline
**Depends on**: Phase 2
**Requirements**: LOGI-01, LOGI-02, LOGI-03, LOGI-04, LOGI-05, LOGI-06, UI-05
**Success Criteria** (what must be TRUE):
  1. Strategic map displays frontline location and supply status
  2. Player can create convoys and assign them to transport specific resources
  3. Convoys successfully deliver supplies to frontline each turn (deterministic delivery)
  4. Frontline supply levels visibly affect combat outcomes
  5. Player can view convoy status and frontline supply inventory
**Plans**: TBD

Plans:
- (Plans will be created during phase planning)

### Phase 4: Research & Technology
**Goal**: Add research system with tech tree that unlocks production and logistics improvements
**Depends on**: Phase 3
**Requirements**: RSRCH-01, RSRCH-02, RSRCH-03, RSRCH-04, RSRCH-05, RSRCH-06, RSRCH-07, UI-04
**Success Criteria** (what must be TRUE):
  1. Player can view tech tree showing 5-10 technologies and their dependencies
  2. Research points generate from production activities each turn
  3. Player can select which technology to research next
  4. Research progresses automatically each turn when active
  5. Completed technologies unlock new production capabilities or logistics improvements
  6. Player can see current research progress and available technologies
**Plans**: TBD

Plans:
- (Plans will be created during phase planning)

## Progress

**Execution Order:**
Phases execute in numeric order: 1 → 2 → 3 → 4

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1. Foundation & Core Systems | 4/4 | Complete | 2026-01-31 |
| 2. Economy & Production | 0/TBD | Not started | - |
| 3. Logistics & Supply | 0/TBD | Not started | - |
| 4. Research & Technology | 0/TBD | Not started | - |

---
*Roadmap created: 2026-01-31*
*Last updated: 2026-01-31*
