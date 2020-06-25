package model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Task {

    private long id;
    private String name;
    private String description;
    private User assignedUser;
    private TaskStatus taskStatus;
    private Date createdDate;
    private Date deadline;
    private User author;

}
