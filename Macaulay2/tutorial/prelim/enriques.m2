document { "Tutorial:Constructing matrices",
TT "Construction of matrices",
" This will be the tutorial which describes methods of constructing new matrices from
old.  Right now, this is just a test." }

document { "Tutorial:Multi-gradings",

"In this example, our plan is to compute the multi-graded betti numbers of a
toric ideal and then to investigate the associated 'Spanish complexes'.
Along the way, we explain how to use multi-gradings in Macaulay 2.",

PARA,

TEX "Let's start with a simple example: the rational quartic curve in $P^3$.  This
is the ideal defining the image of the polynomial map $(s,t) |-> (s^4, s^3 t,
s t^3, t^4).$",

EXAMPLE {
     "R = ZZ/32003[s,t];",
     "S = ZZ/32003[a..d];",
     "Sm = ZZ/32003[a..d,Degrees=>{{1,4,0},{1,3,1},{1,1,3},{1,0,4}}];",
     "use S",
     "f = map(R,S,matrix{{s^4, s^3*t, s*t^3, t^4}})",
     "I = generators kernel f",
     "J = substitute(I, Sm)",
     "poincare cokernel J",
     "C = resolution cokernel J",
     "degrees C_0",
     "degrees C_1",
     "degrees C_2",
     "degrees C_3"
     }
}

document { "Example:Enriques surface",

TEX "Let $X \\subset {\\bf P}^5$ be the surface whose ideal is generated by the 3 by 3 
minors of a symmetric matrix of linear forms.  Our aim is to study this ideal, and
determine some of the geometry of $X$.",

PARA,

TEX "Let's first take a look at the ideal of 3 by 3 minors of a generic symmetric
matrix.",

EXAMPLE {
     "R = ZZ/32003[a .. j];",
     "m = genericSymmetricMatrix(R,a,4)",
     "I = image minors(3,m)",
     "N = R^1/I",
     "codim N",
     "degree N",
     "C = resolution N",
     },

TEX "Thus $Y = V(I) \\subset P^9$ is codimension three, degree 10, and arithmetically
Cohen-Macaulay.  We may view the resolution using C.dd",

EXAMPLE "C.dd",

TEX "There are several ways of 'moving' this ideal to ${\\bf P}^5$.  Perhaps the
easiest is to create a ring map which sends each of the ten variables to random
linear forms in six variables.",

PARA,

TEX "Define the ring of ${\\bf P}^5$",
EXAMPLE "S = ZZ/32003[vars(0..5)];",
TEX "Define the ring map.  A ring map $S \mapfrom R$ is determined by the images of the
variables in $R$.  We use the random function to produce ten random linear forms
in $S$.",
EXAMPLE "F = map(S,R,random(S^1, S^{10:-1}))",
TEX "The desired ideal is obtained by evaluation.  We use the semicolon to supress the
lengthy display of this matrix",
EXAMPLE "J = F I;",
TEX "Since the original variety is Cohen-Macaulay, $X = V(J) \\subset {\\bf P}^5$
should be a degree 10 surface.",
EXAMPLE {
     "codim J",
     "degree J",
     },
TEX "In fact, let's display the Hilbert polynomial of (the cokernel of the matrix) $J$.",
EXAMPLE "hilbertPolynomial(J, Projective=>true)",
TEX "This output needs some explanation."
}
