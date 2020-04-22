Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'squares',
		'dices',
		'players',
		'scoreboard'
	],
	#category : #'IS2-GameTP1'
}

{ #category : #'as yet unclassified' }
Game class >> createWith: numberOfSquares players: listOfPlayers dices: listOfDices [
	
	^self new 
		setWith: numberOfSquares 
		playersList: listOfPlayers 
		dicesList: listOfDices 
]

{ #category : #game }
Game >> complete [
	[ self isStillOn ]
		whileTrue: [ 
			self play.
			self nextPlayer 
		]
]

{ #category : #getter }
Game >> getScoreboard [
	^ scoreboard .
]

{ #category : #game }
Game >> isStillOn [
	^(scoreboard first getSquare) <= squares.
]

{ #category : #players }
Game >> nextPlayer [
	^players next.
]

{ #category : #players }
Game >> play [
	self whoPlays rollDice: dices.
	self updateScoboard.
]

{ #category : #initialization }
Game >> setWith: numberOfSquares playersList: listOfPlayers dicesList: listOfDices [ 
	scoreboard := listOfPlayers collect: [:player | player].
	squares := numberOfSquares.
	players  := CircularIterator cyclingOver: listOfPlayers.
	dices := listOfDices.
]

{ #category : #sorting }
Game >> updateScoboard [
	scoreboard sort: [ :p1 :p2 | p1 getSquare >= p2 getSquare ].
]

{ #category : #players }
Game >> whoPlays [
	^players current.
]

{ #category : #players }
Game >> winner [
	^scoreboard first.
]