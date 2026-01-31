# Pixel

## What This Is

A turn-based military production simulator where you manage a nation's industrial economy during wartime. Focus is on optimizing factory production, resource chains, technology research, and logistics to supply multiple frontlines. PC desktop game built in Godot with clean icon and text-based interface.

## Core Value

The strategic optimization of production chains and logistics - managing factories efficiently, balancing resource allocation, and ensuring frontlines stay supplied while racing to develop superior technology.

## Requirements

### Validated

(None yet — ship to validate)

### Active

- [ ] Multi-stage resource economy (raw materials → refined goods → military products)
- [ ] Factory management system (set production quotas, allocate resources to factories)
- [ ] 5-10 key resource types (steel, oil, electronics, etc.)
- [ ] Build new facilities (mines, refineries, factories) at map locations
- [ ] Strategic map showing multiple countries and active frontlines
- [ ] Convoy/logistics system to transport supplies from production to frontlines
- [ ] Research system with tech tree (mix of unit upgrades and new unit types)
- [ ] Turn-based gameplay loop (issue orders → resolve turn → see results)
- [ ] Combat resolution based on supply levels + tech quality + unit quantities (probability-based)
- [ ] Basic AI enemies with abstracted strength (simple behavior patterns)
- [ ] Menu/form-based UI overlaying strategic map (pages for factories, resources, research, logistics)
- [ ] Simple icon and text-based graphics
- [ ] Start as established nation with existing infrastructure
- [ ] Sandbox mode (no campaign structure for v1)

### Out of Scope

- Overly complex resource chains (50+ materials) — keeping it manageable with 5-10 key types
- Constant micromanagement of individual units — high-level orders only
- Full economic simulation for AI enemies — abstracted for v1, focus on player experience
- Campaign mode with story/missions — sandbox first to validate core loop
- Multiplayer functionality — single-player proof of concept
- Advanced graphics, animations, or cinematics — simple and clean
- Extensive tutorial system — proof of concept phase
- Mobile or web versions — PC desktop only for v1
- Direct tactical combat control — strategic level only
- Real-time gameplay — turn-based for manageable complexity

## Context

This game focuses on the production and logistics aspects of grand strategy games (similar to Hearts of Iron's industrial management) while stripping away the tactical combat complexity. The player enjoys optimizing supply chains and resource allocation under pressure from multiple war fronts.

Starting as an established nation means the player inherits existing infrastructure and can immediately focus on optimization and strategic decisions rather than building everything from scratch.

The proof of concept goal is to validate whether the core gameplay loop (manage production → allocate resources → research tech → supply fronts → resolve combat → iterate) is engaging and fun before investing in polish, content, or advanced features.

## Constraints

- **Platform**: PC desktop application — Godot Engine for native builds
- **Scope**: Proof of concept — focus on core mechanics, minimal polish
- **Graphics**: Simple icons and text-based UI — no complex art requirements
- **Complexity**: 5-10 resource types maximum — avoid overwhelming micromanagement while maintaining strategic depth
- **Tech Stack**: Godot Engine chosen for strong UI system, turn-based game support, and accessible GDScript language

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Godot Engine | Free, excellent UI system for menu-heavy interface, good for turn-based games, accessible scripting | — Pending |
| Turn-based gameplay | Fits management focus better than real-time, reduces implementation complexity | — Pending |
| Abstracted AI enemies | Keep focus on player's production challenge, avoid simulating full enemy economies | — Pending |
| Multi-stage production chains | Creates meaningful optimization puzzle, more realistic than direct resource-to-product | — Pending |
| Sandbox mode for v1 | Faster to prototype than campaign structure, easier to iterate on core mechanics | — Pending |
| Established nation start | Player can immediately engage with optimization rather than lengthy build-up phase | — Pending |
| Menu/form-based UI | Matches management focus, easier to implement than complex map interactions | — Pending |

---
*Last updated: 2026-01-31 after initialization*
