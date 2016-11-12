<?php

namespace Proyecto2Bundle\Controller;

use Proyecto2Bundle\Entity\Vuelo;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

/**
 * Vuelo controller.
 *
 */
class VueloController extends Controller
{
    /**
     * Lists all vuelo entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $vuelos = $em->getRepository('Proyecto2Bundle:Vuelo')->findAll();

        return $this->render('vuelo/index.html.twig', array(
            'vuelos' => $vuelos,
        ));
    }

    /**
     * Creates a new vuelo entity.
     *
     */
    public function newAction(Request $request)
    {
        $vuelo = new Vuelo();
        $form = $this->createForm('Proyecto2Bundle\Form\VueloType', $vuelo);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($vuelo);
            $em->flush($vuelo);

            return $this->redirectToRoute('vuelo_show', array('id' => $vuelo->getIdVuelo()));
        }

        return $this->render('vuelo/new.html.twig', array(
            'vuelo' => $vuelo,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a vuelo entity.
     *
     */
    public function showAction(Vuelo $vuelo)
    {
        $deleteForm = $this->createDeleteForm($vuelo);

        return $this->render('vuelo/show.html.twig', array(
            'vuelo' => $vuelo,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing vuelo entity.
     *
     */
    public function editAction(Request $request, Vuelo $vuelo)
    {
        $deleteForm = $this->createDeleteForm($vuelo);
        $editForm = $this->createForm('Proyecto2Bundle\Form\VueloType', $vuelo);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('vuelo_edit', array('id' => $vuelo->getId()));
        }

        return $this->render('vuelo/edit.html.twig', array(
            'vuelo' => $vuelo,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a vuelo entity.
     *
     */
    public function deleteAction(Request $request, Vuelo $vuelo)
    {
        $form = $this->createDeleteForm($vuelo);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($vuelo);
            $em->flush($vuelo);
        }

        return $this->redirectToRoute('vuelo_index');
    }

    /**
     * Creates a form to delete a vuelo entity.
     *
     * @param Vuelo $vuelo The vuelo entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Vuelo $vuelo)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('vuelo_delete', array('id' => $vuelo->getIdVuelo())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
