# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Running Tests
- `bin/rails test` - Run all tests except system tests
- `bin/rails test:system` - Run system tests
- `bin/rails test test/models/user_test.rb` - Run specific test file
- `bin/rails test:db` - Reset database and run tests

### Code Quality & Linting
- `bin/rubocop` - Run RuboCop linter (uses rails-omakase configuration)
- `bin/rubocop -a` - Auto-fix RuboCop violations
- `bin/brakeman` - Run security scanner

#### Important: Always run linting after code changes
After implementing features or making changes, ensure code quality by running `bin/rubocop` and fixing any issues.

### Development Server
- `bin/dev` - Start development environment (Rails server + Tailwind CSS watcher)
- `bin/rails server` - Start Rails server only
- `bin/rails console` - Interactive Rails console

### Database Operations
- `bin/rails db:migrate` - Run database migrations
- `bin/rails db:seed` - Seed database with reference data
- `bin/rails db:reset` - Reset database (drop, create, migrate, seed)
- `bin/rails db:setup` - Setup database from scratch

### Asset Management
- `bin/rails tailwindcss:build` - Build Tailwind CSS
- `bin/rails tailwindcss:watch` - Watch and rebuild Tailwind CSS

## Application Architecture

### Domain Organization
KognoFluo is a **Maintenance Management System** organized into four main domains:

1. **Common** (`app/models/common/`) - Shared reference data (countries, currencies, languages, timezones, measure units)
2. **Organization** (`app/models/organization/`) - Company structure (plants → areas → production lines)
3. **Maintenance** (`app/models/maintenance/`) - Core maintenance management (assets, plans, schedules, technicians)
4. **User Management** - Authentication and profiles

### Database Namespacing
Each domain uses table prefixes for clear separation:
- `common_*` tables for reference data
- `organization_*` tables for company structure  
- `maintenance_*` tables for maintenance operations

### Controller Structure
Controllers mirror the model organization with consistent CRUD patterns and JSON API support:
```
app/controllers/
├── common/          # Reference data management
├── organization/    # Plant/area/line management
├── maintenance/     # Asset and maintenance management
└── settings/        # Application configuration
```

## Key Architectural Patterns

### Modular Design
- Models organized by domain with clear namespace boundaries
- Controllers follow the same modular pattern
- Views structured by domain for maintainability

### Enum State Management
Models use the `HasEnumState` concern for consistent status management:
```ruby
has_enum_state :status, values: STATUSES, colors: STATUS_COLORS, default: :active
```

### Hierarchical Organization
The application supports complex industrial environments:
- Plant → Area → Production Line → Assets
- Precise asset location tracking
- Multi-facility support

## Development Guidelines

### Testing
- Comprehensive test suite using Minitest
- Factory Bot for test data generation
- System tests with Capybara and Selenium
- Always run tests before committing changes

### Internationalization
- Bilingual support (English/Spanish-MX) with base locale `es-MX`
- Comprehensive i18n structure in `config/locales/`
- Use i18n keys consistently across views and controllers

### Code Style
- Follows Rails Omakase RuboCop configuration
- Ruby 3.4.4 and Rails 8.0.2
- Frozen string literals enabled

## Tech Stack
- **Rails 8.0.2** with Hotwire (Turbo Rails, Stimulus)
- **Tailwind CSS** for styling
- **Devise** with Argon2 for authentication
- **SQLite** database with Active Storage
- **Action Text** for rich content
- **Kamal** for deployment

## Seeding Data
The application includes sophisticated seeding in `db/seeds/`:
- Reference data (countries, currencies, languages, timezones)
- Sample maintenance data
- User accounts for development

Run `bin/rails db:seed` to populate development data.

## Working with Assets and Maintenance
When working with the maintenance domain, understand the relationships:
- Assets have hierarchical locations and can have components
- Maintenance plans include detailed tasks with steps and measurements
- Schedules link plans to specific assets and time periods
- Technicians can be assigned to specific assets or plans