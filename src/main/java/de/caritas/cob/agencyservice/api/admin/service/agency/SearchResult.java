package de.caritas.cob.agencyservice.api.admin.service.agency;

import java.util.List;

public class SearchResult<T> {

  private List<T> result;
  private Long totalSize;

  public SearchResult(List<T> result, Long totalSize) {
    this.result = result;
    this.totalSize = totalSize;
  }

  public List<T> getResult() {
    return result;
  }

  public Long getTotalSize() {
    return totalSize;
  }
}
