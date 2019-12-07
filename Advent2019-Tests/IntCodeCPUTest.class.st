"
An IntCodeCPUTest is a test class for testing the behavior of IntCodeCPU
"
Class {
	#name : #IntCodeCPUTest,
	#superclass : #TestCase,
	#category : #'Advent2019-Tests'
}

{ #category : #test }
IntCodeCPUTest >> testAt [
	| cpu program result |
	program := #(10 20 30 40).
	cpu := IntCodeCPU new.
	cpu load: program.
	result := cpu at: 3.
	self assert: result equals: 40.
]

{ #category : #test }
IntCodeCPUTest >> testAtPut [
	| cpu program result |
	program := #(10 20 30 40).
	cpu := IntCodeCPU new.
	cpu load: program.
	cpu at: 3 put: 10.
	result := cpu at: 3.
	self assert: result equals: 10.
]
