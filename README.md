# DuckieTown-TomCatGroup
Smartlab2021-DeepLearningInPractice
[Botond Gergő Ungvárszki - QKWFF7]
[Barna Radnai - B310FB]
[Gábor Lévai - AKTA7P]

## Setup

To run any demonstration or training code included in this repository, Gym-Duckietown, and other dependencies have to be installed.

### Building & runnning the Docker image

*Requirements*: [`docker`](https://docs.docker.com/get-docker/) or [`nvidia-docker`](https://github.com/NVIDIA/nvidia-docker) installed on your computer.

Clone this repository by : 

```
git clone https://github.com/LordNassel/DuckieTown-TomCatGroup.git
cd Duckietown-RL/
```

To build and run the Docker image, run the following commands:

```
docker build . --tag dtaido5
docker run --rm -dt -p 2233:22 -p 7000:7000 -p 7001:7001 --name dtaido5 dtaido5
```

Now you should be able to ssh into the container by running: 

```ssh -X -A -p 2233 duckie@localhost ```

When you are asked if you trust the authenticity of host type `yes` and when prompted for a password, enter:

```dt2020```

In the container update `Ray` and instrall `tree` by:
```
pip3 install ray=1.8.0
pip3 install tree
```

For better observation of data change during training it's recommended to log in into your Weights & Biases account by:
```
wandb login
```

## Train a lane-following policy

Training requires `xfvb`, which is installed in the Docker container. 

Training of a lane-following policy is performed by executing the following command: 

```xvfb-run -a -s "-screen 0 1400x900x24" python -m experiments.train-rllib```

## Test a lane-following policy in closed loop simulation

To test the lane-following agent in closed loop simulation run:

```python -m experiments.test-rllib```

The simulator window should appear, and the robot should start moving immediately, and follow the right side lane.  

The same simulation can be viewed from a fixed, bird's eye perspective, instead of through the robot's camera. To run in this mode, add the `--top-view` flag to the test command.

``` python -m experiments.test-rllib --top-view```

## Evaluate closed loop performance and visualize trajectories
The performance of the trained agent is evaluated by calculating some metrics on it closed loop performance. This can be performed by running the command below. 

``` python -m experiments.test-rllib --analyse-trajectories --results-path EvaluationResults```

Metrics for each episode are printed to the standard output, also median and mean values are displayed after all episodes finished. Trajectory plots and the evaluated metrics are saved to a new `EvaluationResults` folder. 

## Copyright

The hardware used in our experiments and parts of the software was developed by the [Duckietown project](https://www.duckietown.org). Software components in this repository may partially be copied or derived from the [Duckietown project's repositories](https://github.com/duckietown) and [kaland313 Duckietown_RL](https://github.com/kaland313/Duckietown-RL)
