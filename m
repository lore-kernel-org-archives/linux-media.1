Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.68.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792711574;
	b=tizDiFAyRx8mnRzvjDMR9W9tRauHSCqi0wF5Yx0FqVNbmjQmY7UGQaRrpiQm04jGPTnm
	 z40Z4SaKYRjlRhkrxpQ1JXuyrd3OwhPndW7I0ynJtN7w3xbq4N2RWtI7BG0+5ZdoK+TTQ
	 o4zUhDUa2QAx5hxt0I38eUwBlJjQvyBcwVgNSPe6RanjPRosip0tX58GaLjkEaKbQ1XdJ
	 83olGvkFfhSkSKhuPN8wOFLYIyWcfG89KdplWn4A9jYqDnPCD/I2u09Es+QVWyG2KvVn2
	 9BgAMOK1JfnKb3W+5M8IWRTeO5p4QzK6zAs3bz+UkhggGg/BLVH/OFEIExGbbH3bPSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792711574;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:References;
	bh=qK1E2uG1zvFHCK8gs5UtlxlKszUMbPuj+AhidZUOLqQ=;
	b=vhIOro+4lc4vOXXNI4/4e5y9i9QeiPRJct/Esp0J3y53a+s/XWAjdQBNlDufkgzIgiEy
	 lvEvlWxJaPXGr1hTRRaY8vkwoOoMCNZteIKhoECw72bm62/7HDuErOkej7nJXBimD4J+C
	 zaQUv5PPyeZwQnrChYZLk7qzogSic0fwXfAkxusDL9ZB9fqEK2vDnh3sHZB96Hc9sKrwj
	 w52xyLWmY2W2n1p28PRCDjsIIFb1S/wtbpFQvVR1AB43qmwJ5kaW1NHF6jEncfJd9F8Rc
	 PTesCK9faZyEoIpOa5euO06IE/vNX1DDQqul6koGsQtPEtRHJnq7Sg5YKd4B5OWXzQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=aLSYDHnn;
	arc=none smtp.remote-ip=34.2.68.31
Received: from sonic.asd.mail.yahoo.com (sonic-usea4-0032.asd.mail.yahoo.com [34.2.68.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5472606A31A
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 23:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5472606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=aLSYDHnn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792711573; bh=qK1E2uG1zvFHCK8gs5UtlxlKszUMbPuj+AhidZUOLqQ=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=aLSYDHnnkQSV9yWWCjUMNfezC0uUlWOj0FvsAalhpcu7hNsMwmcNlSFyZhjo/9ZN6kwLNaSm6CAM5OXWkAkzjlk9dgOo0YwlZ0DEL9TbIdyFF5uIING4BIlzaSPCQmLLhte+MsCQSwwzJbo+nuT2zhV9NQBUB2UdnmpANK5vOjPjwJ8aZwwZCinFCnX4rlLQI7oI/7MKJdVL7bKuqBejV+15c2jpC+hTyDxqxadwstrl4gCqeSlYD900WTS+6ve9APO/1Xtx6EpOZUZt/pucT7JFkvg0TAO7agsULXrNzCnoRvM/vfhHi1s+kIaZXt0LcmZ6jQDab5nrPLDwPkawYw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792711573; bh=eC5SVKbvbqF5TI6imnffh9JunH2sc5+niDsrYRKDQPy=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Lyr5SPZvsK5OWWc28dk1dJSTZeFoB4n9dyiBguZkfwvYClw0Bhnf7YvBUwUGLfJFdEBT+70PZq3gGiMpBpOQwwGuoDXjO4ZPKGLWqXji8rZiEhggAiD35sXDqsWNKjF5/2eekaZe79tRltfrJtISjfk/cCafHO/NTC7EMj/OnDJi4tyxAGIn2T/6iabu6Y1dY7gCTcaY45UeslF266Q/mBKwgZSN00HcBMt0UAyuGV+zQbLFRgn2MrXwmzFk3bGmOEECFGahyM5C1Bint8u4Ig0tpS+T92IxHlaXeemIzBoB94EglQljx0yr+ohBV6JT4PkvTJw+GCHJFJ0CfjiHkQ==
X-YMail-OSG: oLeDcRMVM1kWMguzlW.zhVoNYSUyq1ULzowW9Gz8tY95uuCiilje_Nzjq4CmW2H
 CrKo_1rbx5z7LQ.33605UQzphRTiKtlz6qE7taTJqzupvOVXhEoM4854cZSHqFCY9B6ab3VyU93I
 ylLDIdDpThCD4xvk8lXJ5CCr7Td1CDw4wEGLgARpdWftNlIVmTnxPd5fIo1Mwhs3a6zHK4jFZqua
 tGyfq13nS__wA41pbmzKimQ1mJWE7q8NOhgDL200f9KTrEFV67Z6kyGEszCcxORQ3J2TDRdjBnJ9
 sOsQ38IYQK86uXEJo0imSeU01WYZoHKJdECNKk2E66YGmED0bn32GeyiyIjmPCYqLwUyx8VeGiXn
 .2_tYETyEdLnEmby9KtxausG574LAwcO49YBRXHT2y7GcmxHr753NZNglhmzWtXGe10H4XF_At6s
 r24pOKKJJ7HOH_kgnFgV0PtnWuj0w9Axc0g4IYbIcmKdJLWuF9U.tZLwvYSriXoM0zHyP02RNcYy
 RvkRTKdMsdsKqb18tdkVxlk_nIda18BZdW7THMVlloAT0.XPqWJiyPJkJYErrDEAwkMf4aJdnxOE
 ASYCk8Rl1XeCddm71MpWYdhuDfYrfauAWjPQzw5n6T9_9KM1aUqK3hmFDfEnqHpjF.5J3eFuzeEE
 TfCJAh3P9El6dXBfwD.RTRDrjME1Vj.XJ9yyRQvoNELpDO.l0Nn7uGq.aSTbgJ.VlTKfsulInnjv
 yp2DCilXaTXOssT9BDUUlrHLr5x8ZgArQXvwFNJg2CEGtqbSL7QWX8KT7TT_dC9qOUhRd.1X.jcm
 A5ix03meTThh0LeVH0FSB4OWP.paC71yMhJloMIsnrnbXmZxKPXGh6YDMeazYPLbyEeA5sBguv5R
 g6SlnqubowNq8ZL8dqfkC9STI7_Bw2W8ndl9YTC_1bxs1VfUUGj5FE3dSZI7lGyNfG9zKItpzo9Z
 so2qTHQqOmV7CiSlcePeRRpPYqnl7lDwYllYOXCHiPHDWf2JtCuLoLBv8pFg90lMUb.tvRbKe2La
 jMsH7Y7_8wmJvEQnsH_BKjms46ssmdBl2clEBnSDtUcbVF3hd_rZBEKK3oYGf6I4VW_amaHwexoh
 9JpoXoTu7glBblB8c82YWUJVOI_mArE7SY2cjr8OTRJ56hYh3JlOUFcXBTV7HToLxCplPooJZ2SU
 SFQPoluLfZ02IjuBxBnVMob33kJinydmi1Z.6PdJHyZrsejKYY0IjkVQFrVTwBxgbfD32AmCqhMU
 psSM6c2gdPdbK.n90aLJ7UWap63EL1IQr5AhfJxyRtgp_Lrfs.aMnV8lCtxNhc0nTzrqWXxEu8Wg
 IcQksHPZaicZGQ7jSSLas49MfwziuHTfuQpedLw4U4gYd2ZDnXb5Z4_gd_kGuR4sDvgmpAgM.G0T
 RlvE0wCyFWGEv4UtOBCtu.V1da71AsmYJLsZ8kRdiBJ3lGJ63Qf_.IXuZ0OqQJUSEmuljNvabrVk
 nJMyPaWg0Mhy5dQgxSCOWea_hFbaFu3IOq50vrGFhtZJ89Ga0ukZvH6a4cZKLgR8H_2VboinlHwE
 oyfkyN.OMNhiCEymHXtQdQZY3GU1HVK2LJ8.yInGJ1X9mEe0tRKOSKd6myOrYDL0R8LcZ7jXCdMG
 IwmOtR4gJ3P2UAK5BrfUIHDyt3J.bhXXvxDpH_t.ILAQ33Un7iPDPrpBGFIWKy2.kECiYtLfPBBQ
 7BkSoSyQIHnHkJjesKpqVlwEM9HpQBsNxo8Uj7tOXd.x07uWh7XO5tqm8wsl201UVwhOJJ6tbodi
 4AnrafFH6A0lU_x_SlO9shgrNXvm8uRGHSlsG8EV8BozPQMvvSLbRdwMEutm2jtgKVfQC4Q5SpQy
 1nzTUIGqPWcYObts6pgN2plRtXvW.dsVvXoa5S.Otw.GWLuCDm.BN.5HTjeyTbBrLDJYVbh9.b98
 ahKg1f0PpDPAvvzKeX_Evx6QsbUUCQv45CB2CRxkwWNBikMtU238pYuHAFC2mko2m0a4sOsGBk5g
 gVfo2k3HHoMPFN0hzpJ2PFmcoug3QFU_EE7VzFO0pIKR9uGwUorneTPHFRgQ-
X-Sonic-MF: <stealth3m@yahoo.com>
X-Sonic-ID: c14406db-3ba8-4d7f-bf31-cba6246b7c0c
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea4-prod-sonicconsumer-svc-102 with HTTP; Thu, 22 Oct 2026 23:26:13 +0000
Received: from dip117.lsn.bf1.yahoo.com ([67.195.177.126])
          by hello (SMTP) with SMTP ID 81a0382c6781dfa1b88c965d2a3d9a7d;
          Thu, 22 Oct 2026 23:26:11 +0000 (UTC)
From: Ext745 <stealth3m@yahoo.com>
To: linux-media@vger.kernel.org
Cc: isely@pobox.com,
	mkrufky@linuxtv.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Ext745 <stealth3m@yahoo.com>
Subject: [PATCH v2 0/4] media: FM radio for the Hauppauge WinTV-HVR-1950
Date: Thu, 22 Oct 2026 19:25:44 -0400
Message-ID: <20261022232548.526232-1-stealth3m@yahoo.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20261022232548.526232-1-stealth3m.ref@yahoo.com>

The HVR-1950 (pvrusb2, 75xxx) has an FM tuner, but Linux has never
offered radio on it ("no FM support on HVR-1950 ... requires some
enhancements to the cx25840 chip-level driver and possibly also the
pvrusb2 driver", pvrusb2 web page). This series adds it.

The cause: in FM mode the TDA8295 hands FM radio to the cx25843 as a
5.5 MHz sound IF, and the cx25840 radio setting (0x808 = 0xf9) never
locks onto that with the audio firmware in linux-firmware.

 1/4 cx25840: on boards that say so (new platform data flag), demodulate
     radio as forced 5.5 MHz FM: mono, 50 us de-emphasis, works with the
     existing firmware.
 2/4 cx25840: FM stereo when Hauppauge's HVR-1950 audio firmware is
     installed as v4l-cx25840-fmstereo.fw (optional, loaded with
     firmware_request_nowarn). Radio then uses the Windows driver's
     setting, 0x808 = 0xfa (audio system 0xa, not in the data sheet),
     reports stereo and switches mono/stereo through the tuner audio
     mode; de-emphasis is 75 us. Without the file nothing changes from 1/4.
 3/4 tda8290: FM signal strength from the TDA8295 IF AGC (the H-PLL lock
     bit used today is always off in FM mode).
 4/4 pvrusb2: radio input, routing and cx25840 platform data for the
     750xx/751xx models.

About the firmware: the image is Driver73/Hcw73MlC.rom (16382 bytes,
sha256 a6505aee99fa71768daece0a7ced1ac1f60bf7f8d823707640778fe0a4fd0a81)
from Hauppauge's WinTV packages. It is the same file on the original
2007 driver CD and in the current WinTV v7, v8.5 and v10 installers
from hauppauge.com. It is not redistributable as far as I know, so it
can't go into linux-firmware, and the series doesn't depend on it. A
user can extract it from the WinTV installer; I have a small script that
does that and checks the hash, and can send it (e.g. for
Documentation/admin-guide/media) if that is wanted. The 0xfa setting
was found by looking at the register writes of Hauppauge's Windows
driver for this board (hcw73bda.sys).

Testing, on an HVR-1950 model 75111 (kernel 7.0 with these changes
backported; this series is compile-tested on media/next, every patch):
 - radio across the FM band; signal meter 30-84 % on local stations,
   0-26 % where the band is empty, but it stays high between closely
   spaced stations too (IF AGC over the whole passband, see 3/4)
 - the low end of the 65-108 MHz range, where I have no stations: an RF
   modulator's channel 4 sound carrier (71.75 MHz FM) on the FM input
   quiets the audio by about 55 dB against the empty channels around it
 - with the firmware file: stereo on 20 of 20 starts on two stations,
   live mono/stereo switching; without it: mono, as in 1/4
 - de-emphasis measured on the hiss of an empty channel: 50 us (1/4),
   75 us (2/4), both within 0.5 dB of the model curves
 - switching between radio, analog TV (BTSC), composite and ATSC, with
   v4l2-ctl, dvbv5-zap and tvheadend
 - v4l2-compliance 1.32: no new failures. The video node gives the same
   result as the stock driver (48 tests, 11 failed, identical fail and
   warning lines); the radio node (new on this card) fails 7, all in
   pvrusb2-v4l2.c, which this series doesn't touch: the radio node
   advertising read() I/O (how pvrusb2 streams radio), an empty tuner
   name, VIDIOC_S_EXT_CTRLS error_idx, and the control enumeration fixed
   by the separate patch below
 - unplugging the card during an FM capture: the reader gets -EIO, the
   driver tears down cleanly, no warnings
 - radio and video open at the same time: whichever node streams first
   keeps streaming without a gap, and read() on the other gets -EBUSY.
   Opening the radio node while TV is streaming still switches the
   input to radio (pvr2_channel_limit_inputs() in pvrusb2-v4l2.c, not
   changed here; the card just had no radio node before), and the input
   stays on radio after the radio node is closed
 - rmmod pvrusb2 while /dev/radio0 is streaming: refused ("in use"), the
   capture carries on, and the module unloads once it is closed
 - a 72 h soak with the firmware file and another 72 h without it.
   Every hour: 30 min of ATSC (dvbv5-zap), then FM on two stations
   (stereo, and once forced mono), analog TV and composite. Both runs
   finished 72 of 72 cycles with no failed step: the ATSC lock was
   never lost (314 GB in each run), every radio capture had audio
   (with the file, 133 of 144 stereo captures had separated channels;
   the rest were near-mono programme material) and every TV capture
   had video. The card never re-enumerated and there were no oopses.
   The only kernel warning was the existing cx2341x "encoder appears
   to be stuck" message, about 3 per cycle. The stock driver prints it
   too, and it recovered every time with no failed firmware reload
   (the soaks ran on v1; the v2 changes are covered by the run below)
 - v2, with the firmware file: a 4 h soak in 15 min cycles (5 min of
   ATSC, then FM on two stations, stereo and once forced mono, analog
   TV and composite). 16 of 16 cycles with no failed step: the ATSC
   lock was never lost, every radio capture had audio (26 of 32 stereo
   captures had separated channels, the rest near-mono programme
   material; the 16 forced-mono captures had L = R) and every TV
   capture had video. The encoder "stuck" warning came about 3 times per
   cycle, as on v1, and recovered every time with no failed firmware
   reload; no oopses. The pvrusb2 module in this run was a local test
   build with an extra encoder power-cycle recovery path (for a card
   problem I hit between the v1 and v2 runs, also with v1); that path
   never triggered

Not covered: the 73xxx models (HVR-1900, same chips as far as I know)
are left as they are because I can't test them. 4/4 enables radio on
both 750xx and 751xx, but only a 751xx was tested; the 750xx has the same
tuner, IF demodulator and cx25843 (only its ATSC demodulator differs,
s5h1409), so it gets the same routing. The other cx25840 users (ivtv,
cx23885, cx231xx) are untested on hardware: 2/4 moves the tuner
audio-mode switch into a helper, and everything new is gated by the
new platform data flag, so their code paths are unchanged by
inspection. Suspend/resume with the radio running wasn't tested.

Not supported: RDS and hardware seek. The cx25843 has an RDS
demodulator, but its registers only give raw I/Q, polled over I2C,
and the audio reaches the host through the cx2341x encoder at 48 kHz,
which loses the 57 kHz RDS subcarrier, so the radio node doesn't
advertise RDS. The data sheet also lists an RDS output that can be
routed to the audio path; I haven't tried that yet. For seek, the
TDA8295's AFC reads 0 on every station in FM mode and the signal meter
(3/4) is too broad to stop on one. A read-only sweep of the band did
turn up two cx25843 registers in the reserved 0x81c-0x9c8 range (0x9b8
and 0x94f) that dip over about 0.3 MHz around each of the 18 local
stations and recover between closely spaced ones, with and without
the firmware file. Seek could be built on those, but as they are
undocumented I'd rather leave that for a follow-up.

How this was made: I used an AI coding assistant (Claude Opus 5.5) to
analyse the problem, look at the Windows driver's register writes, run
and evaluate the experiments on my card, and write the code and the
changelogs. I reviewed the changes, ran the hardware tests and am
responsible for the result; each patch carries an Assisted-by tag.

Two separate patches don't depend on this series: one (now at v2,
https://lore.kernel.org/r/20261022231728.517427-1-stealth3m@yahoo.com)
fixes "s5h1411_writereg: writereg error ... -5" when an analog open follows
closing the DVB frontend on this card, the other fixes pvrusb2 control
enumeration with V4L2_CTRL_FLAG_NEXT_COMPOUND (v4l2-ctl -l lists only the
user class controls today).

Two more patches that report the fixed FM de-emphasis (75 us with the
stereo firmware, 50 us without) through V4L2_CID_TUNE_DEEMPHASIS are
tested and ready; I'll send them as a follow-up once this series is
settled.

Changes in v2 (all from the Sashiko review of v1; no functional change
intended on the tested paths):
- 2/4 cx25840: radio keeps its own audio mode (radio_audmode, mono or
  stereo) instead of overwriting the TV audmode, so a VIDIOC_S_TUNER on
  the radio node no longer changes what TV restores in 0x809 or what
  TV's G_TUNER reports; radio audmode values other than mono are taken
  as stereo instead of being stored unchecked.
- 2/4 cx25840: set fm_stereo only after check_fw_load() succeeds, so a
  failed firmware download doesn't leave the stereo setting (0x808 =
  0xfa) in use without the stereo firmware.
- 3/4 tda8290: return -EREMOTEIO when the IF AGC read fails instead of
  computing the signal strength from an uninitialised byte.
- 4/4 pvrusb2: keep the cx25840 platform data in struct pvr2_hdw (like
  ir_init_data) instead of on the stack: the I2C core keeps the
  platform_data pointer, and cx25840_probe() reads it again if the
  driver is rebound.
- 1/4: unchanged.

Link to v1: https://lore.kernel.org/r/20261021115747.1864231-1-stealth3m@yahoo.com

Ext745 (4):
  media: cx25840: demodulate FM radio from a 5.5 MHz sound IF
  media: cx25840: FM stereo with an optional HVR-1950 audio firmware
  media: tda8290: report FM signal strength on the TDA8295
  media: pvrusb2: enable FM radio on the HVR-1950

 drivers/media/i2c/cx25840/cx25840-core.c      | 152 +++++++++++++-----
 drivers/media/i2c/cx25840/cx25840-core.h      |   9 ++
 drivers/media/i2c/cx25840/cx25840-firmware.c  |  30 +++-
 drivers/media/tuners/tda8290.c                |  15 ++
 .../media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c   |  26 +++
 drivers/media/usb/pvrusb2/pvrusb2-devattr.c   |   8 +-
 drivers/media/usb/pvrusb2/pvrusb2-devattr.h   |   4 +
 .../media/usb/pvrusb2/pvrusb2-hdw-internal.h  |   2 +
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c       |  27 +++-
 include/media/drv-intf/cx25840.h              |   8 +-
 10 files changed, 230 insertions(+), 51 deletions(-)

-- 
2.53.0

