# Computer Lab #1 documentation
### This handout provides extra background information on the Allen Cell Types lesson plan.
In the first part of the lesson, you'll interact with the Allen Institute website to compare different cell types. Then, you'll dive into the data yourself, to compare mouse and human cells.

---

## Information about Allen Institute Cell Types Dataset
The dataset we'll be interacting with in this notebook was collected by the Allen Institute for Brain Science. I'd recommend watching this video so that you can see the people behind the data:

[![Allen Institute Video](http://img.youtube.com/vi/1GWyjxzxqII/0.jpg)](https://www.youtube.com/watch?v=1GWyjxzxqII "Allen Cell Types Database: Understanding the fundamental building blocks of the brain")

### Targeting different cell types
How did the Allen actually distinguish between different cell types?

### Whole-cell patch clamp

### Characterizing the electrophysiology of cells
You'll find many different metrics describing what happens when the Allen researchers stimulated and recorded from different cells. Let's breakdown what these properties are actually measuring.

| Codename                | Full definition   
| -------------           |------------------------------------|
| vrest                   | resting membrane potential         |
| upstroke-downstroke     | ratio of AP upstroke to downstroke |


--- 

## Computing Basics
By using this Jupyter Notebook, you're encountering quite a few different elements of coding. Here are a few useful things to know.

#### Software Development Kits
In this notebook, we're interacting with the Allen Institute's Software Development Kit (SDK). SDKs provide a set of tools, libraries, documentation, code samples, processes, and or guides that allow developers to create software applications. The AllenSDK is really useful because it enables us to interact with their raw data as well as any computed metrics they've already created.

#### Python
Python is a coding language that is widely used in research, data science, and more. You might use Python in a distribution such as <a href="https://www.anaconda.com/distribution/">Anaconda</a>. Distributions such as this are useful because they contain various tools to help you code as well as many pre-installed coding packages.

#### Jupyter Notebooks
Jupyter Notebooks are great ways to collaborate on coding projects and learn how to code. Usefully, they contain both <i>markdown</i> (helpful text describing what is happening in the notebook) and blocks of code. If you've never used a Jupyter Notebook before, I'd recommend starting with the Introduction to Jupyter Notebooks, found in this repository. 

---

