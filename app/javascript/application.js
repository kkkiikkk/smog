import "bootstrap"
import "@hotwired/turbo-rails"
window.process = { env: { NODE_ENV: 'production' } };
import '@popperjs/core'
import "popper"
import "controllers"
import "./upload.js"
import "./modal.js"
import "./rails_admin.js"
