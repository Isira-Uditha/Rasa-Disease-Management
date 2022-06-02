# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/custom-actions


# This is a simple example for a custom action which utters "Hello World!"
import json
from typing import Any, Text, Dict, List
from rasa_sdk.events import SlotSet
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.knowledge_base.storage import InMemoryKnowledgeBase
from rasa_sdk.knowledge_base.actions import ActionQueryKnowledgeBase


class ActionInquireDiseases(ActionQueryKnowledgeBase):
    def __init__(self):
        knowledge_base = InMemoryKnowledgeBase("knowledge_base.json")
        super().__init__(knowledge_base)

    def name(self) -> Text:
        return "action_inquire_diseases"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        current_disease = next(
            tracker.get_latest_entity_values("disease"), None)

        current_disease = str(current_disease).lower().replace(" ", "")
        if(current_disease != None):
            SlotSet("disease", current_disease)

        # Opening JSON file
        f = open('knowledge_base.json')

        # returns JSON object as
        # a dictionary
        data = json.load(f)

        check = False

        # Iterating through the json
        # list
        for i in data['diseases']:
            if(i['name'] == current_disease):
                check = False
                dispatcher.utter_message(i['description'])
                break
            else:
                check = True

        if check:
            check = False
            dispatcher.utter_message(
                text="Sorry, we wouldn't be able to find that disease. Please check again!")

        # Closing file
        f.close()

        return []


class ActionInquireSpreading(ActionQueryKnowledgeBase):
    def __init__(self):
        knowledge_base = InMemoryKnowledgeBase("knowledge_base.json")
        super().__init__(knowledge_base)

    def name(self) -> Text:
        return "action_inquire_spreading"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        current_disease = next(
            tracker.get_latest_entity_values("disease"), None)
        if(current_disease != None):
            current_disease = str(current_disease).lower().replace(" ", "")
            SlotSet("disease", current_disease)
        else:
            current_disease = tracker.get_slot("disease")
            current_disease = str(current_disease).lower().replace(" ", "")

        # Opening JSON file
        f = open('knowledge_base.json')

        # returns JSON object as
        # a dictionary
        data = json.load(f)

        # Iterating through the json
        # list
        for i in data['diseases']:
            if(i['name'] == current_disease):
                if(i['spread']):
                    dispatcher.utter_message(
                        'Of course, yes ' + current_disease + ' disease is spreading')
                else:
                    dispatcher.utter_message(
                        'No, ' + current_disease + ' disease is not spreading')
        # Closing file
        f.close()

        return []


class ActionInquireSolutions(ActionQueryKnowledgeBase):
    def __init__(self):
        knowledge_base = InMemoryKnowledgeBase("knowledge_base.json")
        super().__init__(knowledge_base)

    def name(self) -> Text:
        return "action_inquire_solutions"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        current_disease = next(
            tracker.get_latest_entity_values("disease"), None)

        if(current_disease != None):
            current_disease = str(current_disease).lower().replace(" ", "")
            SlotSet("disease", current_disease)
        else:
            current_disease = tracker.get_slot("disease")
            current_disease = str(current_disease).lower().replace(" ", "")

        # Opening JSON file
        f = open('knowledge_base.json')

        # returns JSON object as
        # a dictionary
        data = json.load(f)

        # Iterating through the json
        # list
        for i in data['diseases']:
            if(i['name'] == current_disease):
                dispatcher.utter_message(
                    'Solutions for the ' + current_disease + ' disease.')
                index = 1
                solu = ""
                solu_arrya = []
                for x in i['solutions']:
                    solu_arrya.append(str(index) + ') ' + x)
                    index = index + 1
                solu = "\n".join(solu_arrya)
                dispatcher.utter_message(solu)
        # Closing file
        f.close()

        return []


class ActionInquireSymptoms(ActionQueryKnowledgeBase):
    def __init__(self):
        knowledge_base = InMemoryKnowledgeBase("knowledge_base.json")
        super().__init__(knowledge_base)

    def name(self) -> Text:
        return "action_inquire_symptoms"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        current_disease = next(
            tracker.get_latest_entity_values("disease"), None)

        if(current_disease != None):
            current_disease = str(current_disease).lower().replace(" ", "")
            SlotSet("disease", current_disease)
        else:
            current_disease = tracker.get_slot("disease")
            current_disease = str(current_disease).lower().replace(" ", "")

        # Opening JSON file
        f = open('knowledge_base.json')

        # returns JSON object as
        # a dictionary
        data = json.load(f)

        # Iterating through the json
        # list
        for i in data['diseases']:
            if(i['name'] == current_disease):
                dispatcher.utter_message(
                    'Symptoms of the ' + current_disease + ' disease.')
                index = 1
                symp = ""
                sym_arrya = []
                for x in i['symptoms']:
                    sym_arrya.append(str(index) + ') ' + x)
                    index = index + 1
                symp = "\n".join(sym_arrya)
                dispatcher.utter_message(symp)

        # Closing file
        f.close()

        return []
