Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF3A3F6C59
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631941; cv=none; b=kUhMXUwI35r9nOSQUOBV4JJfCpGtFBsO0N4pRsYChct664Sx28ww+V3UMIeBkU42TpFJqRs0aEZ9+QIqC8/KkeL96AJWBIAwHy/+PpUOerV24bFH/PkVfTJxVDgK+GLYwUbX7woldZsR4K46VI2ReUahq7ZCrc5oMMbBbjvCz38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631941; c=relaxed/simple;
	bh=Pe5ZR+cX4bBtNH/5+Dju6/5H0vNbcA4Mj/jWbiwdy9k=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=FlWHm7S2m63ERQmLuxy4ev/SDGc1f5YMuYRTqlg5po5M0BBx7bBCWYumMOozoNbXizq6bMZQ0vOl0XBnVCwqBH2OoWXKV633TNs7yCKT8qb1GQI7591gcL0MgqzRg/ac7IFZZkcSkgJRfkqd8ehLWj2lqgIhW/UXYYx85yr3oes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=j-l-p@gmx.de header.b=Pz/rUsYW; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=j-l-p@gmx.de header.b="Pz/rUsYW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791631937; x=1792236737; i=j-l-p@gmx.de;
	bh=ZSALvJs16Bu7CGhfSogWC3BmsP+vjuTLsK+uBJtUxTY=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Pz/rUsYW5ySgWrOp0+1iDjCesmxqtUmAM+WhWV5FEfd8qb8CtYsmG6j6ZF7UAmyF
	 EOxXPMzwkJ6CVRVeBNb79Pb/oPwdso3TrFwSKhMFQIMDtuRGvqnB7GkyZvQqKIhol
	 CeOfskLm5cuSeM/fwX/o2J4dBzBrKgp3aEwXhv5nyqDNIKJojYQhTl+TmFIQzMn4V
	 uo9LFv5tSNs4OHkQjVjHXCAjwHFfRAyiOrXShg2dZObXEKPjDFtRGj/Fcprgbe+KL
	 ee52LjiTkKQuJ4Pe7uMGnNoRyD/RUgtvoXDw0wqoNNewHYdr23LbT09PWnfui7JEz
	 93Dxe5bdkwo9cPtE2Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mgeo8-1wjm4C3qG4-00fEE1 for
 <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 13:32:16 +0200
Message-ID: <8b020d3b140ec3ac5036ee85ebf45f9796275d1e.camel@gmx.de>
Subject: [BUG] media: dvb-frontends: mxl5xx: UBSAN negative shift during
 initialization
From: Gero Graubner <j-l-p@gmx.de>
To: linux-media@vger.kernel.org
Date: Sat, 10 Oct 2026 13:32:00 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.0 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:lPwPZZ9C4QtDRG80ehM/t4oJ8lknIU0NhAZbE2g2yqlU7pYtMU0
 RFro7LfLlRoGexkWnZB6FhCeyb3M5OSRuPuMFooXx7zJJdJ9fdzGUJUT6UuwUMJ2NDyJO09
 FpoY5vfCpBBzE3TR0K5hVtC6P3F13T6wu90A1NAUQkHtkF/sFzkn6QaKn394rXhQyGOs8Xk
 lBAZtlNOQJQ3ZumTczMvw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zpOXA8Ylp1Q=;ud80/OduHeA9anF7cvAs2ec2fDh
 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
 VbUanGd3QcbevUDhUv36S0FWmx5xpfXcDyZ2Xo=

Hello Linux Media maintainers,

I would like to report a reproducible UBSAN warning during
initialization of the in-tree mxl5xx driver on a Digital Devices Max8
DVB card.

Environment:
------------
- Distribution: Fedora 44, x86_64
- Kernel: 7.2.8-200.fc44.x86_64
- Driver modules: ddbridge, mxl5xx
- Hardware: Digital Devices Max8 DVB card
- The warning has occurred across multiple kernel versions.

Observed warning:
-----------------
The kernel log contains:

UBSAN: shift-out-of-bounds in drivers/media/dvb-frontends/mxl5xx.c
shift exponent -48 is negative
...
update_by_mnemonic [mxl5xx]
config_ts.constprop.0 [mxl5xx]
probe.cold [mxl5xx]
mxl5xx_attach [mxl5xx]
ddb_fe_attach_mxl5xx [ddbridge]


The same initialization reports:

chipVer=3D00000002
Hydra FW alive. Hail!


The DVB adapters subsequently register successfully, so the warning
does not prevent driver initialization in this setup.

Suspected cause:
----------------
In the upstream mxl5xx.c, the xpt_nco_clock_rate table contains these
entries:
---
static const struct MXL_REG_FIELD_T
xpt_nco_clock_rate[MXL_HYDRA_DEMOD_MAX] =3D {
        {0x90700044, 16, 80}, {0x90700044, 16, 81},
        {0x90700044, 16, 82}, {0x90700044, 16, 83},
        {0x90700044, 16, 84}, {0x90700044, 16, 85},
        {0x90700044, 16, 86}, {0x90700044, 16, 87}
};
---

The mask macro in mxl5xx_defs.h is:

---
#define MXL_GET_REG_MASK_32(lsb_loc, num_of_bits) \
        ((0xFFFFFFFF >> (32 - (num_of_bits))) << (lsb_loc))
---

For num_of_bits =3D 80, the expression 32 - num_of_bits becomes -48,
matching the UBSAN warning.

The table is used when chipversion >=3D 2, which matches the reported
chip version.

Comparison with the Digital Devices driver:
-------------------------------------------

The public Digital Devices dddvb implementation defines the
corresponding fields symbolically as XPT_NCO_COUNT_MIN0 through
XPT_NCO_COUNT_MIN7.

Its register definitions specify 8-bit fields at the following
locations:

- Demodulator 0: register 0x90700044, bit offset 16, width 8
- Demodulators 1=E2=80=934: register 0x90700238, bit offsets 0, 8, 16 and 2=
4,
width 8
- Demodulators 5=E2=80=937: register 0x9070023C, bit offsets 0, 8 and 16, w=
idth
8

Sources:

- In-tree Linux driver:
https://codebrowser.dev/linux/linux/drivers/media/dvb-frontends/mxl5xx.c.ht=
ml
- In-tree register definitions:
https://codebrowser.dev/linux/linux/drivers/media/dvb-frontends/mxl5xx_defs=
.h.html
- Digital Devices driver: https://github.com/DigitalDevices/dddvb

This comparison strongly suggests that the in-tree table may contain
incorrect register addresses and field widths.

Request:
--------
Could the register definitions and their intended behavior for Hydra
chip version 2 be verified against the vendor implementation?

If confirmed, correcting the table should eliminate the negative-shift
warning. I have not yet verified a proposed fix on the affected
hardware, so I am reporting the evidence and suspected cause rather
than claiming that a patch is tested.

I can provide the complete kernel log and additional hardware details
if useful.

Actual kernel log from the affected system:

---
Oct 10 08:44:23 XBMC.fritz.box kernel: i2c i2c-8: Hydra FW alive. Hail!
Oct 10 08:44:23 XBMC.fritz.box kernel: i2c i2c-8: chipID=3D00000001
Oct 10 08:44:23 XBMC.fritz.box kernel: i2c i2c-8: chipVer=3D00000002
Oct 10 08:44:23 XBMC.fritz.box kernel: i2c i2c-8: FWVer=3D0202010a
Oct 10 08:44:23 XBMC.fritz.box kernel: ------------[ cut here ]--------
----
Oct 10 08:44:23 XBMC.fritz.box kernel: UBSAN: shift-out-of-bounds in
drivers/media/dvb-frontends/mxl5xx.c:313:9
Oct 10 08:44:23 XBMC.fritz.box kernel: shift exponent -48 is negative
Oct 10 08:44:23 XBMC.fritz.box kernel: CPU: 3 UID: 0 PID: 550 Comm:
(udev-worker) Not tainted 7.2.8-200.fc44.x86_64 #1 PREEMPT(lazy)
Oct 10 08:44:23 XBMC.fritz.box kernel: update_by_mnemonic+0x6e/0x100
[mxl5xx]
Oct 10 08:44:23 XBMC.fritz.box kernel: config_ts.constprop.0+0xc5/0x770
[mxl5xx]
Oct 10 08:44:23 XBMC.fritz.box kernel: probe.cold+0x265/0xa09 [mxl5xx]
Oct 10 08:44:23 XBMC.fritz.box kernel: mxl5xx_attach+0x2e6/0x350
[mxl5xx]
Oct 10 08:44:23 XBMC.fritz.box kernel: ddb_fe_attach_mxl5xx+0x107/0x440
[ddbridge]
...
Oct 10 08:44:23 XBMC.fritz.box kernel: DVB: registering adapter 0
frontend 0 (MaxLinear MxL5xx DVB-S/S2 tuner-demodulator)...
...
Oct 10 08:44:23 XBMC.fritz.box kernel: DVB: registering adapter 7
frontend 0 (MaxLinear MxL5xx DVB-S/S2 tuner-demodulator)...
---

The warning occurs during driver initialization, but all eight DVB
frontends register afterwards.

Regards
Gero
