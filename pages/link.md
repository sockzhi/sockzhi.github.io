---
layout: page
title: Links
tagline: My friends.
permalink: /links.html
---


{% for f in site.data.friends %}
<div class="link-chip">
 <img alt="{{f.describe}}" src="{{f.image}}" class="link-chip-icon">
 <a title="{{f.describe}}" target="_blank" class="link-chip-title" href="{{f.url}}">{{f.name}}</a>
</div>
{% endfor %}

[返回主页](https://{{ site.url }})

<hr/>
  {% if site.data.social.valine_comment.enable  == true %}
  <script src="//unpkg.com/leancloud-storage@3/dist/av-min.js"></script>
  <script src="//unpkg.com/valine/dist/Valine.min.js"></script>
  <div id="comments"></div>
  {% include comments.html %}
  {% endif %}
  {% include scripts.html %}
