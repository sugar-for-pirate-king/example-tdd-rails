# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with full_name, email and password' do
    user = build(:user,
                 full_name: 'Bill john',
                 email: 'bill.john@gmail.com',
                 password: 'secret123')
    user.valid?
    expect(user.errors).to be_empty
  end

  it 'is invalid without full_name' do
    user = build(:user, full_name: nil)
    user.valid?
    expect(user.errors[:full_name]).to include "can't be blank"
  end

  it 'is invalid without email' do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include "can't be blank"
  end

  it 'is invalid without password' do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include "can't be blank"
  end
end
