Vue.component('component-item',{
	props: ['todo'],
	template: '<li>{{todo.meow}}</li>'
})

var app = new Vue({ 
    el: '#app',
    data: {
		username: 'admin',
		password: 'password',
		
		enteredUsername: '',
		enteredPassword: '',
		
		login: false,
		
        message: 'Success',
		testMessage: '',
		title:'this is a title',
		seen:false,
		todos: [
		  { text: 'Learn JavaScript', meow:'don\'t learn javascript' },
		  { text: 'Learn Vue', meow:'don\'t learn vue' },
		  { text: 'Build something awesome', meow:'don\'t build something awesome' }
		]
    },
	methods:{
		loginButtonClick: function(){
			this.message="Success"
			this.login = true
		},
		passwordChange: function(){
			this.message="No"
		}
	}
});