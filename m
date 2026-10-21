Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.68.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583925;
	b=QN5gvb7oszmMGf2u6RGgjORq/9H6Z76RKxgzSH6gNfN9e6dYhWKNR2YvuqTxXK2hKUIK
	 mO+0zAoe+NEPyjN2aWGCXNc2jOJwQ4MJwyjor8+WHRjtIzRe1L8XifNUnqHMHDTpugRh7
	 ChfkMMTuY32D26K3hbhbtUZ2Wd5+J6Ql950SslAD3rbapY96wUF/ShNBLOkdrRzL5yZza
	 xs2Hr/opFAJaL0wuWamslfXnbCBWsvQ1xEWi+6btLcW2GF/v3fEomoIe7CdUJ25VHMesV
	 oBMbSuKmFa4A72cTgNyGRpEnUbePmNqTlWpv/e8Nw6yePI9oyMp2Lhzp6802JLn8Jlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583925;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UPnptaKwbNHXeavYrVrbJSkhOK2h8++9BmobpQnUARQ=;
	b=3ucYVwlQ5va1yAn1Q3GK3lGcp4mRD4VGo6mLilx8TYsh3fQSQuLkSw12OfMYGjaQ0jR3
	 +E7c62uItj+Jy20LyGRbzRKlqGuOORtpPV0WaEHKlExDCGje7FUhd+rsDHD+FEoKREmW0
	 +Yv1kfv7nGnIWYDfGETem+DBSo0QoHI/yPrG2oJ1nZg9ELCuHkoHpb1qN1n7W/8QcOqZm
	 JXKC+7UO8LxAxSP+1jc6cfvD0YcvZ7VtclL5aOg8PY2rMQKjZBVsjezdSnuxJZbkp5L/9
	 xWVyEhV7VZgIKsRCUwFql4Afi1flLGfo+dMOorNVZaISAZxsgAhvJ3otnAJRscZfbQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=tgFYUYLV;
	arc=none smtp.remote-ip=34.2.68.31
Received: from sonic.asd.mail.yahoo.com (sonic-usea4-0032.asd.mail.yahoo.com [34.2.68.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319D0606A322
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 11:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 319D0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=tgFYUYLV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792583924; bh=UPnptaKwbNHXeavYrVrbJSkhOK2h8++9BmobpQnUARQ=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=tgFYUYLVxQ0Kx7dz2Svq/zGWl4pFZAFRIsVDRSqmO+f6mdEQYmzJFPuQLvMNtQ6mNWH3e4bzDLzGznbXaWnYFSs6z03WOMIe6RS0nWZtQh3QzGHxZgX1hREs20pOmw7r1HI2SpJHbzl7mrg9vZ2RcY2HBwQsE75FtDNpCmzdGeQll+1TpT2+YtIfo5caht1wme2nD0PXnlKAAq0jNK6ZolwxGwYCmv/bkUkLNhk8AvQk259Dy3pywh/JXrt5e3aNHIQeFunckZJW5jBFTcjnm650TAVEe0ustpZFjUGEmcx5dtstlOtJD09ud/mNwYUI2ouGWdRXpimY8o2piKQDJA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792583924; bh=UIqXnXEXPp5qSg5e7rnp+fLvEe5glogDl70uncgds6t=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=q8UvlTZm2DHmfg1KUYSs0NeEGTtkBru1fZsdn4orkJctxonL55Eks4+tImUlWyRV/nhNZXlo7cXaYUxP5c8CTHhMk/rSDya3p7MpzUXvA+ME96I80ns8Ipf5TgBM7ahFUCZvpDIhKi/HAmpnl5TOAjAClivciyc9zHSowW/KXORloSgHnUeyLgFgHK0VAJOS7BiXuciQVX3A0Q3Ov8YZPxayLafdg9jN3q0Lui9Zm6WtSDHGTgAcgj3Ce2UEAxf2I+/mGRYfQB9xYj8DYeOsTjhZp8M4uZOAdZdjTNcxdqzLsj9Szhq+ermd5KN+QTDVgGFxFt3SnTheoqOUkYWwfQ==
X-YMail-OSG: TLPpIz4VM1kqI_c9Mc9SscZOXobBeqmmaJQa7iVU35lUpz_y9cV1sP_m7lRJLFY
 6PiaJnXLLoLZf5a5TQyhmoOY4OK8bcu01x2FSES_xN.Cicno8oglWvQPzyOI698ji029qJF2JQBP
 SSWyw8qNCUiT8ZDlQla.4EOXDwJmWSgLmKsyyYY1a9Bh2sobO9qxj8okGA0twfM_zXpeY0B2qCoD
 lclcn35ymsrCc13zaSahDIzsMki3WQavVpMiZoEclBd8dAbrcpecLgNu8RXwke_cZ0SEM32UX8W4
 UikLZeO.1JQRz7.52jIRPmNg9AJ1xHesbN4.iLy_DtS1lUhlY7j8BAqzXmgZVIHcL_n1gPwXmyQM
 NAa1tqSmL4CYWqZtjxtk3VTdUBl58HcXz7p3VJ.PsgUst9RRUvIcmswGbL2Mu8UTgTDLpiaEJ0jT
 gmO0GvGC1qix4w.Cabi2SNWaQIqi1TG5yjwUHoRueZJXrCXqPnx1P5o0R8cFXogEDKUdTXkTlb0N
 ZT1PSDe62a73H3K5zIwmDcv2B6kyhgR2DSOu_fUn4QWUhPJfve_U8jsA5GB7LLOakWW1COO9cEZQ
 ainwILvph2v.n25H5dfWDHhy22vw.UwGczPQAGmG4auewEbn2XS1N.Lyo5H8AkN8qbLpmviOgjF0
 8qBPZVF0DGhaJYc4NUfaeh0PwcLdqf5wZ7J.URlxLc2sj4Fmeqji.VPEyTf0si1cgvA4QKchB.PU
 Bso_UcKV4liFA4njZqWGWvxU6xZXnQX6I6TEOSGdBaTHu5ntXp1BgfgRXzQ8mdH5Jrza8MIHb05H
 M7XdakNkT_O3qg1tk6xZUgZzNrQaugpJdjGs6K4.XmSV2999u9T2h8UAd38LzumZCsOoN3ovUHkz
 Q3HbkC7dGMA3h4kn0V1OJNgy5hWTwu.uVO2mWcke_NPK3scb4TgBi8hEN8X5MUfDl3nq96Q8sqZi
 aYbb1M9ANQjc4NfhKtNMO1dqu5fI7D2noRdCbMODHwNygEqJrl9qE2c02sGQ6YFhexAwybIBQill
 tUjZ1_M66o0lslCUyZel1SgcZU2XHBIybXt8U90Kt2or6dKa8snwSjRfIsjqCzZvK26x1EQYOTuJ
 lJQ01xzgVZg.WVjatLhDbHFewRtHV5zMm4CzXLZ_F9HliSZ5O99U2jBSaOyMUs.jLeUczpJ6kOwp
 W6gymFdhY9NhexHO5IgNNIWwrI73wIM4Rc1i3Y6g8ggi4pVb1RoTqhWaneKmJCtWV3wEyiIp4Xfx
 EC8v7LLg0_DKpnUwbHCfvPPVOLnMvof8ulNi5WVq9jzvEjyfOC3NHehczZltJbxzrsuU4Li2XWMF
 G1XbYB4MknGrx8PFoL58ZqkkzaukUH3rBOPmpCw7nYq.y79Na0yjo7SxgVUfm8JUg3QyYZBVVmwH
 3Ml04Q32vs0oF4dffoeseUKa9EgM4Q551gYpPtMrWmnY3yA0tBZFZqHNmGQrtGhh8jb1rQdZYwvd
 lQ_BjIbDUvHsBQCM6ZPYfhOYmoKP1WLp_5vVlhUMzCBx8VSTLe7azJf7K5kjFjPBirdlkHQscGdA
 CtGT1mZiePIbC4usSFTTL40pSB3ezOzyP6C_VgckWPAu17TnJ7g5YGWPijkkvY1WZQfz0naicgnS
 K.8ydCSeniRc.tovB9UiMRjuB8yDspYLlZBeFAlFFm44qrT6ZtuVyFLFdjoUNVan1MFRWeuSV4OB
 s0YjxPqRrMaEK_96QLYdqqd.VEuv_HfrPQV18xPUhBai4J7WuGzcdE4FAL4tGwE5qgqQLRLP5rpM
 pb5DGuzRU8jLmqjcxBl9wxfMADdvPZewh6yiJ2xDZI7aSUvt.XQ5Cb75B.sK0MLAjaj7QVyBm2je
 b1dURwjAbNMGqYrudYBDwq_Wps8F147oInmFGo3VodFbPGvaZvFc1ZG5EUyQiyRWGI4F3Q2_uhLF
 ao6pby9Ff3DABuKLGkBpQSITgC97kzqOZFZSS9_NcyhKU4h23rO5CqqlK.XJn4Pd1lVG74jc3AmV
 Mb9kFD_74xdBw2tRbD.kOIwLG4yZc0cVGHHlTeUhkdi0-
X-Sonic-MF: <stealth3m@yahoo.com>
X-Sonic-ID: 7af3d316-2bc4-4992-bd07-5f6cd287c5a5
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea4-prod-sonicconsumer-svc-101 with HTTP; Wed, 21 Oct 2026 11:58:44 +0000
Received: from dip106.lsn.bf1.yahoo.com ([67.195.177.115])
          by hello (SMTP) with SMTP ID 335e7936c2db7179f5b6ae587ebc3b0e;
          Wed, 21 Oct 2026 11:58:41 +0000 (UTC)
From: Ext745 <stealth3m@yahoo.com>
To: linux-media@vger.kernel.org
Cc: isely@pobox.com,
	mkrufky@linuxtv.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Ext745 <stealth3m@yahoo.com>
Subject: [PATCH 4/4] media: pvrusb2: enable FM radio on the HVR-1950
Date: Wed, 21 Oct 2026 07:57:47 -0400
Message-ID: <20261021115747.1864231-5-stealth3m@yahoo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021115747.1864231-1-stealth3m@yahoo.com>
References: <20261021115747.1864231-1-stealth3m@yahoo.com>
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

The HVR-1950 (75xxx) has an FM tuner (the retail box lists FM stereo
radio, with a separate FM antenna input), but pvrusb2 never enabled it:
the 750xx and 751xx device descriptions lack flag_has_fmradio, so there
is no radio device. Their routing scheme can't simply gain it either:
its radio entry selects the line input meant for the external FM module
of the older PVR-USB2 models. On the HVR-1950 FM comes from the analog
tuner, like TV sound.

 - Set flag_has_fmradio for 750xx/751xx and give them a routing scheme
   whose radio input is the tuner (COMPOSITE7 / AUDIO8, as for TV).
 - Pass cx25840 platform data with radio_sif_5_5mhz (the TDA8295's FM
   output) through v4l2_i2c_new_subdev_board.
 - In radio mode ask the cx25840 again at the end of the tuner status
   poll, so that tuner-core's default stereo report doesn't override
   what the audio decoder can do.

The band is tuner-core's radio range, 65 to 108 MHz.

Tested on an HVR-1950 (model 75111): /dev/radio0 tunes the FM band
accurately, the signal meter works, stereo with the optional cx25840
firmware and mono without, and switching between radio, analog TV,
composite and ATSC (with tvheadend and v4l2-ctl/dvbv5-zap) works.

Assisted-by: Claude Opus 5.5
Signed-off-by: Ext745 <stealth3m@yahoo.com>
---
 .../media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c   | 26 +++++++++++++++++
 drivers/media/usb/pvrusb2/pvrusb2-devattr.c   |  8 +++--
 drivers/media/usb/pvrusb2/pvrusb2-devattr.h   |  4 +++
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c       | 29 ++++++++++++++++++-
 4 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c b/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c
index e4b31ae02..915f97792 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c
@@ -125,11 +125,37 @@ static const struct routing_scheme routing_def160xxx = {
 	.cnt = ARRAY_SIZE(routing_scheme160xxx),
 };
 
+/* HVR-1950: FM radio comes from the analog tuner, like television audio */
+static const struct routing_scheme_item routing_scheme75xxx[] = {
+	[PVR2_CVAL_INPUT_TV] = {
+		.vid = CX25840_COMPOSITE7,
+		.aud = CX25840_AUDIO8,
+	},
+	[PVR2_CVAL_INPUT_RADIO] = {
+		.vid = CX25840_COMPOSITE7,
+		.aud = CX25840_AUDIO8,
+	},
+	[PVR2_CVAL_INPUT_COMPOSITE] = {
+		.vid = CX25840_COMPOSITE3,
+		.aud = CX25840_AUDIO_SERIAL,
+	},
+	[PVR2_CVAL_INPUT_SVIDEO] = {
+		.vid = CX25840_SVIDEO1,
+		.aud = CX25840_AUDIO_SERIAL,
+	},
+};
+
+static const struct routing_scheme routing_def75xxx = {
+	.def = routing_scheme75xxx,
+	.cnt = ARRAY_SIZE(routing_scheme75xxx),
+};
+
 static const struct routing_scheme *routing_schemes[] = {
 	[PVR2_ROUTING_SCHEME_HAUPPAUGE] = &routing_def0,
 	[PVR2_ROUTING_SCHEME_GOTVIEW] = &routing_defgv,
 	[PVR2_ROUTING_SCHEME_AV400] = &routing_defav400,
 	[PVR2_ROUTING_SCHEME_HAUP160XXX] = &routing_def160xxx,
+	[PVR2_ROUTING_SCHEME_HAUP75XXX] = &routing_def75xxx,
 };
 
 void pvr2_cx25840_subdev_update(struct pvr2_hdw *hdw, struct v4l2_subdev *sd)
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-devattr.c b/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
index d1b984ec7..2e74b97ef 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-devattr.c
@@ -482,10 +482,12 @@ static const struct pvr2_device_desc pvr2_device_750xx = {
 		.flag_has_cx25840 = !0,
 		.flag_has_hauppauge_rom = !0,
 		.flag_has_analogtuner = !0,
+		.flag_has_fmradio = !0,
 		.flag_has_composite = !0,
 		.flag_has_svideo = !0,
 		.flag_fx2_16kb = !0,
-		.signal_routing_scheme = PVR2_ROUTING_SCHEME_HAUPPAUGE,
+		.flag_radio_sif_5_5mhz = !0,
+		.signal_routing_scheme = PVR2_ROUTING_SCHEME_HAUP75XXX,
 		.digital_control_scheme = PVR2_DIGITAL_SCHEME_HAUPPAUGE,
 		.default_std_mask = V4L2_STD_NTSC_M,
 		.led_scheme = PVR2_LED_SCHEME_HAUPPAUGE,
@@ -505,10 +507,12 @@ static const struct pvr2_device_desc pvr2_device_751xx = {
 		.flag_has_cx25840 = !0,
 		.flag_has_hauppauge_rom = !0,
 		.flag_has_analogtuner = !0,
+		.flag_has_fmradio = !0,
 		.flag_has_composite = !0,
 		.flag_has_svideo = !0,
 		.flag_fx2_16kb = !0,
-		.signal_routing_scheme = PVR2_ROUTING_SCHEME_HAUPPAUGE,
+		.flag_radio_sif_5_5mhz = !0,
+		.signal_routing_scheme = PVR2_ROUTING_SCHEME_HAUP75XXX,
 		.digital_control_scheme = PVR2_DIGITAL_SCHEME_HAUPPAUGE,
 		.default_std_mask = V4L2_STD_NTSC_M,
 		.led_scheme = PVR2_LED_SCHEME_HAUPPAUGE,
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-devattr.h b/drivers/media/usb/pvrusb2/pvrusb2-devattr.h
index 3c88f05d8..2a6483956 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-devattr.h
+++ b/drivers/media/usb/pvrusb2/pvrusb2-devattr.h
@@ -57,6 +57,7 @@ struct pvr2_string_table {
 #define PVR2_ROUTING_SCHEME_ONAIR 2
 #define PVR2_ROUTING_SCHEME_AV400 3
 #define PVR2_ROUTING_SCHEME_HAUP160XXX 4
+#define PVR2_ROUTING_SCHEME_HAUP75XXX 5
 
 #define PVR2_DIGITAL_SCHEME_NONE 0
 #define PVR2_DIGITAL_SCHEME_HAUPPAUGE 1
@@ -165,6 +166,9 @@ struct pvr2_device_desc {
 	unsigned int flag_has_svideo:1;        /* Has s-video input */
 	unsigned int flag_fx2_16kb:1;          /* 16KB FX2 firmware OK here */
 
+	/* FM radio reaches the cx2584x as a 5.5 MHz sound IF (TDA8295) */
+	unsigned int flag_radio_sif_5_5mhz:1;
+
 	/* If this driver is considered experimental, i.e. not all aspects
 	   are working correctly and/or it is untested, mark that fact
 	   with this flag. */
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index c749ef7e4..fc41a2fea 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -12,6 +12,7 @@
 #include <linux/videodev2.h>
 #include <media/v4l2-common.h>
 #include <media/tuner.h>
+#include <media/drv-intf/cx25840.h>
 #include "pvrusb2.h"
 #include "pvrusb2-std.h"
 #include "pvrusb2-util.h"
@@ -2015,7 +2016,23 @@ static int pvr2_hdw_load_subdev(struct pvr2_hdw *hdw,
 		return -EINVAL;
 	}
 
-	if (i2ccnt == 1) {
+	if (i2ccnt == 1 && mid == PVR2_CLIENT_ID_CX25840) {
+		struct cx25840_platform_data pdata = {
+			.radio_sif_5_5mhz =
+				hdw->hdw_desc->flag_radio_sif_5_5mhz,
+		};
+		struct i2c_board_info info = {
+			.addr = i2caddr[0],
+			.platform_data = &pdata,
+		};
+
+		pvr2_trace(PVR2_TRACE_INIT,
+			   "Module ID %u: Setting up with specified i2c address 0x%x",
+			   mid, i2caddr[0]);
+		strscpy(info.type, fname, sizeof(info.type));
+		sd = v4l2_i2c_new_subdev_board(&hdw->v4l2_dev, &hdw->i2c_adap,
+					       &info, NULL);
+	} else if (i2ccnt == 1) {
 		pvr2_trace(PVR2_TRACE_INIT,
 			   "Module ID %u: Setting up with specified i2c address 0x%x",
 			   mid, i2caddr[0]);
@@ -5057,6 +5074,16 @@ void pvr2_hdw_status_poll(struct pvr2_hdw *hdw)
 	   now.  (Of course, no sub-drivers seem to implement it either.
 	   But now it's a chicken and egg problem...) */
 	v4l2_device_call_all(&hdw->v4l2_dev, 0, tuner, g_tuner, vtp);
+	if (vtp->type == V4L2_TUNER_RADIO &&
+	    hdw->hdw_desc->flag_radio_sif_5_5mhz) {
+		/*
+		 * Whether this FM path is stereo depends on the cx2584x
+		 * audio firmware: ask it again last, so tuner-core's
+		 * default doesn't decide.
+		 */
+		v4l2_device_call_all(&hdw->v4l2_dev, PVR2_CLIENT_ID_CX25840,
+				     tuner, g_tuner, vtp);
+	}
 	pvr2_trace(PVR2_TRACE_CHIPS, "subdev status poll type=%u strength=%u audio=0x%x cap=0x%x low=%u hi=%u",
 		   vtp->type,
 		   vtp->signal, vtp->rxsubchans, vtp->capability,
-- 
2.53.0

