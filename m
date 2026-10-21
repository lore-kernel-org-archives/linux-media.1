Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.68.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583907;
	b=YeDMY3WnDOuHDCN/kMXgCe4J5lFD81EATbl7UuvSN4S5l0zIOz/JEasu9W6Agrusugyz
	 ZSULslp4hhf5ZjdAbe0u61mzg+7C7B1tEdpLsSbmGQHrXM8kkaaTo0SjbHXsp33vOO3h3
	 R3ZCxauMcKfZVEr/0GlzQ9Q402Tk5uGsBZDWK1AKtCv7r4XSquNRReINcp1/cXdJEvdQG
	 9DnnIqVr0ObXWe5f9Frkltb2DjgvVcuLrch9S2yIeFCNF+GADQnBf2mKDdncy/BvWFnFS
	 u2KhtC+d4MrURR6mXxSQCXOdHo4XEsif9mfmzmodi37V/nrPn/qjChI8anRj5sbDzwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583907;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:References;
	bh=ePHU+PPOj4D/7LZY+rsS90WYffYLhog2RDdOchcTuz8=;
	b=0bHHFK/enX+OY/vUYKoBFzDUPW7k4R/zCDz2kZjSO5Q76j+2huXeRk9FZA5BXPJJ7ipR
	 +ju7DZPtlTPXSiIYW2mlGyUEWSTMrYE5O1xTLemunnVLfzxdv2yN9IWIZCut68dWthb5L
	 5F78h+UbWOHos0tlq/wOXacUP6tgySmKxDh24v76zOxBmZ6UuZ+v2iGPL4ko3JvU7Yn2l
	 PLcoA1uYsS+ItTs/Gz2kpVpV0kt7Y3pIMGkcu54DGcXMn3UM6qXCj/PeNQX0TzU/QDXtw
	 qbLmfFaVXiHL2yYxNTRAF6pkJyFDPQPH0UfPPgM+fCBtRSK804FO24dae2oithVeSYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=IDGxEtEz;
	arc=none smtp.remote-ip=34.2.68.31
Received: from sonic.asd.mail.yahoo.com (sonic-usea4-0032.asd.mail.yahoo.com [34.2.68.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650FF606A31B
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 11:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 650FF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=IDGxEtEz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792583905; bh=ePHU+PPOj4D/7LZY+rsS90WYffYLhog2RDdOchcTuz8=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=IDGxEtEzfvgr84IGQrpzg+pQR7etmLt21xVJOhrCWF6jAh0LBZJe+SVN0bNvFh6E1uRLyXkaw8+4b0ZKvk4ELb7SFg1sYFfkJiMPimR/ksGbKqfEG8J1G0I3jLyA3O2fF3BXZEefJUoxTQhqNIFeFqDVoHE9zYvQ/xBr8NSoiG30Ato5UVexFZ/oZIBYpVLqY0Ba5UCIQNgDzG0ZlfG2b9y3b5Gd78eVuu2hRL6tWjseAXyaGi5aiBj01KUvQbFy/UptkYw/FsSCr+iIzozK1bac2w0yx2siH6/VOH3tOc9eqOu0ZvFy+PjK+CgCXi1N+t7nLC40CUy6eYcklCHKMQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792583905; bh=ozlZb6LQqKbGZizzgOPccTTQa/y7KjPI671bLt61UJB=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=MdGuKTuKsMUBXVyEDZF6NyHFpR30v0wNvm4aHmeo5Cgao/A9oCDWQBha+jPvfqvtTxcD+pi0kwQeT3OhBscfcI29vq+LgTgr71lCzLHuJlwD68sBgB7cq/Moq8GRz/1cEjszZxq5ipknXYZDgXEcSVs75HDTvMV07Hgit0aBRPwoDCMEhdC0yfQptCrqmYFdCvDe+qmXl7r73bJTYKcqDx8KOsTfoz8fWHmm3b+bZvAyB0HmMTGrfr2JMJ6OKUKmxbgZ63/IdTnImmrYKePI1jo4/Pl3jsANxaLav7DdqPOlsJJogy1ecToa+MjARetyhsKBMG366+2wA7RTmzFv7g==
X-YMail-OSG: 92.s4D0VM1kbDrILHYYaXFfCVEMNOp4cwOjsCmvoviSyVgsYf0ZI0ww4wwsp6Af
 mYcIRwTTPQiC3WpZAWVi0llVAmYFp3A1S1vgHp2H3bD46y.K0UK0rDbeGzMzGHE_e3GEcoGomxU4
 TdTHg9SlKCIOvppaG82abDJ3p.0RIIG6cwRm0BmM.jxaHW5rugz8UPJffeHrWybq5.BK2Bf4N9p5
 GU.5zJ8C98EQN5rJRDqfhEsBbSxrYoHgcNN_Mzg89J2MpaexGRdGaVj8hqWXi7R2PoXVwwtdWoqk
 CVyEO.Wy8ws.WLwwMQ1acFq8nnkE8Gh6qSsbE0LJoNn5fYf81cWeODI0aifxrrYnaJGq6vU0CsKu
 ItiOLOskYO1m_oXJrA5qtiE7AXmIosmaJA1j4EiKvu8DHR_tlfQfbET0RlnxcWNzPkcjcCFMFHLt
 .ljTo3HkMqbBq7toD65L.pFOjolprtsGXkML3LlRGpuSR6I3tpUY3gNL8ij_SclCKgTbZPh_tIV0
 I63qHqqWXQiKf_U1kyurRr_CAGvq7wcAsDFlF_bDBRGqKaTPsNkx5I9Vg0_IRu1nNWVzfqbgsSA6
 az2PGYYpNzTZim9BjhaY7v5Y7QPli9wplt2_H4W8TfoAIbs9CvWL4wA0u14i9sNAl7YCHF5V_BFn
 scbmVCWbkD1vs7wWXJr8KEaWcg3.mSu4Uz6V1clKuZb6.gkYr1d_Z5ZmG5hGSI56veNjnCSc6WAi
 7MIU4SO2UybfaPu.1EaEZ6OKy5wrLo8PBx6fP7omjZoHA_7k.wLf7hD_xPvLUQ51kXsF5pjmjAH9
 0BXQIkgOnFvqiFEdoR09Z2o7Dbf0eOUf56ZDL5Mah2dJhiNZ9b0jyeTyja1a0oKPU87OR6BHOyyg
 XIACeTJllwqRaTYpr1.sBnaNhCWxMlgwMBgyBlDFz46meBi3.MS5t6fNrV9OqtZHE9JFDyTv2xF6
 fra2dXWJtLpL5wPDnFQU13bwsh9OyKfVrGt3H29BAXOUN7QEc.WG.Rpy._arG.gA9OgCWWZb7o9b
 FpGXsFUcC.xY120plETROTrgAfD7OsgjteApz60fc3UfFxnDLjxK2l8OcnWIx3FDk0YrLz.Z3Yim
 7Zd_tnCqEdKJGQao4uh0vYQtdjAeGeSfqItrQfOjG9Cc.3y79CtZUxGbflHew3D7_YtSWBwn0p0Y
 97uKkMahFxp89yOcWU1iPxGXcQMiAVH.ZnrYb1_DmdrkGiofqn0RbE4CMpnM.shb0v5IUHVkbI80
 V1lZ07ba352m1GgXR9_oiZ_Cvr6hjGheRbqY2ctP4dAQDBBfNSnVgUCZoFMoZc1l.FJaMagpnwd_
 nRDxS3lZkF4kZYlFcwP0lMD2yzTqGVP0OSzioCBSDfwEJEz3U.LpugjL2.7VXv_Yrf52W.b_TcZx
 hcl6Kkt7.IvVPRJYhDqMzffVIxhqB5HIvyn2xcAx_AaLGgYPG732H8a5ZoHpFlBN394xxn3jydSY
 oLTE3h0TZnuQ.5oUtavOQNuVmXVTCsZk7_BFY7Q85NB4wl1lpPiUfFnAIfJ4rPlzV3eiLueVxLtD
 E2nUeDQj_F6O9dee64hX4zZSoI0j.AUFz0GApFUrJ6NN_p.2_aCNWSFwXFbNnZJLePuAA1RYHznT
 hmI0PW1r4MLjI3ltxzumjfpm5qXjVgC3fSOlpfuWjTmqmSNIdwRYCAf7Y2VKr3u.Ui4U76b6nzNP
 4SdgU8B0yu15Vx5CAJPDaQguT4Db6zgTbqzqpQLeN3H37hmI2wISDBN9uSmkxI8PpWnX6qxR5Fft
 ZMAscblrxXYnccSarKteDHrmTB0jYh8lEx_gStY8jlmh3_Y6pX41MUSoWom1iRYx5XUeEBafc7FG
 NcKffkpJj7xWeBgA.h2A3PfSAAiaYl2UeJicRcTXWuTQHULh67kyWRTGLA_QT8i3zZoZZAi2OFqT
 QFlj26b6T870kaXq8nUPNGmFi3lgrUtumNI89BmpBIuWGLRN8khSMP.eIncwY_dd3mrNe5TKeRzk
 7I8WVT1N8hnyskZKbcZhHbyUtOCG7J63j59880w--
X-Sonic-MF: <stealth3m@yahoo.com>
X-Sonic-ID: 0dab2a4e-dca0-435a-bc33-47d3eb66483c
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea4-prod-sonicconsumer-svc-102 with HTTP; Wed, 21 Oct 2026 11:58:25 +0000
Received: from dip106.lsn.bf1.yahoo.com ([67.195.177.115])
          by hello (SMTP) with SMTP ID 335e7936c2db7179f5b6ae587ebc3b0e;
          Wed, 21 Oct 2026 11:58:23 +0000 (UTC)
From: Ext745 <stealth3m@yahoo.com>
To: linux-media@vger.kernel.org
Cc: isely@pobox.com,
	mkrufky@linuxtv.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Ext745 <stealth3m@yahoo.com>
Subject: [PATCH 0/4] media: FM radio for the Hauppauge WinTV-HVR-1950
Date: Wed, 21 Oct 2026 07:57:43 -0400
Message-ID: <20261021115747.1864231-1-stealth3m@yahoo.com>
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
References: <20261021115747.1864231-1-stealth3m.ref@yahoo.com>

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

Two separate patches don't depend on this series: one fixes
"s5h1411_writereg: writereg error ... -5" when an analog open follows
closing the DVB frontend on this card, the other fixes pvrusb2 control
enumeration with V4L2_CTRL_FLAG_NEXT_COMPOUND (v4l2-ctl -l lists only the
user class controls today).

Two more patches that report the fixed FM de-emphasis (75 us with the
stereo firmware, 50 us without) through V4L2_CID_TUNE_DEEMPHASIS are
tested and ready; I'll send them as a follow-up once this series is
settled.

Ext745 (4):
  media: cx25840: demodulate FM radio from a 5.5 MHz sound IF
  media: cx25840: FM stereo with an optional HVR-1950 audio firmware
  media: tda8290: report FM signal strength on the TDA8295
  media: pvrusb2: enable FM radio on the HVR-1950

 drivers/media/i2c/cx25840/cx25840-core.c      | 145 +++++++++++++-----
 drivers/media/i2c/cx25840/cx25840-core.h      |   6 +
 drivers/media/i2c/cx25840/cx25840-firmware.c  |  26 +++-
 drivers/media/tuners/tda8290.c                |  14 ++
 .../media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c   |  26 ++++
 drivers/media/usb/pvrusb2/pvrusb2-devattr.c   |   8 +-
 drivers/media/usb/pvrusb2/pvrusb2-devattr.h   |   4 +
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c       |  29 +++-
 include/media/drv-intf/cx25840.h              |   8 +-
 9 files changed, 215 insertions(+), 51 deletions(-)

-- 
2.53.0

