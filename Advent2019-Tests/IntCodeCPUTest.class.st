"
An IntCodeCPUTest is a test class for testing the behavior of IntCodeCPU
"
Class {
	#name : #IntCodeCPUTest,
	#superclass : #TestCase,
	#category : #'Advent2019-Tests'
}

{ #category : #test }
IntCodeCPUTest >> testAdd [
  | cpu program |
  cpu := IntCodeCPU new.
  program := #(1 0 0 0 99).
  cpu load: program.
  cpu start.
  self assert: (cpu at: 0) equals: 2.
]

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

{ #category : #tests }
IntCodeCPUTest >> testIntegration1 [
  | cpu program |
cpu := IntCodeCPU new.
  program := #(2 4 4 5 99 0).
  cpu load: program.
  cpu start.
  self assert: (cpu at: 5) equals: 9801.
]

{ #category : #tests }
IntCodeCPUTest >> testIntegration2 [
  | cpu program |
cpu := IntCodeCPU new.
  program := #(1 1 1 4 99 5 6 0 99).
  cpu load: program.
  cpu start.
  self assert: (cpu at: 0) equals: 30.
]

{ #category : #test }
IntCodeCPUTest >> testMulti [
  | cpu program |
cpu := IntCodeCPU new.
  program := #(2 3 0 3 99).
  cpu load: program.
  cpu start.
  self assert: (cpu at: 3) equals: 6.
]
