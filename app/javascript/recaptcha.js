document.addEventListener('DOMContentLoaded', function() {
  const form = document.querySelector('.auth-form.log-in-form');
  form.addEventListener('submit', function(event) {
    const recaptchaResponse = document.querySelector('textarea[name="g-recaptcha-response"]').value;
    if (!recaptchaResponse) {
      event.preventDefault();
    }
  });
});
