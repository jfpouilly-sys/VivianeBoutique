<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class VivianeCustom extends Module
{
    public function __construct()
    {
        $this->name = 'vivianecustom';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Claude Code';
        $this->need_instance = 0;

        $this->bootstrap = true;
        parent::__construct();

        $this->displayName = $this->l('Viviane Boutique Custom Features');
        $this->description = $this->l('Fonctionnalités personnalisées pour Viviane Boutique');
        $this->ps_versions_compliancy = array('min' => '8.0', 'max' => _PS_VERSION_);
    }

    public function install()
    {
        return parent::install() &&
            $this->registerHook('displayHeader') &&
            $this->registerHook('displayProductAdditionalInfo') &&
            $this->registerHook('displayFooter') &&
            Configuration::updateValue('VIVIANE_SIZE_GUIDE_ENABLED', true);
    }

    public function uninstall()
    {
        return parent::uninstall() &&
            Configuration::deleteByName('VIVIANE_SIZE_GUIDE_ENABLED');
    }

    /**
     * Hook pour afficher le guide des tailles sur les produits lingerie
     */
    public function hookDisplayProductAdditionalInfo($params)
    {
        $product = $params['product'];

        // Vérifier si c'est un produit lingerie
        if ($this->isLingerieProduct($product)) {
            $this->context->smarty->assign(array(
                'size_guide_enabled' => Configuration::get('VIVIANE_SIZE_GUIDE_ENABLED'),
                'product_category' => $product['category']
            ));

            return $this->display(__FILE__, 'views/templates/hook/size-guide.tpl');
        }

        return '';
    }

    /**
     * Vérifie si le produit appartient à la catégorie lingerie
     */
    private function isLingerieProduct($product)
    {
        $lingerieCategories = ['Lingerie', 'Soutiens-gorge', 'Culottes',
                               'Ensembles', 'Nuisettes', 'Pyjamas'];

        if (isset($product['categories'])) {
            foreach ($product['categories'] as $category) {
                if (in_array($category['name'], $lingerieCategories)) {
                    return true;
                }
            }
        }

        return false;
    }

    /**
     * Configuration du module
     */
    public function getContent()
    {
        $output = '';

        if (Tools::isSubmit('submitVivianeSettings')) {
            Configuration::updateValue(
                'VIVIANE_SIZE_GUIDE_ENABLED',
                Tools::getValue('VIVIANE_SIZE_GUIDE_ENABLED')
            );
            $output .= $this->displayConfirmation($this->l('Paramètres sauvegardés'));
        }

        return $output . $this->displayForm();
    }

    /**
     * Formulaire de configuration
     */
    public function displayForm()
    {
        $fields_form = array(
            'form' => array(
                'legend' => array(
                    'title' => $this->l('Paramètres'),
                    'icon' => 'icon-cogs'
                ),
                'input' => array(
                    array(
                        'type' => 'switch',
                        'label' => $this->l('Activer le guide des tailles'),
                        'name' => 'VIVIANE_SIZE_GUIDE_ENABLED',
                        'is_bool' => true,
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => 1,
                                'label' => $this->l('Oui')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => 0,
                                'label' => $this->l('Non')
                            )
                        ),
                    ),
                ),
                'submit' => array(
                    'title' => $this->l('Sauvegarder'),
                    'class' => 'btn btn-default pull-right'
                )
            ),
        );

        $helper = new HelperForm();
        $helper->module = $this;
        $helper->name_controller = $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->currentIndex = AdminController::$currentIndex . '&configure=' . $this->name;
        $helper->submit_action = 'submitVivianeSettings';

        $helper->fields_value['VIVIANE_SIZE_GUIDE_ENABLED'] =
            Configuration::get('VIVIANE_SIZE_GUIDE_ENABLED');

        return $helper->generateForm(array($fields_form));
    }
}
