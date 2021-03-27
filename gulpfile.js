const gulp = require("gulp");
const run = require("gulp-run-command").default;

const HOME_DIR = "../../";
const WATCH_DIR = "./src/json/*";

const BUILD_CMD          = `make`;

// test if i can do only mollew*
gulp.task('copy-mollew', function() {
  return gulp.src(['./public/json/molleweide*.json', './public/json/molleweide_no_dual_keys.json'])
    .pipe(gulp.dest(`${HOME_DIR}.config/karabiner/assets/complex_modifications`));
});

gulp.task(
  "build",
  gulp.series(
    run(BUILD_CMD, {
      ignoreErrors: true,
    }),
    "copy-mollew",
  )
);

gulp.task(
  "watch",
  gulp.series("build", () => {
    gulp.watch(WATCH_DIR, gulp.series("build"));
  })
);

gulp.task("default", gulp.series("watch"));
