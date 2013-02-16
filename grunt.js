module.exports = function( grunt ) {
  grunt.loadNpmTasks('grunt-typescript');

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

    typescript: {
      base: {
        src: ['src/**/*.ts'],
        dest: 'dist/all.js',
        options: {
          module: 'amd', //or commonjs
          target: 'es5',
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
      }
    },

    mocha: {
      all: ['test/**/*.html']
    },

    watch: {
      files: "src/**/*.ts",
      tasks: ["typescript"]
    }
  });

  grunt.registerTask("run", "typescript concat server watch");
};
