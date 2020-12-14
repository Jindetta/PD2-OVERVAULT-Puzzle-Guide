if Global.level_data and Global.level_data.level_id == "red2" then
    if RequiredScript == "lib/units/interactions/interactionext" then
        local correct_cubes, base_id = {7, 9, 10, 13, 14, 16, 30, 32, 33, 36, 37, 39}

        Hooks:PostHook(UseInteractionExt, "init", "OVPG_InteractionExt", function(self, unit)
            if self.tweak_data == "s_cube" then
                base_id = base_id or unit:id() - 23

                if table.contains(correct_cubes, unit:id() - base_id) then
                    self._tweak_data = tweak_data.interaction.correct_cube or self._tweak_data
                end
            end
        end)
    elseif RequiredScript == "lib/tweak_data/interactiontweakdata" then
        Hooks:PostHook(InteractionTweakData, "init", "OVPG_InteractionTweakData", function(self)
            self.correct_cube = table.map_copy(self.s_cube)
            self.correct_cube.contour = "correct_cube"
        end)
    else
        Hooks:PostHook(Setup, "init_finalize", "OVPG_Setup", function()
            tweak_data.contour.correct_cube = {
                standard_color = Vector3(0, 0.3, 1),
                selected_color = Vector3(0, 1, 0)
            }
        end)
    end
end