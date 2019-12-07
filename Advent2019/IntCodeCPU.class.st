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

{ #category : #instructions }
IntCodeCPU >> add [ 
	| xValue yValue sum zValue xAddress yAddress |

	xAddress := self at: programCounter + 1.
	yAddress := self at: programCounter + 2.
	zValue   := self at: programCounter + 3.
	
	xValue := self at: xAddress.
	yValue := self at: yAddress.
	
	sum := xValue + yValue.
	self at: zValue put: sum.
	self advance: 4.

]

{ #category : #execution }
IntCodeCPU >> advance [
	programCounter := programCounter + 1.
]

{ #category : #execution }
IntCodeCPU >> advance: val [
	programCounter := programCounter + val.
]

{ #category : #accessing }
IntCodeCPU >> at: pos [
  ^program at: pos + 1.
]

{ #category : #writing }
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

{ #category : #writing }
IntCodeCPU >> load: intProgram [
program := intProgram.
"use programCounter := (programCounter + 1) % progam size"
keepGoing := true.
programCounter := 0.
]

{ #category : #instructions }
IntCodeCPU >> multi [
	| xValue yValue sum zValue xAddress yAddress |

	xAddress := self at: programCounter + 1.
	yAddress := self at: programCounter + 2.
	zValue   := self at: programCounter + 3.
	
	xValue := self at: xAddress.
	yValue := self at: yAddress.
	
	sum := xValue * yValue.
	self at: zValue put: sum.
	self advance: 4.

]

{ #category : #execution }
IntCodeCPU >> start [
	[ keepGoing ] whileTrue: 
		[ self execute ].
]

{ #category : #instructions }
IntCodeCPU >> stop [ 
	keepGoing := false.
]
