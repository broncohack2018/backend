# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Backend.Repo.insert!(%Backend.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Backend.{Platform, Accounts}

products = [
  %{name: "Product 1",
    description: "Ghana's famed Gye Nyame symbol takes shape in ebony wood, its rotating form understood as 'I fear none except God.' Known as an adinkra symbol, this image is revered throughout the country. Ali Mohammed displays the pendant on a brown leather cord necklace.",
    price: 39.99,
    feature: "Soapstone and bauxite with brass hooks Natural stone - some variations in color and/or pattern are to be expected Hook earrings 0.63 oz Length: 2.2'x 0.7' W",
    story: "Zane Akwasi is a proud mother of three currently living in Ghana.  Every day, Zane and her daughter travel four miles, three times a day, to retrieve water from a small, dirty stream.  There is no way for her to purify the water, so she is stuck drinking and bathing in the bacteria-infested water.  Her two sons work at a goldmine, and could be gone for days at a time.  In whatever free time she makes intricate jewelry to sell to the local community.  One day Zane hopes to move her family to another country in search for a better life."
  }, %{
    name: "Product 2",
    description: "Soapstone wedges in brown and grey combine their natural beauty in earrings from Rachel Armah. Ending with bauxite beads, the handcrafted earrings are worn on brass hooks. Armah calls this design 'Nkabom,' the Akan word for 'unity.'",
    price: 25.99,
    feature: "Soapstone and bauxite with brass hooks Natural stone - some variations in color and/or pattern are to be expected Hook earrings 0.63 oz Length: 2.2' x 0.7' W",
    story: "Rachel Armah is a single mother of two daughters, which she supports through petty trading and by teachings.  With her background in clothing and textiles, she started sewing for people to supplement her income.  It was during this time that she realized the need for accessories to enhance the clothes I produced. With this new awareness coupled with the rich cultural experience she had received growing up in different towns, she got into jewelry making."
  }, %{
    name: "Product 3",
    description: "White bone Afrocentric bracelet bundles--just in time for the spring/summer season. Beautiful smooth white bone beads are combined with a variety of gemstones, African trade beads, Baule brass, and Tibetan brass beads. I used shape and texture to create visual interest and turn up the drama in this monochromatic color palette. Each bracelet is beautiful worn alone, but it is even more beautiful when layered with others in this group. The size of the beads makes wearing multiple bracelets comfortable, and the look is fierce!",
    price: 18.00,
    feature: "8mm handmade white bone Gemstone beads Tibetan brass beads Krobo beads Baule brass 7 - 7.5 inches",
    story: "Abbo Dembe is a hardworking mother of six.  Her mother died when she was a toddler, so she was raised by her older sister and father.  They struggled financially, so from a young age it was important for Abbo to develop a skill that would provide her family with enough income to survive.  She discovered the art of beadery and was immediately hooked.  She uses materials she finds in her hometown to create all of her pieces.  She has since become well-known in the community as one of the finest craftsmen around."
  }, %{
    name: "Product 4",
    description: "The workmanship is of high quality; these carpets are tight and thin and give a real feeling of genuine nomadic handicraft. The carpets are mostly made in small sizes with lively patterns and prayer carpets are common.  These carpets are sold in the city of Herat in Afghanistan, and thus known as Herat-Beluch carpets.",
    price: 219.99,
    feature: "Knotted By Hand 2’11”x4’6” approximately 103 KPSI knot density 0-20 years old, unused wool",
    story: "This Baluch carpet is knotted by a large group of different nomadic tribes, that wander between Persia and western Afghanistan. The carpet is worth its price, well-made and is manufactured in a large number of different motifs, often geometrical. The carpet is very durable and thought to be the best bargain among all modern nomadic carpets.  This skill has been passed down from generation to generation as a way of both cultural expression and a primary trade product for these people."
  }
]

users = [
  %{
    email: "zane.akwasi@example.com",
    first_name: "Zane",
    last_name: "Akwasi"
  },
  %{
    email: "rachel.armah@example.com",
    first_name: "Rachel",
    last_name: "Armah"
  },
  %{
    email: "jassahlina.ladha@example.com",
    first_name: "Jassahlina",
    last_name: "Ladha"
  },
  %{
    email: "abbo.dembe@example.com",
    first_name: "Abbo",
    last_name: "Dembe"
  },
]

0..3
|> Enum.each(fn n ->
  %{email: "test#{n}@example.com", first_name: "first #{n}", last_name: "last #{n}"}
    |> Accounts.create_user!
    |> Accounts.update_user!(%{icon: %Plug.Upload{
      content_type: "image/jpg",
      filename: "#{Enum.at(users, n).email}.jpg",
      path: "priv/static/images/users/#{n}.jpg",
    }})
    |> Platform.from_accounts
    |> Platform.create_product!(products |> Enum.at(n))
    |> Platform.update_product!(%{image: %Plug.Upload{
      content_type: "image/jpg",
      filename: "#{Enum.at(products, n).name}.jpg",
      path: "priv/static/images/products/#{n}.jpg",
    }})
end)
