/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.carlos.cines.client;

import com.carlos.cines.entities.Movie;
import com.carlos.cines.json.MovieReader;
import com.carlos.cines.json.MovieWriter;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.inject.Named;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author Admin
 */
@Named
@RequestScoped
public class MovieClientBean {

    Client client;
    WebTarget target;

    @Inject
    MovieBackingBean bean;

    @PostConstruct
    public void init() {
        client = ClientBuilder.newClient();
        target = client.target("http://localhost:8080/cines/webresources/com.carlos.cines.entities.movie");
    }

    public void addMovie() {
        Movie m = new Movie();
        m.setId(1);
        m.setName(bean.getMovieName());
        m.setActors(bean.getActors());
        target.register(MovieWriter.class)
                .request()
                .post(Entity.entity(m, MediaType.APPLICATION_JSON));
    }

    @PreDestroy
    public void destroy() {
        client.close();
    }

    public Movie[] getMovies() {
        return target
                .request()
                .get(Movie[].class);
    }

    public Movie getMovie() {
        return target
                .register(MovieReader.class)
                .path("{movieId}")
                .resolveTemplate("movieId", bean.getMovieId())
                .request(MediaType.APPLICATION_JSON)
                .get(Movie.class);
    }

    public void deleteMovie() {
        target.path("{movieId}")
                .resolveTemplate("movieId", bean.getMovieId())
                .request()
                .delete();
    }
}
