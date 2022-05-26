# #!/usr/bin/env python
from ast import Bytes
from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.common.by import By


# Start the browser and login with standard_user
Locators = {'username_id': 'user-name', 'password_id': 'password', 'login_btn': 'login-button',
            'class_add_to_cart': 'inventory_item', 'class_remove': 'btn_secondary '}
def login(user, password):
    print('Starting the browser...')
    options = ChromeOptions()
    options.add_argument("--headless")
    driver = webdriver.Chrome(options=options)
    print('Browser started successfully. Navigating to the demo page to login.')
    driver.get('https://www.saucedemo.com/')

    print('Fill the loggin page with login details')
    driver.find_element(By.ID, Locators['username_id']).send_keys(user)
    driver.find_element(By.ID, Locators['password_id']).send_keys(password)

    print('Successfully logged in with username= '+user + ' and password= '+password)
    driver.find_element(By.ID, Locators['login_btn']).click()

    print('Adding all items to cart')
    list_add_to_cart = driver.find_elements(By.CLASS_NAME, Locators['class_add_to_cart'])

    for element in list_add_to_cart:
        item_name = element.find_element(By.CLASS_NAME, 'inventory_item_name').text
        element.find_element(By.CLASS_NAME, 'btn_inventory').click()
        print('Added item {} to cart'.format(item_name))

    driver.find_element(By.CLASS_NAME, 'shopping_cart_link').click()

    print('Remove all items from the cart')
    for item in driver.find_elements(By.CLASS_NAME, 'cart_item'):
        item_name = item.find_element(By.CLASS_NAME, 'inventory_item_name').text
        item.find_element(By.CLASS_NAME, 'cart_button').click()
        print('Removed item {} from cart'.format(item_name))

    driver.find_element(By.CLASS_NAME, 'btn_secondary').click()

    #checking add to cart button
    list_add_to_cart_after_test = driver.find_elements(By.CLASS_NAME, Locators['class_add_to_cart'])

    assert len(list_add_to_cart_after_test) > 0, 'There is no add to cart button... test failed'

    print('All tests passed')


login('standard_user', 'secret_sauce')

