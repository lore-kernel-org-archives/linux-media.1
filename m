Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71151A262A
	for <linux-media@vger.kernel.org>; Sat, 29 Aug 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788016928; cv=pass; b=mSnCk/sh5o0Mu2JZc7doZFHgaSXhGm9AvNlPEF4mwkdzOAMNvtaKYxvBh+7s3hFB1imqMRozV5g6Uu543IZqRRPeqEaId7LQ+fgM9Y9CvGz2YtPWZJlUpSnOqsKdDO5QJs3FMtc7JfnCWIY7gufJ2Nvepr9DPK9tV9HodAI/UCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788016928; c=relaxed/simple;
	bh=NKnmJBcMVfZzhaKOLeFFZuMSAdWVUHcl66xVgoH4ME8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=n6tTD3zdJwBLtBdELG4IoYFpiKwbNrETY/bkn1OrV0SUbPwX5v72Vu7sd0Whf/93IseWESCN/1JNGLjr67ZKnt8v1xeR1hrX1Qv73xMaST9IFWRsThRCla3IG+XpqZeWh7XyTPjv2lZBngNmOLxE38s+V1Ubjx7XEd/TTnKsW24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digitaleo.com; spf=pass smtp.mailfrom=digitaleo.com; dkim=pass (2048-bit key) header.d=digitaleo.com header.i=@digitaleo.com header.b=k/p9kEHI; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digitaleo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digitaleo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digitaleo.com header.i=@digitaleo.com header.b="k/p9kEHI"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66d23c88af0so839304d50.1
        for <linux-media@vger.kernel.org>; Sat, 29 Aug 2026 08:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788016923; cv=none;
        d=google.com; s=arc-20260327;
        b=NIoLMmkQnrC1JnlbftV6Gpswrts2fLOek5/qeBJWAkyqakaQx2d98epZb/Y6rKKxpv
         5Vmp5S0gTJPYENVCEua9QUSmwEE4hpL7X/vJzKXWo2RKqgiacsPFuqtpnJPWZNZosvV7
         aROLi0sIQT+syDlU/1yTYJRbzEt1jyNB5/tZQitqcHytthqM0nay8gb3Glyn0H4FVSuM
         vA1P1HSrnlkHeQKHrlAs0zfbLLdDQbfoRCyvMyIPbmXYiONn7IdalZ4AfBRFRIN00N/R
         GEg8Vtw7CzMA6gRtmziaDdFRT2CoKKU9tAylTvopEpOrT4/5L/YqsNNdev1UarYAKnKU
         Gz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=bbAEdKpkt366VgenOoob93IAXgm+ipQ5ZDLXTpxBjWE=;
        fh=eQV1msZTdgKT28N2bDwlrwX21War/QYcgfwo7Q6OnJg=;
        b=AtAglPlxHTHhj2GgOy1m0tUgrhhbSndwG8YuDPXXvNG6FmxpGCAF6HuhYEnNUH+pdG
         pIZdrE8gHQHv6yjy78Oj0PZy1AN4HSUxTQmgJBiS2NLsN1+iSv3/id8giFbtwy2P8g/5
         fwh0sUbarXKUh9NxbLlLW99GPIm+Dq3ZYoO7oWHTtX0blw/lfg+SjHwh83JkpYiWR0w+
         gKxOm92EDIbcGefrpwp20p4VMr8WQSBaRaP9va24qDZ8UItX4kqBvqtXTB6Upl6eJRdl
         s/zcuUM65TtYruJttNeoITv24j9YvpCF8xcKVw61dQWT/DA5NAhH7bdgAkUhhe4BaJNM
         pAPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=digitaleo.com; s=google-20250313; t=1788016923; x=1788621723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbAEdKpkt366VgenOoob93IAXgm+ipQ5ZDLXTpxBjWE=;
        b=k/p9kEHI6TUWG4kK06AoTxkPlPhYYmJPURe1ctvML5w0mDfjePEClq71biG+QlowGw
         ktrSx8xtWR/WWDFofKbfrEnE2NT4dygi/eIt2ikaBh/gGIBi17bcb+kQTMUJ1jV815xw
         UHozervvLHQQVkwEr3YTnUEq1NVobHjqMhqxhVklQ/NU6+CCdX5/d+ZQkikzMOdpEojZ
         D+wY5eDk3tmUfyf+75K0Eq4gXSBxoaCDr7GDiP+lKxrGATw2FFKp9kdFfDbRW2LfHQLn
         vGB6GfFCK32FLW6wDyfePPKLvfiOHGwVewNtdlmAKqaeS5jRB1O6yOkreD09+mcqnyV6
         tjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788016923; x=1788621723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bbAEdKpkt366VgenOoob93IAXgm+ipQ5ZDLXTpxBjWE=;
        b=a5MKMDZo212s9ZfPtlReIkstJZUa3qrogtaAg7UIffB52wn9cV0F4f5IA5VQWGZFVM
         C9Vm4j9VemoUKfMUMa+GV/JLkaIFvHM6FNaNrQbDfgzAWuD9jDfojlHxeCXFm6EM6CZl
         T+7NJbID5+oc/bKWzb/GkdgnG3+dAEqWkqOkMV1JBgHbgr5Yb3MSKr39S9ktQd04szqe
         xBLGOPgNroKU3cOaMwq0fJ4LVPSSaKUzM+k36TwnJ8hW2UjzRZYx2vhj1HqRXHkaHYUl
         AeZm0rPsfvyt4OqNx4FQOYtiMvqaOuzMPq7J4dKjDS/D3yHDDksvewvocSTlynJok2cL
         OneQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0434d0xwjULkfXkRCh2DLjE/WcSYIx+5aSRg50GoEf8bmzxMbpVIol1QdQl6enLgXetjDkf3FOQKNvA==@vger.kernel.org
X-Gm-Message-State: AFuF++lUm9lZ/DVXH7Z2CNY3EX/t4orhGtIqPTFZ6jtjCJKtzVOTnZtp
	XhxQzK9wOvT5WU25r8L5bqZZ5vVm6Yn/CJp+Bq4boJPYa8GGRtK2ugoePoCqlcH3Bp7kWlF6RFN
	8HIobOKfZrXMAY6pbr2sxiP5kE2wQGd1qHa+erl5WgQ==
X-Gm-Gg: AYBFou2IS8HDSC944bJ89cGi2gZVV1XhDceAvsFfkCezHbOGD13lM9/tBKSlpF5Xe6M
	aGfDRzrsbhMF/YVi6vVH1gODLi+yV30JreS2HsSVHp27s0zBhW8cqJJCs2cM7asPCE0gfa9GSir
	YnAwE7tnAW8KI+tnVDNxEOuAZbFNA/3qB3T/RTl2UMHV3j4b8M8M7G2o0y9NRAnYLGfC/2wzfjx
	QXVE7TzEfaAML00m/M0Gwb+waxvAPBPTe+aHsnE4TAToZ/WFfSxkhHZ/brgEzDbEG0cE3ZMxz93
	ddoNr2EYWOEHFdmFn8YEeXeP8m9uF4SqYZUileAbvpLvPWzbQneNRbnIOOZSy9oxO7OpiUO4ApV
	M
X-Received: by 2002:a53:c8cd:0:b0:66a:c376:6f86 with SMTP id
 956f58d0204a3-66e4c5eaaf5mr3508148d50.8.1788016922892; Sat, 29 Aug 2026
 08:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Steven Agbo <sagbo@digitaleo.com>
Date: Sat, 29 Aug 2026 17:21:26 +0200
X-Gm-Features: AcwNN1W5UN7TZi42BWrm4ZMyCTCHNdwjOtFccP_r8xkvVMIb5PdSu3axU2_sAgI
Message-ID: <CAFsoTZWHf3uExaSH8J_HpcjFyLJCGT77btZx48B=qJF8GuxZPg@mail.gmail.com>
Subject: usbio: Synaptics SVP7500 (06cb:0701) drops off the USB bus on the
 12th acknowledged I2C transaction
To: linux-usb@vger.kernel.org
Cc: israel.a.cepeda.lopez@intel.com, hansg@kernel.org, 
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	bingbu.cao@intel.com, jimmy.su@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

# usbio: Synaptics SVP7500 (06cb:0701) bulk transfer fails and device
re-enumerates
# during ov08x40 sensor PLL programming =E2=80=94 camera unusable on Dell P=
ro
13 Premium PA13250

## Summary

On a Dell Pro 13 Premium PA13250 (Lunar Lake), the front camera sensor
(OmniVision
ov08x40) is reached over an I2C bus exposed by a Synaptics SVP7500 USB brid=
ge
(06cb:0701, "Synaptics Sabre") driven by the `usbio` / `i2c-usbio` drivers.

Sensor probe, IPU7 firmware authentication and async subdev
registration all succeed.
However, the very first attempt to start streaming fails: after
roughly ten consecutive
small I2C register writes, the bridge stops answering on its bulk
endpoints, the USB
device re-enumerates, and streaming aborts.

After the re-enumeration the sensor never re-binds to
`intel_ipu7_isys`, so the camera
disappears from the media graph entirely until the machine is rebooted.

Reproduced on every boot. 100% failure rate, no successful capture
ever obtained.

## Hardware

- Machine: Dell Inc. Dell Pro 13 Premium PA13250
- BIOS: 2.16.0, 08/03/2026 (also reproduced on 2.8.1 =E2=80=94 the update d=
id not help)
- SoC: Intel Core Ultra 7 268V (Lunar Lake)
- IPU: Intel Lunar Lake IPU, PCI 8086:645d rev 04, at 0000:00:05.0
- Sensor: ov08x40, ACPI OVTI08F4:00, on i2c-14 (`usbio-i2c.1`), addr
0x36, 2 lanes, port 0
- Bridge: 06cb:0701 Synaptics SVP7500, USB 2.00, **full speed (12 Mb/s)**
  - bulk OUT ep_06, wMaxPacketSize 0x0040
  - bulk IN  ep_86, wMaxPacketSize 0x0040
  - quirks applied by `usbio_table[]`: `USBIO_QUIRK_BULK_MAXP_63 |
USBIO_QUIRK_I2C_USE_CHUNK_LEN`
- Also present, unbound: INTC10DE (Intel CVS), HIMX1092 (Himax vision senso=
r)

## Software

- Kernel: 7.1.8+deb13-amd64 (Debian trixie-backports, 7.1.8-1~bpo13+1), x86=
_64
- Distro: Debian 13.4 (trixie)
- linux-firmware: 20260622 (Debian firmware-intel-graphics 20260622-1~bpo13=
+1)
  - IPU7 FW: intel/ipu/ipu7_fw.bin =E2=80=94 isys 1.1.9.240627135318, psys
1.1.9.240627135220
- Userspace: libcamera 0.7.1, pipewire 1.4.9, wireplumber 0.5.8
- Modules involved: `usbio`, `i2c-usbio`, `gpio-usbio`, `intel_ipu7`,
`intel_ipu7_isys`,
  `ipu_bridge`, `ov08x40`

Note: `intel_ipu7` and `intel_ipu7_isys` both print the staging-quality war=
ning.

## What works

```
[   16.676224] intel-ipu7 0000:00:05.0: Found supported sensor OVTI08F4:00
[   16.676278] intel-ipu7 0000:00:05.0: Connected 1 cameras
[   16.681997] intel-ipu7 0000:00:05.0: Sending BOOT_LOAD to CSE
[   16.751044] intel-ipu7 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
[   16.783307] intel-ipu7 0000:00:05.0: CSE authenticate_run done
[   17.157551] intel_ipu7_isys.isys intel_ipu7.isys.40: bind ov08x40
14-0036 nlanes is 2 port is 0
[   17.157634] intel_ipu7_isys.isys intel_ipu7.isys.40: All sensor
registration completed.
```

libcamera enumerates the camera correctly via the `simple` pipeline
handler with the
software ISP, and configures 3856x2176 SGRBG10 without error.

## The failure

Triggered by any capture attempt (`cam`, cheese, any PipeWire client):

```
[   51.888170] usbio-bridge 3-3:1.0: Bulk in error -108
[   51.888282] usbio-bridge 3-3:1.0: Bulk in short read: 0
[   51.888292] usbio-bridge 3-3:1.0: Bulk out failed: -19
[   51.888301] ov08x40 i2c-OVTI08F4:00: Failed to write reg 0x5152. error =
=3D -71
[   51.888305] ov08x40 i2c-OVTI08F4:00: ov08x40_start_streaming failed
to set plls
[   51.888317] intel_ipu7_isys.isys intel_ipu7.isys.40: enable streams
Intel IPU7 CSI2 0 failed with -71
[   52.962264] i2c_usbio.usbio-i2c usbio.usbio-i2c.0: Invalid speed
400000 adjusting to bus max 100000
[   52.975389] i2c_usbio.usbio-i2c usbio.usbio-i2c.1: Invalid speed
400000 adjusting to bus max 100000
[   53.894083] intel_ipu7_isys.isys intel_ipu7.isys.40: stream stop time ou=
t
```

The re-appearance of the two "Invalid speed" lines one second later is
the bridge
re-enumerating and the I2C adapters being re-created.

On an earlier boot the identical failure occurred at the identical
register with a
different USB error code (-71 EPROTO instead of -108 ESHUTDOWN):

```
[  101.132522] usbio-bridge 3-3:1.0: Bulk in error -71
[  101.132844] usbio-bridge 3-3:1.0: Bulk in short read: 0
[  101.132863] usbio-bridge 3-3:1.0: Bulk out failed: -19
[  101.132873] ov08x40 i2c-OVTI08F4:00: Failed to write reg 0x5152. error =
=3D -71
```

So the bridge fails with either -EPROTO (-71, USB transaction error)
or -ESHUTDOWN
(-108, endpoint shut down), non-deterministically,
but always at the same point in the register sequence.

## Analysis

`ov08x40_start_streaming()` writes `link_freq_configs[].reg_list`,
which for this mode is
`mipi_data_rate_800mbps[]`. `ov08x40_write_regs()` issues **one
separate I2C write per
register**, each 3 bytes (16-bit address + 8-bit value):

```c
for (i =3D 0; i < len; i++) {
        ret =3D ov08x40_write_reg(ov08x, regs[i].address, 1, regs[i].val);
        ...
}
```

Register `0x5152` is the **11th entry** of `mipi_data_rate_800mbps[]`:

```c
static const struct ov08x40_reg mipi_data_rate_800mbps[] =3D {
        {0x0103, 0x01},   /* software reset */
        {0x1000, 0x00},
        {0x1601, 0xd0},
        {0x1001, 0x04},
        {0x5004, 0x53},
        {0x5110, 0x00},
        {0x5111, 0x14},
        {0x5112, 0x01},
        {0x5113, 0x7b},
        {0x5114, 0x00},
        {0x5152, 0xa3},   /* <-- fails here */
        ...
```

Consequences for triage:

1. Each transfer is 3 bytes, far below `txbuf_len` (63 with
`USBIO_QUIRK_BULK_MAXP_63`).
   The split/chunking path in `usbio_i2c_write()` is never entered, so
   `USBIO_QUIRK_I2C_USE_CHUNK_LEN` is not implicated.
2. Writes 1 through 10 succeed. The bridge only fails once a short
burst of back-to-back
   small transactions has been issued, which points at a rate/timing
or state-machine
   problem in the bridge firmware or in the bulk request/response
handling, rather than at
   transfer size.
3. Entry 1 is a sensor software reset (`0x0103 =3D 0x01`). It is worth
checking whether the
   sensor needs a settle delay after reset that the current code does
not provide, and
   whether the resulting NAKs on the I2C bus are what wedges the bridge.
4. The bus runs at 100 kHz: ACPI declares 400 kHz but
`USBIO_QUIRK_I2C_ALLOW_400KHZ` is not
   set for this device, so `i2c-usbio` clamps it. Combined with a
full-speed (12 Mb/s) USB
   link, each register write costs at least one USB frame.

## Second, separable issue

After the bridge re-enumerates, the sensor is never re-bound to
`intel_ipu7_isys`.
`/dev/media0` is then left with only its 36 internal entities (32 ISYS
Capture + 4 CSI2),
the CSI2 sink pad is `MUST_CONNECT` with no source, and libcamera reports:

```
INFO SimplePipeline simple.cpp:1899 No sensor found for /dev/media0
Camera 1 not found
```

Only a reboot restores the binding. Even once the transfer bug is
fixed, a USB bridge
carrying a camera sensor's I2C bus can legitimately be unplugged or
reset, so the
re-binding path looks worth hardening independently.

## Third issue: kernel oops when reloading intel_ipu7_isys

Because the sensor stays unbound after the bridge resets, reloading
the ISYS module looked
like a way to recover without rebooting. It instead panics. `modprobe
-r intel_ipu7_isys`
also drops `intel_ipu7` (see "last unloaded" below); re-probing then
dereferences software
nodes that `ipu_bridge` has already torn down:

```
Oops: general protection fault, kernel NULL pointer dereference 0x0:
0000 [#1] SMP NOPTI
CPU: 2 UID: 0 PID: 3582 Comm: modprobe Tainted: G         C OE
7.1.8+deb13-amd64 #1
Hardware name: Dell Inc. Dell Pro 13 Premium PA13250/0NGT53, BIOS
2.16.0 08/03/2026
RIP: 0010:software_node_graph_get_port_parent+0x3f/0xa0
Call Trace:
 <TASK>
 fwnode_graph_get_port_parent+0x5d/0xa0
 fwnode_graph_get_endpoint_by_id+0xa9/0x2a0
 isys_notifier_init+0xef/0x1d0 [intel_ipu7_isys]
 isys_probe+0x6d4/0x9e0 [intel_ipu7_isys]
 really_probe+0xde/0x380
 __driver_probe_device+0x84/0x150
 driver_probe_device+0x1f/0xa0
 __driver_attach+0xba/0x1f0
 bus_for_each_dev+0x8e/0xe0
 bus_add_driver+0x11f/0x200
 driver_register+0x72/0xd0
 __auxiliary_driver_register+0x6e/0xd0
 do_one_initcall+0x5c/0x320
 do_init_module+0x60/0x250
 init_module_from_file+0xd6/0x130
 idempotent_init_module+0x114/0x310
 __x64_sys_finit_module+0x71/0xe0
 do_syscall_64+0xea/0x640
 </TASK>
Modules linked in: intel_ipu7_isys(C+) intel_ipu7(C) ... [last
unloaded: intel_ipu7(C)]
```

Reproducer: `modprobe -r intel_ipu7_isys && modprobe intel_ipu7_isys`.

The `OE` taint comes from a locally built `usbio` carrying only an
added `msleep()` knob
(see "Experiment 1" below); it is not in this call path, and the crash is i=
n
`intel_ipu7_isys` / `ipu_bridge` software-node teardown.

## Experiments already performed

**Experiment 1 =E2=80=94 transfer pacing: does not help.** `usbio` was rebu=
ilt
out-of-tree from
the v7.1.8 sources with a single addition: a module parameter
inserting a delay before
every bulk transfer in `usbio_bulk_msg()`. With `xfer_delay_us=3D5000`
(5 ms before *each*
bulk transfer, roughly a thousandfold increase in spacing), the
failure is unchanged: same
register `0x5152`, same eleventh write, same bridge re-enumeration.
The trigger therefore
appears to be transaction count or bridge state, not transfer rate.
Patch available on
request.

**Experiment 2 =E2=80=94 it is the 12th *acknowledged* I2C transaction, not
the register.**
`ov08x40` was rebuilt out-of-tree with a `skip_reg` parameter that
omits one register from
`ov08x40_write_regs()`. With `skip_reg=3D0x5152`, the failure does not
go away: it moves to
the next register in the list.

```
ov08x40 i2c-OVTI08F4:00: skipping reg 0x5152 (debug)
usb 3-3: USB disconnect, device number 2
usbio-bridge 3-3:1.0: Bulk in error -108
ov08x40 i2c-OVTI08F4:00: Failed to write reg 0x5a52. error =3D -71
```

Counting the acknowledged writes issued to the powered sensor:

```
 1. 0x0103   (explicit OV08X40_REG_SOFTWARE_RST in ov08x40_start_streaming)
 2. 0x0103   (first entry of mipi_data_rate_800mbps[], same register again)
 3. 0x1000     4. 0x1601     5. 0x1001     6. 0x5004
 7. 0x5110     8. 0x5111     9. 0x5112    10. 0x5113    11. 0x5114
12. -------> bridge disconnects, whatever this register happens to be
```

Crucially, this is consistent with a userspace observation: `i2cdetect
-y -r 14` issues
about 112 transactions back to back and the bridge survives them all =E2=80=
=94
but the sensor is
powered down when the camera is idle, so every one of those is NAKed.
Likewise, a single
`i2cset -y 14 0x36 0x51 0x52 0xa3 i` (the exact failing payload)
returns "Write failed"
and leaves the bridge alive.

The bridge therefore tolerates an unbounded number of *failed*
transactions and dies on
the twelfth *successful* one. This has the shape of a resource leak in
the bridge
firmware: something allocated per completed transaction and never
released, with room
for twelve.

**Experiment 3 =E2=80=94 no camera-free reproducer is possible on this
machine.** Both usbio I2C
buses were probed from userspace with the camera idle: `i2cdetect -y -r 13`=
 and
`i2cdetect -y -r 14` each report an empty bus. The sensor (OVTI08F4,
bus 14) and the two
devices on bus 13 (HIMX1092, INTC10DE) are all powered down when no
driver holds them, so
every userspace transaction is NAKed and the bridge survives
indefinitely. Reproducing the
crash therefore requires the camera pipeline to power the sensor
first, which is why the
reproducer below goes through libcamera.

**Experiment 4 =E2=80=94 Dell system firmware 2.8.1 -> 2.16.0: does not
help.** The SVP7500
firmware ships inside the Dell system firmware package; updating it
changed nothing.

## Steps to reproduce

1. Boot the machine; confirm `All sensor registration completed` in dmesg.
2. Run `cam -c1 --capture=3D5` (libcamera-tools), or open any camera applic=
ation.
3. Observe the bulk errors above; the capture fails immediately.
4. `cam -l` from then on reports no camera until reboot.

## Additional notes

- A separate, likely unrelated message appears at every boot:
  `gpio_usbio.usbio-gpio usbio.usbio-gpio.0: [Firmware Bug]: GPIO 4 is
not in FW pins bitmap`
- Updating the Dell system firmware from 2.8.1 to 2.16.0 (which is
where the SVP7500
  firmware ships) changed nothing.
- Happy to test patches or collect additional traces (usbmon, dynamic
debug) on request.

## Where to send this

From MAINTAINERS (v7.1.8):

```
INTEL USBIO USB I/O EXPANDER DRIVERS      <- the bridge, i.e. the main bug
M: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
M: Hans de Goede <hansg@kernel.org>
R: Sakari Ailus <sakari.ailus@linux.intel.com>
F: drivers/usb/misc/usbio.c, drivers/i2c/busses/i2c-usbio.c,
drivers/gpio/gpio-usbio.c

INTEL IPU7 INPUT SYSTEM DRIVER            <- the module-reload oops
M: Sakari Ailus <sakari.ailus@linux.intel.com>
R: Bingbu Cao <bingbu.cao@intel.com>
L: linux-media@vger.kernel.org
F: drivers/staging/media/ipu7/

OMNIVISION OV08X40 SENSOR DRIVER
M: Jimmy Su <jimmy.su@intel.com>
L: linux-media@vger.kernel.org
F: drivers/media/i2c/ov08x40.c
```

Note that the USBIO entry carries no `L:` list of its own; the files live u=
nder
`drivers/usb/`, so `linux-usb@vger.kernel.org` is the appropriate list.
