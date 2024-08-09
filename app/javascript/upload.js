document.addEventListener('DOMContentLoaded', function() {
  const fileInput = document.getElementById('file-upload');
  const submitButton = document.querySelector('[value="Upload"]')

  fileInput.addEventListener('change', function(event) {
    const file = event.target.files[0];
    if (file) {
      submitButton.disabled = false
    } else {
      submitButton.disabled = true
    }
  
  });

});