require 'spec_helper'
require_relative '../../dummy/spec/rails_helper'
require 'rails'
require 'ammeter/init'
require 'generators/controller_override'
require 'generators/rails/decorator_generator'

RSpec.describe Rails::Generators::ControllerGenerator do
  destination File.expand_path("../tmp", __FILE__)

  before { prepare_destination }
  after(:all) { FileUtils.rm_rf destination_root }

  describe "the generated decorator" do
    subject { file("app/decorators/your_model_decorator.rb") }

    describe "naming" do
      before { run_generator %w(YourModels) }

      it { is_expected.to contain "class YourModelDecorator" }
    end
  end
end
