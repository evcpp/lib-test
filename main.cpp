#include <motor.h>
#include <time.h>
using namespace std;

static void ms2ts(struct timespec *ts, unsigned long ms) {
    ts->tv_sec = ms / 1000;
    ts->tv_nsec = (ms % 1000) * 1000000;
}

void wait(unsigned long ms) {
    struct timespec delay;
    ms2ts(&delay, ms);
    while (nanosleep(&delay, &delay));
}

int main(){
    Motor a(MotorPort::A);
    a.on(10);
    wait(1000);
    return 0;
}
