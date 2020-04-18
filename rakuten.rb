feature ​'Registrations'​,​ js​:​ ​true​ ​do
   context ​'with a logged user'​ ​do
   it ​'allows the user to signin with success'​ ​do
   timestamp ​=​ ​Time​.​now​.​strftime ​'%Y%m%d-%H%M%S'
   email ​=​ ​"#{timestamp}@wuaki.tv"
   visit ​'/'
   click_link ​'Entrar'
   expect​(​current_url​).​to eq​(​sign_in_url)
   fill_in_sign_in_form email
   expect​(​page​).​to have_content ​'Mi videoteca'
   expect​(​page​).​to have_content ​'Quiero ver'
   ​end 
     it ​'rents a TVOD movie'​ ​do
	 timestamp ​=​ ​Time​.​now​.​strftime ​'%Y%m%d-%H%M%S'
	 email ​=​ ​"#{timestamp}@wuaki.tv"
	 visit ​'/'
	 click_link ​'Entrar'
	 expect​(​current_url​).​to eq​(​sign_in_url)
	 fill_in_sign_in_form email
	 click_link ​'Configuración'
	 click_link ​'Datos bancarios'
	 expect​(​page​).​to have_content ​'Tarjeta de crédito'
	 fill_in_bank_details_form
	 within​(​'#edit_user'​)​ ​{​ find​(​'#user_submit'​).​click }
	 sleep ​30
	 expect​(​page​).​to have_content ​'Los datos han sido guardados correctamente'
	 visit new_releases_url
	 click_on_first ​:​movie
	 click_on_first_purchase_option
	 sleep ​10
	 within​(​'#purchase_submit_action'​)​ ​{​ click_button ​'Alquilar'​ }
	 sleep ​20
	 expect​(​page​).​to have_content ​'Expira en'
     ​end 
     it ​'is cancelled from selection'​ ​do
	 timestamp ​=​ ​Time​.​now​.​strftime ​'%Y%m%d-%H%M%S'
	 email ​=​ ​"#{timestamp}@wuaki.tv"
	 visit ​'/'
	 click_link ​'Entrar'
	 expect​(​current_url​).​to eq​(​sign_in_url)
	 fill_in_sign_in_form email
	 visit settings_url
	 find​(​'#main .sub-nav'​).​click_link ​'Selection'
	 click_link ​'Vas a darte de baja de Selection, ¿estás seguro?'
	 click_link ​'Sí, confirmar.'
	 expect​(​page​).​to have_content ​'Tu subscripción ha sido cancelada con éxito'
     ​end 
  ​end 
  end 