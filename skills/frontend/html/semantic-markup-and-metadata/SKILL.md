---
name: "semantic-markup-and-metadata"
description: "Authoring standards-compliant, semantic HTML5 document structures with robust Open Graph, Twitter Cards, JSON-LD structured data, and accessibility landmarks."
category: "frontend"
subcategory: "html"
language: "html"
framework: "none"
technology: "html5"
difficulty: "beginner"
tags: ["frontend", "html", "semantic-html", "seo", "open-graph", "structured-data", "metadata"]
---

# Semantic HTML5 Architecture and Document Metadata

## Purpose
Instruct AI agents to generate structured, accessible, and search-optimized HTML documents adhering to W3C specifications and modern search engine indexing standards.

## When to Use
Use when creating base page templates, public marketing pages, blog post layouts, or refactoring tag-soup markup dominated by generic <div> and <span> elements.

## Inputs / Context
Document content hierarchy, page title, canonical URL, social share assets, and primary entities represented on the page.

## Instructions
1. Structure root document using correct doctype (`<!DOCTYPE html>`), valid `lang` attribute on `<html>`, and essential `<head>` metadata (`charset="utf-8"`, viewport meta, canonical link).
2. Utilize native HTML5 structural landmarks: `<header>`, `<nav>`, `<main>`, `<article>`, `<section>`, `<aside>`, and `<footer>`.
3. Restrict each document to exactly one `<h1>` element representing the primary topic of the page; maintain strict linear heading hierarchy (`h2` followed by `h3`, never skipping levels).
4. Integrate complete Open Graph (`og:title`, `og:description`, `og:image`, `og:url`, `og:type`) and Twitter Card (`twitter:card`, `twitter:site`) meta tags.
5. Embed Schema.org JSON-LD structured data (`<script type="application/ld+json">`) for rich snippets (e.g., Article, Organization, BreadcrumbList, SoftwareApplication).
6. Ensure all media elements (`<img>`, `<video>`, `<audio>`) include descriptive `alt` attributes or appropriate accessibility fallback attributes (`aria-hidden="true"` for decorative graphics).
7. Optimize resource hints: use `rel="preconnect"` and `rel="dns-prefetch"` for critical third-party domains, and `rel="preload"` for primary above-the-fold fonts/images.

## Constraints / Rules
- Never nest `<main>` inside `<article>`, `<section>`, or `<nav>`; a document must have only one visible `<main>` landmark.
- Do not use `<div>` or `<span>` when a semantic native element (`<button>`, `<dialog>`, `<details>`, `<summary>`, `<time>`) exists.
- Never omit the `alt` attribute on `<img>` tags.

## Workflow
1. Define document metadata and social graph configuration.
2. Outline page content into semantic landmarks (`nav`, `main`, `aside`, `footer`).
3. Construct the content hierarchy within `<main>` using heading tags and semantic sectioning.
4. Inject structured JSON-LD schema matching page content.
5. Validate via W3C Nu HTML Checker and Google Rich Results Test standards.

## Expected Output
Clean, standards-compliant HTML5 document template with complete head metadata, Schema.org JSON-LD markup, and native landmark structure.

## Validation Checklist
- [ ] Does the document contain exactly one `<h1>`?
- [ ] Are headings nested sequentially without skipping levels?
- [ ] Are native landmarks (`main`, `nav`, `header`, `footer`) properly structured?
- [ ] Does the document include valid Open Graph and canonical tags?
- [ ] Is Schema.org JSON-LD embedded and syntactically valid JSON?

## Common Mistakes & Antipatterns
- Building clickable cards using `<div>` with `onClick` instead of an accessible anchor tag `<a>` or `<button>`.
- Using `<section>` as a generic styling wrapper instead of a thematic grouping with its own heading.
- Skipping heading levels (e.g., jumping directly from `<h1>` to `<h3>` for styling purposes).

## Concrete Real-World Example
Scenario: Refactoring a generic React landing page composed entirely of nested `div` containers and missing meta tags.
Prompt: Convert this landing page structure into semantic HTML5 with complete SEO and social metadata.
Application: The AI wraps navigation in `<nav>`, main content in `<main>`, product features in `<section>` with `<h2>` headers, customer quotes in `<figure>` and `<blockquote>`, adds JSON-LD Organization schema, and populates Open Graph tags.
