// document.addEventListener('DOMContentLoaded', function() {
//   const fileInput = document.getElementById('file-upload');
//   const imagePreviewContainer = document.querySelector('.image-preview');
//   const imagePreview = document.getElementById('image-preview');
//   const submitButton = document.querySelector('[value="Upload"]')

//   fileInput.addEventListener('change', function(event) {
//     const file = event.target.files[0];
//     if (file) {
//       const reader = new FileReader();
//       reader.onload = function(e) {
//         imagePreview.src = e.target.result;
//         imagePreviewContainer.classList.remove('hidden');
//       }
//       reader.readAsDataURL(file);
//       submitButton.disabled = false
//     } else {
//       submitButton.disabled = true
//     }
  
//   });

// });