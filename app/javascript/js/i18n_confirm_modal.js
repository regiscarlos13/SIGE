$(document).on('turbolinks:load', function() {
	dataConfirmModal.setDefaults({
		title: 'Confirm your action',
		commit: 'Confirmar',
		cancel: 'Cancelar',
		modalClass: 'custom-model'
	})
});
