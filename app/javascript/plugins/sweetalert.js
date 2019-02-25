import Swal from 'sweetalert2'

const sweetAlert = () => {
  const btn = document.getElementById('booking-cta')
  if (btn) {
    btn.addEventListener('click', (event) => {
      console.log("click")
      Swal.fire({
        // position: 'center',
        type: 'success',
        title: 'Well done!',
        text: ' Your boat has been booked. Enjoy the sea!',
        footer: 'you will be redirected shortly to your bookings',
        showConfirmButton: false,
        timer: 4000,
        width: 600,
      })
    })
  }
}

export { sweetAlert }


