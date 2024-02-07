# This script makes every component inside a selected group or component unique

model = Sketchup.active_model
selection = model.selection

# Check if the selection is a group or component
if selection.length == 1 && (selection.first.is_a? Sketchup::Group or selection.first.is_a? Sketchup::ComponentInstance)

  # Get the group or component
  group_or_component = selection.first

  # Make every component unique
  group_or_component.definition.entities.each do |entity|
    if entity.is_a? Sketchup::ComponentInstance
      entity.make_unique
    end
  end

  UI.messagebox("All components inside the selected group or component have been made unique.")

else
  UI.messagebox("Please select a group or component.")
end
