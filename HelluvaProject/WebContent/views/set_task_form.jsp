<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
                                        <div class="main-card mb-3 card">
                                            <div class="card-body"><h5 class="card-title">Nueva tarea</h5>
                                                <form class="" action="<%=request.getContextPath()%>/tasks" method="post">
                                                    <div class="position-relative form-group">
                                                    	<label for="exampleEmail" class="">Titulo</label>
                                                    	<input type="text" name="titulo" id="exampleEmail" placeholder="titulo" class="form-control">
                                                   	</div>
                                                    
                                                    <div class="position-relative form-group">
                                                    	<label for="exampleText" class="">Descripcion</label>
                                                    	<textarea name="descripcion" id="exampleText" class="form-control"></textarea>
                                                    </div>
                                                    <input type="hidden" name="id_aula" value="${aula_id}">
                                                    <input type="hidden" name="action" value="new_task">
                                                    <button type="submit" class="mt-1 btn btn-primary">Submit</button>
                                                </form>
                                            </div>
                                        </div>