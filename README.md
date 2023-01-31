# Development Environment for THORSwap Ledger Plugin

### Running tests in the Zondax emulator

From the project root directory, `cd` into the plugin-tools subdirectory and run:

```
./start.sh
```

This will build and enter a Docker container containing all the dependencies required to build binaries for testing.
After running `./start.sh`, you should see the prompt:

```
bash-5.1#
```

Running `ls` should show the contents of the `thorswap-plugin-dev` directory:

```
README.md        app-ethereum     docker           plugin-tools     thorswap-plugin
```

Change to the `thorswap-plugin/tests` subdirectory:

```
cd thorswap-plugin/tests
```

Build the binaries for testing using the included script:

```
./build_local_test_elfs.sh
```

If the plugin binaries build correctly, you should see:

```shell
[LINK] bin/app.elf
/thorswap-plugin-dev/thorswap-plugin/tests
* Done
```

The test suite is run from this directory, but must be run outside the Docker container.
Exit the Docker container:

```
exit
```

Then, change to the `thorswap-plugin/tests/` directory:

```
cd ../thorswap-plugin/tests
```

To run tests, first install any required dependencies:

```
yarn install
```

Then, run the test suite:

```
yarn test
```

The test suite will generate screenshots showing whatever information would have been displayed on the physical device.
These screenshots can be found in the `snapshots-tmp/ethereum_nanos_deposit_with_expiry` subdirectory.

## Building the plugin and installing on a physical device

### Build the plugin binary using ledger-app-builder

First, build the ledger-app-builder Docker container.
From the project root directory, run:

```
docker build -t ledger-app-builder:latest .
```

Activate the previously-built `ledger-app-builder` Docker container:

```
docker run --rm -ti -v "$(realpath .):/app" ledger-app-builder:latest
```

Running `ls` should show the contents of the `thorswap-plugin-dev` directory:

```
README.md        app-ethereum     docker           plugin-tools     thorswap-plugin
```

Change to the `thorswap-plugin` subdirectory:

```
cd thorswap-plugin
```

Build the plugin:

```
make clean && make
```

If the plugin binary has built correctly, you should see:

```shell
[LINK] bin/app.elf
bash-5.1#
```

### Load the plugin onto the device using ledgerblue:

Exit the ledger-app-builder Docker container with:

```
exit
```

Change to the project root directory:

```
cd ..
```

Make sure that your Ledger device is plugged in and unlocked.

Run the plugin load script:

```
./load-plugin.sh
```

On your Ledger device, select `Allow unsafe manager`.

On your Ledger device, the screen should display `Install app THORSwap`. Select `Perform installation`.

Enter your PIN to unlock the device.

The application should appear on the device screen.

### Remove the plugin from the device using ledgerblue:

Change to the project root directory:

```
cd ..
```

Make sure that your Ledger device is plugged in and unlocked.

Run the plugin load script:

```
./delete-plugin.sh
```

On your Ledger device, select `Allow unsafe manager`.
The Ledger device screen should now display `Uninstall THORSwap`. Select `Confirm action`.
