alter table agencyservice.agency
    add has_video_calls bit default true not null after is_external;
