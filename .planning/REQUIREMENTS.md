# Requirements: Pixel

**Defined:** 2026-01-31
**Core Value:** Strategic optimization of production chains and logistics to supply military operations

## v1 Requirements

Requirements for proof of concept release. Each maps to roadmap phases.

### Core Systems

- [x] **CORE-01**: Game runs in turn-based mode with end turn button
- [x] **CORE-02**: Turn counter displays current turn number
- [ ] **CORE-03**: Victory condition based on quota (deliver X units in Y turns)
- [ ] **CORE-04**: Defeat condition triggers when failing to meet quotas
- [x] **CORE-05**: Basic UI feedback via text log showing production and delivery events
- [x] **CORE-06**: Manual save game functionality
- [x] **CORE-07**: Load saved game functionality

### Economy

- [ ] **ECON-01**: Resource extraction from map nodes (mines for raw materials)
- [ ] **ECON-02**: Resource inventory tracking per resource type
- [ ] **ECON-03**: 2-tier production chains (raw materials → finished products)
- [ ] **ECON-04**: Factory placement on grid-based map
- [ ] **ECON-05**: Factories consume input resources to produce output products
- [ ] **ECON-06**: Production occurs during turn resolution phase
- [ ] **ECON-07**: 5-10 resource types (steel, oil, electronics, etc.)
- [ ] **ECON-08**: Resource storage capacity tracking

### Logistics

- [ ] **LOGI-01**: Single strategic frontline displayed on map
- [ ] **LOGI-02**: Convoy system to transport supplies from production to frontline
- [ ] **LOGI-03**: Deterministic convoy delivery (convoys always succeed)
- [ ] **LOGI-04**: Supply tracking at frontline (shows what's been delivered)
- [ ] **LOGI-05**: Player can order convoys to specified supply station
- [ ] **LOGI-06**: Frontline supply affects combat outcomes

### Research

- [ ] **RSRCH-01**: Research system with 5-10 technologies
- [ ] **RSRCH-02**: Tech tree UI showing technology dependencies
- [ ] **RSRCH-03**: Technologies unlock new production capabilities
- [ ] **RSRCH-04**: Technologies unlock logistics improvements
- [ ] **RSRCH-05**: Research points generated from production activities
- [ ] **RSRCH-06**: Player can select next technology to research
- [ ] **RSRCH-07**: Research progresses each turn

### Map & UI

- [x] **UI-01**: Strategic map view showing territory and frontline
- [ ] **UI-02**: Factory management page/overlay
- [ ] **UI-03**: Resource tracking display
- [ ] **UI-04**: Research management page/overlay
- [ ] **UI-05**: Convoy/logistics management page/overlay
- [ ] **UI-06**: Grid-based factory placement interface
- [x] **UI-07**: Menu system for switching between pages

## v2 Requirements

Deferred to future release. Tracked but not in current roadmap.

### Production Depth

- **ECON-09**: 3-tier production chains (raw → intermediate → finished)
- **ECON-10**: Production queues (queue 3-5 items per factory)
- **ECON-11**: Production priority system for resource allocation
- **ECON-12**: Bottleneck visualization showing throughput issues

### Logistics Expansion

- **LOGI-07**: Multi-front strategic map (2-3 theaters)
- **LOGI-08**: Convoy risk/loss simulation based on route danger
- **LOGI-09**: Advanced convoy routing with waypoints
- **LOGI-10**: Per-theater resource requirements

### Polish

- **CORE-08**: Autosave functionality
- **CORE-09**: Interactive tutorial system
- **CORE-10**: Factory damage from frontline outcomes
- **CORE-11**: Factory repair mechanics
- **UI-08**: Advanced UI with progressive disclosure
- **UI-09**: Historical production metrics and graphs

### AI

- **AI-01**: More sophisticated AI behavior patterns
- **AI-02**: AI tech progression and counter-research
- **AI-03**: Dynamic frontline pressure based on AI state

## Out of Scope

Explicitly excluded. Documented to prevent scope creep.

| Feature | Reason |
|---------|--------|
| Real-time gameplay | Turn-based is core to manageable complexity and strategic depth |
| Multiplayer/competitive modes | Technical complexity diverts from single-player core validation |
| Full AI economic simulation | Focus is player's production challenge, not enemy detail |
| 3D graphics/visualization | 2D icons/text sufficient for proof of concept |
| Complete convoy automation | Logistics management IS the core gameplay |
| Perfect information hiding | Complexity not needed for v1 optimization focus |
| Campaign/story mode | Sandbox validates core loop before structured content |
| Extensive tutorial | Minimal onboarding sufficient for PoC, full tutorial deferred |
| Mobile/web versions | PC desktop focus for v1 |
| Modding/plugin system | Premature for proof of concept |

## Traceability

Which phases cover which requirements. Updated during roadmap creation.

| Requirement | Phase | Status |
|-------------|-------|--------|
| CORE-01 | Phase 1 | Pending |
| CORE-02 | Phase 1 | Pending |
| CORE-03 | Phase 1 | Pending |
| CORE-04 | Phase 1 | Pending |
| CORE-05 | Phase 1 | Pending |
| CORE-06 | Phase 1 | Pending |
| CORE-07 | Phase 1 | Pending |
| UI-01 | Phase 1 | Pending |
| UI-07 | Phase 1 | Pending |
| ECON-01 | Phase 2 | Pending |
| ECON-02 | Phase 2 | Pending |
| ECON-03 | Phase 2 | Pending |
| ECON-04 | Phase 2 | Pending |
| ECON-05 | Phase 2 | Pending |
| ECON-06 | Phase 2 | Pending |
| ECON-07 | Phase 2 | Pending |
| ECON-08 | Phase 2 | Pending |
| UI-02 | Phase 2 | Pending |
| UI-03 | Phase 2 | Pending |
| UI-06 | Phase 2 | Pending |
| LOGI-01 | Phase 3 | Pending |
| LOGI-02 | Phase 3 | Pending |
| LOGI-03 | Phase 3 | Pending |
| LOGI-04 | Phase 3 | Pending |
| LOGI-05 | Phase 3 | Pending |
| LOGI-06 | Phase 3 | Pending |
| UI-05 | Phase 3 | Pending |
| RSRCH-01 | Phase 4 | Pending |
| RSRCH-02 | Phase 4 | Pending |
| RSRCH-03 | Phase 4 | Pending |
| RSRCH-04 | Phase 4 | Pending |
| RSRCH-05 | Phase 4 | Pending |
| RSRCH-06 | Phase 4 | Pending |
| RSRCH-07 | Phase 4 | Pending |
| UI-04 | Phase 4 | Pending |

**Coverage:**
- v1 requirements: 35 total
- Mapped to phases: 35/35 (100%)
- Unmapped: 0

---
*Requirements defined: 2026-01-31*
*Last updated: 2026-01-31 after roadmap creation*
