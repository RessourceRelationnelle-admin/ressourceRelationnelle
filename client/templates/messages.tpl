{{ include('elements/header.tpl') }}

{{ include('elements/left-sidebar.tpl') }}

<div class="col order-2 order-md-3">
    <div class="container">
    <div class="messages">
        <div class="message_recu">
            <div class="boiteMessage">
                <div class="rechercheMessage">
                    <div class="enteteMessage">
                    <h4>Messages</h4>
                    </div>
                    <div class="boiteRechercheMessage">
                        <div class="stylish-input-group">
                            <input type="text" class="search-bar"  placeholder="Rechercher" >
                        </div>
                    </div>
                </div>
                <div class="inbox_chat">
                    <div class="chat_liste active_chat">
                    <div class="chat_people">
                        <div class="chat_img"> <img src="https://github.com/mdo.png" alt="sunil"> </div>
                        <div class="chat_ib">
                        <h5>John Doe <span class="chat_date">Dec 25</span></h5>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                        </div>
                    </div>
                    </div>
                    {% for i in 0..4 %}
                    <div class="chat_liste">
                    <div class="chat_people">
                        <div class="chat_img"> <img src="https://github.com/mdo.png" alt="sunil"> </div>
                        <div class="chat_ib">
                        <h5>John Doe <span class="chat_date">Dec 25</span></h5>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                        </div>
                    </div>
                    </div>

                    {% endfor %}
        
                </div>
            </div>
            <div class="lesMessages">
            <div class="lesMessagesHistorique">
                <div class="message_envoyeur">
                <div class="message_envoyeur_image"> <img src="https://github.com/mdo.png" alt="sunil"> </div>
                <div class="received_msg">
                    <div class="received_withd_msg">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                    <span class="heureMessage"> HEURE    |    JOURS</span></div>
                </div>
                </div>
                <div class="recepteur_message">
                <div class="message_envoye">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                    <span class="heureMessage"> HEURE    |    JOURS</span></div>
                </div>
                <div class="message_envoyeur">
                <div class="message_envoyeur_image"> <img src="https://github.com/mdo.png" alt="sunil"> </div>
                <div class="received_msg">
                    <div class="received_withd_msg">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                    <span class="heureMessage"> HEURE    |    JOURS</span></div>
                </div>
                </div>
                <div class="recepteur_message">
                <div class="message_envoye">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                    <span class="heureMessage"> HEURE    |    JOURS</span></div>
                </div>
                <div class="message_envoyeur">
                <div class="message_envoyeur_image"> <img src="https://github.com/mdo.png" alt="sunil"> </div>
                <div class="received_msg">
                    <div class="received_withd_msg">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
                        <span class="heureMessage"> HEURE    |    JOURS</span></div>
                </div>
                </div>
            </div>
            <div class="type_msg">
                <div class="leMessageAEnvoye">
                <input type="text" class="write_msg" placeholder="Envoyer un message" />
                <button class="boutonEnvoiMessage" type="button"><svg class="bi me-2" width="16" height="16"><use xlink:href="#send"/></svg></button>
                </div>
            </div>
            </div>
        </div>
        
        </div>
    </div>
</div>

{{ include('elements/right-sidebar.tpl') }}

{{ include('elements/footer.tpl') }}

