package com.axsos.Life.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.axsos.Life.models.*;
import java.util.*;
import java.time.*;
import static com.axsos.Life.models.Enums.*;

public interface InBodyReportRepository extends JpaRepository<InBodyReport, Long> {
	List<InBodyReport> findAllByUserIdOrderByReportDateAsc(Long userId);

	Optional<InBodyReport> findFirstByUserIdOrderByReportDateDesc(Long userId);
}