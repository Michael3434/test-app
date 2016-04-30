module HomeHelper
  def cities
    ["Bordeaux", "Grenoble", "Lille", "Lyon", "Marseille", "Montpellier", "Nantes", "Paris", "Rennes", "Strasbourg", "Toulouse"]
  end

  def facebook_url(city)
    case city
    when "Paris"
      "https://www.facebook.com/groups/760907487298386/"
    when "Bordeaux"
      "https://www.facebook.com/groups/812857502152075/"
    when "Grenoble"
      "https://www.facebook.com/groups/1717543308514315/"
    when "Lille"
      "https://www.facebook.com/groups/500782700122027/"
    when "Lyon"
      "https://www.facebook.com/groups/1542300126071634/"
    when "Marseille"
      "https://www.facebook.com/groups/254492064896049/"
    when "Montpellier"
      "https://www.facebook.com/groups/1018822214871099/"
    when "Nantes"
      "https://www.facebook.com/groups/621741371326238/"
    when "Rennes"
      "https://www.facebook.com/groups/35162264829516/"
    when "Strasbourg"
      "https://www.facebook.com/groups/1542943339334782/"
    when "Toulouse"
      "https://www.facebook.com/groups/978940688825892/"
    end
  end
end
