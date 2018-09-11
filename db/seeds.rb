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












#
