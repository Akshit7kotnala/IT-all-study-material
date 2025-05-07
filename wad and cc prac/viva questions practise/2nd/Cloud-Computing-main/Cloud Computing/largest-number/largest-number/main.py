#!/usr/bin/env python
#
# Copyright 2007 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
import webapp2

class MainHandler(webapp2.RequestHandler):
    def get(self):
        self.response.write('''
            <form method="post">
                A: <input name="a"><br>
                B: <input name="b"><br>
                C: <input name="c"><br>
                <input type="submit" value="Find Largest">
            </form>
        ''')

    def post(self):
        a = int(self.request.get('a'))
        b = int(self.request.get('b'))
        c = int(self.request.get('c'))
        self.response.write("Largest: " + str(max(a, b, c)))

app = webapp2.WSGIApplication([
    ('/', MainHandler)
], debug=True)
