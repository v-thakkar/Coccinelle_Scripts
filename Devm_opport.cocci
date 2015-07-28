/* This semantic patch is for finding devm_opportunity in Linux kernel */

virtual label_check

@main@
identifier str,i,prb;
position p;
@@

struct str i = { .probe = prb@p, };

@calls@
identifier main.prb,f;
position p,p1;
constant char[] c;
@@

prb(...) {
<...
(
clk_put@p@p1(...);
|
dma_free_coherent@p@p1(...);
|
dma_free_noncoherent@p@p1(...);
|
dma_pool_destroy@p@p1(...);
|
gpiod_put@p@p1(...);
|
iio_device_free@p@p1(...);
|
rtc_device_register@p@p1(...);
|
iio_device_unregister@p@p1(...);
|
iio_trigger_free@p@p1(...);
|
release_mem_region@p@p1(...);
|
release_region@p@p1(...);
|
release_resource@p@p1(...);
|
regmap_init_i2c@p@p1(...);
|
regmap_field_alloc@p@p1(...);
|
regmap_init_spi@p@p1(...);
|
ioport_unmap@p@p1(...);
|
iounmap@p@p1(...);
|
pci_iounmap@p@p1(...);
|
free_irq@p@p1(...);
|
mdiobus_free@p@p1(...);
|
free_pages@p@p1(...);
|
kfree@p@p1(...);
|
pci_disable_device@p@p1(...);
|
pci_unpin_device@p@p1(...);
|
usb_put_phy@p@p1(...);
|
pinctrl_put@p@p1(...);
|
pwm_put@p@p1(...);
|
power_supply_register@p@p1(...)
|
regulator_put@p@p1(...);
|
regulator_unregister@p@p1(...);
|
acpi_dma_controller_unregister@p@p1(...);
|
spi_unregister_master@p@p1(...);
|
f@p1(...,c,...);
)
...>
}

@goodcall exists@
identifier main.prb;
position any calls.p;
identifier f;
@@

prb(...) {
... when any
f@p(...);
... when any
}

@badcall exists@
identifier main.prb;
position bad != calls.p1;
position calls.p;
identifier f,g;
@@

prb(...) {
... when any
f@p(...);
... when any
g@bad(...);
... when any
}

@label_check2 depends on label_check exists@
identifier main.prb;
position bad != calls.p1;
identifier l,g;
@@

prb(...) {
... when any
l:
... when any
g@bad(...);
... when any
}

@has_label exists@
identifier main.prb;
identifier l;
@@

prb(...) {
... when any
l:
... when any
}

@depends on
   goodcall && !label_check2 && (has_label || !label_check) && !badcall@
identifier main.prb;
@@

*prb(...)
{
...
}
