document.addEventListener('DOMContentLoaded', function() {
  const modal = document.getElementById('imageModal');
  const modalImage = document.getElementById('modalImage');
  const closeButton = modal.querySelector('[close="modal"]');

  document.querySelectorAll('[data-toggle="modal"]').forEach(function(element) {
    element.addEventListener('click', function(event) {
      event.preventDefault();
      const imageUrl = event.currentTarget.dataset.imageUrl;
      console.log(imageUrl);

      modalImage.src = imageUrl;
      modal.classList.add('show');
      modal.style.display = 'block';
      modal.removeAttribute('aria-hidden');
      modal.setAttribute('aria-modal', 'true');
      document.body.classList.add('modal-open');
      document.body.insertAdjacentHTML('beforeend', '<div class="modal-backdrop fade show"></div>');
    });
  });

  closeButton.addEventListener('click', closeModal);
  
  modal.addEventListener('click', function(event) {
    if (event.target === modal) {
      closeModal();
    }
  });

  function closeModal() {
    modal.classList.remove('show');
    modal.style.display = 'none';
    modal.setAttribute('aria-hidden', 'true');
    modal.removeAttribute('aria-modal');
    modalImage.src = '';
    document.body.classList.remove('modal-open');
    const backdrop = document.querySelector('.modal-backdrop');
    if (backdrop) {
      backdrop.remove();
    }
  }
});
