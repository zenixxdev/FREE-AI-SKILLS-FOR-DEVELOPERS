---
name: "retrieval-pipeline-design"
description: "Architecting enterprise RAG pipelines with semantic document chunking, hybrid keyword/vector search, cross-encoder reranking, and citation grounding."
category: "ai"
subcategory: "rag"
language: "python"
framework: "none"
technology: "rag-pipeline"
difficulty: "advanced"
tags: ["ai", "rag", "retrieval", "hybrid-search", "reranking", "chunking", "grounding"]
---

# Retrieval-Augmented Generation (RAG) Pipeline Architecture

## Purpose
Provide AI agents with complete architecture standards for building accurate, scalable Retrieval-Augmented Generation (RAG) systems that eliminate hallucinations and provide verifiable citations.

## When to Use
Use when building enterprise knowledge base search, technical documentation Q&A, legal/compliance assistants, or customer support bots.

## Inputs / Context
Source documents (PDFs, Markdown, HTML), embedding model, vector store, search query, and LLM generator.

## Instructions
1. Document Ingestion and Semantic Chunking:
   - Never use arbitrary character-count splitting without overlap.
   - Use Document-Aware / Semantic Chunking: split on natural structural boundaries (Markdown headings `#`, `##`, paragraphs, table rows).
   - Target chunk sizes: 300 to 500 tokens with 10-15% overlap to preserve context across boundaries.
   - Preserve Metadata: Attach `source_url`, `doc_id`, `chunk_index`, `title`, and `section_header` to every chunk vector.
2. Implement Hybrid Search (Dense + Sparse):
   - Dense Retrieval (Vector): Uses embeddings (e.g., text-embedding-3) to capture high-level semantic meaning and conceptual similarity.
   - Sparse Retrieval (Keyword / BM25): Captures exact keyword matches, technical codes, product SKUs, and rare proper nouns that vector search often misses.
   - Merge results using Reciprocal Rank Fusion (RRF): `score = 1 / (60 + rank_dense) + 1 / (60 + rank_sparse)`.
3. Apply Cross-Encoder Reranking:
   - Retrieve top 25-50 candidates from hybrid search.
   - Pass query and candidate chunks through a Cross-Encoder Reranker model (e.g., Cohere Rerank or BGE-Reranker) to score true contextual relevance.
   - Take the top 3-5 reranked chunks for generation.
4. Grounded Generation and Citations:
   - Inject reranked chunks into the system prompt wrapped in `<context>` tags.
   - Instruct the generator: 'Answer ONLY based on the provided context. Attach inline citations [Source N] for every factual statement.'
   - If the answer cannot be answered from the context, instruct the model to state so explicitly.

## Constraints / Rules
- Never stuff 50 unranked raw vector search results into the prompt context; context stuffing degrades generation quality ('Lost in the Middle' phenomenon).
- Never discard document metadata during chunking.
- Avoid relying solely on vector search for queries containing exact alphanumeric identifiers (e.g., error code 'ERR_4091').

## Workflow
1. Ingest and parse raw documents into markdown representation.
2. Chunk text semantically and index into Vector DB + BM25 search.
3. On user query, execute hybrid search (Vector + BM25).
4. Merge candidates with Reciprocal Rank Fusion.
5. Rerank top 30 chunks with a Cross-Encoder down to top 5.
6. Generate grounded response with explicit citations.

## Expected Output
Modular Python RAG pipeline implementation featuring semantic chunking, hybrid BM25/vector search, cross-encoder reranking, and citation generation.

## Validation Checklist
- [ ] Are documents chunked along natural semantic boundaries with metadata?
- [ ] Is hybrid search combining dense vectors and sparse BM25 implemented?
- [ ] Are retrieved candidates reranked using a cross-encoder model?
- [ ] Does the prompt require inline citations referencing specific retrieved chunks?
- [ ] Does the system gracefully refuse to answer when context is insufficient?

## Common Mistakes & Antipatterns
- Relying exclusively on vector search for technical docs, causing searches for specific function names like `sqlite3_open_v2` to return generic SQLite overviews instead of the exact API docs.
- Splitting text mid-sentence with rigid 500-character blocks, destroying table structures and code snippets.
- Passing chunks without source metadata, making it impossible for the user to verify where the generated answer came from.

## Concrete Real-World Example
Scenario: An internal company HR policy bot provides incorrect 401(k) vesting rules because vector search retrieved a stale 2021 handbook along with the 2024 policy.
Prompt: Build a hybrid RAG pipeline with reranking and metadata filtering for this company policy assistant.
Application: The AI chunks policies by section header, filters chunks by `effective_year == 2024`, executes hybrid BM25 + embedding search, scores results with a cross-encoder reranker, and outputs the answer with clickable source references.
