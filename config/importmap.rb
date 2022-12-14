# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "tw-elements", to: "https://ga.jspm.io/npm:tw-elements@1.0.0-alpha12/dist/js/index.min.js"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
pin "aos", to: "https://ga.jspm.io/npm:aos@2.3.4/dist/aos.js"
