package model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Comment {

    private int id;
    private String text;
    private Date createdDate;
    private User author;
    private Task task;
    private boolean isActive;
    private Integer parrentCommentId;

}
