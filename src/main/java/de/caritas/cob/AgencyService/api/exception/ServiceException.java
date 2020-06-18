package de.caritas.cob.AgencyService.api.exception;

public class ServiceException extends RuntimeException {

  private static final long serialVersionUID = -1101045273426330258L;

  /**
   * Service exception
   * 
   * @param message
   */
  public ServiceException(String message) {
    super(message);
  }

}
