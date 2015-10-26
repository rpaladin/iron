package lue.node;

import lue.math.Mat4;
import lue.math.Vec3;
import lue.resource.LightResource;

class LightNode extends Node {

	var resource:LightResource;

	// Shadow map matrices
	public var P:Mat4 = null;
	public var V:Mat4 = null;

	public function new(resource:LightResource) {
		super();

		this.resource = resource;

		Node.lights.push(this);
	}

	public function buildMatrices() {
		P = Mat4.perspective(45, 1, 5, 30);
		V = Mat4.lookAt(new Vec3(0, 2, 10), new Vec3(0, 0, 0), new Vec3(0, 0, 1));
	}
}