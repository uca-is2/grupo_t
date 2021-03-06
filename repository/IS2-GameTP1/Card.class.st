Class {
	#name : #Card,
	#superclass : #Object,
	#instVars : [
		'type',
		'player'
	],
	#category : #'IS2-GameTP1'
}

{ #category : #'instance creation' }
Card class >> randomFromDeck [
	| number card |
	number := Random new nextInt: 120.
	
	(number between: 1 and: 20) 		ifTrue: [ card := Overload new ].
	(number between: 21 and: 40) 		ifTrue: [ card := Speed new ].
	(number between: 41 and: 60) 		ifTrue: [ card := Acceleration new ].
			
	(number between: 61 and: 80) 		ifTrue: [ card := Cancellation new ].
	(number between: 81 and: 100) 		ifTrue: [ card := Redo new ].
	(number between: 101 and: 120) 	ifTrue: [ card := Repeat new ].
		
	^self type: card.
]

{ #category : #'accessing structure variables' }
Card class >> type: card [
	^self new initializeAs: card.
]

{ #category : #operation }
Card >> applyTo: playerOrCard in: game [
	self type isPermanent 
		ifTrue: [
			player  := playerOrCard.
			type applyEffectToThis: self inThe: game
			]
		
		ifFalse: [ 
			type applyEffectToThis: playerOrCard inThe: game 
			]
]

{ #category : #initialization }
Card >> initializeAs: cardType [
	type := cardType.
]

{ #category : #accessing }
Card >> player [
	^player
]

{ #category : #accessing }
Card >> type [
	^type
]
