from djoser.email import ActivationEmail

print("Before initializing the Activation Email Class.")
class CustomActivationEmail(ActivationEmail):
    template_name = 'api/templates/custom_activation.html'

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        print("CustomActivationEmail class initialized.")

    def get_context_data(self):
        context = super().get_context_data()
        context['code'] = self.context['user'].verification_code  # Include the verification code
        print("Returned verification code from CustomActivationEmail.")
        return context
