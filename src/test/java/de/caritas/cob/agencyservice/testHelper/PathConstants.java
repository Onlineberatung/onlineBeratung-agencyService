package de.caritas.cob.agencyservice.testHelper;

public class PathConstants {

  public static final String ROOT_PATH = "/agencyadmin";
  public static final String POSTCODE_RANGE_BASE_PATH = ROOT_PATH + "/postcoderanges/";
  public static final String UPDATE_AGENCY_POSTCODE_RANGE_PATH = POSTCODE_RANGE_BASE_PATH + "1";
  public static final String CREATE_AGENCY_POSTCODE_RANGE_PATH = ROOT_PATH
      + "/agencies/1/postcoderanges";
  public static final String DELETE_AGENCY_POSTCODERANGE_PATH = POSTCODE_RANGE_BASE_PATH;
  public static final String GET_AGENCY_POSTCODERANGE_PATH = ROOT_PATH
      + "/agencies/1/postcoderanges";
  public static final String UPDATE_DELETE_AGENCY_PATH_INVALID_ID = ROOT_PATH + "/agencies/abc";
  public static final String UPDATE_DELETE_AGENCY_PATH = ROOT_PATH + "/agencies/1";
  public static final String CHANGE_AGENCY_TYPE_PATH = ROOT_PATH + "/agencies/1/changetype";
  public static final String CREATE_AGENCY_PATH = ROOT_PATH + "/agencies";
  public static final String GET_DIOCESES_PATH = ROOT_PATH + "/dioceses";
  public static final String AGENCY_SEARCH_PATH = ROOT_PATH + "/agencies";
  public static final String PAGE_PARAM = "page";
  public static final String PER_PAGE_PARAM = "perPage";
  public static final String PATH_GET_LIST_OF_AGENCIES = "/agencies";
  public static final String PATH_GET_AGENCIES_WITH_IDS = "/agencies/";
  public static final String GET_AGENCY_PATH = ROOT_PATH + "/agencies";
}
