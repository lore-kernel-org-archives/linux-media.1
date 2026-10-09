Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FC632E68D
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 03:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515238; cv=pass; b=eudAmA7kbffBTJOx/We/ntWezZOgKi4Q6ws9GkM5R89ItbmZzvkzEg2eunSjV12Gdq5dtlWkoLFt0158uiYodSjjICoVCUoaj2w60498iHa4lgSbrMSUeHBPcMHbmPoblEqGHhv69SE1gtAJjyKdFHv5YoC7fG2KruWSOrZsC1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515238; c=relaxed/simple;
	bh=zDKS9rz00duNFZF5gv/ESxyG1+2Q6cK08UzUnwjYz7w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BNREzcnS7zhK5wyIq5yKLdeBloAwvFzok+ymRFaO9Ysj8lxXchRye/YUs2UKztsIh/IZiVo+pQi3ZsoLLo56mvRHr+WFs/dUiwjTFVOaqNXDyg31n01yncVMJsV/pSMdGDGY6SszAMLqzlgPyJr8IymWvATWrSI8Lh/cYINj/Jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7eVoyRI; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7eVoyRI"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so5476895c88.0
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 20:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791515236; cv=none;
        d=google.com; s=arc-20260327;
        b=KjsFaX8oTddJnFocZxfJg3aLJNMUBxnFVfOs1Zt8W0bTaBlVNnn6B2Sp2IWx8n582l
         TzFiw6idPS7zpKzXLyvPiUitoSkmb9q0QjiZi316jT1qVf4zDn2MWNLDX1as/yOypMS8
         wHvt2Sx7431IGKm3zb2BV6VTJe0RR888V26JX+njmheHdjn7yYRmBW4GYeUC9gNe/N9z
         C93RwQJbXu1Fd8o1WBqhYzSc8BeYhJzMl+H56QB2KCSoTIYy7ex8C32jcrO3rRaajPkQ
         NeUe9bV4H3DkNasJ3TSiEK3P4evGif02C1l1wP+SG5NWrEmUi58HRgvVVxF/LIucbKV9
         RC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=bIvB+xdhyRTjlF9aB3Qta8cJj/Plqc9s8QlU4Iabrhw=;
        fh=uAgTQZPrgi4lQ4hk8zNuTHJJNEHEttbn3MhR0UveTL4=;
        b=LN2tr69rv1x1MBNu/P7uuz3VXuThui4DHQZF1dynraWblNl+6elBaxyYLtl2sVVXcs
         cQI12TSN1v6HdwMCqbnBfOgJEzVl17y3VFDqK1EFtptSxXIehYnb+tCTjZRWhCxzKaGV
         ARayE6sv5mDwT05288UlFwxDflW8YAQC2CqCkTT/1zXSJzlSgSlfa/jz8VlxTbvRP6XY
         ykGywAKwWjxEyrVyigkSj3ao7cvQu1dR662WHtbyywBMRJRH6eMd79iSkLoU1hpgoUUt
         jV5BB7PLdG5wGWTaSPWlt3vz6mef3ZPRSomcELmlNAFWDGJC6mbbp3N1ClrmhGuep6nw
         J2TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791515236; x=1792120036; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIvB+xdhyRTjlF9aB3Qta8cJj/Plqc9s8QlU4Iabrhw=;
        b=J7eVoyRIRpnE4ZVb20IZB2VQ7u+hngYYNPjp0/2S/Fd3WM983vcG3rq98UCJu2FRrR
         U6P2GLUTdH3hiUZRWsf40vMPItozh418+qtDguYgw1aZU8Jv1+L0Y4XxKf1dWqEIPcGz
         MQ/TpEfaPKS/EN4m2ltspdnrXpMQUB66LtBbqcExMlnC0bAJUBNpEw6Feic8exsGoYE+
         Q8Kh+PskdfHb54/UbF/xNbJheTTf7pnyeMm7dHLNMuZBYfkzBgr35g16h3uf9EVUWN4g
         WqJPY9KWWRv3miZOyxFWpz20TAlqhGF1/AKGjXA/bmvVsjBWzadDAF4B8QdocOoZgobi
         ox1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791515236; x=1792120036;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bIvB+xdhyRTjlF9aB3Qta8cJj/Plqc9s8QlU4Iabrhw=;
        b=h2phIsQojNaiBkxXzXf6V6R2g/pSR+T6uR/VzzchG2GaNs3YXHWe7njlet+mM+Oajx
         78rmo/Uvp2CAtPLDTe68EA+gKACfJVLrvcRgU9iDdh6sFAvVWUN+gvtsPpc2Re98oJTp
         HXnvFWxb3Pnw3DsbrqxfR5lQCkiGlkZ0DD4qiPVlq9QenDixPgUv6VlcX5PwjknjAjE6
         ZlQkGXalL2+HCIQBkQR0Zr7ldgTB50uQRrkNnQnZdxCbHeslUSpkeZwvZW6y2meaSrbk
         Mr/csw6/wz0rxOD7l41ZK/j3aMoVb/c+SkG9TXEQ6j00eUJBW/gHoe6kUJZzZUGBaJrn
         3Wzg==
X-Forwarded-Encrypted: i=1; AKwUvBwogMtvy848YOQ7RJE8nr73DHblKufU1y4K35/qIYX3H7jUNZmy/q406pU6QDNm0VC5d8Zb95C0v5T2rQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kQFaoHYckzugS9b8uCOs7QP/AWhjSi1sc1FRBbwqtJTTUe8iuw
	jfuiDoQNcZelhU+++LZ8N2RNs2epfyesFvQDo7jvf2bNoH6TxRxprI37ybu2KnoLWHqTKR1zVO+
	c4bn/58WI/PZOOe4hlBWNuKOijWQrCkI=
X-Gm-Gg: AYBFou1kwP/BsLtSqoE7W7DrwPT4a+faiyIUqYCpFUBAjSSNWo3orIC5TIioZgowMiU
	HfDNGs3cvwH1BMY0yh50DhlS52u9qfcv14BRKlVPq1+QA6BzM1GAHe0lhXqua7hqxtoyNDzUxWW
	4nuLq2YZunX8/TKwFihlTRc+4vD5XehJq2FCC8LTDbO/VTQ1XnSMYFWyYqBhhsETkv8PEOsZtTE
	/D7/+w+dXibYWKCa65JTRQbu0qjkGTl/p+EtQDXvBqZnDD2cw+OCXNA6vv05BmdAOik25eXY9Xl
	Fw3Y15AKOf5oBdxBImKscz6QQveE0F0ECRTRlMAgooNdXBKTuUEJKqkDE1iM2lyGk0cJOe3c0Ml
	HV5AUg+Yt1CciuwxzCBXG45fAYGZHzxz4HJ86VePI03GuUBrH3JMu07Fzt2Add0/e/MsqhFNOsA
	==
X-Received: by 2002:a05:7023:a56:20b0:15d:d124:b7c7 with SMTP id
 a92af1059eb24-16a5e49fd65mr646815c88.10.1791515235633; Thu, 08 Oct 2026
 20:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alexander Patrakov <patrakov@gmail.com>
Date: Fri, 9 Oct 2026 11:06:47 +0800
X-Gm-Features: AclHuK-Zf6wXUp4jdkPZ0-p3mUAFC-5OPkQlIA75FwpuE5aMMTTuMIc5lxv57TI
Message-ID: <CAN_LGv0qkxARw4bxO8K-1hUkWNg2ts6q50dooCB5UM5en=bo0w@mail.gmail.com>
Subject: int3472: GPIO type names disagree with Intel's Windows driver
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Leif Skunberg <diamondback@cohunt.app>, 
	Sahan Nissanka <adee.sahan@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

Disclosure: I used Claude Code for the table extraction, for the Windows
driver disassembly, and for drafting this email.

This is a report, not a patch. While I was getting the front camera of a
Lenovo Yoga Duet 7 13ITL6 to work, Claude Code found that Intel's Windows
control logic driver carries a table of names for the INT3472 _DSM GPIO
types. It names three types that matter for discrete-INT3472 designs, one
of which Linux already handles under a different name. I do not see a
clean way to turn that into a patch, so I would like to put the facts in
front of you and ask how you want them handled.

The table
---------

iactrllogic64.sys holds an array of 22 pointers to GPIO function names.
Index and name:

  0x00 Reset       0x08 Power1         0x10 Avdd
  0x01 Enable      0x09 Standby        0x11 Core
  0x02 Strobe      0x0a WriteProtect   0x12 Handshake
  0x03 Torch       0x0b PowerEn        0x13 HDMI_INT_IO
  0x04 Flash       0x0c Mclk           0x14 HDMIDetect
  0x05 LedRear     0x0d PrivateLED     0x15 Reserved
  0x06 LedFront    0x0e AF
  0x07 Power0      0x0f IO

Every type drivers/platform/x86/intel/int3472/discrete.c handles today
sits under a matching name at its own index: reset, strobe, power enable,
clock enable, privacy LED, handshake, hotplug detect. That is why I take
the index to be the _DSM type.

The same table is in two builds:

  DriverVer 08/23/2021,60.22000.0.11   shipped for the Yoga Duet 7 13ITL6
    sha256 28b0ce9cfabc2bd6b1cd11d3bfbffa792f0fab785dc52fcaf21b9f7e100982f8
  DriverVer 07/20/2023,63.22000.3.13186  shipped for the ThinkPad X1 Fold
    16 Gen 1, in Lenovo's camera package n3lce16w.exe
    sha256 fd1db239a9a48671f571080fb5d6c068c50f2196f807ef20cbe6fdbf12f40455

The Yoga driver came with the tablet.

The ThinkPad driver was downloaded from
https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-x-series-laptops/thinkpad-x1-fold-16-gen-1-type-21es-21et/downloads/driver-list/component?name=Camera%20and%20Card%20Reader&id=B7FF933A-6722-4635-9471-39DF68737A1D

How to reproduce
----------------

1. Lenovo's packages are Inno Setup installers that can be extracted on Linux:

     innoextract n3lce16w.exe
     # -> code$GetExtractPath$/x64/iactrllogic64.sys

2. The names are plain ASCII, stored one after another in this order.
   "AF" and "IO" are two characters long, so ask strings for short ones:

     strings -n 2 iactrllogic64.sys | grep -x -B13 -A8 PrivateLED

   (In the 2023 build "Reset" shows as "wZReset": two stray bytes sit
   directly in front of it.)

3. That the order is an index and not an accident of layout shows in the
   pointer array: 22 consecutive 64-bit pointers (image base 0x140000000)
   to those strings, at file offset 0x21060 in the 2021 build and 0x21c60
   in the 2023 build. The script at the end of this mail finds the array
   and prints it.

What this says about Linux
--------------------------

Read as rails, the three are:

  0x0f IO     digital I/O supply    (dovdd)
  0x10 Avdd   analog supply         (avdd)
  0x11 Core   digital core supply   (dvdd)

The Yoga Duet 7 has exactly these three behind its INT3472, next to a
reset and a privacy LED pin: 0x0f on pin 322, 0x10 on pin 321 and 0x11 on
pin 332. Linux handles 0x10 and warns about the other two, so the sensor
never gets all of its supplies.

Linux calls 0x10 DOVDD. That comes from commit 2a7b7652b1bb
("platform/x86: int3472: Handle GPIO type 0x10 (DOVDD)"), added for the
ThinkPad X1 Fold 16 Gen 1. Neither the commit nor its review says how the
meaning was established, and Intel's driver for that same machine has it
as Avdd. Leif, do you remember what it was based on, and which other GPIO
types that machine's INT3472 reports?

As far as I can tell the name has done no harm. Each such GPIO becomes a
regulator that supplies the sensor under the chosen name; sensor drivers
ask for all of their supplies and enable them together (ov5675 does a
regulator_bulk_enable() over avdd, dovdd and dvdd); and a supply that
nothing provides resolves to a dummy regulator on ACPI systems. So the
GPIO is switched at the same moment whichever of the three names it
carries. It would only matter to a driver that sequences its supplies or
does not ask for the name the GPIO was given.

Two more names look wrong against the table. Linux gives type 0x0b the
supply name avdd and type 0x12 the supply name dvdd. Intel calls them
PowerEn and Handshake, a general enable and a handshake signal, neither
of them tied to a rail; the names avdd and dvdd belong to 0x10 and 0x11.
I would treat those two as misnamed as well. They have worked for the
same reason as above.

Why I am not sending a patch
----------------------------

Giving 0x0f, 0x10 and 0x11 their proper names, while 0x0b and 0x12 keep
the ones they have, means two names end up on two types each:

  avdd   0x0b (PowerEn) and 0x10 (Avdd)
  dvdd   0x11 (Core) and 0x12 (Handshake)

A system whose INT3472 declares both members of a pair for one sensor
would ask for two regulators supplying the same name, and the second
regulator_register() fails with -EBUSY. No type shares a default name
with another in mainline today. I do not know whether such a system
exists; Intel's 2021 build handles Core and Handshake as separate steps,
so the firmware vocabulary at least allows it.

The ov5675 driver asks for avdd, dovdd and dvdd, and all three are
already the default names of 0x0b, 0x10 and 0x12. So I see no way to add
0x0f and 0x11 as general types without reusing a name, whatever is done
about 0x10.

For the Lenovo Yoga Duet 7 13ITL6 tablet the three GPIOs do power the
sensor with a local copy of the driver that maps 0x0f and 0x11 to the two
names 0x10 does not use, for this model only. The sensor is an OVTI5678,
the RGB-IR variant of the OV5675 that Sahan's Dell Latitude 7320
Detachable series is about:

  https://lore.kernel.org/linux-media/20260809042540.15849-1-adee.sahan@gmail.com/

Its sensor-side patches are on hold over the ability to describe the 4x4
RGB-IR sensor pattern, so there is no in-tree user for these types yet
either.

Windows driver logic
--------------------

Claude Code says the following about what the Windows driver does with
these types, and I have not verified it. It comes from reading a
disassembly (objdump -d -M intel iactrllogic64.sys) of the power-on
routine, which can be found through its trace string,
"discrete::DiscreteControl::SensorOn".

  2023 build (X1 Fold): switches Enable, Power0, Power1, PowerEn and
  Avdd (0x10) in that order, then handles the handshake, Reset and Mclk,
  with waits of 2 to 5 ms between steps. It does not touch 0x0e, 0x0f or
  0x11 anywhere.

  2021 build (Yoga Duet 7): switches Mclk and Reset, then Avdd (0x10),
  Core (0x11), IO (0x0f) and AF (0x0e) back to back, waits 2 ms, then
  Reset again and Handshake. The power-off routine switches the same
  four off together.

If that is right, both builds treat 0x10 as a supply and the older one
treats 0x0f and 0x11 the same way.

Question
--------

How should this proceed, given the misnamed GPIO types in Linux and the
name conflicts that would follow from attempts to fix them?

Thanks,
Alexander Patrakov

---- int3472-gpio-names.py ----
#!/usr/bin/env python3
"""Print the GPIO function name table of Intel's iactrllogic64.sys.

    int3472-gpio-names.py iactrllogic64.sys

The driver has an array of pointers to short names ("Reset", "Enable", ...).
This finds the array by looking for a pointer to "Reset" followed by a pointer
to "Enable", and prints every name with its index.
"""
import struct, sys

d = open(sys.argv[1], 'rb').read()
pe = struct.unpack_from('<I', d, 0x3c)[0]
nsec, optsize = struct.unpack_from('<H', d, pe + 6)[0],
struct.unpack_from('<H', d, pe + 20)[0]
base = struct.unpack_from('<Q', d, pe + 24 + 24)[0]            #
ImageBase of a PE32+ file
secs = [struct.unpack_from('<IIII', d, pe + 24 + optsize + 40 * i + 8)
for i in range(nsec)]

def name_at(va):
    """The string a virtual address points to, if it is a short
printable one."""
    for vsize, rva, rawsize, raw in secs:
        if base + rva <= va < base + rva + max(vsize, rawsize):
            off = raw + va - base - rva
            end = d.find(b'\0', off)
            s = d[off:end]
            return s.decode() if 1 < len(s) < 24 and all(32 <= c < 127
for c in s) else None

for off in range(0, len(d) - 16, 8):
    if name_at(struct.unpack_from('<Q', d, off)[0]) == 'Reset' and \
       name_at(struct.unpack_from('<Q', d, off + 8)[0]) == 'Enable':
        print('pointer table at file offset 0x%x' % off)
        i = 0
        while (n := name_at(struct.unpack_from('<Q', d, off + 8 *
i)[0])) is not None:
            print('  0x%02x  %s' % (i, n))
            i += 1
        break
else:
    print('no table found')
