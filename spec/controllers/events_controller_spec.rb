require 'rails_helper'

describe EventsController, type: :controller do
  describe '#create' do
    let(:params){{name: "party"}}
    let(:event) {instance_double('Event', name:'party')}
    it 'creates the new event' do
        expect(Event).to receive(:create!).with(params).and_return(event)
        post :create, event: params
    end
    it 'shows success message' do
        allow(Event).to receive(:create!).with(params).and_return(event)
        post :create, event: params
        expect(flash[:notice]).to match(/You successfully created [^']*$/) 
    end
    it 'redirect_to event index' do
        allow(Event).to receive(:create!).with(params).and_return(event)
        post :create, event: params
        expect(response).to redirect_to events_path
    end
  end
  
  describe '#show' do
    let(:id) {"1"}
    let(:event) {instance_double('Event', name: "party")}
    it 'shows the selected event' do
      expect(Event).to receive(:find).with(id).and_return(event)
      get :show, :id => id
    end
  end
  
  describe '#edit' do
    let(:id) {"1"}
    let(:event) {instance_double('Event', name: "party")}
    it 'shows the selected event' do
      expect(Event).to receive(:find).with(id).and_return(event)
      get :edit, :id => id
    end
  end
  
  describe '#update' do
    let(:id) {"1"}
    let(:params) {{:name => "party"}}
    let(:event) {instance_double('Event', name: "party")}
    let(:updated) {instance_double('Event', name: "party")}
    it 'shows the selected event' do
      expect(Event).to receive(:find).with(id).and_return(event)
      allow(event).to receive(:update_attributes!).with(params)
      put :update, :id => id, event: params
    end
    it 'updates the event details' do
      allow(Event).to receive(:find).with(id).and_return(event)
      expect(event).to receive(:update_attributes!).with(params)
      put :update, :id => id, event: params
    end
    it 'shows succesful update message' do
        allow(Event).to receive(:find).with(id).and_return(event)
        allow(event).to receive(:update_attributes!).with(params)
        put :update, :id => id, event: params
        expect(flash[:notice]).to match(/You successfully updated [^']*$/)
    end
    it 'redirect_to events index' do
        allow(Event).to receive(:find).with(id).and_return(event)
        allow(event).to receive(:update_attributes!).with(params)
        put :update, :id => id, event: params
        expect(response).to redirect_to events_path
    end
  end
  
  describe '#destroy' do
    let(:id) {"1"}
    let(:event) {instance_double('Event', name: "party")}
    it 'shows the selected event' do
      expect(Event).to receive(:find).with(id).and_return(event)
      allow(event).to receive(:destroy)
      delete :destroy, :id => id
    end
    it 'calls the destroy method' do
      allow(Event).to receive(:find).with(id).and_return(event)
      expect(event).to receive(:destroy)
      delete :destroy, :id => id
    end
    it 'shows succesfull de message' do
      allow(Event).to receive(:find).with(id).and_return(event)
      allow(event).to receive(:destroy)
      delete :destroy, :id => id
      expect(flash[:notice]).to match(/You successfully deleted [^']*$/)
    end
    it 'redirect_to event index' do
      allow(Event).to receive(:find).with(id).and_return(event)
      allow(event).to receive(:destroy)
      delete :destroy, :id => id
      expect(response).to redirect_to events_path
    end
  end
end
