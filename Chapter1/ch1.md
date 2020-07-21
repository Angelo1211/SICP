# Building Abstractions with procedures
## The elements of Programming
   Languages serve as more than just a means to get a computer to perform a task, they also structure our ideas about processes.
   Every language provides some way to combine simple ideas into complex ideas typically using a combination of these 3:
   - **Primitive Expressions** Which are the simplest expressions a language is concerned with
   - **Means of Combination** How we combine simple expressions into more complex ones
   - **Means of Abstraction** How compound elements can be named and manipulated
   We deal with two kinds of elements, data and procedures: Data is stuff we want to manipulate, procedures are description of the steps we want to follow to manipulate the data
## Expressions
   When interacting with the interpreter you type an expression and the interpreter resonds by evaluating it. 
   ```
   (+ 300 500)
   (- 5.2 27)
   (* 1 18)
   (* 2.8 0.1)
   ```
   Expressions such as the above are called **combinations** the leftmost element in the list is called an **operator** and the other elements are **operands**. The Value of a combination is obtained by applying the procedure specified by the operator to the arguments that are the values of the operands.

   The convention of putting the operator to the left is called prefix notation. It allows for any number of arguments and allows for nested combinations.

   ```
	(+ 3 65 1 9 200 2.1)
	(+ (* 32 5) (- 10 6))
	Using pretty printing
	(+ (* 3
	      (+ (* 2 4)
		     (+ 3 5)))
	   (+ (- 10 7)
		   6))
   ```

We can use pretty printing to make some of these expressions easier to read.
Even with complex expressions the interpreter always operates in the same basic cycle: It reads an instruction, evaluates the expression, and prints the result. This is called a **Read-Eval-Print-Loop** or a **REPL**. You don't actually need to tell the repl to print!

## Naming and the Environment
   A name identifies a variable who's value is the object. In scheme we name things with **define**.
   ```
   (define size 2)
   (define pi 3.141592)
   (define radius 10)
   (* pi (* radius radius))
   (define circumference (* 2 pi radius))
   ```
   Define is the languages simplest means of abstraction. The interpreter keeps track of the name-object pairs. This memory is called the environment (more precisely **global environment**) there can be more than one environment
## Evaluating Combinations
   To evaluate a combination yo umust to the following: 
   1. Evaluate the subexpressions of the combination
   2. Apply the procedure that is the leftmost subexpression (the operator) to the arguments that are the values of the other subexpressions.

   Notice tha to evaluate the main expression we need to have also managed to evaluate the subexpressions first. This highlights the recursive nature of this process. The main step needs to invoke itself to work!

   We can represent each combination as a tree, where each combination is a node with branches corresponding to operators and operands. Terminal nodes (nodes with no further branches) represent operators or numbers. This is a general kind of process known as **tree accumulation**. 

   There are also exceptions to the evaluation role above. For example, define is not an evaluation. It is what we call a **special form**. All special forms have their own evaluation rules. 

   Each kind of expresion constitute the syntax of the programming language.
#### Syntactic Sugar causes cancer of the Semicolon. lmao.

## Compound Procedures	

Some of the elements that must appear on any powerful programming language:
* Numbers and arithmetic operations are primitive dat aand procedures
* Nesting of combinations provides a means of combining operations
* Definitions that associate names with values provide a limited means of abstraction

A more powerful 


