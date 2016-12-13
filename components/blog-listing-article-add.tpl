<a class="blog-article-newer without-image cms-blog-article-add-button" href="{% if blog-listing-article-add == "item" %}{{ item.url }}{% else %}{{ page.path }}{% endif %}?new">
  <div class="article-top">
    <div class="top-inner aspect-ratio-inner">
      <div class="article-placeholder">
        <svg class="article-add-ico" width="82" height="82" viewBox="0 0 82 82" xmlns="http://www.w3.org/2000/svg">
          <use xlink:href="#ico-plus"></use>
        </svg>

        <div class="article-title">{{ "add_new_post" | lc }}</div>
      </div>
    </div>
  </div>
</a>
