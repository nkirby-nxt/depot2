import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart"
export default class extends Controller {
  connect() {
	  console.log("cart controller connected.");
  }
  
  log() {
	  console.log("test logger");
  }
}
