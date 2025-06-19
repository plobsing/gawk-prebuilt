def _fmt_install_cmd(item):
    (name, targ) = item

    src_files = targ.files.to_list()
    if len(src_files) != 1:
        fail("Target {targ} does not produce exactly one output.".format(targ=targ.label))
    src = src_files[0]

    return 'install "$@" "$BUILD_WORKING_DIRECTORY"/"{src}" "{name}"'.format(src=src.path, name=name)

def _release_bundle_impl(ctx):
    output = ctx.actions.declare_file(
        "{name}_/{name}".format(name = ctx.attr.name),
    )

    content = (ctx.actions.args()
        .set_param_file_format("multiline")
        .add("#!/usr/bin/env bash")
        .add('set -euo pipefail')
        .add('cd "$BUILD_WORKING_DIRECTORY"')
        .add('cd "$1"; shift')
        .add_all(ctx.attr.files.items(), map_each=_fmt_install_cmd)
    )
        
    ctx.actions.write(
        output = output,
        content = content,
        is_executable = True,
    )

    runfiles = ctx.runfiles(
        files = ctx.files.files,
    )

    return [
        DefaultInfo(
            executable = output,
            runfiles = runfiles,
        )
    ]


release_bundle = rule(
    _release_bundle_impl,
    attrs = {
        "files": attr.string_keyed_label_dict(),
    },
    executable = True,
)
