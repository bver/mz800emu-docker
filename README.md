
# mz800emu-docker
[Sharp MZ-800 Emulator](https://sourceforge.net/projects/mz800emu/)
by [Michal Hučík](https://www.ordoz.com/sharp/) runs in a Docker container.

This great emulator of the famous 8bit-era computer runs natively on Windows and Centos 7 --
please see [the project page](https://sourceforge.net/projects/mz800emu/) for details.

Emulation containerization comes in handy for other host systems.
You should be able to run _mz800emu_ on any OS equipped with [Docker](https://www.docker.com/).

## Instructions
1. Have [Docker Compose](https://docs.docker.com/compose/install/) installed first.
2. Clone this repo.
3. Compose it up:

        cd mz800emu-docker
        docker-compose up

It might take several minutes to download the base image and build all dependencies in
the mz800emu image for the first time.
Next time the already existing container is run so it takes seconds. It also preserves
the settings from the last run (in .ini files).

The `/root/host` directory is mounted from the container to the `mz800emu-docker` directory
on your host system, allowing you to provide the emulator with external files (e.g. mzf or dsk).
You can, of course, change your mounts by modifying the _volumes_ section of
the _docker-compose.yaml_ file.

## Known issues

* The container may fail on the startup with an `unable to open slave` ALSA lib message.
The workaround (on your host machine) is
[described here](https://rtfm.co.ua/en/linux-alsa-lib-pcm_dmix-c1108snd_pcm_dmix_open-unable-to-open-slave-2/).

* Even with the issue above fixed the ALSA lib complains and produces awful sound.

## Changelog
* fixing CA certificate chain 2024-03-09

## Projects interrelationship
There were _no_ modifications made to the original _mz800emu_ sources. They are fetched AS IS from _sourceforge_ in the docker build time and then compiled according
[author's documentation](https://sourceforge.net/p/mz800emu/code/HEAD/tree/trunk/Documentation/HOWTO_Centos7.txt).

Both projects are covered by the same [license](https://www.gnu.org/licenses/gpl-3.0.en.html).

Please direct all kudos to Michal Hučík. My dockerization effort is just a simple enabler.
