
	let productNames = document.getElementsByClassName('nameClass')
		let productPrices = document.getElementsByClassName('priceClass')
		let buttonsArr = document.getElementsByClassName('buttonClass')
		let products = []
		let productsInBasket = []
		
		if(localStorage.getItem('productsInBasket != null'))
			productsInBasket = JSON.parse(localStorage.getItem('productsInBasket'))

		for(let i = 0; i < productNames.length; i++){
			let obj = {name:productNames[i].innerText, price:productPrices[i].innerText}
				products.push(obj)
				buttonsArr[i].addEventListener('click',fAdd)
				buttonsArr[i].name = i
		}
				
		function fAdd() {
			
			productsInBasket.push(products[event.target.name])
			localStorage.setItem('productsInBasket', JSON.stringify(productsInBasket))

		}
		
	//----------------------------------------------------------//

	let prArr = JSON.parse(localStorage.getItem("productsInBasket"))
	// console.log(prArr)
	

	for(let pr of prArr) {
		let newRowMain = document.createElement("div")
		newRowMain.className = "rowMain_div"
		
		let newPrName = document.createElement("div")
		newPrName.innerText = pr.name
		newPrName.className = "ColLeft_div"
		let newPrPrice = document.createElement("div")
		newPrPrice.innerText = pr.price
		newPrPrice.className = "ColMid_div"
		let button = document.createElement("input")
		button.type = "button"
		button.value = "REMOVE"
		button.className = "buttonsBasketClass"

		if(document.getElementById('parentId') != null) {
			parentId.append(newRowMain)
			newRowMain.append(newPrName)
			newRowMain.append(newPrPrice)
			newRowMain.append(button)
		}
		
	}
	let buttonsBasketArr = document.getElementsByClassName("buttonsBasketClass")
	for(let i = 0; i < buttonsBasketArr.length; i++){
		buttonsBasketArr[i].name = i 
		buttonsBasketArr[i].addEventListener('click',fRemove)
	}

	function fRemove() {
		let j = event.target.name
		console.log(prArr)
		prArr.splice(j,1)
		console.log(prArr)
		
		let rows = document.getElementsByClassName("rowMain_div")
		for(let i = 1; i < rows.length; i++)
		rows[i].remove()
	}

	


	


