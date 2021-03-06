import { Suspense, useRef, useState } from "react";
import * as THREE from "three";
import { Canvas, useFrame } from "@react-three/fiber";
import Universe from "./Universe";
import { OrbitControls, Stars } from "@react-three/drei";
// import Universe from "./Universe";
const CanvasUniverse = () => {
  return (
    <Canvas>
      <Suspense fallback={null}>
        <ambientLight intensity={1} color={`#32C1CC`} />
        <pointLight color="#32C1CC" intensity={10} position={[0, 0, 0]} />
        {/* <Box position={[-1.2, 0, 0]} /> */}
        {/* <Box position={[1.2, 0, 0]} /> */}
        <Stars />
        <OrbitControls autoRotate enableZoom={false} />
        <Universe />
      </Suspense>
    </Canvas>
  );
};

export default CanvasUniverse;
