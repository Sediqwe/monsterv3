import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
import "jquery"
import "jquery_ujs"
import "popper"
import "bootstrap"
import "@hotwired/turbo-rails";
import "controllers";
import "trix"
import "@rails/actiontext"
