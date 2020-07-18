window.copyLinkToClipboard = function(link_id) {
  var shortened_link = document.getElementById(link_id);
  shortened_link = shortened_link.innerHTML;
  var temp_shortened_link_input = document.createElement("input");
  document.body.appendChild(temp_shortened_link_input);
  temp_shortened_link_input.setAttribute("id", "dummy_id");
  document.getElementById("dummy_id").value=shortened_link;
  temp_shortened_link_input.select();
  document.execCommand("copy");
  alert("Copied the link: " + shortened_link);
  document.body.removeChild(temp_shortened_link_input);
}
