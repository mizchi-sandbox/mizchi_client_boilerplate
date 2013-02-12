module.exports = function( grunt ) {
  grunt.loadNpmTasks('grunt-coffee');

  grunt.initConfig({
    coffee: {
      app: {
        src: ["src/**/*.coffee"],
        dest: "lib",
        options: {
          preserve_dirs: true,
          base_path: 'src'
        }
      }
    },

    concat: {
      vendor: {
        src: [
          "components/underscore/underscore-min.js",
          "components/jquery/jquery.min.js"
        ],
        dest: "dist/vendor.js"
      },

      app: {
        src: [
          "lib/util/*.js",
          "lib/initialize.js",
          "lib/**/*.js"
        ],
        dest: "dist/all.js",
        options: {
          bare: false
        }
      }
    },

    mocha: {
      all: ['test/**/*.html']
    },

    watch: {
      files: "src/**/*.coffee",
      tasks: ["coffee", "concat"]
    },
  });

  grunt.registerTask("run", "coffee concat server watch");
};
