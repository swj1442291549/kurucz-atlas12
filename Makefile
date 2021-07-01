FC = gfortran
FCFLAGS = -fno-automatic -w -O3
FC1 = ifort
FC1FLAGS = -save
BINDIR = bin
SRCDIR = src

all: $(BINDIR)/xnfpelsyn \
	$(BINDIR)/synbeg \
	$(BINDIR)/rgfalllinesnew \
	$(BINDIR)/rpredict \
	$(BINDIR)/rmolecasc \
	$(BINDIR)/eschwbin \
	$(BINDIR)/rschwenk \
	$(BINDIR)/rh2ofast \
	$(BINDIR)/synthe \
	$(BINDIR)/spectrv \
	$(BINDIR)/rotate \
	$(BINDIR)/broaden \
	$(BINDIR)/converfsynnmtoa \
	$(BINDIR)/fluxaverage1a_nmtoa \
	$(BINDIR)/atlas12 \
	$(BINDIR)/atlas9mem \
	$(BINDIR)/atlas9v \
	$(BINDIR)/diatomicspack \
	$(BINDIR)/nltelinesasctobin \
	$(BINDIR)/kappa9 \
	$(BINDIR)/kapreadts \
	$(BINDIR)/xnfdf \
	$(BINDIR)/dfsynthe \
	$(BINDIR)/dfsortp \
	$(BINDIR)/separatedf \
	 
clean:
	rm -r $(BINDIR)/*

$(BINDIR)/atlas7v.o:
	$(FC) $(FCFLAGS) -c $(SRCDIR)/atlas7v.for -o $@
	
$(BINDIR)/xnfpelsyn.o:
	$(FC) $(FCFLAGS) -c $(SRCDIR)/xnfpelsyn.for -o $@
	
$(BINDIR)/xnfpelsyn: $(BINDIR)/atlas7v.o $(BINDIR)/xnfpelsyn.o
	$(FC) $(BINDIR)/xnfpelsyn.o $(BINDIR)/atlas7v.o -o $@

$(BINDIR)/synbeg:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/synbeg.for
	
$(BINDIR)/rgfalllinesnew:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/rgfalllinesnew.for
	
$(BINDIR)/rpredict:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/rpredict.for
	
$(BINDIR)/rmolecasc:    
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/rmolecasc.for

$(BINDIR)/eschwbin:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/eschwbin.for
	
$(BINDIR)/rschwenk:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/rschwenk.for

$(BINDIR)/rh2ofast:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/rh2ofast.for

$(BINDIR)/synthe:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/synthe.for
	
$(BINDIR)/spectrv.o:
	$(FC) $(FCFLAGS) -c $(SRCDIR)/spectrv.for -o $@
	
$(BINDIR)/spectrv: $(BINDIR)/atlas7v.o $(BINDIR)/spectrv.o
	$(FC) -o $@ $(BINDIR)/spectrv.o $(BINDIR)/atlas7v.o
	
$(BINDIR)/rotate:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/rotate.for

$(BINDIR)/broaden:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/broaden.for

$(BINDIR)/converfsynnmtoa:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/converfsynnmtoa.for

$(BINDIR)/fluxaverage1a_nmtoa:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/fluxaverage1a_nmtoa.for

$(BINDIR)/atlas12:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/atlas12.for

$(BINDIR)/atlas9mem:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/atlas9mem.for

$(BINDIR)/atlas9v:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/atlas9v.for

$(BINDIR)/diatomicspack:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/diatomicspack.for
    
$(BINDIR)/nltelinesasctobin:
	$(FC) $(FCFLAGS) -o $@ $(SRCDIR)/nltelinesasctobin.for

$(BINDIR)/kappa9:
	$(FC1) $(FC1FLAGS) -o $@ $(SRCDIR)/kappa9.for

$(BINDIR)/kapreadts:
	$(FC1) $(FC1FLAGS) -o $@ $(SRCDIR)/kapreadts.for

$(BINDIR)/xnfdf:
	$(FC1) -o $@ $(SRCDIR)/xnfdf.for

$(BINDIR)/dfsynthe:
	$(FC1) -o $@ $(SRCDIR)/dfsynthe.for

$(BINDIR)/dfsortp:
	$(FC1) -o $@ $(SRCDIR)/dfsortp.for

$(BINDIR)/separatedf:
	$(FC1) -o $@ $(SRCDIR)/separatedf.for
