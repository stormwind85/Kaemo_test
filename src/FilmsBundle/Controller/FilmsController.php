<?php

namespace FilmsBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class FilmsController extends Controller
{
    public function indexAction()
    {
        // récupération de la liste entière des films via la bdd et triée par position croissante
        $repository = $this->getDoctrine()->getManager()->getRepository('FilmsBundle:Film');
        
        $liste_films = $repository->listeFilms();
        
        return $this->render('FilmsBundle:Films:index.html.twig', array('liste' => $liste_films));
    }
    public function infosAction($id)
    {
        // récupération des informations d'un film selon l'id
        $infos = $this->getDoctrine()->getManager()->getRepository('FilmsBundle:Film')->find($id);
        
        return $this->render('FilmsBundle:Films:infos.html.twig', array('infos' => $infos));
    }
    public function updateAction($id, Request $request)
    {
        // suivi de la requête ajax, on maj la bdd au niveau de la position du film, élément qui a été dragged
        if($request->isXmlHttpRequest())
        {
            $positionTrouvee = $request->request->get('position');
            
            // exemple : un élément d'id: 2 et position: 2 va remplacer un élément d'id: 3 et position: 3
            // l'élement d'id: 2 va donc devenir en position : 3 et l'élement d'id : 3 deviendra en position : 2
            $em = $this->getDoctrine()->getManager();
            
            $repository = $em->getRepository('FilmsBundle:Film');
            $positionInitiale = $repository->positionInitiale($id);
            
            $film_dragged = $em->getRepository('FilmsBundle:Film')->find($id);
            $film_dragged->setPosition($positionTrouvee);
            $em->persist($film_dragged);
            
            $film_ondrag = $em->getRepository('FilmsBundle:Film')->findOneBy(array('position' => $positionTrouvee));
            $film_ondrag->setPosition($positionInitiale);
            $em->persist($film_ondrag);
            
            $em->flush();
        }
        $this->addFlash('notice', 'Mise à jour de la liste des films !');
        return new \Symfony\Component\HttpFoundation\Response("ok"); // renvoie obligatoire tout en prenant en compte le flashBag
    }
}