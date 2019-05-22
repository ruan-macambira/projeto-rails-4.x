namespace :custom do
  desc "Popular Banco de Dados"
  task populate: :environment do
    print "Gerando Kinds... "
    Kind.create! [{description: 'Amigo'},
      {description: 'Contato'},
      {description: 'Comercial'}]
    puts "Ok!"

    print "Gerando Contatos... "
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: LeroleroGenerator.sentence
      )
    end
    puts "Ok!"
    
    print "Gerando Endereços... "
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        contact: contact
      )
    end
    puts "Ok!"

    print "Gerando Telefones... "
    Contact.all.each do |contact|
      Random.rand(1..5).times do
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contact
        )
      end
    end
    puts "Ok!"
  end

end
