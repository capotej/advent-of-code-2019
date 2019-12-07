Class {
	#name : #Computer,
	#superclass : #Object,
	#instVars : [
		'program'
	],
	#category : #Advent2019
}

{ #category : #'as yet unclassified' }
Computer >> compute: x and: y [
	| cpu output |
	cpu := IntCodeCPU new.
	cpu load: program.
	cpu at: 1 put: x.
	cpu at: 2 put: y.
	cpu start.
	output := cpu at: 0.
	^output.
]

{ #category : #actions }
Computer >> load: intProgram [
 program := intProgram.
]
