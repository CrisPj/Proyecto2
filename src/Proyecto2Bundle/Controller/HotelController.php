<?php

namespace Proyecto2Bundle\Controller;

use Proyecto2Bundle\Entity\Hotel;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;


/**
 * Hotel controller.
 *
 */
class HotelController extends Controller
{
    /**
     * Lists all hotel entities.
     *
     */
    public function indexAction(Request $request)
    {
        $id = $request->request->get('id');
        $em = $this->getDoctrine()->getManager();
        $ciudad = $em->getRepository('Proyecto2Bundle:Ciudad')->findOneBy(array("ciudad"=>$id));
        $hoteles = $em->getRepository('Proyecto2Bundle:Hotel')->findBy(array("idCiudad" => $ciudad->getIdCiudad()));
        $json = array();
        foreach ($hoteles as $hotel)
        {
            $json[] = array("id_hotel"=>$hotel->getIdHotel(),
            "hotel"=> $hotel->getHotel()) ;
        }
        return new Response(json_encode($json,JSON_PRETTY_PRINT), 200,          ['Content-Type' => 'application/json']);
    }

    /**
     * Finds and displays a hotel entity.
     *
     */
    public function showAction(Hotel $hotel)
    {

        return $this->render('hotel/show.html.twig', array(
            'hotel' => $hotel,
        ));
    }
}
