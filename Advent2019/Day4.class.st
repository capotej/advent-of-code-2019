Class {
	#name : #Day4,
	#superclass : #Object,
	#category : #Advent2019
}

{ #category : #testing }
Day4 >> isAdjacent: number [
	| same lastValue |
	same := 0.
	lastValue := nil.
	number asString do: [ :digit | 
		digit = lastValue
			ifTrue: [ same := same + 1 ].
		lastValue := digit.
	].
	^same > 0.
	
]

{ #category : #testing }
Day4 >> isIncreasing: number [
	| lastValue compDigit increasing |
	lastValue := 0.
	increasing := 0.
	number asString
		do: [ :digit | 
			compDigit := digit asString asNumber.
			compDigit >= lastValue
				ifTrue: [ increasing := increasing + 1 ].
			lastValue := compDigit ].
	^increasing = number asString size

]

{ #category : #'as yet unclassified' }
Day4 >> meetsCriteria: number [
	^(self isAdjacent: number) & (self isIncreasing: number)

]

{ #category : #solution }
Day4 >> solution [
| result |
result := 0.
245182 to: 790572 do: [ :n | 
	(self meetsCriteria: n)
		ifTrue: [ result := result + 1 ].
].	
^result.
]
