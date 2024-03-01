# Add a new analysis file -------------------------------------------------

wflow_open("analysis/synopsis_OIA.Rmd")

# After opening a new analysis file, do the following:

# change: author: "Jens Daniel Müller"
# change: date:  "`r format(Sys.time(), '%d %B, %Y')`"

# include link to new html file in _site.yml

# Finally, rebuild, push and push again from R-Studio remaining files not taken care of by workflowr





# Repeated comments during work on the project ----------------------------

# to check impact of latest updates
wflow_build()

# commit regular changes (locally) and rebuild site
wflow_publish(here::here(
  "analysis",
  c(
    "index.Rmd",
    "compute_OIA.Rmd",
    "average_OIA.Rmd",
    "synopsis_OIA.Rmd"
  )
),
message = "run without negative Cant")

wflow_publish(here::here(
  "analysis",
  c(
    "index.Rmd",
    "synopsis_OIA.Rmd")
),
message = "figures finalized")

# commit regular changes (locally) and rebuild site
wflow_publish(all = TRUE, message = "saturation horizon change plot")

# commit changes including _site.yml (locally) and rebuild site
wflow_publish(c("analysis/*Rmd"), message = "rerun with new OIA reconstructions for uncertainty", republish = TRUE)


# Push latest version to GitHub
wflow_git_push()
jens-daniel-mueller
