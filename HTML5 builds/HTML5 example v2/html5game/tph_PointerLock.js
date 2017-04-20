var ctx = document.querySelector('canvas'),
    xdelta = 0,
    ydelta = 0;

ctx.requestPointerLock = ctx.requestPointerLock || ctx.mozRequestPointerLock || ctx.webkitRequestPointerLock;
document.exitPointerLock = document.exitPointerLock || document.mozExitPointerLock || document.webkitExitPointerLock;

document.addEventListener('pointerlockchange', lockChangeAlert, false);
document.addEventListener('mozpointerlockchange', lockChangeAlert, false);
document.addEventListener('webkitpointerlockchange', lockChangeAlert, false);

function lockChangeAlert() {
  if (document.pointerLockElement === ctx || document.mozPointerLockElement === ctx || document.webkitPointerLockElement === ctx) {
    document.addEventListener("mousemove", handleMouseLook, false);
  } else {
    document.removeEventListener("mousemove", handleMouseLook, false);
  }
}

function handleMouseLook(e) {
  xdelta = e.movementX || e.mozMovementX || e.webkitMovementX || 0;
  ydelta = e.movementY || e.mozMovementY || e.webkitMovementY || 0;
}

function reqLockManual(e) {
  ctx.requestPointerLock();
  ctx.removeEventListener('click', reqLockManual);
}

function request_mouse_lock() {
  ctx.addEventListener('click', reqLockManual, false);
}

function exit_mouse_lock() {
  document.exitPointerLock();
}

function get_mouse_lock_status() {
  return (document.pointerLockElement === ctx || document.mozPointerLockElement === ctx || document.webkitPointerLockElement === ctx);
}

function get_mouse_x_movement() {
  return xdelta;
}

function get_mouse_y_movement() {
  return ydelta;
}

function clear_mouse_movement() {
  xdelta = 0;
  ydelta = 0;
}