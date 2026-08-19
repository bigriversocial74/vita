# Wellness AI — Build Blueprint v1.0

## Product Positioning
An AI wellness shopping and education agent. Supplements remain the primary discovery path, while the agent also connects users to dietary guidance, activities, education, and appropriate local professional/provider resources.

## Core Rule
The customer finds relevant supplements first. The agent then expands the experience into education, diet, activity, providers, challenges, and rewards. Rewards are secondary to wellness.

## Privacy Rule
Employee-assisted onboarding must never expose a customer's private wellness profile, symptoms, health data, cabinet, chat history, or recommendations to employees. The employee assists with account creation, answers platform questions, and helps with shopping. The AI conducts the private wellness screening.

## Application Areas
1. Authentication
2. Wellness Profile
3. AI Agent
4. Product Catalog
5. Health Goals → Concerns → Ingredients taxonomy
6. My Cabinet
7. Shopping Lists
8. Wellness Academy
9. Providers / Local Specialist Guide
10. Challenges / Rewards
11. Employee Training
12. Notifications / PWA
13. Affiliate Tracking
14. Knowledge Base
15. Admin Console / Admin AI

## User Navigation
- Home
- Ask AI
- My Goals
- Shop / Supplements
- My Cabinet
- Academy
- Challenges
- Local Specialists
- Rewards
- Chat History
- Profile

Persistent UI:
- Sticky AI chat footer
- Voice input
- Voice response
- New Chat
- Chat History
- Slide-out navigation

## AI Agent Tool Layer
The agent should operate through explicit tools rather than only generating text.

Core tools:
- get_wellness_profile
- update_wellness_profile
- find_goals
- find_concerns
- find_ingredients
- find_products
- compare_products
- create_shopping_list
- add_to_cabinet
- update_cabinet_usage
- calculate_remaining_supply
- create_reminder
- find_academy_content
- find_diet_guides
- find_activities
- find_local_providers
- find_local_rewards
- join_challenge
- get_chat_history
- save_memory

Destructive or account-changing operations require explicit user confirmation where appropriate.

## Wellness Profile
The AI-guided initial screening can collect:
- age / age range
- height
- activity level
- weekly activity
- workout types
- workout duration
- hobbies
- lifestyle preferences
- dietary preferences
- wellness goals
- concerns

Avoid turning this into a medical diagnosis system. The profile supports personalization and shopping/education recommendations.

## Product Relationship Model
Do not hard-code product recommendations.

Goal → Concern → Ingredient → Product

Additional mappings:
- Goal → Diet Guide
- Goal → Activity
- Goal → Academy Content
- Goal → Provider Specialty
- Goal → Challenge
- Challenge → Reward

Each relationship should support relevance/evidence metadata and administrative review.

## My Cabinet
A cabinet item stores:
- product
- quantity
- unit
- usage amount
- usage unit
- frequency
- schedule
- start date
- refill threshold
- notes

Example:
"I take three capsules on workout days."

The agent converts that into a usage rule and estimates remaining supply. PWA notifications can remind the user about doses and refills.

## Shopping
There is NO checkout/payment system in the initial release.

Instead:
- Add to Shopping List
- Add to My Cabinet
- Already Have / Use This
- Purchased / Owned state

A future checkout feature can be enabled later without redesigning the product model.

## Voice
Voice and text use the same chat engine.

Voice pipeline:
Audio → transcription → agent → response text → voice synthesis

Transcriptions are stored as part of chat history according to user privacy/retention settings.

## Proactive Agent
Event-driven recommendations:
- refill due
- dose reminder
- goal progress
- inactive challenge
- Academy follow-up
- relevant local provider
- relevant local reward
- new product/category information

Recommendations should be logged so the system can measure usefulness.

## Wellness Academy
Available to everyone.

Content tracks:
- Consumer Wellness
- Supplement Fundamentals
- Product Training
- App Training
- Privacy & Customer Assistance
- Provider Education
- Employee Certification

Structure:
Course → Module → Lesson → Quiz → Progress → Certification

## Employee Training
Employee capabilities:
- assist account signup
- explain app navigation
- answer platform questions
- assist with shopping
- complete app training
- complete supplement/product training
- complete privacy training
- practice AI-assisted customer scenarios

Employee cannot access private customer wellness data.

## Providers
Provider profiles can include:
- verified status
- specialty
- services
- location
- service area
- rewards
- challenges
- knowledge contributions

Provider knowledge is submitted → reviewed → approved → published to the AI knowledge base.

Providers cannot directly modify authoritative AI knowledge.

## Geolocation
Location is used for relevant local discovery, especially:
- specialists
- trainers
- massage therapists
- yoga studios
- wellness providers
- usable rewards

Location permission should be opt-in.

## Rewards
Rewards are connected to verified providers.

Flow:
Wellness Goal → Activity / Education → Challenge → Provider Reward

Rewards are not the primary driver of the wellness experience.

## Knowledge Base
Sources:
- platform-authored content
- approved provider contributions
- approved supplement/product information
- Academy content

Each article should support:
- source
- source URL
- status
- reviewer
- review date
- evidence metadata
- goal mappings
- concern mappings
- ingredient mappings

## Admin Console
Admin can:
- add
- edit
- delete/archive
- pause
- publish
- review
- verify
- manage relationships
- manage users/roles
- manage products
- manage ingredients
- manage goals/concerns
- manage Academy
- manage providers
- manage rewards
- manage challenges
- manage knowledge
- manage AI configuration
- inspect audit logs

## Admin AI
Admin AI is an operations assistant.

Examples:
- Find products without ingredient mappings.
- Find duplicate products.
- Find Academy lessons that need review.
- Find rewards that expired.
- Find providers whose verification expires.
- Identify common unanswered customer questions.
- Draft knowledge content for admin review.

AI can prepare changes; sensitive/destructive/publishing actions require admin confirmation.

## Core Database Domains
identity
wellness
taxonomy
catalog
knowledge
academy
agent
voice
cabinet
shopping
plans
providers
rewards
challenges
employees
notifications
events
affiliate
admin

## Data Import Strategy
The Costco catalog is an import layer, not the foundation of the application.

Later catalog population should load:
- brands
- products
- categories
- ingredients
- product_ingredients
- goal_products
- concern_products
- goal_ingredients
- concern_ingredients
- source metadata

This lets the application be built and tested before the catalog data is complete.

## Recommended Build Order
Phase 1 — Database + authentication
Phase 2 — Product/catalog engine
Phase 3 — Taxonomy and recommendation engine
Phase 4 — AI chat + memory + tools
Phase 5 — My Cabinet + usage/refill calculations
Phase 6 — PWA + notifications
Phase 7 — Academy
Phase 8 — Providers + local discovery
Phase 9 — Challenges + rewards
Phase 10 — Employee training
Phase 11 — Knowledge base
Phase 12 — Admin + Admin AI
Phase 13 — Costco catalog import
Phase 14 — QA, privacy review, permissions audit, deployment

## Critical Product Principle
The platform should feel like:

"Tell me what you are trying to improve, help me understand my options, help me find the right supplement, remember what I use, tell me when I need more, and help me build healthier habits around it."

It should NOT feel like:

"Tell me a disease and I will prescribe supplements."
