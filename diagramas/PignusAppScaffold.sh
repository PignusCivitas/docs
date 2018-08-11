rails g scaffold Vehículo id:INTEGER plate_number:VARCHAR colour:VARCHAR year:VARCHAR brand:VARCHAR model:VARCHAR engine_number:VARCHAR engine_size:INTEGER
rails g scaffold Tipo Vehículo id:INTEGER name:VARCHAR
rails g scaffold Persona id:INTEGER last_name:VARCHAR first_name:VARCHAR phone:VARCHAR identification:VARCHAR
rails g scaffold Residente id:INTEGER address:VARCHAR city: office_address:VARCHAR notes:VARCHAR
rails g scaffold Agente seguridad id:INTEGER role:VARCHAR division:VARCHAR admission_date:DATE
rails g scaffold Visitante 
rails g scaffold Representante 
rails g scaffold Empresa seguridad id:INTEGER business_name:VARCHAR address:VARCHAR phone:VARCHAR email:VARCHAR identification:VARCHAR
rails g scaffold Supervisor 
rails g scaffold Registro Vehículos id:VARCHAR entry_date: notes:VARCHAR exit_date:DATE cost:DOUBLE status:VARCHAR plate_number:VARCHAR station:VARCHAR
rails g scaffold Inventario activos id:INTEGER stock_name:VARCHAR creation_date:DATE manager:VARCHAR last_update:DATE status:VARCHAR
rails g scaffold Objetos encontrados id:INTEGER name:VARCHAR date:DATE notes:VARCHAR returned_to:VARCHAR return_date:DATE phone:VARCHAR
rails g scaffold Elementos provistos id:INTEGER stock_name:VARCHAR date:DATE accountable:VARCHAR status:VARCHAR
rails g scaffold Tipo Elemento provisto id:INTEGER name:VARCHAR
rails g scaffold Armamento id:INTEGER name:VARCHAR status:VARCHAR notes:VARCHAR
rails g scaffold Notificaciones id:INTEGER subject:VARCHAR content:VARCHAR date:DATE expiration:DATE status:VARCHAR priority:VARCHAR
rails g scaffold Eventos id:INTEGER title:VARCHAR notes:VARCHAR date:DATE hour:TIME reported_by:VARCHAR site:VARCHAR facts:VARCHAR status:VARCHAR location:VARCHAR end_date:DATE end_hour:TIME contact_name:VARCHAR contact_phone:VARCHAR
rails g scaffold Personal mantenimiento id:INTEGER name:VARCHAR phone:VARCHAR admission_date:DATE notes:VARCHAR address:VARCHAR
rails g scaffold Entrada salida personal mantenimiento id:INTEGER entry_date:DATE exit_date:DATE notes:VARCHAR
rails g scaffold Turno id:INTEGER name:VARCHAR start_hour:TIME end_hour:TIME weekends:BOOLEAN break:VARCHAR position:VARCHAR
rails g scaffold Ubicación armas id:INTEGER name:VARCHAR phone:VARCHAR contact:VARCHAR notes:VARCHAR
rails g scaffold Contratos id:INTEGER title:VARCHAR date:DATE expiration:DATE type:VARCHAR notes:VARCHAR contractor:VARCHAR hired:VARCHAR status:VARCHAR
rails g scaffold Comunidad id:INTEGER name:VARCHAR address:VARCHAR phone:VARCHAR admin_address:VARCHAR email:VARCHAR web_site:VARCHAR attendant:VARCHAR notes:VARCHAR
rails g scaffold Reporte lista negra id:INTEGER notes:VARCHAR date:DATE status:VARCHAR facts:VARCHAR
rails g scaffold Alerta id:INTEGER title:VARCHAR content:VARCHAR creation_date:DATE status:VARCHAR coordinates:VARCHAR evidence:VARCHAR
rails g scaffold Ciudadano 
rails g scaffold Usuario id:INTEGER username:VARCHAR password:VARCHAR last_login:DATE email:VARCHAR
rails g scaffold TipoCiudadano 
rails g scaffold Activo id:INTEGER name:VARCHAR notes:VARCHAR entry_date:DATE quantity:INTEGER location:VARCHAR status:VARCHAR who:VARCHAR
rails g scaffold Tipo Residente id:INTEGER name:VARCHAR
rails g scaffold Tipo agente id:INTEGER name:VARCHAR tyṕe:VARCHAR
rails g scaffold División id:INTEGER name:VARCHAR address:VARCHAR phone:VARCHAR attendant:VARCHAR
rails g scaffold Elemento id:INTEGER name:VARCHAR status:VARCHAR amount:INTEGER characteristics:VARCHAR accountable:VARCHAR
rails g scaffold Tipo novedad id:INTEGER name:VARCHAR status:VARCHAR
rails g scaffold Minuta Generada id:INTEGER date:DATE generated_by:VARCHAR notes:VARCHAR file:VARCHAR
rails g scaffold Tipo Comunidad id:INTEGER name:VARCHAR
rails g scaffold Tipo armamento id:INTEGER name:VARCHAR type:VARCHAR
rails g scaffold Cargos mantenimiento id:INTEGER name:VARCHAR status:VARCHAR
