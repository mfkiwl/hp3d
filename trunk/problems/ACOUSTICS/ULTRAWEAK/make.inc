SRC_MODULE = \
            ./modules/common_prob_data.F90

SRC_COMMON = \
            ./common/customize_geometry.F90 \
            ./common/dirichlet.F90 \
            ./common/exact.F90 \
            ./common/exact_error.F90 \
            ./common/getf.F90 \
            ./common/solution.F90 \
            ./common/uniform_href.F90 \
            ./common/set_environment.F90 \
            ./common/initialize.F90 \
            ./common/finalize.F90

SRC_UW = \
            elem.F90 \
            elem_residual.F90 \
            celem.F90 \
            set_initial_mesh.F90 \
            set_3Dint_fi.F90 \
            exec_case.F90 \
            exec_job.F90 \
            my_paraview_driver.F90 \
            soldis.F90 \
            main.F90

SRC_FILE   += $(SRC_MODULE) $(SRC_COMMON) $(SRC_UW)