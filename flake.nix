{
        description = "Dotfiles template for simple retrieval";

        outputs = inputs: {
                templates = {
                        dotfiles = {
                                description = ''
                                Dotfiles configuration
                                '';
                                path = ./dotfiles;
                        };
                };
        };
}
