ArrayList<PVector> serpinskiPoints;
PVector[] triangle = new PVector[3];
PVector start;
void setup() {
  size(600, 600);
  serpinskiPoints = new ArrayList<PVector>();
  triangle[0] = new PVector(300, 50);
  triangle[1] = new PVector(50, 400);
  triangle[2] = new PVector(450, 500);
  start = new PVector(width, height);
}

void draw() {
  background(0);
  fill(255);
  stroke(255);
  Move(start);
  triangleDraw();
  float min = min(60, 1 + serpinskiPoints.size()/10);
  frameRate(min);
}

void triangleDraw() {
  noFill();
  for (PVector p : serpinskiPoints) {
    stroke(255, 0, 0);
    point(p.x, p.y);
  }
  textSize(32);
  text("The Serpinski Trinagle from chaos", 10, 30);
  text("Count: " + str(serpinskiPoints.size()), 10, 60);
}

void Move(PVector arb_Point) {
  PVector target;
  float r = random(6);
  if (r <= 2) {
    float newx = (arb_Point.x + triangle[0].x)/2;
    float newy = (arb_Point.y + triangle[0].y)/2;
    target = new PVector(newx, newy);
    line(target.x, target.y, triangle[0].x, triangle[0].y);
  } else if (r <= 4) {
    float newx = (arb_Point.x + triangle[1].x)/2;
    float newy = (arb_Point.y + triangle[1].y)/2;
    target = new PVector(newx, newy);
    line(target.x, target.y, triangle[1].x, triangle[1].y);
  } else {
    float newx = (arb_Point.x + triangle[2].x)/2;
    float newy = (arb_Point.y + triangle[2].y)/2;
    target = new PVector(newx, newy);
    line(target.x, target.y, triangle[2].x, triangle[2].y);
  }
  serpinskiPoints.add(target);
  start = target;
  fill(0, 0, 255);
  ellipse(target.x, target.y, 10, 10);
}

float EuclideanDistance(PVector a, PVector b) {
  float dx = a.x - b.x;
  float dy = a.y - b.y;
  return sqrt(dx * dx + dy * dy);
}
