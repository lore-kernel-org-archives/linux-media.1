Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.68.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792711581;
	b=S9UpXcHfRO+M3JzFFS1VP75mdx6EV4a1rDK/cOhNaLffAYbxlD2TqxKY0Ue54eUVJxdm
	 A1I6DUAzoqYaLFR4g5Y6hO/b4sVfY0aruaHuSw3Eu/F+pBKRNdM6jWRGwWa0EFxLhKzbN
	 xk68A4MbGlGgWZvepM3OkC922e2IVw3J0BK2dNfVnp/eYukh1DmThCcB2eBZWiokTUdAe
	 l610PWEWmivtrZqrrl8KzRrW1t8BT9mxxZIuarw3Wg/M1ELBX/upjkRKiJ7gYRvjKw7QM
	 uFik95osuF6d3f0yl0upxXLcg74otVzDL7XyeKWRgravDAI1EuWu22lSQHk0SqRo9Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792711581;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=10wBCLh0h4aBkMykJnogs9fUr91WfFKu8qvhoZEMY+I=;
	b=o6JGqZZ9uUjum6W4EyC8F/5jYUraOIWecTMO2YMFvkKDllOnLPg+MxSerAhthMqzn8gS
	 3Gfx2ZZSrbP+iFPjgvI8y8XvhFLHgkA5pKSX5Xblwf9mVeUIXXY1EB83gkGvCDZscqW6x
	 nZh/LXx4VaRvTRSLz4GlWO5Ne348R+fiR58NImDgU1gcsiMS+F3XQTcKm9UZEdgd3Vp3f
	 kOcJbtlLY5IN1cyyhJSC+GLjq3DOOZoJuw56YjYmHRgzE+fOrF0mmQbeCZuJdbU9R5k2E
	 OjsaInD+8q3rkHbJ0tX/raD+myngG72fSD3tD5AW9n3oDUI+sxyu9Qsj6KUQE8Fx+9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b="a6ReHho/";
	arc=none smtp.remote-ip=34.2.68.31
Received: from sonic.asd.mail.yahoo.com (sonic-usea4-0032.asd.mail.yahoo.com [34.2.68.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C31606A319
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 23:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50C31606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=a6ReHho/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792711580; bh=10wBCLh0h4aBkMykJnogs9fUr91WfFKu8qvhoZEMY+I=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=a6ReHho/F5fMtb9W5iFQ4Ag0Q6Xg/pHXyC8pQd7f03cwrUxZYhNKPwMbhLNoKYRK2bZFWr5wVaklfhyeAeXxTV7MIE3FFg8rBTnTqYaQXs8XTTQi+nm07P5I9TrJUT3Dw9O03b5rox7T3/GXLc3LRubCejDOVWx7DFOL70TG0GmKZBRqW9tiE1euZMaCpB1Y6x3itoYf65eZgHlC1YNxEK6iR/97WKcmadKn/Hwm/8gSXz1ouZzg46Ullvb3mUgy1jEhAK2KRYz7emEUFrW4LbkjAB+JQCl4UfVNdjbN691WvUqaQ2IM70iJHse8SllTDYYzhS5cX7AVrt3dSh5glw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792711580; bh=7CUgt8w0d6NzPdwfVPMmRjQ50LN6Qe0V/Im5U4Y5KA1=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=hOyUmkgX1adCidPbGxkhhE9qQ+9WS1Lun/NkmZN4Nm0OW2a4teS3KBFZTMjtrpNDKQs4+xYYtw751Vd5PJnjlJA/gf0g3JAs17tTItMcrZq2/fOlPqxEE5AfLDRP7i52uuLkkaUgImZBZCCEUnmqBQ9tLACJDa8NzHnJTQAw9V3WYuHsGjKbxc1SzIXIQBcHhWnEANHFBy2tWc04XvfJwfgOoZiOQ2//gGov1PakqBOlkDofTXWRghqNl8VMarEKjAK2pJj6YbFTLouiucRoxA4W1i5p6NArMIVZ2yccYRXhM722V1r547pQldhXMNMsJN7G+52qqMQcukKpKmW4Jw==
X-YMail-OSG: UOnQAesVM1nPuqBWueVn4PJ4l2jNoH7Cj_E56Fd50vX5r4VUfIRP781mlj30eum
 2dEzDBil44i1FDvX7ZKpNdCx6Lu6zEBTQVJVY.zo30uaq4ZsdJxceQg4MiKUdjF8G.7hPNgK8Y8w
 t3w.LXo8hr7VvWTKUYW_18CXDLIkJ7HixqlAr94GxJEIvP1BPQxIh7nIB_QHBpqKHyZTN6Y1sj_w
 CT92HdKJCZnxdGGlnx9Ch2Bm5ZG5ZrSieN2gHG2UCSrL1jU8WAurYSYYgyjPsP7s132NCw2QeNUu
 u1ycoKz2o.YsSxyuxhgzi7Xq7DuIQuzW9Zl5Dkq1e0FFHyQg8vJI3ebqPOndp5twdOErsi3NVCsB
 ERxXAiaJrXKeFG1jYAykvIfX..zdJWI6Htjs.qNxdmdijNP1zIeGLCdbyGVYvT5mdML8lR5.R75C
 rNv44ou7Gk_yanfcTumI_whUCiv4if4bL3.vIzE9lEf2PAOxysPX4o7MJv.kLdLs75.gc84CYSgh
 fzbTZP3CA08TcB3tg7wjVv9ZcW57bIxYz5SD_sRTr7xNYry9giSEAdqDfzb6.Za6I0hFHMo3IrAL
 9KKp6jg5fojSsAdiPyp99PCb2mWJPyfW8Rz07JS56DDNn3kNoswDquFLIAFOprB5TGvISoDWHuRj
 P6tUYr4Ty5IFK01ciSZIpEanmLfDtw4pMt7Nue1TSpbB_qZi0t9q05rTH0g7doAqxlJkFbZzhoAc
 15vrQWbnGIU6a7.LzrRnbTmPmpZC247esem4EY7HfVJG.lPsbMclXpUjR6skx2nidfb6zx2Fi9Bk
 mZKZA6A_xvud7imLBTeA2EQdGomeu_Zn65LDjsT05sIH3vWL3hc6wA7zAH0yuyUol9emUphRv22Q
 fFnQQ2DRdDjXbKrI0cqZCuWi_..SLknfNEomZHJMFvyJmCgKXiNRabe3rvSN0DKMfobGdkb530Ux
 RBQbBCkulWTG1PyLL8HTWCTAbpeCKXTQUm3HqSdJ0_UhevipVj5POtM9tds8aeCSFfuNS3KtuURg
 lGvRiiLE8k9IOLWLak8mVWIVOQkWiCPwHbG_FJ4b4qpSzvKtH9_VpUBfPTyzrvKHb_NmrSOXlRpp
 XVg1RLdxL1WbwqbUSYbal80r5pFFpMJI.Jd19BI3oiEPxGcMW1QMFPYuvzYclM.vVltIC2AH9QeS
 ANDs1sood7dLDf0mGX86cxKm.B4su1BJkm0afJp1QHI.hn3b6qWm_dvvSMaOC5IY8LDTwxed.xur
 tTECoTdHv9AjjV.c3RgbMqNIxIQJDgDIZcsn5GEzCmv.y1nmBOjo7DUDf59uv2gEZxNxn8k.PuAG
 0m89kYOp29K0oTjwhVN9YodQLqbp390QY2DltQLLyWfcMs1SYTj7y6GxL56vTpnvYJYVn6hbML4E
 jY7dyn.xoFEeKuTTuYOhot1RLC.oRZvdElm1ZiHfYgXT9kuOIP_ci6qaxjp8I7jisAzfPD5yKQQ4
 LNQjg3P6FJxBImbIeJMTeFdNMTz8x2Mtmvb1KwRovgoRfZoCQPnfTgdB_5j2AhyEWMC6fhe7LVM6
 MCiXO43MUOoYnfOiYvs5tSPZEbirJ9pI0_prREu0xtZnPwrr453WKVBO.ZQKl6UNvbsjC4gfDHcO
 4.O0rLiSIcsd3qKSFzFhr546PC3WX7boCe2UrwgESxIubs2Uy8pjhTVxt52vTbuPRLB.BrwNLAVh
 njnN3zjP_wofv7arkIQrSOJH_MkcrCQN7h8xlsA8hhUKfoBWuUFbUR5_HD4GSZg2Egmhlgdi0tFq
 s08nsXZzLfjJofE_uFrdBIywoAbb2ct0May9n4suTrSUtA7xYLTCRoDrs2xUazNlXeYoIBV4a.g1
 nK567e1sMkDLm9M30MC6lsOP6uA2aIuLLnR4ww5MgqZfL7_OKSrPmFU8OP4YcPWiKGa_367uFR5K
 gG63bvvF6RwPtHfP2umm3BhDMAAC9TApEXK5GFVoR8hEKYbCWLnbtj5l8ClZlPmA7eexpIePrckB
 cfg1N07mI7B2zVEhgcJd2Ce4x5ijVLa4Ut.hO.gGUVw--
X-Sonic-MF: <stealth3m@yahoo.com>
X-Sonic-ID: 2839505b-c2fc-47f3-8531-7fa28123fdf2
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea4-prod-sonicconsumer-svc-104 with HTTP; Thu, 22 Oct 2026 23:26:20 +0000
Received: from dip117.lsn.bf1.yahoo.com ([67.195.177.126])
          by hello (SMTP) with SMTP ID 81a0382c6781dfa1b88c965d2a3d9a7d;
          Thu, 22 Oct 2026 23:26:15 +0000 (UTC)
From: Ext745 <stealth3m@yahoo.com>
To: linux-media@vger.kernel.org
Cc: isely@pobox.com,
	mkrufky@linuxtv.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Ext745 <stealth3m@yahoo.com>
Subject: [PATCH v2 4/4] media: pvrusb2: enable FM radio on the HVR-1950
Date: Thu, 22 Oct 2026 19:25:48 -0400
Message-ID: <20261022232548.526232-5-stealth3m@yahoo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022232548.526232-1-stealth3m@yahoo.com>
References: <20261022232548.526232-1-stealth3m@yahoo.com>
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
v2:
- keep the cx25840 platform data in struct pvr2_hdw instead of on the
  stack (the I2C core keeps the pointer)

 .../media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c   | 26 ++++++++++++++++++
 drivers/media/usb/pvrusb2/pvrusb2-devattr.c   |  8 ++++--
 drivers/media/usb/pvrusb2/pvrusb2-devattr.h   |  4 +++
 .../media/usb/pvrusb2/pvrusb2-hdw-internal.h  |  2 ++
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c       | 27 ++++++++++++++++++-
 5 files changed, 64 insertions(+), 3 deletions(-)

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
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw-internal.h b/drivers/media/usb/pvrusb2/pvrusb2-hdw-internal.h
index 7c998ca61..8230dfb9a 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw-internal.h
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw-internal.h
@@ -26,6 +26,7 @@
 #include "pvrusb2-io.h"
 #include <media/v4l2-device.h>
 #include <media/drv-intf/cx2341x.h>
+#include <media/drv-intf/cx25840.h>
 #include <media/i2c/ir-kbd-i2c.h>
 #include "pvrusb2-devattr.h"
 
@@ -189,6 +190,7 @@ struct pvr2_hdw {
 	/* IR related */
 	unsigned int ir_scheme_active; /* IR scheme as seen from the outside */
 	struct IR_i2c_init_data ir_init_data; /* params passed to IR modules */
+	struct cx25840_platform_data cx25840_pdata; /* passed to cx25840 */
 
 	/* Frequency table */
 	unsigned int freqTable[FREQTABLE_SIZE];
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index c749ef7e4..32e7b4b76 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -2015,7 +2015,22 @@ static int pvr2_hdw_load_subdev(struct pvr2_hdw *hdw,
 		return -EINVAL;
 	}
 
-	if (i2ccnt == 1) {
+	if (i2ccnt == 1 && mid == PVR2_CLIENT_ID_CX25840) {
+		/* in hdw: the I2C core keeps the platform_data pointer */
+		struct i2c_board_info info = {
+			.addr = i2caddr[0],
+			.platform_data = &hdw->cx25840_pdata,
+		};
+
+		hdw->cx25840_pdata.radio_sif_5_5mhz =
+			hdw->hdw_desc->flag_radio_sif_5_5mhz;
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
@@ -5057,6 +5072,16 @@ void pvr2_hdw_status_poll(struct pvr2_hdw *hdw)
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

