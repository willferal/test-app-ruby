# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'trix'
pin '@rails/actiontext', to: 'actiontext.js'
pin 'local-time' # @2.1.0
pin 'flowbite', to: 'https://ga.jspm.io/npm:flowbite@1.5.1/dist/flowbite.js'
pin 'alpinejs', to: 'https://ga.jspm.io/npm:alpinejs@2.7.3/dist/alpine.js'
pin 'jquery', to: 'https://ga.jspm.io/npm:jquery@3.6.1/dist/jquery.js'
pin 'jquery-mask-plugin', to: 'https://ga.jspm.io/npm:jquery-mask-plugin@1.14.16/dist/jquery.mask.js'
pin 'alpine-magic-helpers', to: 'https://ga.jspm.io/npm:alpine-magic-helpers@0.5.1/dist/index.js'
pin 'process', to: 'https://ga.jspm.io/npm:@jspm/core@2.0.0-beta.25/nodelibs/browser/process-production.js'
pin 'alpine-turbo-drive-adapter', to: 'https://ga.jspm.io/npm:alpine-turbo-drive-adapter@1.1.0/dist/alpine-turbo-drive-adapter.js'
pin 'chartkick', to: 'chartkick.js'
pin 'highcharts' # @10.2.1
pin 'setup', to: 'custom/setup.js'
pin "sortablejs", to: "https://ga.jspm.io/npm:sortablejs@1.15.0/modular/sortable.esm.js"
