Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342D5481FA1
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946501; cv=pass; b=iw0bLx+Nfa7Zv3ipeig8mopwWa3S1CXqQxzw3HWtq/VzdqOBClZAaOgG3NNu7f+jNKzZpIgK8p9J2oOXpY729aSWm9fgYkoJUZkfqIt8AEV3sOJtGE+KNR5eiKlDdcb22cYOeca0qhjAgXLgIBqiEJgACjvhrSWa0ZvtVM4v/io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946501; c=relaxed/simple;
	bh=or+55o0RtM7ZLSkqXu7H2qwhiJl9CUEa7FUb38bw+iA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=e43Oe0zVIOeDVTpZEbp5vuAOzlhnuiR0HWLJvl/V0GH17Z7s0fEN0z+dVgESEWqP2BkqhLojbP8B+q5FZSUuY+2vfdOvchikKiOIzm3wh94e4rWAtOkhXqvd99sYnsJwwp/YlvRn+jsF3NP34kBrOjMNLKCULzd0ZnkSgZ5qfBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYzQNPjJ; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYzQNPjJ"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-75e2905c09aso173907137.2
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 09:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785946490; cv=none;
        d=google.com; s=arc-20260327;
        b=bZHbpujghEe5/4ps8OmycGN3gyjr/lPxGYMyhd2HPPRw45E0LaowuQWYRXEziq6y+J
         jMCdGLZbN9/A8ea8lrNrdWQlY6ioCOAfOSWXUUXzDNe7nw5TykUldqIwKs/hdqpWEUDl
         jmtCg+LZp+zJlRbtbt/k7e+/EGfbnKL9aPDJ89XgPmPceGTR8y8jwWd4FTmr2Xoh/shM
         LNOUOb84isWwbem8SmPvY1wJ7U1YL0SsbB+bcGfDZaIThOp20woL9al0gDnlvfqLxNWU
         KXIkQe/DdRF0U7OwhKMBq9qVzJQ9K2fXRHs9LZerPoXi19R12DEDAcBDvu7uSPFvGDWX
         ApbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=or+55o0RtM7ZLSkqXu7H2qwhiJl9CUEa7FUb38bw+iA=;
        fh=NdtrawRA3vMIeir2Q2iaxkEoVYzEAuSA/RyAIwoCSKk=;
        b=BIOYIwFSuzwQHGri2IKuNFaev0U3bsz3O2Ka6V5V1vUGLYyOxwGGc2MKKZ5a3+3uAd
         R11mspumueLoQQXhfXVsdkgZ8k8UfJgEvHJopqD2CD5v5X+2JUD7KezFlen4T+L4/JeO
         NH84hrcQFgHZqc29HgFgU7PvKEcPginunbdMMsEIngziopyy88E5RsdMIYQYJksEyk9B
         Jf7bF++/f4qyPsHbhwaMdSmh89jiWa/OtlAzrSB0QttzflKcZvbnrMzzgiraeP844KGS
         pPAx1coW2ZAZ340zswCAvt+hMkbXwRP4KmS22P3mwDk5FAT36yhMEeV3qLeInvbD5kn3
         KsuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785946490; x=1786551290; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=or+55o0RtM7ZLSkqXu7H2qwhiJl9CUEa7FUb38bw+iA=;
        b=XYzQNPjJC8mnHnfrE1NcGvyqMsqRLtUY8mYlHh+X45pEmyWVmDqCcPVvviK8PlZf0O
         Hsw4+ZhUZdkKLoFJRjl8Itzouxot/SFhDYqr1ieREj0ZYCGJPT3+wTBje1e+tZ9+VN2x
         WzvNojHO7jI7tAqLED+zOio2LsTKvrn/LoIOSs1CopalTIHt4Lxy4Fikpn1C1kwhJcxI
         28AHeOGJdORaK2Snb4T2cn6kpkSQrLoyEAOtzexXstPjjK0k+my19R1kCtu4GkwgyLbr
         OmdeNZDnBN+l956/wjCD2c2NLvLUCAgYwzUMdTNyuZQ3E/obhybaYGSmm1x61k/hFyry
         DNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946490; x=1786551290;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=or+55o0RtM7ZLSkqXu7H2qwhiJl9CUEa7FUb38bw+iA=;
        b=rR3gdXR9I/GHSBsloaglczaJRLRkURwPkLS7dvlyNpQU0hU9+OKjIsXKutzXlvPn8r
         uVRT4m1NXWxMK8DFNYcP6oOv+zNnhDF1N7KZnMYWOsixlpLCUTqGBr4t90cxVco+T8sb
         v/eiM4y1HYWx32gmSV45/D4tLIzLc9zfq3DRoZVrlF2GbiNxsg9Nhri1cMK+at7ZnSkb
         DqHJTnqF9OneDO9dRLK+NHQchK0Wqu2VALAEtgUqvbW/K7Uv3AQHGeXU5gerqqs9KDwk
         qq8tdc5UrrLQY40peXWgbkY26FUsVYgyu0RuDUAzUav6SeODv46oXsU8EVp8dh5iR2+A
         tDzg==
X-Gm-Message-State: AOJu0YyFbXiR/FGAlO4ovG1gMhEeeDXC5DzLBU4H7R4c6canCuDheZtX
	wX7jUFXfkHJBJzRfl3xx8TJDkGyfU1QKWDXgvLjPK0IeFbJaToh1MTyDR8vhJ370eKuTYO7lI8Z
	FEJx4o/YO+cRWKPCEUaW1+Me4DVtxbrdCjsjm
X-Gm-Gg: AR+sD10BSLRxJYnm7bJhIuJgAdofceqvYPC3xjMd/myW7Yh65bjpuwiGufk4FjcjAh1
	k85e2db7M+VLOg+dbq/KwynRLWM7Zx+43F2JrL1RufNkhy0/S6t00Ik/ktgIY0Dkmc5QcYzhoC3
	phFYTFcLzivSydavRkcgrWrNeo0zCYhBkILpYCsFwCEKRmdY9PSaWJN5JtpFOMgucGP/D7W4OQa
	eyr/l8aVWJUnUnmGcUFWQDtpe+4Y+u4kkDfMk2UaDzbEA2gnmWbxg6lbFXSF3xVLkJM503gk8sP
	Vg+xkORLoLd2mzRqfc/TGV2dn7cl1a0G07ORhVL7GdyqjQ==
X-Received: by 2002:a05:6102:5345:b0:739:d787:be8 with SMTP id
 ada2fe7eead31-760e903ad11mr2042473137.9.1785946490037; Wed, 05 Aug 2026
 09:14:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Onuralp Akca <onuralpakca36@gmail.com>
Date: Wed, 5 Aug 2026 18:14:39 +0200
X-Gm-Features: AUfX_mwQqJp0k3Vh711YPThfBg_M4dtTLoblfVBxMYTleN6KyjPb3YS11YONbg0
Message-ID: <CAAKsUJk1CjF2U79+9ztmhCkjGm_=bACyna=fepK+3BAQLVHLbw@mail.gmail.com>
Subject: Samsung Galaxy Book6 Pro camera sensor (ACPI HID SSLC2000, IPU7) has
 no in-tree driver, working out-of-tree fix exists
To: linux-media@vger.kernel.org
Cc: hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

On a Samsung Galaxy Book6 Pro (Panther Lake, Intel Core Ultra X7 358H),
the integrated MIPI camera is not usable under Linux. The IPU7 driver
probes successfully and loads firmware, but no sensor subdevice is
registered, so the media graph stays empty:

intel-ipu7 0000:00:05.0: no subdev found in graph

The camera sensor presents itself with ACPI HID SSLC2000, for which
there was no in-tree driver. I could not find any prior public
reference to this HID, so this may be the first report of it.

Since first working on this, a community fix has surfaced here:

https://github.com/Jabbslad/sc200pc-linux

It confirms and completes the diagnosis below:

- The sensor is a Samsung/SmartSens SC200PC, ACPI HID SSLC2000, on
I2C3 at address 0x36, matching the ACPI data below.
- drivers/media/pci/intel/ipu-bridge.c has no entry for SSLC2000 in
ipu_supported_sensors[]. Because of that, ipu-bridge never builds a
software-node graph for the sensor, and intel-ipu7 correctly reports
"no subdev found in graph", which is the exact symptom seen here.
- The fix is a two-line addition to ipu_supported_sensors[] (patch:
patches/ipu-bridge-add-sslc2000.patch in the repo above), plus a new
out-of-tree V4L2 sensor driver (sc200pc.c, a 141-entry init table
reverse-engineered from the OEM Windows sc200pc.sys driver), since
no in-tree driver exists for this sensor yet.
- I have confirmed this working end to end on Fedora 44, kernel
7.1.5-201.fc44.x86_64 (the repo itself only targeted Arch). qcam
captures real frames, and Firefox picks up the camera correctly via
PipeWire/libcamera at 1920x1080 30fps.

This is currently packaged as an out-of-tree DKMS solution, but both
pieces seem small enough to be reasonable candidates for upstreaming.
ipu-bridge.c just needs the sensor added to its config table, and
sc200pc.c would need to go through the usual V4L2 sensor driver review
(register table cleanup, CameraSensorHelper / CameraSensorProperties
entries for libcamera, and so on).

I am filing this report with that context in case it helps prioritise
or review the upstreaming work. I am happy to test patches on this
hardware.

Below is the original diagnosis I put together before finding the
existing fix, kept for reference in case the ACPI details are useful.

SYSTEM

Machine: Samsung Galaxy Book6 Pro 14"
DMI system-product-name: Galaxy Book6 Pro - PRHK
DMI system-family: Galaxy Book6 Pro
DMI system-version: 1.0
DMI baseboard-product-name: NP940XJG-KG7DE
BIOS version: PRHK.1.2.48.546
SoC: Intel Core Ultra X7 358H (Panther Lake)
Distro: Fedora 44
Kernel: 7.1.5-201.fc44.x86_64 (stock Fedora)
IPU: 00:05.0 Multimedia controller: Intel Corporation Panther Lake IPU
(rev 04), device id 0xb05d

WHAT WORKS

The IPU7 side comes up cleanly. Relevant dmesg:

intel_ipu7: module is from the staging directory, the quality is
unknown, you have been warned.
intel-ipu7 0000:00:05.0: enabling device (0000 -> 0002)
intel-ipu7 0000:00:05.0: Device 0xb05d (rev: 0x4)
intel-ipu7 0000:00:05.0: IPU7 SKU 1 in secure mode mask 0x0
intel-ipu7 0000:00:05.0: firmware cpd file: intel/ipu/ipu7ptl_fw.bin
intel-ipu7 0000:00:05.0: FW binary0 info:
intel-ipu7 0000:00:05.0: Name: psys
intel-ipu7 0000:00:05.0: Version: 1.2.1.251215214352
intel-ipu7 0000:00:05.0: FW binary1 info:
intel-ipu7 0000:00:05.0: Name: isys
intel-ipu7 0000:00:05.0: Version: 1.2.1.251215214331
intel-ipu7 0000:00:05.0: Sending BOOT_LOAD to CSE
intel-ipu7 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
intel-ipu7 0000:00:05.0: CSE authenticate_run done
intel_ipu7_isys: module is from the staging directory, the quality is
unknown, you have been warned.
intel-ipu7 0000:00:05.0: no subdev found in graph

intel_skl_int3472_discrete and ipu_bridge are both loaded (before the
fix above).

THE SENSOR DEVICE

The sensor ACPI node is \_SB.LNK0, which reports itself as present and
functional:

$ cat /sys/bus/acpi/devices/SSLC2000:00/status
15

Evaluated live via acpi_call:

\_SB.LNK0._STA -> 0xf
\_SB.LNK0._HID -> "SSLC2000"
\_SB.DSC0._STA -> 0xf (the INT3472 PMIC/power controller for this link)
\_SB.LNK1._STA -> 0x0 (second link, not populated)

_HID is a method, not a static Name, so the HID only becomes visible
at runtime. It is produced by an HCID() helper in the MiCaTb/MiCaTabl
SSDT which selects between several possible sensor modules for this
board design.

There are also five OVTI08F4 ACPI nodes with status = 0. These appear
to be the unpopulated alternative sensor variants for the same board,
not the sensor actually fitted here. I initially chased those, which
was a red herring, worth flagging in case others hit the same
confusion on Samsung Panther Lake machines.

RESOURCES

\_SB.LNK0._CRS decodes to two I2cSerialBus descriptors, both on
\_SB.PC00.I2C3:

slave address 0x36 (presumably the sensor itself)
slave address 0x50 (presumably an EEPROM, calibration/OTP data)

SSDB

Raw \_SB.LNK0.SSDB dump (110 bytes), decoded values of note:

a lane count field that reads as 2 (2-lane MIPI CSI-2)
0x80 0xba 0x8c 0x01 little-endian = 0x018CBA80 = 25,920,000, plausibly
an MCLK or link frequency in Hz

Full raw buffer available on request.

WHAT THIS IS NOT

To save others the same detour, I ruled out the following:

Not the Intel CVS dependency. There is no INTC10DE / INTC10E0 /
INTC10CF / INTC10E1 / INTC10FA device anywhere in this machine's ACPI
tables, and \_SB.LNK0._DEP does not reference one. Building and
loading intel_cvs from intel/vision-drivers has no effect here, it
binds nothing. This differs from the reported Dell XPS and ThinkPad
X1 Carbon Gen 14 Panther Lake cases.

Not Samsung's "block recording" privacy feature. The
samsung-galaxybook driver binds (ACPI ID SAM0430) and creates the
"Samsung Galaxy Book Camera Lens Cover" input device;
evtest --query ... SW_CAMERA_LENS_COVER returns 0 (not blocked).

Not a disabled/absent device. _STA returns 0x0f for both the sensor
link and its INT3472 power controller.

Not an _OSI / OSYS quirk. The DSDT's highest recognised value is
"Windows 2022", which Linux already reports.

No UEFI setting. This machine's firmware setup exposes no camera
toggle.

No firmware update available via fwupd/LVFS for this model.

Thanks for reading, and happy to provide the full DSDT/SSDT dumps or
run further tests on this hardware.

Regards
Onuralp Akca
