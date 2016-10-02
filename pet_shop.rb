require ('pry-byebug')

def total_cash(pet_shop)
 pet_shop[:admin][:total_cash]
end

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, pets)
  pet_shop[:admin][:pets_sold] += pets
end

def stock_count(pet_shop)
  pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed)
  breed_array = []
    for pet in pet_shop[:pets]
      if pet[:breed].include?(breed)
        breed_array.push(breed)
      end
    end
      return breed_array
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
      if pet[:name] == name
        return pet
      end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    pet[:name] = nil if pet[:name] == name
  end
end

def add_pet_to_stock(pet_shop, pet)
  pet_shop[:pets].push(pet)
end

def customer_pet_count(customer)
  customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, pet)
  if customer[:cash] >= pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet)

        customer[:pets] << pet 
          pet_shop[:admin][:pets_sold] += 1
              pet_shop[:admin][:total_cash] += pet[:price]
                customer[:cash] -= pet[:price]
  else
    return nil
  end
end

