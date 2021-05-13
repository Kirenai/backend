package une.revilla.backend.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode
@ToString
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class DataTaskDto {

    private TaskDto taskData;

    private List<TaskDto> data;

    private static DataTaskDto instance = null;

    public static DataTaskDto getInstance(TaskDto taskDto) {
        if (instance != null) {
            return instance;
        }
        return new DataTaskDto(taskDto, null);
    }

    public static DataTaskDto getInstance(List<TaskDto> data) {
        if (instance != null) {
            return instance;
        }
        return new DataTaskDto(null, data);
    }

}