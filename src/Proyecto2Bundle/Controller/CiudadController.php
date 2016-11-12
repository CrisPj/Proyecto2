<?php

namespace Proyecto2Bundle\Controller;

use Proyecto2Bundle\Entity\Ciudad;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
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
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
            $ciudades = $em->getRepository('Proyecto2Bundle:Ciudad')->findAll();
            $json = array();
            foreach ($ciudades as $ciudad)
            {
                $json[] = array("ciudad" => $ciudad->getCiudad()) ;
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
