soData = [
    {
        "cod": "SO1",
        "des": "Analyze a complex computing problem and to apply principles of computing and other relevant disciplines to identify solutions."
    },

    {
        "cod": "SO2",
        "des": "Design, implement, and evaluate a computing-based solution to meet a given set of computing requirements in the context of the program’s discipline."
    },
    {
        "cod": "SO3",
        "des": "Communicate effectively in a variety of professional contexts."
    },

    {
        "cod": "SO4",
        "des": "Recognize professional responsibilities and make informed judgments in computing practice based on legal and ethical principles."
    },
    {
        "cod": "SO5",
        "des": "Function effectively as a member or leader of a team engaged in activities appropriate to the program’s discipline."
    },
    {
        "cod": "SO6",
        "des": " Apply computer science theory and software development fundamentals to produce computing-based solutions."
    },

]

criteriosData = [
    {
        "des": "Analiza las especificaciones de un problema dado entendiendo los parámetros y datos iniciales mediante la aplicación de las ciencias exactas e identifica los procesos adecuados para brindar una solución.",
        "so_id": 1
    },
    {
        "des": "Identifica los requerimientos de los actores y los componentes para brindar una solución computacional a un problema dado.",
        "so_id": 1
    },
    {
        "des": "Analiza las especificaciones de un problema dado e identifica técnicas, métodos, estructuras de datos, arquitecturas o infraestructura informática para brindar una solución computacional.",
        "so_id": 1
    },
    {
        "des": "Diseña los componentes de una solución basada en cómputo, identifica a los diferentes actores y su conjunto de requerimientos.",
        "so_id": 2
    },
    {
        "des": "Implementa una solución basada en cómputo para un problema dado, utilizando el diseño de componentes establecidos según los requerimientos de los actores.",
        "so_id": 2
    },
    {
        "des": "Evalúa una solución basada en cómputo para un problema dado, de acuerdo a los requerimientos de los actores y el diseño propuesto.",
        "so_id": 2
    },
    {
        "des": "Comunica ideas de manera escrita y ordenada argumentándolas con base científica y técnica en un contexto profesional.",
        "so_id": 3
    },
    {
        "des": "Comunica ideas de manera oral, fortaleciéndolas con lenguaje no verbal y facilitando la captación de su discurso.",
        "so_id": 3
    },
    {
        "des": "Brinda una solución computacional a un problema profesional, identificando dilemas éticos con sus actores y consecuencias.",
        "so_id": 4
    },
    {
        "des": "Demuestra honestidad e integridad en cuanto a cumplir preceptos éticos y deontológicos, asume la responsabilidad de su actividad profesional con respeto hacia sus compañeros, conforme a lo establecido en las normas que rigen a la sociedad.",
        "so_id": 4
    },
    {
        "des": "IMPACTO E INFLUENCIA\n Intención de persuadir, convencer, influenciar o impresionar a otros para obtener su apoyo; o el deseo de tener un impacto o efecto específico en los demás.",
        "so_id": 5
    },
    {
        "des": "TRABAJO EN EQUIPO Y COOPERACIÓN\nImplica una intención genérica por trabajo cooperativo con otros, de trabajar juntos y desarrollar colaboración, como opuesto a trabajar separadamente o competitivamente.",
        "so_id": 5
    },
    {
        "des": "FORMACIÓN DE RELACIONES Y CONTACTO\nTrabajo para realizar o mantener relaciones amistosas, amables, o redes de contactos con gente que es o puede ser útil algún día para el logro de las metas laborales. ",
        "so_id": 5
    },
    {
        "des": "DESARROLLO DE LOS DEMÁS \nVersión de Impacto e Influencia, en la que la intención es enseñar o fomentar el desarrollo de alguna o de algunas personas. Implica la capacidad para emprender acciones eficaces para mejorar el talento y las capacidades de los demás.",
        "so_id": 5
    },
    {
        "des": "LIDERAZGO DE EQUIPO\nIntención de tomar el rol de líder de un equipo u otro grupo.",
        "so_id": 5
    },
    {
        "des": "Aplica teoría de ciencias de la computación y fundamentos de desarrollo de software para identificar y diseñar una solución apropiada para un problema dado. ",
        "so_id": 6
    },
    {
        "des": "Implementa la solución acorde al diseño usando teoría de las ciencias de computación y fundamentos de desarrollo de software.",
        "so_id": 6
    },


]


nivelesCri = [
    {
        "desNivel": "Entiende los parámetros y datos iniciales; sin embargo, no identifica los procesos y tampoco brinda una solución a un problema dado.",
    },
    {
        "desNivel": "Entiende los parámetros y datos iniciales e identifica los procesos; sin embargo, no brinda una solución a un  problema dado.",
    },
    {
        "desNivel": "Entiende los parámetros, datos iniciales, identifica los procesos y brinda una solución al problema problema dado.",
    },
    {
        "desNivel": "Entiende el conjunto de datos, identifica los procesos, optimiza dichos procesos y brinda una solución a un problema dado.",
    },
    {
        "desNivel": "Identifica los requerimientos de los actores; sin embargo, no identifica los componentes y tampoco brinda una solución computacional a un problema dado.",
    },
    {
        "desNivel": "Identifica los requerimientos de los actores y los componentes; sin embargo, no brinda una solución computacional a un problema dado.",
    },
    {
        "desNivel": "Identifica los requerimientos de los actores, los componentes convencionales y brinda una solución computacional a un problema dado.",
    },
    {
        "desNivel": "Identifica los requerimientos de los actores, los componentes convencionales, agrega nuevos componentes y brinda una solución computacional a un problema dado.",
    },
    {
        "desNivel": "Identifica técnicas, métodos, estructuras de datos; sin embargo, no identifica arquitecturas o infraestructuras informáticas y tampoco brinda una solución computacional.",
    },
    {
        "desNivel": "Identifica técnicas, métodos, estructuras de datos, arquitecturas o infraestructuras informáticas; sin embargo, no brinda una solución computacional.",
    },
    {
        "desNivel": "Identifica técnicas, métodos, estructuras de datos; así como también arquitecturas o infraestructuras informáticas y brinda una solución computacional convencional.",
    },
    {
        "desNivel": "Identifica técnicas, métodos, estructuras de datos; así como también arquitecturas o infraestructuras informáticas y brinda una solución computacional innovadora.",
    },
    {
        "desNivel": "Diseña los componentes de una solución basada en cómputo sin embargo, no identifica a los diferentes actores y tampoco considera su conjunto de requerimientos.",
    },
    {
        "desNivel": "Diseña los componentes de una solución basada en cómputo, identifica a los diferentes actores sin embargo, no considera su conjunto de requerimientos.",
    },
    {
        "desNivel": "Diseña todos los componentes convencionales de una solución basada en cómputo, identifica a los diferentes actores y considera su conjunto de requerimientos.",
    },
    {
        "desNivel": "Diseña todos los componentes convencionales y agrega componentes novedosos para una solución basada en cómputo, identifica a los diferentes actores y considera su conjunto de requerimientos.",
    },
    {
        "desNivel": "Implementa una solución basada en cómputo para un problema dado sin embargo, no utiliza el diseño de componentes establecidos según los requerimientos de los actores.",
    },
    {
        "desNivel": "Implementa una solución basada en cómputo para un problema dado considerando parte del diseño de componentes establecidos según los requerimientos de los actores.",
    },
    {
        "desNivel": "Implementa una solución convencional basada en cómputo para un problema dado, considerando la totalidad de componentes establecidos en el diseño según los requerimientos de los actores.",
    },
    {
        "desNivel": "Implementa correctamente una solución óptima basada en cómputo para un problema dado, considerando todo el diseño de componentes establecidos según los requerimientos de los actores.",
    },
    {
        "desNivel": "Evalúa una solución basada en cómputo para un problema dado sin embargo, no considera los requerimientos de los actores ni el diseño propuesto.",
    },
    {
        "desNivel": "Evalúa una solución basada en cómputo para un problema dado, considera los requerimientos de los actores sin el diseño propuesto.",
    },
    {
        "desNivel": "Evalúa una solución convencional basada en cómputo para un problema dado, considera todos los requerimientos de los actores y el diseño propuesto.",
    },
    {
        "desNivel": "Evalúa una solución basada en cómputo para un problema dado, considera todos los requerimientos de los actores y el diseño propuesto y determina si la solución es óptima.",
    },
    {
        "desNivel": "Comunica ideas de manera escrita y ordenada sin embargo, no las argumenta con base técnica ni científica en un contexto profesional.",
    },
    {
        "desNivel": "Comunica las ideas de manera escrita y ordenada, proporcionando argumentos con base técnica, sin un argumento científico, en un contexto profesional.",
    },
    {
        "desNivel": "Comunica efectivamente todas las ideas, de manera escrita y ordenada, argumentándolas de forma convencional, con base técnica y ciéntifica en un contexto profesional.",
    },
    {
        "desNivel": "Comunica efectivamente todas las ideas, de manera escrita y ordenada, argumentándolas minuciosamente con base científica y técnica en un contexto profesional aplicando estructuras de escritura y/o estándares internacionales.",
    },
    {
        "desNivel": "Comunica ideas de manera oral sin embargo, no las complementa con lenguaje no verbal ni facilita la captación de su discurso.",
    },
    {
        "desNivel": "Comunica ideas de manera oral y utiliza el lenguaje no verbal sin embargo se dificulta la captación de su discurso.",
    },
    {
        "desNivel": "Comunica efectivamente todas las ideas, de manera oral, fortaleciéndolas con lenguaje no verbal y facilitando la captación de su discurso de una forma convencional.",
    },
    {
        "desNivel": "Comunica efectivamente todas las ideas, de manera oral, fortaleciéndolas con lenguaje no verbal transmitiendo confianza y seguridad para atraer la atención de la audiencia y así captar la comprensión de su discurso.",
    },
    {
        "desNivel": "Brinda una solución computacional a un problema profesional, identificando dilemas éticos sin embargo, no identifica ni sus actores ni las consecuencias.",
    },
    {
        "desNivel": "Brinda una solución computacional a un problema profesional, identificando dilemas éticos y sus actores sin embargo, no determina las consecuencias.",
    },
    {
        "desNivel": "Brinda una solución computacional a un problema profesional, identificando dilemas éticos, sus actores y consecuencias.",
    },
    {
        "desNivel": "Brinda una solución computacional a un problema profesional, identificando dilemas éticos con sus actores y consecuencias. Además, es capaz de sugerir a los involucrados las soluciones para la toma de decisiones.",
    },
    {
        "desNivel": "Demuestra honestidad e integridad en cuanto a cumplir preceptos éticos y deontológicos sin embargo, no asume la responsabilidad de su actividad profesional ni demuestra respeto hacia sus compañeros, conforme a lo establecido en las normas que rigen a la sociedad.",
    },
    {
        "desNivel": "Demuestra honestidad e integridad en cuanto a cumplir preceptos éticos y deontológicos y asume la responsabilidad de su actividad profesional sin embargo, no demuestra respeto hacia sus compañeros, conforme a lo establecido en las normas que rigen a la sociedad.",
    },
    {
        "desNivel": "Demuestra honestidad e integridad en cuanto a cumplir preceptos éticos y deontológicos, asume la responsabilidad de su actividad profesional con respeto hacia sus compañeros, conforme a lo establecido en las normas que rigen a la sociedad.",
    },
    {
        "desNivel": "Demuestra honestidad e integridad en cuanto a cumplir preceptos éticos y deontológicos, asume la responsabilidad de su actividad profesional con respeto hacia sus compañeros, conforme a lo establecido en las normas que rigen a la sociedad. Además comparte las buenas prácticas de su labor profesional.",
    },
    {
        "desNivel": "A1 Declara intención, pero no Realiza Acciones Especificas. Intenta tener un impacto o efecto específico; expresa preocupación por reputación, estatus y apariencias.\nA2 Realiza una Acción Simple para Persuadir. No realiza intentos aparentes para adaptarse al interés o nivel de la audiencia. Usa la persuasión directa en una discusión o presentación (e.g. apela a razones, datos, propósitos mayores; usa ejemplos concretos, ayudas audiovisuales, demostraciones,etc.).",
    },
    {
        "desNivel": "A3 Realiza una Acción con Dos Pasos para Persuadir. No realiza intentos aparentes para adaptarse al interés o nivel de la audiencia. Incluye preparación cuidadosa de datos a ser presentados, o la preparación de dos o más argumentos diferentes en una presentación o discusión.\nA4 Calcula el Impacto de sus Acciones o Palabras. Adapta una presentación o discusión para atraer el interés y nivel de los otros. Anticipa el efecto de una acción u otro detalle en la imagen que la gente se formará del relator.",
    },
    {
        "desNivel": "A5 Calcula una Acción Dramática. Modela la conducta deseada de los demás o realiza una acción dramática bien pensada e inusual para tener un impacto específico.\nA6 Realiza Dos Pasos para Influenciar. Con cada paso adaptado a la audiencia específica o planeado para tener un efecto específico o se anticipa y prepara para la reacción de los demás.",
    },
    {
        "desNivel": "A7 Tres Acciones o Influencia Indirecta. Usa expertos o terceras personas para influenciar; o realiza tres acciones diferentes o realiza discusiones complejas, planeadas. Junta coaliciones políticas, construye apoyo desde ""bambalinas"" para sus ideas, deliberadamente proporciona o retiene información para tener efectos específicos, usa habilidades de procesos grupa les para dirigir o conducir a un grupo.\nA8 Estrategias de Influencia Compleja. Usa estrategias de influencia complejas adaptadas a situaciones específicas (e.g. usando cadenas de influencia indirecta ""obtener que A le muestre a B de manera que B le diga a C tal y tal cosa""), estructurando trabajos o situaciones o cambiando laestructura organizacional para fomentar conductas deseadas; usa maniobras políticas complejas para alcanzar una meta o tener un efecto.",
    },
    {
        "desNivel": "Coopera. Participa deseosamente, apoya las decisiones del equipo, es un \"buen jugador del equipo\", hace su parte del trabajo.\nComparte Información. Mantiene a la gente informada y al día acerca del proceso del grupo, comparte toda la información útil o relevante.",
    },
    {
        "desNivel": "Expresa Expectativas Positivas. Expresa expectativas positivas de los demás. Se refiere a los miembros del equipo en términos positivos. Muestra respeto por la inteligencia de los demás, apelando a la razón.\nSolicita Información. Valoriza genuinamente la información y experiencia de los otros, está deseoso de aprender de los demás, especialmente de subordinados. Solicita ideas y opiniones para ayudar a formar planes o decisiones específicas. Invita a todos los miembros del grupo a contribuir a un proceso.",
    },
    {
        "desNivel": "Da Autoridad a Otros. Da público crédito a otros cuando han rendido bien. Apoya y autoriza a otros, los hace sentir fuertes o importantes. Forma Equipo. Actúa para promover un clima amigable, buena moral, y cooperación (realiza fiestas y reuniones, crea símbolos de identidad grupal). Protege y promueve la reputación del grupo con extraños.",
    },
    {
        "desNivel": "Resuelve Conflictos. Enfrenta los conflictos y anima o facilita una solución beneficiosa de los conflictos (debe involucrar acción para resolver el conflicto, no esconderlo o evitar el tema).",
    },
    {
        "desNivel": "Acepta Invitaciones. Acepta invitaciones u otras aperturas amistosas de otros, pero no extiende las invitaciones o sale de su vía para establecer relaciones laborales. \nRealiza Contactos Relacionados con el Trabajo. Mantiene relaciones laborales formales (en gran medida confinadas a materias relacionadas con el trabajo, no necesariamente formales en el tono, estilo o estructura). Incluye charlas inestructuradas acerca de materias relativas al trabajo.",
    },
    {
        "desNivel": "Hace Contactos Ocasionales Informales. Ocasionalmente inicia relaciones informales o casuales en el trabajo, charlas sobre los niños, deportes, noticias, etc.\nConstruye Rapport. Frecuentemente inicia contactos informales o casuales en el trabajo con compañeros o clientes. Hace un esfuerzo consciente para establecer rapport.",
    },
    {
        "desNivel": "Hace Contactos Sociales Ocasionales. Ocasionalmente inicia o persigue relaciones amistosas, con asociados o clientes fuera del trabajo en clubes, restaurantes, etc.",
    },
    {
        "desNivel": "Realiza Contactos Sociales Frecuentes. Frecuentemente inicia o prosigue relaciones amistosas con asociados o clientes fuera del trabajo en clubes, restaurantes, etc. \nHace Contactos Familiares y Hogareños. Ocasionalmente invita a casa a asociados o clientes o va a sus casas. \nHace Amistades Personales Cercanas. Frecuentemente entretiene a asociados o clientes en casa. Establece amistad personal con ellos o utiliza amistades personales para expandir la red del negocio.",
    },
    {
        "desNivel": "A1 Expresa Expectativas Positivas de los Demás. Hace comentarios positivos relativos a las habilidades o potencialidades de los demás aún en casos \"difíciles\". Cree que los demás desean y pueden aprender. \nA2 Da Instrucciones Detalladas y/o Demostraciones en Terreno. Dice cómo hacer el trabajo, hace sugerencias útiles específicas.",
    },
    {
        "desNivel": "A3 Da Razones o Apoya a Otros. Da instrucciones o demostraciones con razones o racionales incluidas como estrategias de entrenamiento; o da apoyo práctico o ayuda para hacer más fácil el trabajo (e.g.entrega en forma voluntaria recursos adicionales, herramientas, información, ayuda experta). Hace preguntas, pruebas o usa otros métodos para verificar que los demás han entendido las explicaciones o instrucciones.\nA4 Da Retroalimentación Específica Positiva o Mezclada con Propósitos de Desarrollar.\nA5 Reasegura y Da Aliento. Reasegura a los otros luego de un traspié. Da retroalimentación negativa en términos conductuales más que personales, y expresa expectativas positivas para el desempeño futuro o de sugerencias individualizadas para mejoramiento; o descompone tareas difíciles en partes más pequeñas, o usa otras estrategias.",
    },
    {
        "desNivel": "A6 Hace Entrenamiento o Enseñanza de Largo Plazo. Diseña misiones apropiadas y de ayuda, entrenamiento formal, u otras experiencias con el propósito de fomentar el aprendizaje y desarrollo de la otra persona. Incluye hacer que la persona trabaje por sí misma, respuesta a problemas de manera que ellos realmente adquieran experiencia, en vez de simplemente darles la respuesta. Entrenamiento formal realizado simplemente para cumplir con requerimientos corporativos o gubernamentales no cuenta aquí.\nA7 Crea Nuevo Entrenamiento/Enseñanza. Identifica una necesidad de entrenamiento o desarrollo y diseña o establece nuevos programas o materiales para alcanzarlos; diseña enfoques significativamente nuevos para enseñar materias tradicionales; o arregla experiencias exitosas para que otros desarrollen sus habilidades y confianza.",
    },
    {
        "desNivel": "A8 Delega Completamente. Luego de evaluar las competencias de los subordinados, delega total autoridad y responsabilidad con la posibilidad de realizar una tarea a su manera, incluyendo la oportunidad de hacer y aprender de los errores en un ambiente no crítico.\nA9 Recompensa Buen Desarrollo. Promueve o consigue promociones para subordinados, .especialmente competentes como recompensa o como experiencias de desarrollo; o da a los otros recompensas por buen desempeño. Esta conducta se puntúa alto porque, generalmente, un individuo tiene que haber desarrollado bien a la gente para ser capaz de recompensarlos por haber respondido bien.",
    },
    {
        "desNivel": "Administra Reuniones.\nConfecciona agendas y objetivos, controla el tiempo, asigna tareas, etc. ",
    },
    {
        "desNivel": "Informa a Personas. Permite saber qué sucede a las personas afectadas por una decisión. Asegura que el grupo tenga la información necesaria. Puede explicar las razones de una decisión.\nUsa la Autoridad con Justicia. Usa el poder y la autoridad formal de una manera justa y equitativa.  Hace un esfuerzo personal para tratar con justicia a todos los miembros del grupo.",
    },
    {
        "desNivel": "Promueve la Efectividad del Equipo. Usa estrategias complejas para promover la moral y productividad del equipo (decisiones de contratos y despidos, asignaciones de tareas, entrenamiento cruzado, etc.)\nCuida al Grupo. Protege al grupo y su reputación respecto a la organización o la comunidad en su conjunto: obtiene el personal deseado, recursos, información para el grupo. Asegura que se alcancen las necesidades prácticas del grupo. Frecuentemente este nivel se encuentra en situaciones militares o industriales, pero también se aplica en la obtención de recursos menos tangibles para profesionales o gerenciales subordinados.",
    },
    {
        "desNivel": "Se Posiciona Así mismo como Líder. Asegura que los otros asuman la misión, metas, agenda, clima, políticas, etc. \"Da un buen ejemplo\" (es decir, modela la conducta deseada). Asegura que las tareas del grupo se cumplan (es un líder creíble). /nComunica una Visión Obligada. Tiene genuino carisma, comunica una visión obligada, que genera excitación, entusiasmo, y compromiso a la misión del grupo. (ejemplo de este nivel son raros y es probable que se infieran del resultado de actividades, de reportes de otros, y de las observaciones e impresiones del entrevistador más que de citas directas.",
    },
    {
        "desNivel": "Identifica y diseña una solución, aplicando teoría de las ciencias de la computación y fundamentos de desarrollo de software; sin embargo, no soluciona el problema dado.",
    },
    {
        "desNivel": "Identifica y diseña una solución, aplicando teoría de las ciencias de la computación y fundamentos de desarrollo de software; sin embargo, soluciona en parte el problema dado.",
    },
    {
        "desNivel": "Identifica y diseña una solución, aplicando teoría de las ciencias de la computación y fundamentos de desarrollo de software, alcanzando los resultados esperados según el problema dado.",
    },
    {
        "desNivel": "Identifica y diseña una solución, aplicando teoría de las ciencias de la computación y fundamentos de desarrollo de software, alcanzando los resultados previstos con los menores recursos posibles.",
    },
    {
        "desNivel": "Implementa la solución usando teoría de las ciencias de computación y fundamentos de desarrollo de software; sin embargo no está acorde al diseño propuesto",
    },
    {
        "desNivel": "Implementa la solución usando teoría de las ciencias de computación y fundamentos de desarrollo de software; sin embargo cumple en parte con el diseño propuesto",
    },
    {
        "desNivel": "Implementa la solución usando teoría de las ciencias de computación y fundamentos de desarrollo de software; cumpliendo con todo el diseño propuesto",
    },
    {
        "desNivel": "Implementa la solución usando teoría de las ciencias de computación y fundamentos de desarrollo de software; cumpliendo con todo el diseño propuesto, alcanzando los resultados previstos con los menores recursos posibles.",
    }
]

# Entiende los parámetros y datos iniciales; sin embargo, no identifica los procesos y tampoco brinda una solución a un problema dado.
# Entiende los parámetros y datos iniciales e identifica los procesos; sin embargo, no brinda una solución a un  problema dado.
# Entiende los parámetros, datos iniciales, identifica los procesos y brinda una solución al problema problema dado.
# Entiende el conjunto de datos, identifica los procesos, optimiza dichos procesos y brinda una solución a un problema dado.
# Identifica los requerimientos de los actores; sin embargo, no identifica los componentes y tampoco brinda una solución computacional a un problema dado.
# Identifica los requerimientos de los actores y los componentes; sin embargo, no brinda una solución computacional a un problema dado.
# Identifica los requerimientos de los actores, los componentes convencionales y brinda una solución computacional a un problema dado.
# Identifica los requerimientos de los actores, los componentes convencionales, agrega nuevos componentes y brinda una solución computacional a un problema dado.
# Identifica técnicas, métodos, estructuras de datos; sin embargo, no identifica arquitecturas o infraestructuras informáticas y tampoco brinda una solución computacional.
# Identifica técnicas, métodos, estructuras de datos, arquitecturas o infraestructuras informáticas; sin embargo, no brinda una solución computacional.
# Identifica técnicas, métodos, estructuras de datos; así como también arquitecturas o infraestructuras informáticas y brinda una solución computacional convencional.
# Identifica técnicas, métodos, estructuras de datos; así como también arquitecturas o infraestructuras informáticas y brinda una solución computacional innovadora.


# Diseña los componentes de una solución basada en cómputo sin embargo, no identifica a los diferentes actores y tampoco considera su conjunto de requerimientos.
# Diseña los componentes de una solución basada en cómputo, identifica a los diferentes actores sin embargo, no considera su conjunto de requerimientos.
# Diseña todos los componentes convencionales de una solución basada en cómputo, identifica a los diferentes actores y considera su conjunto de requerimientos.
# Diseña todos los componentes convencionales y agrega componentes novedosos para una solución basada en cómputo, identifica a los diferentes actores y considera su conjunto de requerimientos.
# Implementa una solución basada en cómputo para un problema dado sin embargo, no utiliza el diseño de componentes establecidos según los requerimientos de los actores.
# Implementa una solución basada en cómputo para un problema dado considerando parte del diseño de componentes establecidos según los requerimientos de los actores.
# Implementa una solución convencional basada en cómputo para un problema dado, considerando la totalidad de componentes establecidos en el diseño según los requerimientos de los actores.
# Implementa correctamente una solución óptima basada en cómputo para un problema dado, considerando todo el diseño de componentes establecidos según los requerimientos de los actores.
# Evalúa una solución basada en cómputo para un problema dado sin embargo, no considera los requerimientos de los actores ni el diseño propuesto.
# Evalúa una solución basada en cómputo para un problema dado, considera los requerimientos de los actores sin el diseño propuesto.
# Evalúa una solución convencional basada en cómputo para un problema dado, considera todos los requerimientos de los actores y el diseño propuesto.
# Evalúa una solución basada en cómputo para un problema dado, considera todos los requerimientos de los actores y el diseño propuesto y determina si la solución es óptima.


# Comunica ideas de manera escrita y ordenada sin embargo, no las argumenta con base técnica ni científica en un contexto profesional.
# Comunica las ideas de manera escrita y ordenada, proporcionando argumentos con base técnica, sin un argumento científico, en un contexto profesional.
# Comunica efectivamente todas las ideas, de manera escrita y ordenada, argumentándolas de forma convencional, con base técnica y ciéntifica en un contexto profesional.
# Comunica efectivamente todas las ideas, de manera escrita y ordenada, argumentándolas minuciosamente con base científica y técnica en un contexto profesional aplicando estructuras de escritura y/o estándares internacionales.
# Comunica ideas de manera oral sin embargo, no las complementa con lenguaje no verbal ni facilita la captación de su discurso.
# Comunica ideas de manera oral y utiliza el lenguaje no verbal sin embargo se dificulta la captación de su discurso.
# Comunica efectivamente todas las ideas, de manera oral, fortaleciéndolas con lenguaje no verbal y facilitando la captación de su discurso de una forma convencional.
# Comunica efectivamente todas las ideas, de manera oral, fortaleciéndolas con lenguaje no verbal transmitiendo confianza y seguridad para atraer la atención de la audiencia y así captar la comprensión de su discurso.
# Brinda una solución computacional a un problema profesional, identificando dilemas éticos sin embargo, no identifica ni sus actores ni las consecuencias.
# Brinda una solución computacional a un problema profesional, identificando dilemas éticos y sus actores sin embargo, no determina las consecuencias.
# Brinda una solución computacional a un problema profesional, identificando dilemas éticos, sus actores y consecuencias.
# Brinda una solución computacional a un problema profesional, identificando dilemas éticos con sus actores y consecuencias. Además, es capaz de sugerir a los involucrados las soluciones para la toma de decisiones.
# Demuestra honestidad e integridad en cuanto a cumplir preceptos éticos y deontológicos sin embargo, no asume la responsabilidad de su actividad profesional ni demuestra respeto hacia sus compañeros, conforme a lo establecido en las normas que rigen a la sociedad.
# Demuestra honestidad e integridad en cuanto a cumplir preceptos éticos y deontológicos y asume la responsabilidad de su actividad profesional sin embargo, no demuestra respeto hacia sus compañeros, conforme a lo establecido en las normas que rigen a la sociedad.
# Demuestra honestidad e integridad en cuanto a cumplir preceptos éticos y deontológicos, asume la responsabilidad de su actividad profesional con respeto hacia sus compañeros, conforme a lo establecido en las normas que rigen a la sociedad.
# Demuestra honestidad e integridad en cuanto a cumplir preceptos éticos y deontológicos, asume la responsabilidad de su actividad profesional con respeto hacia sus compañeros, conforme a lo establecido en las normas que rigen a la sociedad. Además comparte las buenas prácticas de su labor profesional.

# A1 Declara intención, pero no Realiza Acciones Especificas. Intenta tener un impacto o efecto específico; expresa preocupación por reputación, estatus y apariencias.\nA2 Realiza una Acción Simple para Persuadir. No realiza intentos aparentes para adaptarse al interés o nivel de la audiencia. Usa la persuasión directa en una discusión o presentación (e.g. apela a razones, datos, propósitos mayores; usa ejemplos concretos, ayudas audiovisuales, demostraciones,etc.).
# A3 Realiza una Acción con Dos Pasos para Persuadir. No realiza intentos aparentes para adaptarse al interés o nivel de la audiencia. Incluye preparación cuidadosa de datos a ser presentados, o la preparación de dos o más argumentos diferentes en una presentación o discusión.\nA4 Calcula el Impacto de sus Acciones o Palabras. Adapta una presentación o discusión para atraer el interés y nivel de los otros. Anticipa el efecto de una acción u otro detalle en la imagen que la gente se formará del relator.
# A5 Calcula una Acción Dramática. Modela la conducta deseada de los demás o realiza una acción dramática bien pensada e inusual para tener un impacto específico.\nA6 Realiza Dos Pasos para Influenciar. Con cada paso adaptado a la audiencia específica o planeado para tener un efecto específico o se anticipa y prepara para la reacción de los demás.
# A7 Tres Acciones o Influencia Indirecta. Usa expertos o terceras personas para influenciar; o realiza tres acciones diferentes o realiza discusiones complejas, planeadas. Junta coaliciones políticas, construye apoyo desde ""bambalinas"" para sus ideas, deliberadamente proporciona o retiene información para tener efectos específicos, usa habilidades de procesos grupa les para dirigir o conducir a un grupo.\nA8 Estrategias de Influencia Compleja. Usa estrategias de influencia complejas adaptadas a situaciones específicas (e.g. usando cadenas de influencia indirecta ""obtener que A le muestre a B de manera que B le diga a C tal y tal cosa""), estructurando trabajos o situaciones o cambiando laestructura organizacional para fomentar conductas deseadas; usa maniobras políticas complejas para alcanzar una meta o tener un efecto.
# Coopera. Participa deseosamente, apoya las decisiones del equipo, es un \"buen jugador del equipo\", hace su parte del trabajo.\nComparte Información. Mantiene a la gente informada y al día acerca del proceso del grupo, comparte toda la información útil o relevante.
# Expresa Expectativas Positivas. Expresa expectativas positivas de los demás. Se refiere a los miembros del equipo en términos positivos. Muestra respeto por la inteligencia de los demás, apelando a la razón.\nSolicita Información. Valoriza genuinamente la información y experiencia de los otros, está deseoso de aprender de los demás, especialmente de subordinados. Solicita ideas y opiniones para ayudar a formar planes o decisiones específicas. Invita a todos los miembros del grupo a contribuir a un proceso.
# Da Autoridad a Otros. Da público crédito a otros cuando han rendido bien. Apoya y autoriza a otros, los hace sentir fuertes o importantes. Forma Equipo. Actúa para promover un clima amigable, buena moral, y cooperación (realiza fiestas y reuniones, crea símbolos de identidad grupal). Protege y promueve la reputación del grupo con extraños.
# Resuelve Conflictos. Enfrenta los conflictos y anima o facilita una solución beneficiosa de los conflictos (debe involucrar acción para resolver el conflicto, no esconderlo o evitar el tema).
# Acepta Invitaciones. Acepta invitaciones u otras aperturas amistosas de otros, pero no extiende las invitaciones o sale de su vía para establecer relaciones laborales. \nRealiza Contactos Relacionados con el Trabajo. Mantiene relaciones laborales formales (en gran medida confinadas a materias relacionadas con el trabajo, no necesariamente formales en el tono, estilo o estructura). Incluye charlas inestructuradas acerca de materias relativas al trabajo.
# Hace Contactos Ocasionales Informales. Ocasionalmente inicia relaciones informales o casuales en el trabajo, charlas sobre los niños, deportes, noticias, etc.\nConstruye Rapport. Frecuentemente inicia contactos informales o casuales en el trabajo con compañeros o clientes. Hace un esfuerzo consciente para establecer rapport.
# Hace Contactos Sociales Ocasionales. Ocasionalmente inicia o persigue relaciones amistosas, con asociados o clientes fuera del trabajo en clubes, restaurantes, etc.
# Realiza Contactos Sociales Frecuentes. Frecuentemente inicia o prosigue relaciones amistosas con asociados o clientes fuera del trabajo en clubes, restaurantes, etc. \nHace Contactos Familiares y Hogareños. Ocasionalmente invita a casa a asociados o clientes o va a sus casas. \nHace Amistades Personales Cercanas. Frecuentemente entretiene a asociados o clientes en casa. Establece amistad personal con ellos o utiliza amistades personales para expandir la red del negocio.
# A1 Expresa Expectativas Positivas de los Demás. Hace comentarios positivos relativos a las habilidades o potencialidades de los demás aún en casos \"difíciles\". Cree que los demás desean y pueden aprender. \nA2 Da Instrucciones Detalladas y/o Demostraciones en Terreno. Dice cómo hacer el trabajo, hace sugerencias útiles específicas.
# A3 Da Razones o Apoya a Otros. Da instrucciones o demostraciones con razones o racionales incluidas como estrategias de entrenamiento; o da apoyo práctico o ayuda para hacer más fácil el trabajo (e.g.entrega en forma voluntaria recursos adicionales, herramientas, información, ayuda experta). Hace preguntas, pruebas o usa otros métodos para verificar que los demás han entendido las explicaciones o instrucciones.\nA4 Da Retroalimentación Específica Positiva o Mezclada con Propósitos de Desarrollar.\nA5 Reasegura y Da Aliento. Reasegura a los otros luego de un traspié. Da retroalimentación negativa en términos conductuales más que personales, y expresa expectativas positivas para el desempeño futuro o de sugerencias individualizadas para mejoramiento; o descompone tareas difíciles en partes más pequeñas, o usa otras estrategias.
# A6 Hace Entrenamiento o Enseñanza de Largo Plazo. Diseña misiones apropiadas y de ayuda, entrenamiento formal, u otras experiencias con el propósito de fomentar el aprendizaje y desarrollo de la otra persona. Incluye hacer que la persona trabaje por sí misma, respuesta a problemas de manera que ellos realmente adquieran experiencia, en vez de simplemente darles la respuesta. Entrenamiento formal realizado simplemente para cumplir con requerimientos corporativos o gubernamentales no cuenta aquí.\nA7 Crea Nuevo Entrenamiento/Enseñanza. Identifica una necesidad de entrenamiento o desarrollo y diseña o establece nuevos programas o materiales para alcanzarlos; diseña enfoques significativamente nuevos para enseñar materias tradicionales; o arregla experiencias exitosas para que otros desarrollen sus habilidades y confianza.
# A8 Delega Completamente. Luego de evaluar las competencias de los subordinados, delega total autoridad y responsabilidad con la posibilidad de realizar una tarea a su manera, incluyendo la oportunidad de hacer y aprender de los errores en un ambiente no crítico.\nA9 Recompensa Buen Desarrollo. Promueve o consigue promociones para subordinados, .especialmente competentes como recompensa o como experiencias de desarrollo; o da a los otros recompensas por buen desempeño. Esta conducta se puntúa alto porque, generalmente, un individuo tiene que haber desarrollado bien a la gente para ser capaz de recompensarlos por haber respondido bien.
# Administra Reuniones.\nConfecciona agendas y objetivos, controla el tiempo, asigna tareas, etc.
# Informa a Personas. Permite saber qué sucede a las personas afectadas por una decisión. Asegura que el grupo tenga la información necesaria. Puede explicar las razones de una decisión.\nUsa la Autoridad con Justicia. Usa el poder y la autoridad formal de una manera justa y equitativa.  Hace un esfuerzo personal para tratar con justicia a todos los miembros del grupo.
# Promueve la Efectividad del Equipo. Usa estrategias complejas para promover la moral y productividad del equipo (decisiones de contratos y despidos, asignaciones de tareas, entrenamiento cruzado, etc.)\nCuida al Grupo. Protege al grupo y su reputación respecto a la organización o la comunidad en su conjunto: obtiene el personal deseado, recursos, información para el grupo. Asegura que se alcancen las necesidades prácticas del grupo. Frecuentemente este nivel se encuentra en situaciones militares o industriales, pero también se aplica en la obtención de recursos menos tangibles para profesionales o gerenciales subordinados.
# Se Posiciona Así mismo como Líder. Asegura que los otros asuman la misión, metas, agenda, clima, políticas, etc. \"Da un buen ejemplo\" (es decir, modela la conducta deseada). Asegura que las tareas del grupo se cumplan (es un líder creíble). /nComunica una Visión Obligada. Tiene genuino carisma, comunica una visión obligada, que genera excitación, entusiasmo, y compromiso a la misión del grupo. (ejemplo de este nivel son raros y es probable que se infieran del resultado de actividades, de reportes de otros, y de las observaciones e impresiones del entrevistador más que de citas directas.


# Identifica y diseña una solución, aplicando teoría de las ciencias de la computación y fundamentos de desarrollo de software; sin embargo, no soluciona el problema dado.
# Identifica y diseña una solución, aplicando teoría de las ciencias de la computación y fundamentos de desarrollo de software; sin embargo, soluciona en parte el problema dado.
# Identifica y diseña una solución, aplicando teoría de las ciencias de la computación y fundamentos de desarrollo de software, alcanzando los resultados esperados según el problema dado.
# Identifica y diseña una solución, aplicando teoría de las ciencias de la computación y fundamentos de desarrollo de software, alcanzando los resultados previstos con los menores recursos posibles.
# Implementa la solución usando teoría de las ciencias de computación y fundamentos de desarrollo de software; sin embargo no está acorde al diseño propuesto
# Implementa la solución usando teoría de las ciencias de computación y fundamentos de desarrollo de software; sin embargo cumple en parte con el diseño propuesto
# Implementa la solución usando teoría de las ciencias de computación y fundamentos de desarrollo de software; cumpliendo con todo el diseño propuesto
# Implementa la solución usando teoría de las ciencias de computación y fundamentos de desarrollo de software; cumpliendo con todo el diseño propuesto, alcanzando los resultados previstos con los menores recursos posibles.

criteriosAsignaturasEMPRESAS = [
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 1
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 2
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 3
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 4
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 5
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 6
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 7
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 8
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 9
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 10
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 11
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 12
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 13
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 14
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 15
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 16
    },
    {
        "asi_id": "E-CT-ICO-EMP-ICC",
        "cri_id": 17
    },

]

criteriosAsignaturasGraduados = [
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 1
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 2
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 3
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 4
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 5
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 6
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 7
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 8
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 9
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 10
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 11
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 12
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 13
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 14
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 15
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 16
    },
    {
        "asi_id": "E-CT-ICO-GRA-ICC",
        "cri_id": 17
    },

]

criteriosAsignaturas = [
    {
        "asi_id": "C-CE-ICO-101",
        "cri_id": 1
    },
    {
        "asi_id": "C-CE-ICO-102",
        "cri_id": 1
    },
    {
        "asi_id": "C-CE-ICO-103",
        "cri_id": 1
    },
    {
        "asi_id": "C-CE-ICO-104",
        "cri_id": 1
    },
    {
        "asi_id": "C-CE-ICO-105",
        "cri_id": 1
    },
    {
        "asi_id": "C-CE-ICO-106",
        "cri_id": 1
    },
    {
        "asi_id": "E-CE-ICO-101",
        "cri_id": 1
    },
    {
        "asi_id": "C-CT-ICO-101",
        "cri_id": 2
    },
    {
        "asi_id": "C-CT-ICO-102",
        "cri_id": 2
    },
    {
        "asi_id": "E-CT-ICO-144",
        "cri_id": 2
    },
    {
        "asi_id": "E-CT-ICO-154",
        "cri_id": 2
    },
    {
        "asi_id": "E-CT-ICO-158",
        "cri_id": 2
    },
    {
        "asi_id": "G-CA-ICO-001",
        "cri_id": 2
    },
    {
        "asi_id": "E-CT-ICO-148",
        "cri_id": 2
    },
    {
        "asi_id": "C-CT-ICO-107",
        "cri_id": 3
    },
    {
        "asi_id": "E-CT-ICO-143",
        "cri_id": 3
    },
    {
        "asi_id": "E-CT-ICO-146",
        "cri_id": 3
    },
    {
        "asi_id": "E-CT-ICO-149",
        "cri_id": 3
    },
    {
        "asi_id": "E-CT-ICO-150",
        "cri_id": 3
    },
    {
        "asi_id": "E-CT-ICO-152",
        "cri_id": 3
    },
    {
        "asi_id": "E-CT-ICO-030",
        "cri_id": 3
    },
    {
        "asi_id": "E-CT-ICO-153",
        "cri_id": 3
    },
    {
        "asi_id": "E-CT-ICO-040",
        "cri_id": 3
    },
    {
        "asi_id": "E-CT-ICO-026",
        "cri_id": 3
    },
    {
        "asi_id": "E-CT-ICO-160",
        "cri_id": 3
    },
    {
        "asi_id": "E-CT-ICO-036",
        "cri_id": 3
    },
    {
        "asi_id": "E-CT-ICO-042",
        "cri_id": 3
    },
    {
        "asi_id": "C-CT-ICO-105",
        "cri_id": 4
    },
    {
        "asi_id": "E-CT-ICO-144",
        "cri_id": 4
    },
    {
        "asi_id": "E-CT-ICO-146",
        "cri_id": 4
    },
    {
        "asi_id": "E-CT-ICO-150",
        "cri_id": 4
    },
    {
        "asi_id": "E-CT-ICO-158",
        "cri_id": 4
    },
    {
        "asi_id": "C-CT-ICO-106",
        "cri_id": 5
    },
    {
        "asi_id": "E-CT-ICO-144",
        "cri_id": 5
    },
    {
        "asi_id": "E-CT-ICO-158",
        "cri_id": 5
    },
    {
        "asi_id": "E-CT-ICO-146",
        "cri_id": 6
    },
    {
        "asi_id": "E-CT-ICO-150",
        "cri_id": 6
    },
    {
        "asi_id": "E-CT-ICO-154",
        "cri_id": 6
    },
    {
        "asi_id": "E-CT-ICO-158",
        "cri_id": 6
    },

    {
        "asi_id": "E-CT-ICO-042",
        "cri_id": 7
    },
    {
        "asi_id": "G-HU-ICO-101",
        "cri_id": 7
    },
    {
        "asi_id": "E-CT-ICO-152",
        "cri_id": 7
    },
    {
        "asi_id": "E-CT-ICO-030",
        "cri_id": 7
    },
    {
        "asi_id": "E-CT-ICO-153",
        "cri_id": 7
    },
    {
        "asi_id": "E-CT-ICO-042",
        "cri_id": 8
    },
    {
        "asi_id": "G-HU-ICO-101",
        "cri_id": 8
    },
    {
        "asi_id": "E-CT-ICO-152",
        "cri_id": 8
    },
    {
        "asi_id": "E-CT-ICO-030",
        "cri_id": 8
    },
    {
        "asi_id": "E-CT-ICO-153",
        "cri_id": 8
    },
    {
        "asi_id": "C-CT-ICO-107",
        "cri_id": 9
    },
    {
        "asi_id": "E-CT-ICO-151",
        "cri_id": 9
    },
    {
        "asi_id": "E-CT-ICO-152",
        "cri_id": 9
    },
    {
        "asi_id": "E-CT-ICO-030",
        "cri_id": 9
    },
    {
        "asi_id": "E-CT-ICO-153",
        "cri_id": 9
    },
    {
        "asi_id": "E-CT-ICO-154",
        "cri_id": 9
    },
    {
        "asi_id": "E-CT-ICO-031",
        "cri_id": 9
    },
    {
        "asi_id": "E-CT-ICO-033",
        "cri_id": 9
    },
    {
        "asi_id": "E-CT-ICO-159",
        "cri_id": 9
    },
    {
        "asi_id": "E-CT-ICO-165",
        "cri_id": 9
    },
    {
        "asi_id": "G-CA-ICO-001",
        "cri_id": 9
    },
    {
        "asi_id": "E-CT-ICO-042",
        "cri_id": 9
    },
    {
        "asi_id": "C-CT-ICO-107",
        "cri_id": 10
    },
    {
        "asi_id": "E-CT-ICO-151",
        "cri_id": 10
    },
    {
        "asi_id": "E-CT-ICO-152",
        "cri_id": 10
    },
    {
        "asi_id": "E-CT-ICO-030",
        "cri_id": 10
    },
    {
        "asi_id": "E-CT-ICO-153",
        "cri_id": 10
    },
    {
        "asi_id": "E-CT-ICO-154",
        "cri_id": 10
    },
    {
        "asi_id": "E-CT-ICO-031",
        "cri_id": 10
    },
    {
        "asi_id": "E-CT-ICO-033",
        "cri_id": 10
    },
    {
        "asi_id": "E-CT-ICO-159",
        "cri_id": 10
    },
    {
        "asi_id": "E-CT-ICO-165",
        "cri_id": 10
    },
    {
        "asi_id": "G-CA-ICO-001",
        "cri_id": 10
    },
    {
        "asi_id": "E-CT-ICO-042",
        "cri_id": 10
    },
    {
        "asi_id": "E-CT-ICO-154",
        "cri_id": 11
    },
    {
        "asi_id": "E-CT-ICO-031",
        "cri_id": 11
    },
    {
        "asi_id": "E-CT-ICO-033",
        "cri_id": 11
    },
    {
        "asi_id": "E-CT-ICO-031",
        "cri_id": 11
    },
    {
        "asi_id": "E-CT-ICO-159",
        "cri_id": 11
    },
    {
        "asi_id": "E-CT-ICO-165",
        "cri_id": 11
    },
    {
        "asi_id": "E-CT-ICO-154",
        "cri_id": 12
    },
    {
        "asi_id": "E-CT-ICO-031",
        "cri_id": 12
    },
    {
        "asi_id": "E-CT-ICO-033",
        "cri_id": 12
    },
    {
        "asi_id": "E-CT-ICO-031",
        "cri_id": 12
    },
    {
        "asi_id": "E-CT-ICO-159",
        "cri_id": 12
    },
    {
        "asi_id": "E-CT-ICO-165",
        "cri_id": 12
    },
    {
        "asi_id": "E-CT-ICO-154",
        "cri_id": 13
    },
    {
        "asi_id": "E-CT-ICO-031",
        "cri_id": 13
    },
    {
        "asi_id": "E-CT-ICO-033",
        "cri_id": 13
    },
    {
        "asi_id": "E-CT-ICO-031",
        "cri_id": 13
    },
    {
        "asi_id": "E-CT-ICO-159",
        "cri_id": 13
    },
    {
        "asi_id": "E-CT-ICO-165",
        "cri_id": 13
    },
    {
        "asi_id": "E-CT-ICO-154",
        "cri_id": 14
    },
    {
        "asi_id": "E-CT-ICO-031",
        "cri_id": 14
    },
    {
        "asi_id": "E-CT-ICO-033",
        "cri_id": 14
    },
    {
        "asi_id": "E-CT-ICO-031",
        "cri_id": 14
    },
    {
        "asi_id": "E-CT-ICO-159",
        "cri_id": 14
    },
    {
        "asi_id": "E-CT-ICO-165",
        "cri_id": 14
    },
    {
        "asi_id": "E-CT-ICO-154",
        "cri_id": 15
    },
    {
        "asi_id": "E-CT-ICO-031",
        "cri_id": 15
    },
    {
        "asi_id": "E-CT-ICO-033",
        "cri_id": 15
    },
    {
        "asi_id": "E-CT-ICO-031",
        "cri_id": 15
    },
    {
        "asi_id": "E-CT-ICO-159",
        "cri_id": 15
    },
    {
        "asi_id": "E-CT-ICO-165",
        "cri_id": 15
    },
    {
        "asi_id": "E-CE-ICO-101",
        "cri_id": 16
    },
    {
        "asi_id": "E-CT-ICO-148",
        "cri_id": 16
    },
    {
        "asi_id": "E-CT-ICO-040",
        "cri_id": 16
    },
    {
        "asi_id": "E-CT-ICO-026",
        "cri_id": 16
    },
    {
        "asi_id": "E-CT-ICO-160",
        "cri_id": 16
    },
    {
        "asi_id": "E-CT-ICO-036",
        "cri_id": 16
    },
    {
        "asi_id": "E-CT-ICO-042",
        "cri_id": 16
    },
    {
        "asi_id": "C-CT-ICO-107",
        "cri_id": 16
    },
    {
        "asi_id": "E-CT-ICO-152",
        "cri_id": 16
    },
    {
        "asi_id": "E-CT-ICO-030",
        "cri_id": 16
    },
    {
        "asi_id": "E-CT-ICO-153",
        "cri_id": 16
    },
    {
        "asi_id": "E-CE-ICO-101",
        "cri_id": 17
    },
    {
        "asi_id": "E-CT-ICO-148",
        "cri_id": 17
    },
    {
        "asi_id": "E-CT-ICO-040",
        "cri_id": 17
    },
    {
        "asi_id": "E-CT-ICO-026",
        "cri_id": 17
    },
    {
        "asi_id": "E-CT-ICO-160",
        "cri_id": 17
    },
    {
        "asi_id": "E-CT-ICO-036",
        "cri_id": 17
    },
    {
        "asi_id": "E-CT-ICO-042",
        "cri_id": 17
    },
    {
        "asi_id": "C-CT-ICO-107",
        "cri_id": 17
    },
    {
        "asi_id": "E-CT-ICO-152",
        "cri_id": 17
    },
    {
        "asi_id": "E-CT-ICO-030",
        "cri_id": 17
    },
    {
        "asi_id": "E-CT-ICO-153",
        "cri_id": 17
    },
]
