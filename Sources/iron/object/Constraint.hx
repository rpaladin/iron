package iron.object;

import iron.data.SceneFormat;

class Constraint {
	var raw: TConstraint;
	var target: Transform = null;

	public function new(constr: TConstraint) {
		raw = constr;
	}

	public function apply(transform: Transform) {
		if (target == null) {
			if (raw.target != null) {
				var obj = Scene.active.getChildren(true);
				for (obji in obj) {
					if (obji.name == raw.target) {
						target = obji.transform;
					}
				}
			}
			return;
		}

		if (raw.type == "COPY_LOCATION") {
			if (raw.use_x) {
				transform.world._30 = target.loc.x;
				if (raw.use_offset) transform.world._30 += transform.loc.x;
			}
			if (raw.use_y) {
				transform.world._31 = target.loc.y;
				if (raw.use_offset) transform.world._31 += transform.loc.y;
			}
			if (raw.use_z) {
				transform.world._32 = target.loc.z;
				if (raw.use_offset) transform.world._32 += transform.loc.z;
			}
		}
	}
}
