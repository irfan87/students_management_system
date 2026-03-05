// import { Application } from "@hotwired/stimulus"

// const application = Application.start()

// // Configure Stimulus development experience
// application.debug = false
// window.Stimulus   = application

// export { application }

// app/javascript/controllers/application.js
import { Application } from "@hotwired/stimulus";

const application = Application.start();

// Automatically load all controllers
const controllers = import.meta.glob("./**/*_controller.js", { eager: true });
for (const path in controllers) {
  const controllerModule = controllers[path];
  const controllerName = Object.keys(controllerModule)[0];
  application.register(controllerName, controllerModule[controllerName]);
}

export { application };
