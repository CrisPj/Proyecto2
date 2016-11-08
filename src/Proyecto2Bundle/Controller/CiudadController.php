<?php

namespace Proyecto2Bundle\Controller;

use Proyecto2Bundle\Entity\Ciudad;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;


/**
 * Ciudad controller.
 *
 */
class CiudadController extends Controller
{
    /**
     * Lists all ciudad entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $ciudades = $em->getRepository('Proyecto2Bundle:Ciudad')->findAll();
        $json = array();
        foreach ($ciudades as $ciudad)
        {
            $json = $json + array($ciudad->getCiudad() => null) ;
        }
        return new Response(json_encode($json,JSON_PRETTY_PRINT), 200,          ['Content-Type' => 'application/json']);
    }

    /**
     * Finds and displays a ciudad entity.
     *
     */
    public function showAction(Ciudad $ciudad)
    {

        return $this->render('ciudad/show.html.twig', array(
            'ciudad' => $ciudad,
        ));
    }
}
