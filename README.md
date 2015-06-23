<p align="center">
  <img src="http://i.imgur.com/VAGfHGh.png">
</p>
<br>

It is a tabs component and it is simple.

## Install

Using [Bower](http://bower.io):

```bash
bower install simpletabs
```

## Usage

```html
<nav>
  <ul>
    <li><a href="#tab-1" data-tab="tab-1" class="tab__link">Tab 1</a></li>
    <li><a href="#tab-2" data-tab="tab-2" class="tab__link">Tab 2</a></li>
  </ul>
</nav>

<section class="content">
  <div class="content__item" data-content="tab-1">
    <h1>Tab 1</h1>
    ...
  </div>
  <div class="content__item" data-content="tab-2">
    <h1>Tab 2</h1>
    ...
  </div>
</section>

<script src="/path/to/simpletabs.js"></script>
```

A full working example is on [CodePen](http://codepen.io/romulomachado/full/rVYVqr/).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mifflin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
