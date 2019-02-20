import Swal from 'sweetalert2'

const sweetAlert = () => {
  const btn = document.getElementById('book_btn')

  if (btn) {
    btn.addEventListener('click', (event) => {
      Swal.fire({
        position: 'center',
        type: 'success',
        title: 'Well done! Your boat has been booked. Enjoy the sea!',
        showConfirmButton: false,
        timer: 2000
      })
    })
  }
}

export { sweetAlert }


