const gulp = require("gulp");
const run = require("gulp-run-command").default;

const WATCH_DIR = "./src/json/*";


const BUILD_CMD          = `make`;
const COPY_MOLLEW_CMD    = `cp public/json/molleweide.json ~/.config/karabiner/assets/complex_modifications`;
// const COPY_MOLL_NDK_CMD  = `cp public/json/molleweide_ndk.json ~/.config/karabiner/assets/complex_modifications`;

gulp.task("copy_moll", run(COPY_MOLLEW_CMD));
gulp.task("copy_moll_ndk", run(COPY_MOLL_NDK_CMD));

 gulp.task(
   "build",
   gulp.series(
     run(BUILD_CMD, {
       ignoreErrors: true,
     }),
     "copy_moll",
     // "copy_moll_ndk",
   )
 );


gulp.task(
  "watch",
  gulp.series("build", () => {
    gulp.watch(WATCH_DIR, gulp.series("build"));
  })
);


gulp.task("default", gulp.series("watch"));
