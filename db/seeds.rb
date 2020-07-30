# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#MVP seed data 
Category.destroy_all
Sylabus.destroy_all

art = Category.create!(name: "Art")
tech = Category.create!(name: "Tech")
science = Category.create!(name: "Science")

WAAH_sylabus = Sylabus.create!(title: "West African Art History", description: "West African cultures developed bronze casting for reliefs, like the famous Benin Bronzes, to decorate palaces and for highly naturalistic royal heads from around the Bini town of Benin City, Edo State, as well as in terracotta or metal, from the 12th–14th centuries. Akan goldweights are a form of small metal sculptures produced over the period 1400–1900; some apparently represent proverbs, contributing a narrative element rare in African sculpture; and royal regalia included impressive gold sculptured elements.[8] Many West African figures are used in religious rituals and are often coated with materials placed on them for ceremonial offerings. The Mande-speaking peoples of the same region make pieces from wood with broad, flat surfaces and arms and legs shaped like cylinders. In Central Africa, however, the main distinguishing characteristics include heart-shaped faces that are curved inward and display patterns of circles and dots.", image_url: "https://upload.wikimedia.org/wikipedia/commons/9/97/AdinkraCalabashStamps.jpg", category_id: art.id)

#Concentrations
imagination = Concentration.create!(title: "Imagination", description: "Whenever one’s focus is liberation, the imagination must act as a core component. To tell the future one must engage their memory and imagination.", sylabus_id: WAAH_sylabus.id)

industrialization = Concentration.create!(title: "Industrialization", description: "Industrialization is present in manufacturing, education, and our sense of self. We must learn and unlearn these teachings to make liberation possible.", sylabus_id: WAAH_sylabus.id)

pedagogy = Concentration.create!(title: "Pedagogy", description: "To learn is to be human. To teach is to love. We become free by figuring out how best to expand our inner worlds.", sylabus_id: WAAH_sylabus.id)

 #KEYWORDS
art = Keyword.create!(word: "Art")
pleasure = Keyword.create!(word: "Pleasure Activism")
sociology = Keyword.create!(word: "Sociology")
design = Keyword.create!(word: "Design")
decentralization = Keyword.create!(word: "Decentralization")
cooperation = Keyword.create!(word: "Cooperation")
curriculum = Keyword.create!(word: "Curriculum")
liberation = Keyword.create!(word: "Liberation")
utility = Keyword.create!(word: "Utilitarism")
classroom = Keyword.create!(word: "Classroom")

# CONCENTRATION KEYWORDS
# imagination concentration
imagination_art = ConcentrationKeyword.create!(concentration_id: imagination.id, keyword_id: art.id)
imagination_pleasure = ConcentrationKeyword.create(concentration_id: imagination.id, keyword_id: pleasure.id)

# industrialization concentration
industrialization_design = ConcentrationKeyword.create!(concentration_id: industrialization.id, keyword_id: design.id)
industrialization_decentralization = ConcentrationKeyword.create!(concentration_id: industrialization.id, keyword_id: decentralization.id)

# pedagogy concentration
pedagogy_decentralization = ConcentrationKeyword.create!(concentration_id: pedagogy.id, keyword_id: decentralization.id)
pedagogy_curriculum = ConcentrationKeyword.create!(concentration_id: pedagogy.id, keyword_id: curriculum.id)
pedagogy_liberation = ConcentrationKeyword.create!(concentration_id: pedagogy.id, keyword_id: liberation.id)
pedagogy_classroom = ConcentrationKeyword.create!(concentration_id: pedagogy.id, keyword_id: classroom.id)