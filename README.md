[![Travis](https://shields.beevelop.com/travis/beevelop/docker-weblate.svg?style=flat-square)](https://travis-ci.org/beevelop/docker-weblate)
[![Pulls](https://shields.beevelop.com/docker/pulls/beevelop/weblate.svg?style=flat-square)](https://links.beevelop.com/d-weblate)
[![Size](https://shields.beevelop.com/docker/image/size/beevelop/weblate/latest.svg?style=flat-square)](https://links.beevelop.com/d-weblate)
[![Layers](https://shields.beevelop.com/docker/image/layers/beevelop/weblate/latest.svg?style=flat-square)](https://links.beevelop.com/d-weblate)
[![Gemnasium](https://shields.beevelop.com/gemnasium/beevelop/docker-weblate.svg?style=flat-square)](https://gemnasium.com/beevelop/docker-weblate)
![Badges](https://shields.beevelop.com/badge/badges-7-brightgreen.svg?style=flat-square)
[![Beevelop](https://links.beevelop.com/honey-badge)](https://beevelop.com)

> Weblate is a translation tool with tight version control integration featuring a simple and clean user interface, propagation of translations across components, quality checks and automatic linking to source files.

# [Weblate](https://weblate.org/) for Docker (unofficial) :whale:
----

### Quick start with Docker Compose
```bash
git clone https://github.com/beevelop/docker-weblate && cd docker-weblate
# Adjust the docker-compose.yml to your needs
docker-compose up
```
Navigate to `http://*YOURHOST*:8000` and login with `admin:Un1c0rn`.


### Manually
```bash
# Launch a postgres database (POSTGRES_USER and POSTGRES_PASSWORD are mandatory)
docker run --name dev-weblate-postgres -e POSTGRES_USER=weblate -e POSTGRES_PASSWORD=weblate -d kiasaki/alpine-postgres

# Launch weblate linked to the database
docker run -it -p 8000:8000 --name dev-weblate \
    -e WEBLATE_ADMIN_NAME=john \
    -e WEBLATE_ADMIN_EMAIL=john@example.com \
    -e WEBLATE_EMAIL=john@example.com \
    --link dev-weblate-postgres:database beevelop/weblate
```
You should then be able to access Weblate via `http://*YOUR_HOST*:8000`.
> Attention: To persist changes you need to bind the volumes `/app/data` and `/app/config` for the Weblate container and the respective volumes for the Postgres container.

## Configuration
### General
- `WEBLATE_DEBUG` (default: `1`): Enables debugging functionality
- `WEBLATE_ALLOWED_HOSTS`
    + Coma-separated list of allowed hosts (e.g. `weblate.beevelop.com`)
    + Required if `WEBLATE_DEBUG` is disabled!
- `WEBLATE_LOCK_DOWN` (default: not set)
    + If set, Weblate requires logging in to access anything (seems quite suitable for private projects) 
- `WEBLATE_ADMIN_NAME`
- `WEBLATE_ADMIN_EMAIL`
- `WEBLATE_EMAIL`
- `SECRET_KEY` (this is required for a production-ready setup)
    + **Might be mandatory in future releases!**
- `LANGUAGE_CODE` (default: en-us)
    + [Using Language Identifiers (RFC 3066)](http://www.i18nguy.com/unicode/language-identifiers.html)
- `TIME_ZONE` (default: UTC)
    + [List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
- `SITE_TITLE` (default: Weblate)
- `ADMIN_PASSWORD` (default: Un1c0rn)
- `REGISTRATION_OPEN` (default: `True`): Set to `False` to disable registration functionality

### Email
- `EMAIL_HOST`
- `EMAIL_HOST_USER`
- `EMAIL_HOST_PASSWORD`
- `EMAIL_PORT` (default: `587`)

### Social-Auth
- `SOCIAL_AUTH_GITHUB_KEY`
- `SOCIAL_AUTH_GITHUB_SECRET`
- `SOCIAL_AUTH_BITBUCKET_KEY`
- `SOCIAL_AUTH_BITBUCKET_SECRET`
- `SOCIAL_AUTH_FACEBOOK_KEY`
- `SOCIAL_AUTH_FACEBOOK_SECRET`
- `SOCIAL_AUTH_GOOGLE_OAUTH2_KEY`
- `SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET`
