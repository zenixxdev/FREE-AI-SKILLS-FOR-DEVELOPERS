---
name: "websocket-and-reconnection"
description: "Building resilient, bidirectional WebSocket communication channels with application-level ping/pong heartbeats, exponential backoff reconnection, and message acknowledgments."
category: "api"
subcategory: "websocket"
language: "typescript"
framework: "none"
technology: "websocket"
difficulty: "intermediate"
tags: ["api", "websocket", "real-time", "heartbeat", "reconnection", "networking"]
---

# WebSocket Architecture with Heartbeats and Reconnection

## Purpose
Instruct AI agents to implement production-grade WebSocket client and server architectures that detect silent connection drops, reconnect automatically, and prevent message loss.

## When to Use
Use when building real-time chat, collaborative document editing, live notification feeds, financial tickers, or multiplayer game state synchronization.

## Inputs / Context
Message protocol format, heartbeat interval (e.g., 30s), reconnection policy, and authentication mechanism.

## Instructions
1. Implement an application-level Heartbeat (Ping/Pong) mechanism:
   - Server sends periodic `ping` frames or messages every N seconds (e.g., 30s).
   - Client responds with `pong`.
   - If no pong or activity is received within a timeout window (e.g., 10s after ping), terminate the dead socket (`socket.terminate()`) to clean up server resources.
2. Authenticate WebSocket connections during the initial HTTP upgrade handshake: validate session cookie or short-lived signed ticket; never pass static API secrets in WebSocket URLs.
3. Build resilient client-side reconnection logic:
   - Never reconnect immediately on close; use Jittered Exponential Backoff (e.g., 1s, 2s, 4s, 8s up to 30s max delay).
   - Reset backoff delay only after a connection has remained established and stable for at least 10 seconds.
4. Implement Message Acknowledgments (ACKs) with unique sequence IDs (`msgId`) to guarantee delivery of critical events.
5. Buffer outbound messages during transient disconnections up to a bounded queue limit (e.g., 100 messages), dropping oldest non-essential telemetry if overflow occurs.
6. Support multi-node horizontal scaling using Redis Pub/Sub or a message broker to broadcast messages across server instances.

## Constraints / Rules
- Never trust the TCP connection to close cleanly; mobile clients frequently drop connections silently without sending FIN/RST packets.
- Avoid reconnecting with a static delay, which creates a stampede on the server during restarts.
- Do not buffer unbounded numbers of messages in memory while disconnected.

## Workflow
1. Set up WebSocket server with upgrade authentication hook.
2. Implement server-side ping interval and dead-socket reaper loop.
3. Build client WebSocket wrapper with state machine (CONNECTING, OPEN, CLOSING, CLOSED, RECONNECTING).
4. Add jittered backoff reconnection and message queueing.
5. Test behavior under simulated airplane mode and network latency.

## Expected Output
Robust WebSocket client and server implementation featuring heartbeat timers, authenticated handshakes, jittered reconnection, and ACK message queues.

## Validation Checklist
- [ ] Are silent connection drops detected and reaped within timeout bounds?
- [ ] Does client reconnection use exponential backoff with randomized jitter?
- [ ] Is authentication validated during the initial HTTP upgrade request?
- [ ] Are outbound message queues bounded to prevent memory exhaustion?
- [ ] Does the server scale horizontally across multiple instances using pub/sub?

## Common Mistakes & Antipatterns
- Relying on TCP keepalive alone, which can take over 2 hours on mobile operating systems to detect an abruptly severed connection.
- Reconnecting in a tight infinite loop (`onclose = () => connect()`), instantly crashing the server with thousands of reconnect requests during a brief network hiccup.
- Passing sensitive auth tokens in WebSocket query strings (`ws://example.com?token=xyz`), exposing them in access logs and browser histories.

## Concrete Real-World Example
Scenario: A financial trading terminal loses real-time quote updates silently when users switch Wi-Fi networks, showing stale prices without warning.
Prompt: Implement a resilient WebSocket client wrapper with heartbeat monitoring and automatic reconnection.
Application: The AI authors a `ResilientWebSocket` class that sends periodic pings, detects missing pongs within 5 seconds, triggers an immediate teardown, transitions UI to 'Reconnecting...', and executes exponential backoff reconnection with message queue flushing.
