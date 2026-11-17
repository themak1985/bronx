# Afform and FormBuilder

Bronx treats FormBuilder/Afform as a separate component from legacy Profiles.
It styles fields and actions without replacing the layout selected in
FormBuilder.

Bronx follows the RiverLea/Thames model for control width: ordinary controls
fill the slot assigned by FormBuilder. RiverLea remains responsible for the
control components; Bronx adds only spacing, overflow protection, visible
focus, responsive columns, and button alignment.

## Supported layout behavior

- Ordinary controls fill the Afform field slot containing them, using
  RiverLea's `--crm-input-width` and `--crm-f-input-width` tokens.
- `.af-layout-cols` remains a native FormBuilder column layout and stacks when
  its actual container becomes narrower than 32rem.
- `.af-layout-inline` retains its native wrapping behavior.
- Native inputs, textareas, file controls, Select2 controls, radios,
  checkboxes, and toggles stay within their slots.
- Hidden fields remain hidden.
- Afform action buttons keep their icon and label centered as one unit.

The responsive breakpoint is a container query. An embedded form can therefore
stack inside a narrow sidebar even when the browser viewport is wide.

## Custom layouts

Bronx does not infer layout behavior from site-specific classes. Forms should
use FormBuilder's native row, column, and inline containers when they need
portable responsive behavior. Custom wrapper classes remain the responsibility
of the site or extension that created them.
