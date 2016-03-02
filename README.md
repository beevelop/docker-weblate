[![Travis](https://img.shields.io/travis/beevelop/docker-weblate.svg?style=flat-square)](https://travis-ci.org/beevelop/docker-weblate)
[![Docker Pulls](https://img.shields.io/docker/pulls/beevelop/weblate.svg?style=flat-square)](https://links.beevelop.com/d-weblate)
[![ImageLayer](https://badge.imagelayers.io/beevelop/weblate:latest.svg)](https://imagelayers.io/?images=beevelop/weblate:latest)
[![Dependency Status](https://gemnasium.com/beevelop/docker-weblate.svg)](https://gemnasium.com/beevelop/docker-weblate)
[![Beevelop](https://links.beevelop.com/honey-badge)](https://beevelop.com)

> Weblate is a translation tool with tight version control integration featuring a simple and clean user interface, propagation of translations across components, quality checks and automatic linking to source files.

# weblate
----
### Pull from Docker Hub
```
docker pull beevelop/weblate:latest
```

### Build from GitHub
```
docker build -t beevelop/weblate github.com/beevelop/docker-weblate
```

### Run image
```
docker run -it beevelop/weblate bash
```

### Use as base image
```Dockerfile
FROM beevelop/weblate:latest
```

## Configuration
- `WEBLATE_DEBUG`
- `WEBLATE_ADMIN_NAME`
- `WEBLATE_ADMIN_EMAIL`
- `WEBLATE_EMAIL`
- `EMAIL_HOST`
- `EMAIL_HOST_USER`
- `EMAIL_HOST_PASSWORD`
- `EMAIL_PORT` (default: 587)
- `SECRET_KEY` (this is required for a production-ready setup)
    + **Might be mandatory in future releases!**
- `LANGUAGE_CODE` (default: en-us)
    + [Using Language Identifiers (RFC 3066)](http://www.i18nguy.com/unicode/language-identifiers.html)
- `TIME_ZONE` (default: UTC)
    + [List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
- `SITE_TITLE` (default: Weblate)
- `ADMIN_PASSWORD` (default: Un1c0rn)
