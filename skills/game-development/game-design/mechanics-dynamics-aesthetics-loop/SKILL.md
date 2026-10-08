---
name: "mechanics-dynamics-aesthetics-loop"
description: "Designing compelling game loops and player progression systems using the Mechanics-Dynamics-Aesthetics (MDA) framework, flow channels, and economy balancing."
category: "game-development"
subcategory: "game-design"
language: "agnostic"
framework: "none"
technology: "game-design-framework"
difficulty: "intermediate"
tags: ["game-development", "game-design", "mda-framework", "core-loop", "player-progression", "balancing"]
---

# Game Design Mechanics-Dynamics-Aesthetics (MDA) and Core Loops

## Purpose
Provide AI agents with structured game design methodology to architect engaging core gameplay loops, player progression mechanics, and balanced game economies.

## When to Use
Use when designing game design documents (GDD), conceptualizing gameplay loops, tuning player difficulty curves, or designing reward economies.

## Inputs / Context
Game genre, target player emotional aesthetic (challenge, fantasy, fellowship, discovery), platform, and session length target.

## Instructions
1. Apply the MDA Framework:
   - Mechanics: The formal rules, mathematical systems, actions, and algorithms (e.g., jump height, health points, dice rolls).
   - Dynamics: The run-time behaviors that emerge when players interact with the mechanics (e.g., aggressive flanking, resource hoarding, bidding wars).
   - Aesthetics: The emotional experiences evoked in the player (e.g., Sensation, Fantasy, Narrative, Challenge, Fellowship, Discovery, Expression, Submission).
   - Design from Aesthetics to Mechanics; analyze from Mechanics to Aesthetics.
2. Construct the Nested Core Loop:
   - Primary Loop (Seconds): Moment-to-moment action (e.g., Aim -> Shoot -> Dodge).
   - Secondary Loop (Minutes): Objective fulfillment (e.g., Clear Room -> Loot Chest -> Reach Checkpoint).
   - Tertiary Loop (Hours/Days): Long-term progression (e.g., Level Up -> Upgrade Gear -> Unlock New Biomes).
3. Maintain Csikszentmihalyi's Flow Channel:
   - Balance Challenge Level vs. Player Skill Level.
   - If Challenge > Skill: Player experiences Anxiety and Frustration.
   - If Skill > Challenge: Player experiences Boredom.
   - Implement dynamic difficulty adjustments, skill checkpoints, and progressive mechanics introduction.
4. Design Balanced Game Economies:
   - Explicitly define Faucets (sources that generate currency/resources) and Sinks (mechanics that permanently consume resources).
   - If Faucets > Sinks: Hyperinflation occurs, rendering progression trivial.
   - If Sinks > Faucets: Player progress stalls into a punitive grind.

## Constraints / Rules
- Never introduce new mechanics without an introductory tutorial or safe experimentation space.
- Avoid designing reward economies with infinite resource generation and no sink mechanisms.
- Do not confuse game mechanics (rules) with player dynamics (emergent behavior).

## Workflow
1. Define target aesthetic emotional response.
2. Map the 3-tier nested core loop (seconds, minutes, hours).
3. Specify formal mechanics and rule equations.
4. Model the resource economy (faucets, converters, sinks).
5. Chart the difficulty progression against the flow channel.

## Expected Output
Comprehensive Game Design Document (GDD) section detailing the core loop diagram, MDA breakdown, economy faucet/sink balance, and progression curve.

## Validation Checklist
- [ ] Are primary, secondary, and tertiary core loops clearly mapped?
- [ ] Are target aesthetic emotions identified using MDA?
- [ ] Is the resource economy balanced with proportional faucets and sinks?
- [ ] Does difficulty scale in proportion to expected player skill progression?
- [ ] Are emergent dynamics anticipated and bounded?

## Common Mistakes & Antipatterns
- Creating a game with only a primary loop (shooting) but no secondary or tertiary loops, causing players to lose interest after 5 minutes due to lack of purpose.
- Flooding the player with gold rewards without adding meaningful high-value sinks, destroying the late-game economy.
- Introducing 15 complex controls in the first 30 seconds of gameplay, spiking cognitive load and triggering player abandonment.

## Concrete Real-World Example
Scenario: A roguelike deckbuilder game feels addictive in the first 10 minutes but becomes trivial and boring after the player collects high-damage cards.
Prompt: Analyze and re-balance this roguelike deckbuilder's core loop and economy using the MDA framework.
Application: The AI diagnoses an economy imbalance where damage scaling (faucet) vastly exceeds monster health growth (sink), designs diminishing returns on card upgrades, introduces situational enemy resistances to demand varied deck strategies, and re-establishes the flow channel.
