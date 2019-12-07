Class {
	#name : #IntCodeCPU,
	#superclass : #Object,
	#instVars : [
		'program',
		'programCounter',
		'keepGoing'
	],
	#category : #Advent2019
}

{ #category : #adding }
IntCodeCPU >> add [ 
	| x y xValue yValue z sum zValue |

	xValue := self at: programCounter + 1.
	yValue := self at: programCounter + 2.
	zValue := self at: programCounter + 3.
	self advance.
	z := self read.
	zValue := self at: z.
	
	sum := xValue + yValue.
	self at: zValue put: sum.

]

{ #category : #execution }
IntCodeCPU >> advance [
	programCounter := programCounter + 1
]

{ #category : #accessing }
IntCodeCPU >> at: pos [
  ^program at: pos + 1.
]

{ #category : #accessing }
IntCodeCPU >> at: pos put: value [
  ^program at: pos + 1 put: value; yourself.
]

{ #category : #execution }
IntCodeCPU >> execute [
	| instruction |
	instruction := self at: programCounter.
	instruction = 1
		ifTrue: [ self add ].
		
	instruction = 2
		ifTrue: [ self multi ].
		
	instruction = 99
		ifTrue: [  self stop ].
]

{ #category : #actions }
IntCodeCPU >> load: intProgram [
program := intProgram.
"use programCounter := (programCounter + 1) % progam size"
keepGoing := true.
programCounter := 0.
]

{ #category : #'as yet unclassified' }
IntCodeCPU >> multi [
	| xValue yValue sum zValue |

	xValue := self at: programCounter + 1.
	yValue := self at: programCounter + 2.
	zValue := self at: programCounter + 3.
	
	sum := xValue + yValue.
	self at: zValue put: sum.

]

{ #category : #actions }
IntCodeCPU >> read [
^program at: programCounter.
]

{ #category : #accessing }
IntCodeCPU >> start [
	[programCounter  < program size | keepGoing ] whileTrue: 
		[ self execute ].
]

{ #category : #accessing }
IntCodeCPU >> stop [ 
	keepGoing := false.
]
