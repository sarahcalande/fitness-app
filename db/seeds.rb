require 'net/http'
  def parse_data(url)
    uri = URI(url)
    req = Net::HTTP::Get.new(uri)
    req['Token'] = "c0f9912bdcb90b81c198c2ed64cb0d782a52447d"
    res = Net::HTTP.start(uri.hostname, uri.port) {|http|http.request(req)}
    parsed_data = JSON.parse(res.body)
  end

  def populate_categories
    parsed_data = parse_data("http://wger.de/api/v2/exercisecategory/")
    parsed_data["results"].each do |category|
      new_cat = Category.create
      new_cat.update(id: category["id"], name: category["name"])
    end
  end

  def populate_muscles
    parsed_data = parse_data("http://wger.de/api/v2/muscle/")
    parsed_data["results"].each do |muscle|
      new_muscle = Muscle.create
      new_muscle.update(id: muscle["id"], name: muscle["name"])
    end
  end

  def populate_exercise
    for i in 1..27
      parsed_data = parse_data("http://wger.de/api/v2/exercise/?page=#{i}")

      english_exercises = parsed_data["results"].select!{|exercise| exercise["language"] == 2 && !exercise["muscles"].blank?}

      english_exercises.each do |exercise|
        new_exercise = Exercise.create
        new_exercise.update(name: exercise["name"], description: exercise["description"], muscle_ids: exercise["muscles"], category_id: exercise["category"])
      end
    end
  end


populate_categories
populate_muscles
populate_exercise


Muscle.find(1).update(category_name: "Arms")
Muscle.find(2).update(category_name: "Shoulders")
Muscle.find(3).update(category_name: "Abs")
Muscle.find(4).update(category_name: "Chest")
Muscle.find(5).update(category_name: "Arms")
Muscle.find(6).update(category_name: "Abs")
Muscle.find(7).update(category_name: "Calves")
Muscle.find(8).update(category_name: "Legs")
Muscle.find(9).update(category_name: "Arms")
Muscle.find(10).update(category_name: "Legs")
Muscle.find(11).update(category_name: "Legs")
Muscle.find(12).update(category_name: "Back")
Muscle.find(13).update(category_name: "Arms")
Muscle.find(14).update(category_name: "Abs")
Muscle.find(15).update(category_name: "Calves")

Muscle.find(1).update(image_url: 'muscles/bicepsbrachii.jpeg')
Muscle.find(2).update(image_url: 'muscles/anteriordeltoid.jpeg')
Muscle.find(3).update(image_url: 'muscles/Serratusanterior.jpeg')
Muscle.find(4).update(image_url: 'muscles/Pectoralismajor.jpeg')
Muscle.find(5).update(image_url: 'muscles/Tricepsbrachii.jpeg')
Muscle.find(6).update(image_url: 'muscles/Rectusabdominis.jpeg')
Muscle.find(10).update(image_url: 'muscles/Quadricepsfemoris.jpeg')
Muscle.find(11).update(image_url: 'muscles/Bicepsfemoris.jpeg')
Muscle.find(13).update(image_url: 'muscles/Brachialis.jpeg')
Muscle.find(7).update(image_url: 'muscles/Gastrocnemius.jpeg')
Muscle.find(8).update(image_url: 'muscles/Gluteusmaximus.jpeg')
Muscle.find(9).update(image_url: 'muscles/Trapezius.jpeg')
Muscle.find(12).update(image_url: 'muscles/Latissimusdorsi.jpeg')
Muscle.find(14).update(image_url: 'muscles/Obliquusexternusabdominis.jpeg')
Muscle.find(15).update(image_url: 'muscles/Soleus.jpeg')



Category.find(10).update(image_url: 'abs.jpeg')
Category.find(8).update(image_url: 'arms.jpeg')
Category.find(12).update(image_url: 'back.jpeg')
Category.find(14).update(image_url: 'calves.jpeg')
Category.find(11).update(image_url: 'chest.jpeg')
Category.find(9).update(image_url: 'legs.jpeg')
Category.find(13).update(image_url: 'shoulders.jpeg')
