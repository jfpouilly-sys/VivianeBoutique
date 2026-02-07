<div class="paypal-button-container">
    <div id="paypal-button"></div>
</div>

<script src="https://www.paypal.com/sdk/js?client-id={$paypal_client_id}&currency=EUR&locale=fr_FR"></script>

<script>
paypal.Buttons({
    style: {
        layout: 'vertical',
        color: 'gold',
        shape: 'rect',
        label: 'paypal'
    },
    createOrder: function(data, actions) {
        return actions.order.create({
            purchase_units: [{
                amount: {
                    value: '{$cart_total}'
                },
                description: 'Achat sur Viviane Boutique'
            }]
        });
    },
    onApprove: function(data, actions) {
        return actions.order.capture().then(function(details) {
            // Rediriger vers page de confirmation
            window.location.href = '{$confirmation_url}?order_id=' + details.id;
        });
    },
    onError: function(err) {
        console.error('Erreur PayPal:', err);
        alert('Une erreur est survenue lors du paiement. Veuillez réessayer.');
    }
}).render('#paypal-button');
</script>

<style>
.paypal-button-container {
    margin: 20px 0;
    padding: 15px;
    background: #f8f9fa;
    border-radius: 8px;
    text-align: center;
}
</style>
