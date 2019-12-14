Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'grid'
	],
	#category : #Advent2019
}

{ #category : #'instance creation' }
Board class >> create [
	| board |
	board := self new.
	board initGrid.
	^board.
]

{ #category : #initialization }
Board >> initGrid [
	grid := Dictionary new.
]

{ #category : #calculating }
Board >> lowestDistance [
	| result |
	result := Dictionary new.
	grid keysAndValuesDo: [ :key :value | 
		(value size > 1 & ((self manhattanDistance: key) ~= 0))
		  ifTrue: [ 
				result at: (self manhattanDistance: key) put: value asArray asSortedCollection.
			].
		].
	
	^result keysSortedSafely at: 1.
]

{ #category : #calculating }
Board >> manhattanDistance: stringCoord [
	| numbers result |
	numbers := stringCoord splitOn: ','.
	result := ((numbers at: 1) asNumber) abs + ((numbers at: 2) asNumber) abs.
	^result.
]

{ #category : #actions }
Board >> mark: x and: y for: name [
	| coord val collection |
	coord := x asString,',',y asString.
	collection := Set new.
	
	val := grid at: coord ifAbsentPut: collection.
	val add: name.
]
