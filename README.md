# BidHub — Irish Local Auction Platform

## Team Members

| # | Name | Student ID | Role |
|---|------|------------|------|
| 1 | Mykola Vaskevych | 22372199 | Full Stack Dev & QA |
| 2 | Xunze Tan | 24247472 | Leader & Full Stack Dev |
| 3 | Zitao Zhang | 24247464 | Full Stack Dev |
| 4 | Zihan Zhuo | 24247456 | Frontend Dev |
| 5 | Oliver Fitgerald | 22365958 | Full Stack Dev |

**Communication channels:**

- **WhatsApp** — primary team communication, daily standups, scheduling
- **GitHub Issues** — task tracking, bug reports, feature requests
- **GitHub Projects** — sprint planning and progress tracking
- **GitHub Pull Requests** — code reviews and technical discussions

## Application Scenario

### Problem Statement

Irish classifieds platforms such as adverts.ie and DoneDeal rely exclusively on fixed-price listings. While adverts.ie serves over 1 million users with 850K+ active listings, the platform suffers from well-documented pain points:

- **Scams and fraud** — no built-in trust mechanism; buyers and sellers must rely on good faith
- **No price discovery** — sellers guess a price and hope for the best; buyers have no way to negotiate transparently
- **Stale listings** — items sit unsold for weeks or months with no expiry pressure
- **Pricing uncertainty** — sellers frequently overprice or underprice because there is no market signal
- **Low buyer engagement** — fixed prices offer no interactive or competitive buying experience

Despite these issues, **no auction-based alternative exists in the Irish market**. eBay serves a global audience but lacks local focus, and no platform combines auction mechanics with the local, community-driven feel of Irish classifieds.

### Proposed Solution — BidHub

**BidHub** is a web-based auction platform designed specifically for the Irish market. Instead of fixed prices, competitive bidding determines fair market value transparently.

Key features:

- **Time-limited auctions** (1–7 days) keep the marketplace fresh — no stale listings
- **Competitive bidding** lets the market decide fair value, removing pricing guesswork
- **Bidding activity as a trust signal** — multiple bidders on an item indicate legitimacy and desirability
- **Wallet system** with transparent transaction history for all purchases and sales
- **Buy-now option** for buyers who want an instant purchase at a fixed price
- **In-app notifications** keep users engaged when they are outbid or an auction ends

### Target Users

- **Sellers** — individuals or small businesses auctioning used goods, collectibles, electronics, furniture, and more
- **Buyers** — bargain hunters, collectors, and anyone looking for fair-price deals through competitive bidding
- **Admins** — platform moderators managing categories, users, and content

### Academic Context

BidHub is a CS4135 Software Architecture group project demonstrating full-stack development, RESTful API design, and collaborative software engineering using React + Spring Boot.

## Project Requirements

### Functional Requirements — Buyer

| ID | Requirement | Priority |
|----|-------------|----------|
| B1 | Register with username, email, password, display name | Must |
| B2 | Log in / log out with JWT-based auth | Must |
| B3 | Browse active auctions (paginated, sortable) | Must |
| B4 | Search auctions by keyword | Must |
| B5 | Filter by category, price range, status | Must |
| B6 | View auction detail: photos, description, seller info, current bid, countdown timer, bid history | Must |
| B7 | Place a bid (must exceed current highest by ≥€1, server-validated) | Must |
| B8 | Buy Now — instantly win at listed buy-now price | Should |
| B9 | Watchlist — add/remove favourite auctions | Should |
| B10 | Dashboard — active bids, won auctions, watchlist, wallet balance | Must |
| B11 | In-app notification when outbid | Must |
| B12 | In-app notification when auction ends (win/lose) | Must |
| B13 | Wallet top-up (mock — €10/€50/€100/€500 buttons) | Must |
| B14 | Winning bid deducted from wallet automatically | Must |
| B15 | Confirm delivery to release funds to seller | Should |
| B16 | View transaction history (top-ups, purchases, refunds) | Should |
| B17 | Edit profile (display name, avatar) | Should |
| B18 | Rate seller after completed transaction (1–5 stars) | Could |

### Functional Requirements — Seller

| ID | Requirement | Priority |
|----|-------------|----------|
| S1 | Create auction: title, description, category, photos (1–5), starting price, reserve price, buy-now price, duration | Must |
| S2 | Auction durations: 1, 3, 5, or 7 days | Must |
| S3 | View own listings with status (active/ended/sold) | Must |
| S4 | Edit listing only if zero bids | Should |
| S5 | Cancel listing only if zero bids | Should |
| S6 | View bids on own auction | Must |
| S7 | Notification when new bid placed | Must |
| S8 | Notification when auction ends (sold/unsold/reserve not met) | Must |
| S9 | Sale proceeds credited to wallet after buyer confirms delivery (minus 5% mock fee) | Should |

### Functional Requirements — Admin

| ID | Requirement | Priority |
|----|-------------|----------|
| A1 | Admin login (role-based, same auth system) | Must |
| A2 | Dashboard: total users, active auctions, completed sales, revenue | Must |
| A3 | View/search all users, ban/suspend/unban | Must |
| A4 | CRUD categories (flat list: Electronics, Vehicles, Furniture, etc.) | Must |
| A5 | View all auctions, remove rule-violating listings | Must |
| A6 | View and action user reports (dismiss or remove item) | Should |

### Non-Functional Requirements

| ID | Requirement |
|----|-------------|
| NF1 | Responsive UI (desktop + mobile) |
| NF2 | RESTful API with proper HTTP status codes |
| NF3 | Passwords hashed with BCrypt |
| NF4 | Auction deadlines enforced by server-side scheduled job |
| NF5 | Bid placement is atomic (optimistic locking to prevent race conditions) |
| NF6 | All monetary values stored as BigDecimal / NUMERIC(12,2) |
| NF7 | Input validation on both frontend and backend |
| NF8 | Consistent error response format from API |

### Technology Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React 19, Vite 7, React Router, ESLint, Playwright |
| Backend | Spring Boot 3.5, Java 21, Maven, Spring Security + JWT, Spring Data JPA |
| Database | PostgreSQL (prod), H2 (dev) |
| Testing | Bruno CLI (API), Playwright (E2E), JUnit 5 (unit) |
| CI/CD | GitHub Actions |
| DevOps | Docker, Lefthook, Husky + lint-staged |
| Code Quality | Spotless + Google Java Format, ESLint |

### Simplifications (Pet Project Scope)

- Payments are mock (wallet top-up buttons, no real payment gateway)
- Notifications are in-app only (no email/SMS)
- "Delivery" is a confirmation button + notification (no real shipping integration)
- Image storage on local filesystem (no S3/cloud storage)
- No real-time WebSocket bidding (page refresh or polling)

## Project Setup (Marking Scheme) – 5 Marks

| Criteria | Status | Excellent (Full Marks) | Good | Basic | Poor (0 Marks) | Marks |
|----------|--------|----------------------|------|-------|-----------------|-------|
| **Team Formation & Organisation** | :white_check_mark: | Team is fully formed, roles are clearly assigned, and communication channels are established. | Team formed with minor gaps in roles or organisation. | Team formed, but roles are unclear, or the communication setup is incomplete. | Team not clearly formed or no organisation evident. | 1 |
| **Application Scenario Description** | :white_check_mark: | The scenario is clear, detailed, well-structured, and provides a strong context for the project. | The scenario is generally clear with minor missing details. | The scenario is vague, incomplete, or lacks clarity. | No scenario or extremely poor description. | 1 |
| **Basic Project Requirements** | :white_check_mark: | Requirements are well-defined, relevant, and logically derived from the scenario. | Requirements are mostly clear with some minor gaps. | Limited or unclear requirements; missing key elements. | No requirements or irrelevant content. | 1 |
| **GitHub/GitLab Repository Setup** | :white_check_mark: | Repository fully created, well-structured, includes README, folders, and proper version control practices. | Repository created with basic structure; minor improvements needed. | The repository exists, but poorly structured or missing documentation. | No repository or unusable structure. | 1 |
| **Wiki Setup for Collaboration & Documentation** | :white_check_mark: | Wiki created with clear structure, sections for documentation, and visible team contributions. | Wiki is set up but incomplete or lacking some structure. | Wiki minimally created; poor organization or missing content. | No Wiki created. | 1 |

---

## Repository Structure

```
cs4135_BidHub/               # Parent repo (this)
├── frontend/                # Submodule -> cs4135_BidHub_frontend
├── backend/                 # Submodule -> cs4135_BidHub_backend
├── lefthook.yml             # Git hooks config
└── .github/workflows/       # Integration CI
```

## Branch Strategy

| Branch | Purpose |
|--------|---------|
| `main` | **Deploy branch.** Submodule pointers are pinned to exact commits of `backend/main` and `frontend/main`. Railway deploys from here. |
| `development` | Day-to-day work. Pushing here never touches production. |

`backend/main` and `frontend/main` are fast-forwarded from their `development` branches when ready to ship. Root `main` is then updated to pin the new SHAs.

## Cloning the Project

```bash
# Clone with submodules
git clone --recurse-submodules git@github.com:MykolaVaskevych/cs4135_BidHub.git

# Or if already cloned without submodules
git submodule update --init --recursive

# Pull latest changes (run from repo root)
git pull origin development
git submodule update --remote --merge
```

## Peer Review Quick Start

If you are reviewing this project, follow these steps to run the full stack locally. The
**root `docker-compose.yml`** is the single canonical entry point for the full stack
(backend services + frontend). The file in `backend/docker-compose.yml` brings up only the
backend; see [`backend/docs/DEPLOY.md`](backend/docs/DEPLOY.md) for that workflow.

### Prerequisites

- **Supported host:** Linux, macOS, or Windows with WSL2. Native Windows is not a deploy
  target — Docker Desktop on Windows runs the same Linux engine via WSL2 anyway.
- **Docker Desktop / Docker Engine** running. Verify with `docker info`; if it errors, start
  Docker before continuing.
- **Git 2.13+** with submodule support.
- **~6 GB free RAM** for the full stack (10 backend services + Postgres + frontend).
- **Free host ports:** 80 (frontend), 8080 (gateway), 8761 (Eureka), 8888 (config-server).

If `git` reports *dubious ownership* on a submodule directory, copy the path from the error
message and add it explicitly:

```bash
git config --global --add safe.directory /path/from/error/message
```

### Step 1: Clone

```bash
git clone --recurse-submodules git@github.com:MykolaVaskevych/cs4135_BidHub.git
cd cs4135_BidHub
```

If you forgot `--recurse-submodules`:

```bash
git submodule update --init --recursive
```

### Step 2: Configure secrets

Copy the example env file and fill in real values:

```bash
cp .env.example .env
# Edit .env: set JWT_SECRET, POSTGRES_PASSWORD, INTERNAL_API_TOKEN, RABBITMQ_PASS to strong random values
```

Compose will refuse to start if any required variable is missing — this is intentional, the
defaults that used to be embedded in `docker-compose.yml` have been removed.

### Step 3: Start everything

Run from the **repo root** (`cs4135_BidHub/`):

```bash
docker compose up --build
```

First build takes ~5 minutes (Maven downloads + Docker images). After that, run
`docker compose ps` to confirm every service reports `(healthy)`. The api-gateway and
frontend will only become reachable once their `depends_on` chain has all gone healthy.

### Step 4: Open in browser

| What | URL |
|------|-----|
| **Frontend** | http://localhost |
| **API Gateway** | http://localhost:8080 |
| **Eureka Dashboard** | http://localhost:8761 |

> Business services (account, auction, order, payment, etc.) are no longer published on host
> ports by default. They are reachable only through the gateway, or from inside the
> `bidhub-*` Docker network. To run a one-off Swagger probe against, say, auction-service:
> `docker compose exec auction-service wget -qO- http://localhost:8083/swagger-ui/index.html`.

### Test accounts

A default admin account is created automatically on startup:

| Role | Email | Password |
|------|-------|----------|
| Admin | `admin@bidhub.local` | `Admin123!` |

To create a buyer or seller account, use the **Register** page on the frontend. Password must contain uppercase, lowercase, digit, and special character (min 8 chars).

### Quick API test

```bash
# Register a test user
curl -X POST http://localhost/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email":"reviewer@test.com","password":"Review1!","firstName":"Peer","lastName":"Reviewer","role":"BUYER"}'

# Login (returns JWT)
curl -X POST http://localhost/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"reviewer@test.com","password":"Review1!"}'
```

### Services overview

| Service | Port | Host-reachable | Description |
|---------|------|----------------|-------------|
| eureka-server | 8761 | yes (`localhost:8761`) | Service discovery (Spring Cloud Netflix) |
| config-server | 8888 | yes (`localhost:8888`) | Centralised configuration (Spring Cloud Config) |
| api-gateway | 8080 | yes (`localhost:8080`) | Edge routing + JWT validation (Spring Cloud Gateway) |
| frontend | 80 | yes (`localhost`) | React SPA (nginx proxies `/api/` to gateway) |
| rabbitmq | 5672 / 15672 | mgmt UI yes (`localhost:15672`), AMQP no | Settlement-saga broker (containers + dependencies provisioned; no event flows wired yet) |
| account-service | 8081 | no (Docker network only) | Auth, profile, addresses, admin user management |
| catalog-service | 8082 | no | Search, categories, active-count |
| auction-service | 8083 | no | Listings, auctions, bids, watchlist |
| order-service | 8084 | no | Order lifecycle |
| payment-service | 8085 | no | Wallet, top-up, deduct, transactions |
| notification-service | 8086 | no | Send, list, templates |
| admin-service | 8087 | no | Categories, reports, moderation, dashboard |
| delivery-service | 8088 | no | Delivery job lifecycle |
| postgres | 5432 | no | Shared database |

**Trust boundary.** The api-gateway terminates browser traffic, validates the JWT, and attaches
two headers to every proxied request: `X-User-Id` (the authenticated user) and
`X-Internal-Token` (the shared service-to-service secret from `.env`). Account-service
rejects any request that does not carry a matching `X-Internal-Token`. Other backend services
currently rely on Docker network isolation alone; extending the same filter to the rest is
tracked separately as P1 work.

### Known limitations

- **RabbitMQ infrastructure is provisioned** (broker container + Spring AMQP dependency on the four settlement-saga services), but **no business event flows have been wired yet** — settlement, catalogue projection, and async notifications still run synchronously over REST. Subsequent PRs land the choreography described in `docs/runtime_view_2_async.puml`.
- **catalog-service** is a read-projection — no data is indexed from Auction events yet; search returns empty unless seeded manually.

---

## Running the Project

### Full stack (Docker)

Run from the **repo root** (`cs4135_BidHub/`):

```bash
docker compose up --build
# All services + frontend + Postgres. First build takes ~5 min.
# Frontend:      http://localhost
# API gateway:   http://localhost:8080
# Eureka:        http://localhost:8761
```

If you already have the images built:

```bash
docker compose up
```

## Pre-commit Hooks

Install [Lefthook](https://github.com/evilmartians/lefthook) for automatic submodule updates:

```bash
lefthook install
```

Hooks:

- `post-checkout`: Auto-update submodules
- `post-merge`: Auto-update submodules

## Making Changes

### 1. Working in a Submodule

```bash
cd frontend  # or backend
# Make changes, commit, push
git add .
git commit -m "your message"
git push origin development
```

### 2. Updating Parent

After committing in a submodule:

```bash
cd ..  # back to parent
git add frontend  # or backend
git commit -m "Update frontend submodule"
git push origin development
```

## Deployment

Railway project: https://railway.com/project/b4e59d4d-ca8e-44a0-a7ec-d0c8f7a08a87

Full deploy workflow and Railway env var reference: [`backend/docs/DEPLOY.md`](backend/docs/DEPLOY.md).

Quick redeploy (from repo root):

```bash
# 1. Fast-forward backend/main
cd backend && git checkout main && git merge --ff-only origin/development && git push origin main && git checkout development && cd ..

# 2. Pin in root/main
git checkout main && git submodule update --remote --merge && git add backend && git commit -m "pin backend@$(git -C backend rev-parse --short HEAD)" && git push origin main && git checkout development

# 3. Redeploy changed services
for svc in account-service auction-service admin-service; do
  railway up --service "$svc" --detach --path-as-root backend/
done
```
