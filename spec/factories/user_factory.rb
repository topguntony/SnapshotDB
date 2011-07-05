Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.password "PASSWORD"
  f.password_confirmation "PASSWORD"
end

Factory.sequence :email do |f|
  "staff#{f}@accountsapp.com"
end