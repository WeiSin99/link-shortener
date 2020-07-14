// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
//= require jquery3
//= require popper
//= require bootstrap-sprockets

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

window.myFunction = function(link_id) {
  console.log(link_id)
  /* Get the text field */
  var copyText = document.getElementById(link_id);

  /* Select the text field */
  copyText = copyText.innerHTML;

  // Create a dummy input to copy the string array inside it
  var dummy = document.createElement("input");

  // Add it to the document
  document.body.appendChild(dummy);

  // Set its ID
  dummy.setAttribute("id", "dummy_id");

  console.log(copyText)
  // Output the array into it
  document.getElementById("dummy_id").value=copyText;
  // Select it
  dummy.select();

  // Copy its contents
  document.execCommand("copy");

  alert("Copied the link: " + copyText);

  document.body.removeChild(dummy);
}
