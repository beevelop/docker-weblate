#!/usr/bin/env python

import django
django.setup()

import sys,os
from django.contrib.auth.models import User
from django.core.management import call_command

admin_username = os.getenv('WEBLATE_ADMIN_NAME', 'admin')

try:
  user = User.objects.get(username=admin_username)
except:
  print 'Creating Admin...'
  User.objects.create_superuser(admin_username, os.getenv('WEBLATE_ADMIN_EMAIL', 'admin@example.com'), os.getenv('ADMIN_PASSWORD', 'Un1c0rn'))
  print 'Admin user has been created! Login with ' + os.getenv('WEBLATE_ADMIN_EMAIL', 'admin@example.com')
  sys.exit(0)
else:
  print 'Admin seems to exist. Not creating admin...'
  sys.exit(0)
