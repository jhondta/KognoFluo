# frozen_string_literal: true

class MaintenanceSeeder
  class << self
    def seed!
      puts 'Starting maintenance seed...'
      Faker::Config.locale = 'es-MX'

      create_technicians
      create_organization_structure
      create_manufacturers
      create_asset_types
      create_assets_and_components
      create_tools
      create_maintenance_plans
      create_schedules_and_assignments

      puts 'Maintenance seed completed.'
    end

    private

      def create_technicians
        puts 'Creating technicians...'
        User.find_each do |user|
          next if user.technician.present?

          Maintenance::Technician.create!(
            user: user,
            specialty: %w[Mecánico Eléctrico Instrumentista Electromecánico].sample,
            certification_level: (1..5).to_a.sample,
            status: Maintenance::Technician::STATUSES.sample
          )
        end
      end

      def create_organization_structure
        puts 'Creating plants...'
        create_plants
        create_areas
        create_production_lines
      end

      def create_plants
        [ 'Ciudad de México', 'Monterrey', 'Guadalajara' ].each_with_index do |city, i|
          Organization::Plant.create!(
            code: "PL#{format('%02d', i + 1)}",
            name: "#{Faker::Industry.plant_name} #{city}",
            address: "#{Faker::Address.street_address}, #{city}, #{Faker::Address.zip}",
            status: Organization::Plant::STATUSES.sample
          )
        end
      end

      def create_areas
        Organization::Plant.find_each do |plant|
          Faker::Industry::PLANT_AREAS.each_with_index do |(department, subareas), i|
            subareas.each_with_index do |subarea, j|
              Organization::Area.create!(
                code: "AR#{format('%02d', i + 1)}#{format('%02d', j + 1)}",
                name: "#{department} - #{subarea}",
                description: Faker::Lorem.paragraph(sentence_count: 2),
                plant: plant,
                status: Organization::Area::STATUSES.sample
              )
            end
          end
        end
      end

      def create_production_lines
        Organization::Area.where("name LIKE '%Producción%'").find_each do |area|
          rand(2..4).times do |i|
            capacity = [ 1000, 2000, 5000, 10000 ].sample
            Organization::ProductionLine.create!(
              code: "L#{format('%02d', i + 1)}",
              name: "#{Faker::Industry.production_line_name(area)} #{area.name.split('-').last.strip}",
              description: "Línea de #{area.name.split('-').last.strip} con capacidad de #{capacity} unidades/hora",
              area: area,
              status: Organization::ProductionLine::STATUSES.sample
            )
          end
        end
      end

      def create_manufacturers
        puts 'Creating manufacturers...'
        Faker::Industry::MANUFACTURERS.each do |manufacturer|
          Maintenance::Manufacturer.create!(
            code: manufacturer[:name][0..2].upcase,
            name: manufacturer[:name],
            website: "https://www.#{manufacturer[:name].downcase.gsub(/[^a-z0-9]/, '')}.com",
            support_phone: Faker::PhoneNumber.phone_number,
            suport_email: "support@#{manufacturer[:name].downcase.gsub(/[^a-z0-9]/, '')}.com",
            notes: "Fabricante especializado en #{manufacturer[:specialties].join(' y ')}",
            status: Maintenance::Manufacturer::STATUSES.sample
          )
        end
      end

      def create_asset_types
        puts 'Creating asset types...'
        Faker::Industry::ASSET_CATEGORIES.each do |_category, data|
          data[:types].each do |type|
            Maintenance::AssetType.create!(
              # Ensure unique code
              code: "#{type[0..2].upcase}#{rand(100..9999)}",
              name: type,
              description: "Equipo tipo #{type} para aplicaciones industriales",
              status: Maintenance::AssetType::STATUSES.sample
            )
          end
        end
      end

      def create_assets_and_components
        puts 'Creating assets and components...'
        distribution = determine_asset_distribution
        create_assets_by_distribution(distribution)
      end

      def determine_asset_distribution
        puts 'Determining asset distribution...'
        {
          'Equipos de Bombeo' => 15,
          'Equipos de Compresión' => 10,
          'Equipos de Proceso Térmico' => 8,
          'Sistemas de Transporte' => 20,
          'Sistemas Hidráulicos' => 15,
          'Equipos de Control' => 25,
          'Equipos Eléctricos' => 12
        }
      end

      def create_assets_by_distribution(distribution)
        puts 'Creating assets and components by distribution...'
        asset_types = Maintenance::AssetType.all
        production_lines = Organization::ProductionLine.all
        manufacturers = Maintenance::Manufacturer.all

        distribution.each do |category, count|
          count.times do
            asset_type = asset_types.find do |at|
              Faker::Industry::ASSET_CATEGORIES[category][:types].include?(at.name)
            end
            next unless asset_type

            manufacturing_date = Faker::Date.between(from: '2015-01-01', to: '2020-12-31')

            asset = create_asset(asset_type, production_lines.sample, manufacturers.sample, manufacturing_date, category)
            create_asset_components(asset, category)
            create_asset_documents(asset)
            assign_technicians(asset)
          end
        end
      end

      def create_asset(asset_type, production_line, manufacturer, manufacturing_date, category)
        Maintenance::Asset.create!(
          code: Faker::Alphanumeric.unique.alpha(number: 3).upcase,
          name: Faker::Industry.asset_name(asset_type),
          type: asset_type,
          production_line: production_line,
          manufacturer: manufacturer,
          model: "#{manufacturer.name.upcase[0..2]}-#{Faker::Alphanumeric.alpha(number: 4).upcase}",
          serial_number: generate_serial_number(manufacturing_date),
          manufacturing_date: manufacturing_date,
          purchase_date: manufacturing_date + rand(1..6).months,
          warranty_expiration: manufacturing_date + 5.years,
          status: Maintenance::Asset::STATUSES.sample,
          criticality_level: determine_criticality(category),
          technical_specs: Faker::Industry.technical_specs(category),
          physical_location: Faker::Industry.physical_location(category)
        )
      end

      def generate_serial_number(date)
        "#{date.year % 100}#{format('%02d', date.month)}#{Faker::Alphanumeric.unique.alpha(number: 8).upcase}"
      end

      def determine_criticality(category)
        case category
        when 'Equipos de Control', 'Equipos Eléctricos'
          Maintenance::Asset::CRITICALITY_LEVELS[2..3].sample # Alta criticidad
        when 'Equipos de Proceso Térmico'
          Maintenance::Asset::CRITICALITY_LEVELS[1..2].sample # Media-alta
        else
          Maintenance::Asset::CRITICALITY_LEVELS.sample
        end
      end

      def create_tools
        puts 'Creating maintenance tools...'
        Faker::Industry::TOOLS.each do |type, tools|
          tools.each do |tool|
            Maintenance::Tool.create!(
              # Ensure unique code
              code: "#{tool[0..2].upcase}#{rand(100..999)}",
              name: tool,
              description: "#{tool} para mantenimiento industrial",
              calibration_required: %w[Medición Especiales].include?(type)
            )
          end
        end
      end

      def create_maintenance_plans
        puts 'Creating maintenance plans...'
        Maintenance::Asset.find_each do |asset|
          create_plans_for_asset(asset)
        end
      end

      def create_plans_for_asset(asset)
        # Plan preventivo (siempre existe)
        create_maintenance_plan(asset, :preventive)

        # Plan predictivo (70% de probabilidad)
        create_maintenance_plan(asset, :predictive) if rand < 0.7

        # Plan correctivo (50% de probabilidad)
        create_maintenance_plan(asset, :corrective) if rand < 0.5
      end

      def create_maintenance_plan(asset, plan_type)
        translated_plan_type = Maintenance::Plan.new(plan_type: plan_type).t_enum(:plan_type)

        plan = Maintenance::Plan.create!(
          code: Faker::Alphanumeric.unique.alpha(number: 5).upcase,
          name: "#{translated_plan_type} - #{asset.name}",
          description: generate_plan_description(plan_type),
          plan_type: plan_type,
          status: Maintenance::Plan::STATUSES.sample,
          criticality: asset.criticality_level,
          frequency_type: determine_frequency_type(plan_type),
          frequency_value: determine_frequency_value(plan_type),
          estimated_duration: rand(30..240),
          requires_shutdown: rand < 0.3,
          asset: asset,
          component: asset.components.sample,
          start_date: Date.today - rand(1..365).days
        )

        create_plan_tasks(plan)
        create_plan_resources(plan)
      end

      def generate_plan_description(plan_type)
        case plan_type
        when 'preventivo'
          'Plan de mantenimiento preventivo para asegurar la operación continua y confiable del equipo'
        when 'predictivo'
          'Monitoreo y análisis de condiciones para predecir y prevenir fallas potenciales'
        when 'correctivo'
          'Procedimientos para la reparación y restauración del equipo en caso de fallas'
        else
          ''
        end
      end

      def determine_frequency_type(plan_type)
        types = Maintenance::Plan::FREQUENCY_TYPES
        case plan_type
        when 'preventivo'
          %i[monthly weekly ].sample
        when 'predictivo'
          %i[monthly daily].sample
        else
          types.sample
        end
      end

      def determine_frequency_value(plan_type)
        case plan_type
        when 'preventivo'
          [ 1, 3, 6, 12 ].sample
        when 'predictivo'
          [ 1, 2, 4 ].sample
        else
          nil
        end
      end

      def create_schedules_and_assignments
        puts 'Creating schedules and assignments...'
        Maintenance::Plan.where(plan_type: %w[preventivo predictivo]).find_each do |plan|
          create_schedule_for_plan(plan)
        end
      end

      def create_asset_components(asset, category)
        category_data = Faker::Industry::ASSET_CATEGORIES[category]
        return unless category_data

        component_counts = determine_component_counts(category)

        category_data[:components].each do |subsystem, components|
          next unless component_counts[subsystem]

          rand(component_counts[subsystem]).times do
            component = components.sample
            specs = generate_component_specs(subsystem, component)
            replacement_period = calculate_replacement_period(subsystem)

            asset.components.create!(
              name: "#{component} - #{(1..9999).to_a.sample}",
              description: generate_component_description(subsystem),
              quantity: determine_component_quantity(subsystem),
              specifications: specs,
              replacement_period: replacement_period,
              status: Maintenance::AssetComponent::STATUSES.sample
            )
          end
        end
      end

      def determine_component_counts(category)
        case category
        when 'Equipos de Control'
          { hardware: 2..4, comunicacion: 1..2, instrumentacion: 2..3 }
        when 'Equipos de Bombeo'
          { mecanicos: 3..5, electricos: 1..2, hidraulicos: 2..3 }
        when 'Equipos de Compresión'
          { mecanicos: 3..4, control: 2..3, refrigeracion: 1..2 }
        else
          Hash[Faker::Industry::ASSET_CATEGORIES[category][:components].keys.map { |k| [ k, 1..3 ] }]
        end
      end

      def create_asset_documents(asset)
        document_types = [ 'Manual de Operación', 'Manual de Mantenimiento',
                           'Ficha Técnica', 'Certificado de Garantía' ]

        document_types.each do |doc_type|
          asset.documents.create!(
            document_type: doc_type,
            name: "#{doc_type} - #{asset.name}",
            description: "#{doc_type} para #{asset.name}",
            version: "1.#{rand(0..9)}",
            expiration_date: asset.warranty_expiration,
            status: Maintenance::AssetDocument::STATUSES.sample
          )
        end
      end

      def assign_technicians(asset)
        technicians = Maintenance::Technician.all
        specialties_needed = determine_specialties_needed(asset.type.name)

        specialties_needed.each do |specialty|
          matching_technician = technicians.find { |t| t.specialty == specialty }
          next unless matching_technician

          asset.assignees.create!(technician: matching_technician)
        end
      end

      def determine_specialties_needed(asset_type)
        case asset_type
        when /Eléctric/
          [ 'Eléctrico' ]
        when /Control|Instrumenta/
          [ 'Instrumentista', 'Eléctrico' ]
        when /Bomb|Compres|Motor/
          [ 'Mecánico', 'Electromecánico' ]
        else
          [ 'Mecánico' ]
        end
      end

      def create_plan_tasks(plan)
        task_count = case plan.plan_type
        when 'preventivo' then rand(4..8)
        when 'predictivo' then rand(2..4)
        else rand(3..6)
        end

        task_count.times do |i|
          task = plan.tasks.create!(
            sequence_number: i + 1,
            name: generate_task_name(plan.plan_type),
            description: generate_task_description(plan.plan_type),
            estimated_duration: rand(15..120),
            requires_shutdown: rand < 0.2
          )

          create_task_steps(task)
          create_task_measurements(task) if plan.predictive?
        end
      end

      def generate_task_name(plan_type)
        case plan_type
        when 'preventivo'
          "#{Faker::Industry.maintenance_task} de #{Faker::Industry.component}"
        when 'predictivo'
          "Medición de #{Faker::Industry.measurement_type}"
        else
          "#{Faker::Industry.maintenance_task}"
        end
      end

      def generate_task_description(plan_type)
        case plan_type
        when 'preventivo'
          "Tarea de mantenimiento preventivo para asegurar el funcionamiento óptimo"
        when 'predictivo'
          "Monitoreo y análisis de parámetros para evaluar condición del equipo"
        else
          "Procedimiento de reparación y restauración del equipo"
        end
      end

      def create_task_steps(task)
        step_count = rand(3..6)

        step_count.times do |i|
          task.steps.create!(
            sequence_number: i + 1,
            description: generate_step_description(task.name, i + 1)
          )
        end
      end

      def generate_step_description(task_name, step_number)
        case step_number
        when 1
          "Preparar herramientas y equipos necesarios para #{task_name}"
        when 2
          "Verificar condiciones de seguridad y bloqueos necesarios"
        else
          "#{Faker::Industry.maintenance_task} según procedimiento establecido"
        end
      end

      def create_task_measurements(task)
        measurement_count = rand(2..4)

        measurement_count.times do
          measurement_type = Maintenance::PlanTaskMeasurement::MEASUREMENT_TYPES.sample
          nominal = rand(1..100)
          tolerance = rand(5..15)

          task.measurements.create!(
            name: "Medición de #{measurement_type} #{(1..9999).to_a.sample}",
            measurement_type: measurement_type,
            nominal_value: nominal,
            min_value: nominal - (nominal * tolerance / 100),
            max_value: nominal + (nominal * tolerance / 100),
            tolerance_percentage: tolerance,
            is_critical: rand < 0.3
          )
        end
      end

      def create_plan_resources(plan)
        tools = Maintenance::Tool.all

        rand(1..2).times do
          plan.resources.create!(
            resource_type: Maintenance::PlanResource::RESOURCE_TYPES.sample,
            # Ensure unique tool assignment
            tool: tools.sample,
            specialty_type: determine_specialty_type(plan.asset.type.name),
            quantity: rand(1..3),
            hours_required: rand(1..8)
          )
          tools = tools - [ plan.resources.last.tool ]
        end
      end

      def determine_specialty_type(asset_type)
        case asset_type
        when /Eléctric/
          :electrical
        when /Control|Instrumenta/
          :instrumentation
        else
          Maintenance::PlanResource::SPECIALTY_TYPES.sample
        end
      end

      def create_schedule_for_plan(plan)
        current_date = Date.today
        end_date = current_date + 1.year

        current_date = plan.start_date while current_date <= end_date
        schedule = plan.schedules.create!(
          scheduled_date: current_date,
          status: determine_schedule_status(current_date)
        )

        assign_technicians_to_schedule(schedule)
        current_date += calculate_next_date(plan)
      end

      def determine_schedule_status(date)
        if date < Date.today
          Maintenance::Schedule::STATUSES.sample
        else
          'pendiente'
        end
      end

      def assign_technicians_to_schedule(schedule)
        technicians = schedule.plan.asset.assignees.map(&:technician)

        technicians.each do |technician|
          schedule.assignments.create!(
            maintenance_technician: technician,
            specialty_type: technician.specialty.downcase,
            assigned_hours: rand(1..8),
            status: determine_assignment_status(schedule.status)
          )
        end
      end

      def calculate_next_date(plan)
        case plan.frequency_type
        when 'dias'
          plan.frequency_value.days
        when 'semanas'
          plan.frequency_value.weeks
        when 'meses'
          plan.frequency_value.months
        else
          1.month
        end
      end

      def determine_assignment_status(schedule_status)
        return schedule_status if [ 'completado', 'cancelado' ].include?(schedule_status)
        'pendiente'
      end

      def generate_component_specs(subsystem, component)
        base_specs = case subsystem
        when :mecanicos
                       {
                         material: [ 'Acero Inoxidable', 'Aluminio', 'Bronce', 'Hierro Fundido' ].sample,
                         dimensiones: "#{rand(10..100)}x#{rand(10..100)}x#{rand(10..100)}cm",
                         peso: "#{rand(1..50)}kg",
                         torque_instalacion: "#{rand(20..200)}Nm",
                         clase_precision: "#{[ 'A', 'B', 'C' ].sample}"
                       }
        when :electricos, :hardware
                       {
                         voltaje: "#{[ 12, 24, 110, 220, 440 ].sample}V",
                         potencia: "#{rand(0.5..50.0).round(1)}kW",
                         corriente_nominal: "#{rand(1..100)}A",
                         clase_aislamiento: "#{[ 'F', 'H', 'B' ].sample}",
                         grado_proteccion: "IP#{[ 54, 55, 65, 67 ].sample}",
                         factor_potencia: "#{rand(0.8..0.95).round(2)}"
                       }
        when :hidraulicos
                       {
                         presion_maxima: "#{rand(1..100)}bar",
                         caudal_nominal: "#{rand(1..1000)}L/min",
                         temperatura_operacion: "#{rand(0..120)}°C",
                         viscosidad_fluido: "#{rand(32..68)} ISO VG",
                         material_sellos: [ "NBR", "EPDM", "Viton", "PTFE" ].sample,
                         conexiones: "#{rand(1..4)} pulgadas #{[ 'NPT', 'BSP', 'ANSI' ].sample}"
                       }
        when :control
                       {
                         rango_medicion: "#{rand(0..100)} a #{rand(101..1000)} #{[ 'bar', '°C', 'L/min' ].sample}",
                         precision: "±#{rand(0.1..1.0).round(2)}%",
                         tiempo_respuesta: "#{rand(10..1000)}ms",
                         protocolo_comunicacion: [ '4-20mA', 'HART', 'Modbus', 'Profibus' ].sample,
                         certificacion: [ 'ATEX', 'IECEx', 'CSA', 'UL' ].sample,
                         repetibilidad: "±#{rand(0.05..0.5).round(3)}%"
                       }
        when :combustion
                       {
                         potencia_termica: "#{rand(50..500)}kW",
                         tipo_combustible: [ 'Gas Natural', 'GLP', 'Diesel' ].sample,
                         consumo: "#{rand(5..50)}m³/h",
                         nox_emisiones: "#{rand(30..100)}mg/Nm³",
                         ratio_modulacion: "1:#{rand(3..10)}"
                       }
        when :refrigeracion
                       {
                         capacidad_refrigeracion: "#{rand(5..100)}kW",
                         tipo_refrigerante: [ 'R134a', 'R410A', 'R407C' ].sample,
                         caudal_aire: "#{rand(1000..10000)}m³/h",
                         nivel_ruido: "#{rand(65..85)}dB(A)"
                       }
        when :transmision
                       {
                         relacion_reduccion: "1:#{rand(5..50)}",
                         potencia_maxima: "#{rand(1..100)}kW",
                         velocidad_entrada: "#{rand(750..3600)}RPM",
                         tipo_lubricacion: [ 'Baño Aceite', 'Grasa', 'Forzada' ].sample
                       }
        when :filtracion
                       {
                         grado_filtracion: "#{rand(1..100)}µm",
                         caudal_max: "#{rand(10..1000)}L/min",
                         presion_diferencial: "#{rand(0.1..2.0).round(1)}bar",
                         area_filtrante: "#{rand(0.1..10.0).round(1)}m²"
                       }
        else
                       {}
        end

        # Agregar especificaciones específicas del componente
        component_specific_specs = case component
        when /Motor/
                                     {
                                       velocidad_nominal: "#{rand(750..3600)}RPM",
                                       eficiencia: "IE#{rand(2..4)}"
                                     }
        when /Bomba/
                                     {
                                       npsh_requerido: "#{rand(1..10).round(1)}m",
                                       eficiencia_hidraulica: "#{rand(60..90)}%"
                                     }
        when /Válvula/
                                     {
                                       cv: "#{rand(0.1..100.0).round(1)}",
                                       tipo_actuacion: [ 'Manual', 'Neumática', 'Eléctrica' ].sample
                                     }
        when /Sensor/
                                     {
                                       tipo_sensor: [ 'RTD', 'Termocupla', 'Capacitivo', 'Inductivo' ].sample,
                                       salida: [ '4-20mA', '0-10V', 'Digital' ].sample
                                     }
        else
                                     {}
        end

        base_specs.merge(component_specific_specs)
      end

      def calculate_replacement_period(subsystem)
        base_period = case subsystem
        when :mecanicos
                        rand(12..60) # 1 a 5 años
        when :electricos, :hardware
                        rand(24..96) # 2 a 8 años
        when :hidraulicos
                        rand(6..24) # 6 meses a 2 años
        when :control
                        rand(36..120) # 3 a 10 años
        when :combustion
                        rand(12..48) # 1 a 4 años
        when :refrigeracion
                        rand(18..72) # 1.5 a 6 años
        when :transmision
                        rand(24..84) # 2 a 7 años
        when :filtracion
                        rand(3..12) # 3 meses a 1 año
        else
                        rand(12..36) # 1 a 3 años
        end

        # Ajustar según criticidad del equipo (si está disponible)
        base_period
      end

      def generate_component_description(subsystem)
        technical_details = case subsystem
        when :mecanicos
                              [ "diseñado para alta resistencia mecánica",
                                "fabricado según normas ISO",
                                "con tratamiento superficial anticorrosivo" ].sample
        when :electricos
                              [ "conforme a normativa IEC",
                                "con protección contra sobrecarga",
                                "diseñado para ambiente industrial" ].sample
        when :hidraulicos
                              [ "para operación con fluidos industriales",
                                "con sellos de alta durabilidad",
                                "diseñado para alta presión" ].sample
        when :control
                              [ "con certificación para áreas clasificadas",
                                "compatible con sistemas DCS/SCADA",
                                "con autodiagnóstico integrado" ].sample
        when :combustion
                              [ "con sistema de seguridad de llama",
                                "de bajo nivel de emisiones",
                                "con control automático de combustión" ].sample
        when :refrigeracion
                              [ "con recuperación de calor",
                                "de alta eficiencia energética",
                                "con control de capacidad variable" ].sample
        when :transmision
                              [ "con rodamientos de alta precisión",
                                "diseñado para servicio continuo",
                                "con sistema de lubricación integrado" ].sample
        when :filtracion
                              [ "con indicador de saturación",
                                "de fácil mantenimiento",
                                "con elementos filtrantes intercambiables" ].sample
        else
                              "con especificaciones estándar industriales"
        end

        "Componente #{subsystem.to_s.humanize.downcase} #{technical_details}. #{Faker::Lorem.sentence}"
      end

      def determine_component_quantity(subsystem)
        case subsystem
        when :mecanicos, :hidraulicos
          rand(1..4)
        when :electricos, :hardware
          1
        when :control, :instrumentacion
          rand(1..2)
        when :filtracion
          rand(2..6) # Múltiples elementos filtrantes
        when :transmision
          rand(1..3) # Componentes de transmisión
        when :refrigeracion
          rand(1..2) # Sistemas de refrigeración
        else
          1
        end
      end
  end
end
