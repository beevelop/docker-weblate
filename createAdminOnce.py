#!/usr/bin/env python

import django
django.setup()

import sys
from django.contrib.auth.models import User
from django.core.management import call_command

try:
  user = User.objects.get(username='admin')
except:
  print 'Creating Admin...'
  call_command('createadmin', password='admin')
  sys.exit(0)
else:
  print 'Admin seems to exist. Not creating admin...'
  sys.exit(0)
