<?php

namespace Proyecto2Bundle\Controller;

use Proyecto2Bundle\Entity\Tipo;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;


/**
 * Tipo controller.
 *
 */
class TipoController extends Controller
{
    /**
     * Lists all tipo entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $tipos = $em->getRepository('Proyecto2Bundle:Tipo')->findAll();

        $json = array();
        foreach ($tipos as $tipo)
        {
            $json[] = array("tipo" => $tipo->getTipo()) ;
        }
        return new Response(json_encode($json,JSON_PRETTY_PRINT), 200,          ['Content-Type' => 'application/json']);
    }

    /**
     * Finds and displays a tipo entity.
     *
     */
    public function showAction(Tipo $tipo)
    {

        return $this->render('tipo/show.html.twig', array(
            'tipo' => $tipo,
        ));
    }
}
