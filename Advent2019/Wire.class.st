Class {
	#name : #Wire,
	#superclass : #Object,
	#instVars : [
		'board',
		'name',
		'currentX',
		'currentY'
	],
	#category : #Advent2019
}

{ #category : #'instance creation' }
Wire class >> name: theName board: theBoard [
	| wire |
	wire := self new.
	wire board: theBoard.
	wire name: theName.
	wire currentX: 0.
	wire currentY: 0.
	wire mark.
	^wire.

]

{ #category : #accessing }
Wire >> board: theBoard [
	board := theBoard.
]

{ #category : #accessing }
Wire >> currentX: x [
	currentX := x.
]

{ #category : #accessing }
Wire >> currentY: y [
	currentY := y.
]

{ #category : #actions }
Wire >> down [	
	currentY := currentY - 1.
	self mark.
]

{ #category : #actions }
Wire >> left [
	currentX := currentX - 1.
	self mark.
]

{ #category : #actions }
Wire >> mark [
	board mark: currentX and: currentY for: name.
]

{ #category : #accessing }
Wire >> name: theName [
	name := theName.
]

{ #category : #parsing }
Wire >> parseCommand: command [
| size direction howMany |

size := command size.
direction := command at: 1.
howMany := command copyFrom: 2 to: size.

direction = $U
	ifTrue: [ howMany asNumber timesRepeat: [ self up ] ].
direction = $D
	ifTrue: [ howMany asNumber timesRepeat: [ self down ] ].
direction = $R
	ifTrue: [ howMany asNumber timesRepeat: [ self right ] ].
direction = $L
	ifTrue: [ howMany asNumber timesRepeat: [ self left ] ].

]

{ #category : #parsing }
Wire >> parseCommands: commandArray [
  commandArray do: [ :n | self parseCommand: n ].

]

{ #category : #parsing }
Wire >> parseFromCommandString: commandString [
  self parseCommands: (commandString  splitOn: ',').
]

{ #category : #actions }
Wire >> place: direction [
"looks like R8 or U4"
]

{ #category : #actions }
Wire >> right [
	currentX := currentX + 1.
	self mark.
]

{ #category : #actions }
Wire >> up [
	currentY := currentY + 1.
	self mark.
]
