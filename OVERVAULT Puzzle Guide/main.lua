if Global.level_data and Global.level_data.level_id == "red2" then
    if RequiredScript == "lib/units/interactions/interactionext" then
        local correct_cubes, base_id = {0, 2, 3, 6, 7, 9, 23, 25, 26, 29, 30, 32}

        Hooks:PostHook(UseInteractionExt, "init", "OVPGMod_InteractionExt", function(self, unit)
            if self.tweak_data == "s_cube" then
                base_id = base_id or unit:id() - 16

                if table.contains(correct_cubes, unit:id() - base_id) then
                    self._tweak_data = tweak_data.interaction.correct_cube or self._tweak_data
                end
            end
        end)
    else
        tweak_data.interaction.correct_cube = table.map_copy(tweak_data.interaction.s_cube)
        tweak_data.interaction.correct_cube.contour = "correct_cube"

        tweak_data.contour.correct_cube = {
            standard_color = Vector3(0, 0.3, 1),
            selected_color = Vector3(0, 1, 0)
        }
    end
end