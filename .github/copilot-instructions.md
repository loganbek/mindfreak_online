# Copilot Instructions for mindfreak_online

## Project Overview
This is a Ruby on Rails application for the "Zero-to-Hero Money-Making Hub." It provides:
- Free mini-MVP tutorials (affiliate marketing, print-on-demand, micro digital services)
- Web3 affiliate/referral link toolkit
- Passive-income Web3 features (staking, yield farming, etc.)
- Community, rewards, and live bootcamps

## Architecture & Key Patterns
- **MVC Structure:**
  - `app/controllers/` — Rails controllers for routing and business logic
  - `app/models/` — ActiveRecord models for data
  - `app/views/` — ERB templates for rendering HTML
  - `app/assets/` — Static assets (CSS, images)
- **Config:**
  - `config/routes.rb` — Main routing entry point
  - `config/environments/` — Environment-specific settings
  - `config/initializers/` — App-wide configuration
- **Jobs, Mailers, Helpers:**
  - `app/jobs/`, `app/mailers/`, `app/helpers/`
- **PWA Support:**
  - `app/views/pwa/` — Manifest and service worker for progressive web app features

## Developer Workflows
- **Install dependencies:**
  - `bundle install` (Ruby gems)
- **Database setup:**
  - `rails db:create db:migrate db:seed`
- **Run the app locally:**
  - `bin/rails server` or `rails s`
- **Run tests:**
  - `bin/rake test` or `rails test`
- **Linting/Security:**
  - `bin/rubocop` (style)
  - `bin/brakeman` (security)

## Deployment: Railway
To deploy on [Railway](https://railway.app):
1. **Create a Railway project** and link your GitHub repo.
2. **Set environment variables:**
   - `RAILS_ENV=production`
   - `RAILS_MASTER_KEY` (from `config/master.key`)
   - Any other secrets (DB, API keys)
3. **Configure build & start commands:**
   - Build: `bundle install && rails db:migrate`
   - Start: `rails server -b 0.0.0.0 -p $PORT`
4. **Provision a PostgreSQL database** (Railway plugin) and update `config/database.yml` accordingly.
5. **Push to main branch** — Railway will auto-deploy.

## Project Conventions
- Use `bin/` scripts for all dev tasks (see `bin/` directory)
- Keep all business logic in models or service objects, not controllers
- Use ERB for views, not HAML/SLIM
- PWA assets live in `app/views/pwa/`
- All static assets in `app/assets/`

## Key Files
- `config.ru` — Rack config for deployment
- `Dockerfile` — For containerized deploys (optional)
- `Rakefile` — Custom tasks
- `README.md` — Product vision and feature matrix

---
For more, see the README and in-code comments. When in doubt, follow Rails conventions unless a project-specific pattern is documented above.
