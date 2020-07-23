# Building Abstractions with procedures
### The elements of Programming
   Languages serve as more than just a means to get a computer to perform a task, they also structure our ideas about processes.
   Every language provides some way to combine simple ideas into complex ideas typically using a combination of these 3:
   - **Primitive Expressions** Which are the simplest expressions a language is concerned with
   - **Means of Combination** How we combine simple expressions into more complex ones
   - **Means of Abstraction** How compound elements can be named and manipulated
   We deal with two kinds of elements, data and procedures: Data is stuff we want to manipulate, procedures are description of the steps we want to follow to manipulate the data
### Expressions
   When interacting with the interpreter you type an expression and the interpreter resonds by evaluating it. 
   ```scheme
   (+ 300 500)
   (- 5.2 27)
   (* 1 18)
   (* 2.8 0.1)
   ```
   Expressions such as the above are called **combinations** the leftmost element in the list is called an **operator** and the other elements are **operands**. The Value of a combination is obtained by applying the procedure specified by the operator to the arguments that are the values of the operands.

   The convention of putting the operator to the left is called prefix notation. It allows for any number of arguments and allows for nested combinations.

   ```scheme
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

### Naming and the Environment
   A name identifies a variable who's value is the object. In scheme we name things with **define**.
   ```
   (define size 2)
   (define pi 3.141592)
   (define radius 10)
   (* pi (* radius radius))
   (define circumference (* 2 pi radius))
   ```
   Define is the languages simplest means of abstraction. The interpreter keeps track of the name-object pairs. This memory is called the environment (more precisely **global environment**) there can be more than one environment

### Evaluating Combinations
   To evaluate a combination yo umust to the following: 
   1. Evaluate the subexpressions of the combination
   2. Apply the procedure that is the leftmost subexpression (the operator) to the arguments that are the values of the other subexpressions.

   Notice tha to evaluate the main expression we need to have also managed to evaluate the subexpressions first. This highlights the recursive nature of this process. The main step needs to invoke itself to work!

   We can represent each combination as a tree, where each combination is a node with branches corresponding to operators and operands. Terminal nodes (nodes with no further branches) represent operators or numbers. This is a general kind of process known as **tree accumulation**. 

   There are also exceptions to the evaluation role above. For example, define is not an evaluation. It is what we call a **special form**. All special forms have their own evaluation rules. 

   Each kind of expresion constitute the syntax of the programming language.

### Compound Procedures	

Some of the elements that must appear on any powerful programming language:
* Numbers and arithmetic operations are primitive dat aand procedures
* Nesting of combinations provides a means of combining operations
* Definitions that associate names with values provide a limited means of abstraction

A more powerful abstraction technique is the **procedure definition** by which a compound operation can be given a name and then referred to
```scheme
; A compound procedure by the name square
(define (square x) (* x x))
```

The general form of procedure definition is the following:
```scheme
(define(<name> <formal parameters>) <body> )
```

**Name** is the symbol associated with the procedure definition
**Formal parameters** are the names used within the body of the procedure to refer to the arguments
**Body** Is an expression that will yield the value of the procedure

```scheme
; 1.1.4 Command procedure examples
(define (square x) (* x x))
(square 5)
(square (square 3))

; Compound procedures can be made of other compound procedures
(define (sum-of-squares x y) (+ (square x) (square y) ))
(sum-of-squares 3 4)

;; Used in the exact asme way as primitive procedures
(define (f a) (sum-of-squares (+ a 1) (* a 2)))
(f 5)
```

### Subtitution model for procedure

To apply a compound procedure to arguments evaluate the body of the procedure with the formal parameters substituted with arguments.

This procedure is typically known as the **substitution model** for procedure application.
* Worth saying it is not necessarily how the interpreter actually applies procedures.
* As we go along we'll be building increasingly advanced models of how an interpreter works, like in science you start with half truths and refine.

In this model we have defined the interpreter evaluates the operator and operands and applies the arguments to the procedure, essentially performing as many of the current operations as you can until you resolve.

This is not the only way, you can also delay evaluating the operands until and just keep expaniding the functions. It would essentially perform the following:

#### Applicative order evaluation (evaluate as you go)
```scheme
(f 5)
(sum-of-squares (+ a 1) (* a 2))
(sum-of-squares (+ 5 1) (* 5 2))
(sum-of-squares 6 10)
(+ (square 6) (square 10))
(+ (* 6 6) (* 10 10))
(+ 36 100)
136
```

#### Normal order evaluation (fully expand and then reduce)
```scheme
; Expansions
(f 5)
(sum-of-squares (+ 5 1) (* 5 2))
(+ (square (+ 5 1)) (square (* 5 2)))
(+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))

; Reductions
(+ (* 6 6) (* 10 10))
(+ 36 100)
136
```

Gives the same answer but notice how (+ 5 1) is done twice. If your procedure can be modelled with substitution both give the same results.

However the interpreter will prefer Applicative order evaluation for two reasons: 1. The efficiency from avoiding multiple evaluations 2. Because normal mode evaluation becomes much more complicated to deal with when substitution is not enough. 

### Conditional Expressions and Predicates

We are limited because we cannot make tests and perform different operations on the results of the tests. AKA case analysis.

Introducing **cond**:

```scheme
(define (abs x)
   (cond ((> x 0) x)
         ((= x 0) 0)
         ((< x 0) (-x))))
```

General form of cond:
```scheme
(cond (<p1> <e1>)
      (<p2> <e2>)
      ...
      (<pn> <en>))
```
Symbol cond followed by parenthesized pairs of expressins (p e) called **clauses**. First expression is a **predicate**, an expression whose value is interpreted to be either true or false. 

Conditionals work as follows, you evaluate the first predicate, if false then you move to the second etc until you hit one that is true, then you return the value of the **consequent expression** .

Special keyword **else** which returns the consequent if no other predicates are true. Any predicate that is always true works as a bootleg else.

Another more basic conditional:

```scheme
(if <predicate> <consequent> <alternative>)
```
Interpreter begins by evaluating the predicate, if it evaluates to true it evaluates the consequent, else it evaluates the alternative and returns a value.

#### Other useful composition operations for compound predicates:

```scheme
(and <e1> <e2>)
```
Interpreter evaluates the expressions <e1..n> one at a time in left to right order. If any evaluates false, the value is false and the rest are not evaluated. If all es evaluate to true the value of and is the last expression.

```scheme
(or <e1> <e2>)
```
Interpreter evaluates the expressions <e1..n> one at a time in left to right order. If any evaluates to true, the value is true and the rest are not evaluated. IF all evalaute to false the value is false and thefirst expression is returned.

```scheme
(not <e1>)
```
Evaluates to true when expression evaluates to false, false otherwise.

**or** and **and** are special forms, not procedures.

### Example: Square Roots by Netwon's Method

The difference between a function and a procedure is the difference between describing the properties of things and how to do things.
* In mathematics we are normally concerned with **declarative** (what is) knowledge
* In compute science we are normally concer with **imperative** (how to) knowledge

```scheme
(define (abs x) (if (< x 0) (- x) x))
(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (improve guess x) (average guess (/ x guess)))

(define error 0.01)
(define (good-enough? guess x)
        (< (abs (- (square guess) x)) error))

(define (sqrt-iter guess x)
        (if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) x)))

(define (sqrt x) (sqrt-iter 1.0 x))

(sqrt (+ 100 37))
```




```scheme
```