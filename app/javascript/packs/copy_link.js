window.copyLinkToClipboard = function(link_id) {
  var shortened_link = document.getElementById(link_id).textContent;
  document.getElementById('clipboard').value = shortened_link;
  document.getElementById('clipboard').select();
  document.execCommand("copy");
  alert("Copied the link: " + shortened_link);
}
