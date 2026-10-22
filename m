Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.68.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792711577;
	b=lhkdLXGRQAOp6OL08qS//gai7BJ4BJixIkC9vlTnl4rn10QSJQCsTEMa+PmvG0rSeMo7
	 /7t2BjLArNDwkL00Cl4JTfCjpJID4a683rK//O2TXtSscejPnQPby8QOoP3e9unLZ4KeB
	 jgZmBi7Ko/UEnbeKVCbwT2SIy9P3xp0XmjSRAuAW15X0v89mrqqHXkBYxXuQgQlX1Uf5h
	 ffPMi6eNRVNbKJorZ2313bN2hzFfUn74rEs9zZNeuxdv44sTtqtM95X4cIWWmrr28aXxs
	 m1UiBLbY6+qhqtrxB8FVCvLUimpOM/mT5M7twd5sExJxMTS50GlZlH6TwcICCNKjDhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792711577;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=08NOxNNKzQ/YxaUnwFuXIjrJuBN/u/xsJzrQJk0k0dM=;
	b=4xlI1Ro8OhAuV99EKu3/L3JBPGI0cHJfocP1V2ZtWO3CKojUOIzQ5YTdQWM3WnjXyV2s
	 U6chqXLEirXpQIb+GPXb7ejWDitmCbGFSljHX+PzaPF1mxJ5M2zHkLhwIT32wKrAq7r7Y
	 Pfq+y/XiZ2X2IbRU4i+zUPmQWwmC2oCVZ6g4kNHGJEhdmHWZT4CPPNR8n2NAO2WGWNBvV
	 RqBjpuLccM/R+LGbezetzlxTqja9BS33OR1VPVggZRfWDC+lyEQTGd22L/8p6BvPgw9UQ
	 rq7C9RnqmyR+6fnvpwihxEjWYWYuqFc3/lEGmA3kf7iHM8KhUlG9ga3QI7/Wbl7gZ/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=n8f9FQmr;
	arc=none smtp.remote-ip=34.2.68.31
Received: from sonic.asd.mail.yahoo.com (sonic-usea4-0032.asd.mail.yahoo.com [34.2.68.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E063606A326
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 23:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E063606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=n8f9FQmr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792711575; bh=08NOxNNKzQ/YxaUnwFuXIjrJuBN/u/xsJzrQJk0k0dM=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=n8f9FQmryN9s1etIYNHkur4R/Wm5KOqIDi0dJs7cy4pdoiom2eMOg7y1gp3DmQWAP+sFNpKm0AC8o1Q+zfRc8eaR/n+yuXP4HXOxpFRxaEJfgApRq5ZkvXcGe0jn5wZF+7Tc0MT0vXENtt+LK5fgNq5ryhOlhKwEXAKrbjQqkPncmbbxH0eBpLcA5Q93cHHKx40H+QN1WKhe/iZlNbLq6WD7yWg3wm9AevO7es/lB7cd6Giv5dteHvv9YK3Fa+UIbX/a83PwG/AJK9ZuYtwsTnCo7KS/e9zNsCpxHug6Bxt0VEK48a5MDPojFFpvmHEO9fCHv+G6ZxeH7R4A+GLIng==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792711575; bh=5vpaD8Wwu8z25k1rMTesUMutLjmLC5zmgXaJ+gYGiKJ=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=NyMIndh7aERYmXwzZlouo4D5Eykbs1+IvKzDpLPV2crxVzRqKxJ6DQnwdT9H/xPy5bMkT7BJPbGv6CS95Qk9dvFfH9aeZMF2eRDu80E/W74D/qFgC397da/vDXC2fY/Eu7QWGpdQ0YOtEnCSUlO8ItEC7nzkZJLvWaBLBouAPOhGnwChgXCHTKzUE8M7u8uCLsHCHtZDmVVebp5wmstHV4+Dk6SE8GMcl+hOIT8A1JmbaZsSxNChGNgHiU2UYqBnFd44dgy0RNQQE4ogb9nqeOGPe6LVYaITFH0uoYrq4e0wLtFmv1otWesMBQPOua5oCcbxVOnogHpPPomT9O6mMA==
X-YMail-OSG: NlueGsMVM1mdOtWTmt_DzDv3gMssdZ1_ztXjjHedmgskAksy9n4Sn0aeCJb2h0C
 BvOhSqZfl7zDHv9hWYkFY.5YxYChoDlUsbjsIy9GLMtjgZ32b7kgBGGU_bsR5cW1WmHBa7NdXqJt
 nDUvEsGt7wVZKZLXZvo1K6BkRKZ8dSSBOOnF61H4uiRJ3.n8bh2PRYoRUuANsOb1h52_rBUF8RLB
 .IkyM18x2ucC_qiTPVjTdSs0akda3LzCCOUR5XSYBjD1DkEywK4Uji.M6q624dz3QNqFHZm8UOaE
 Mi_53zQSzlVZcz1lCbIGOI_8.nuW.2rGyqkqGEvlmgG6JYeV8H_waOwl27amgHAiYIFArRDPwEVJ
 QyjYf8OVVdW8G4ejYhnYC.4s0d9EVq3hm8E7s_ykiDkU5x6lITW_MtaLwJpvqJK.4hA.kKi.MmD6
 bOv1U.Y1QRjKIaWNJ1koprHmlWw0CWGzQcOayFaetScrpInbey77scpnHjTf5j0GMFv17od.sOUM
 NPdUdBwEU3wrMEyKscIk8lyj2QNj5_EWeyRDslacUbEYpvg3p3a1jMD.vjwJVBBMhFbyS2ZJxToD
 .k5BCVTSnsTUSi9X5sfC1tKtbfPXZSvuCwprFGBs.5P72mwnzLIMKvGd5wfxosMBhfH0yrczUlzQ
 xyhICmbYqySuTjpFyX.7DeBcpw9WFPJMmXxFCQHF2DqioW33tnfszAYVKjcNbBIcqZHdAs1QlcqQ
 jS7SnI_5_CnWd1GBNNrMX2KcDSrkpAYNVqqY.9Y.6qdeH1e.NYAPTKkCNNu9a8fJtbZagvnvSz8v
 mlthpSXfiqRCTDia3d0LFwiWH0oMtBh.YY6g01QhvxiDqRHJsQ4D04g6Mk3faUDRAMSQb422R5.3
 2MKEZtI5VYRTE0A2JNQNXQ4LD6lKPd9g4MgzOPRaZ__LaFkIKpg941rcAU2EixaUVDDgnsV6.dwk
 AJOpE.0RtOdDVBHdvFMZohKjeAwDWng.vgS0j6fsEubwX1NYhUMTPGCp06IU1oiB8Mx_Y.q0IdtD
 gTXi6IDHjObij5VlAz1q7X4AXJBPVMM69kT5vNztosrrpbcKu6j1wUfK6yqdsFxUsDhKdzm8iiVJ
 P5FBzsRmYX45z0ljob3F05UkjZmib59iyp_ZNIr7MvxL_qMu1xwtBNaa2.ulwkXOcMeXPwuw6B69
 ev2oJwH98eWOy8pWTyV6PtiHidV28MeD6brHjxscaMYqQGw2qnAUfXL8moatGFchXHFun.jqeXHH
 IxodK2mAXcZaTJxgyD9c4DoMq51tTk9JhuG6.G3KSr5Fybl0JzkfL.nWXFtbYwRlUZkAzvYeStRh
 zyvBa6MTjyGctCXBecnhLLu.Mv3nUQtOJ2XWfX3upnpxGAofBtWC5hamPm2z2HjdVc39c.LSDHNl
 eBcqeN0rJj3q8vJ9LBBKjVQjNO25d01od8lSypHr3FCtGk70mWhH4e3ycXMR7G.UQeMzVi4cU2tj
 5ZNY33kT5qA1wolJDrF5Q_9JR5lzrP7g5zO88wsLjh6p7ts6wWuaN30Wsxox2H0U83NZCZQVHoqQ
 Q1g9Uj5RXXAM9UsfbP97oHRpTuz4HziQN1c_nGLuGbzjjyD5Oc6M9Kxesrch4reg.ZOYfZEpWwMm
 t.U3CYJzNJ9qJEX5WkLV0rKUQTgXo_CWr0cR186QES2.f._bWUqlrVCraSS7EX5q59F2R_TFgYX8
 OAqCo.gX3RGRj9dI41I5OzCk5iWNv5Qr7vLf2WJyfPsApz9HS2aM77.ApIQO_rQxlA4I2cCMzDke
 PSlXHJs1WSTTzqps4ltVDQZ0RZpDXJChFJmAKjTMArSUsmG4jA.L.S0i0IZc_JFJ0361jGCORasw
 2V_D1nN69__AMcTGscMaI0Gu60MzMSKhOy4n6ruc8L4xgXWwx0BWuyFPPpm30nGyfnzZ42hM_Wqr
 WqDiy7WbGGMWOink1aEmWfIs71FFNcfIqu_K7B_5upSLPdIEuclH6ihw_dTaNp8oRpsC_1JAIizJ
 5EgGg.A63Zt4_nAlVygkWH7nUWb9Hp0N_ribc.2FaKso-
X-Sonic-MF: <stealth3m@yahoo.com>
X-Sonic-ID: 235014e5-8b6b-4a15-8ba5-4196adc6e40f
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea4-prod-sonicconsumer-svc-104 with HTTP; Thu, 22 Oct 2026 23:26:15 +0000
Received: from dip117.lsn.bf1.yahoo.com ([67.195.177.126])
          by hello (SMTP) with SMTP ID 81a0382c6781dfa1b88c965d2a3d9a7d;
          Thu, 22 Oct 2026 23:26:13 +0000 (UTC)
From: Ext745 <stealth3m@yahoo.com>
To: linux-media@vger.kernel.org
Cc: isely@pobox.com,
	mkrufky@linuxtv.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Ext745 <stealth3m@yahoo.com>
Subject: [PATCH v2 2/4] media: cx25840: FM stereo with an optional HVR-1950 audio firmware
Date: Thu, 22 Oct 2026 19:25:46 -0400
Message-ID: <20261022232548.526232-3-stealth3m@yahoo.com>
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

The HVR-1950's Windows driver loads its own cx25843 audio firmware
(Hcw73MlC.rom) and puts the audio core in radio mode with 0x808 = 0xfa:
automatic standard detection, audio system 0xa, which the CX25840/1/2/3
data sheet doesn't document. With that firmware, 0xfa finds FM radio on
the 5.5 MHz sound IF (0x805 = 0x0e), detects the stereo pilot
(0x804 = 0x01) and decodes stereo; the firmware sets the dematrix
(0x8ce) to FM stereo itself. The linux-firmware image (v4l-cx25840.fw)
detects nothing with either 0xfa or 0xf9, and 0xf9 with the HVR-1950
firmware detects FM but stays mono.

That image can't go into linux-firmware, so make it optional: on
radio_sif_5_5mhz boards try v4l-cx25840-fmstereo.fw first, without a
warning when it is missing, and use v4l-cx25840.fw and the mono path
otherwise. With it:

 - radio sets 0x808 = 0xfa. The audio soft reset is not pulsed again
   afterwards: a second restart of the audio core left the stereo
   decoder hissy in 23 of 24 tries, and in none without it.
 - g_tuner reports stereo capability and, from 0x804, whether a stereo
   pilot is received.
 - s_tuner maps the audio mode to the preferred mode in 0x809: mono
   gives mono (useful on weak stations), anything else stereo. Both
   take effect immediately. Radio keeps its own mono/stereo setting,
   so TV's audio mode is restored when leaving radio (both share
   0x809).

De-emphasis is fixed at 75 us in this mode (measured within 0.5 dB; the
0x809 DE_EMPHASIS_TIME bit has no effect), as used in the Americas.

The preferred-mode switch moves out of s_tuner into a helper so that
input_change can use it too.

Tested on an HVR-1950: stereo on every start (20 of 20) on two local
stations, mono/stereo switching, BTSC TV after radio, and switching
between radio, analog TV, composite and ATSC. Without the file radio
stays mono as before.

Assisted-by: Claude Opus 5.5
Signed-off-by: Ext745 <stealth3m@yahoo.com>
---
v2:
- keep a separate radio_audmode so S_TUNER on the radio node doesn't
  overwrite the TV audmode; radio modes other than mono map to stereo
- set fm_stereo only once check_fw_load() succeeds

 drivers/media/i2c/cx25840/cx25840-core.c     | 145 +++++++++++++------
 drivers/media/i2c/cx25840/cx25840-core.h     |   8 +-
 drivers/media/i2c/cx25840/cx25840-firmware.c |  30 +++-
 include/media/drv-intf/cx25840.h             |   6 +-
 4 files changed, 133 insertions(+), 56 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index a7b4cae01..5ceef7428 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -1280,6 +1280,56 @@ void cx25840_std_setup(struct i2c_client *client)
 
 /* ----------------------------------------------------------------------- */
 
+/* Program the audio decoder's preferred mode (0x809 [3:0]) for audmode */
+static int set_pref_mode(struct i2c_client *client, u32 audmode, bool radio)
+{
+	if (radio) {
+		/* FM radio is mono or stereo; anything but mono means stereo */
+		cx25840_and_or(client, 0x809, ~0xf,
+			       audmode == V4L2_TUNER_MODE_MONO ? 0x00 : 0x04);
+		return 0;
+	}
+
+	switch (audmode) {
+	case V4L2_TUNER_MODE_MONO:
+		/*
+		 * mono      -> mono
+		 * stereo    -> mono
+		 * bilingual -> lang1
+		 */
+		cx25840_and_or(client, 0x809, ~0xf, 0x00);
+		break;
+	case V4L2_TUNER_MODE_STEREO:
+	case V4L2_TUNER_MODE_LANG1:
+		/*
+		 * mono      -> mono
+		 * stereo    -> stereo
+		 * bilingual -> lang1
+		 */
+		cx25840_and_or(client, 0x809, ~0xf, 0x04);
+		break;
+	case V4L2_TUNER_MODE_LANG1_LANG2:
+		/*
+		 * mono      -> mono
+		 * stereo    -> stereo
+		 * bilingual -> lang1/lang2
+		 */
+		cx25840_and_or(client, 0x809, ~0xf, 0x07);
+		break;
+	case V4L2_TUNER_MODE_LANG2:
+		/*
+		 * mono      -> mono
+		 * stereo    -> stereo
+		 * bilingual -> lang2
+		 */
+		cx25840_and_or(client, 0x809, ~0xf, 0x01);
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static void input_change(struct i2c_client *client)
 {
 	struct cx25840_state *state = to_state(i2c_get_clientdata(client));
@@ -1302,11 +1352,23 @@ static void input_change(struct i2c_client *client)
 
 	cx25840_and_or(client, 0x810, ~0x01, 1);
 
-	if (state->radio && state->radio_sif_5_5mhz) {
+	if (state->radio && state->radio_sif_5_5mhz && state->fm_stereo) {
+		/*
+		 * The FM stereo firmware's automatic FM radio system (0xA)
+		 * locks onto the 5.5 MHz sound IF and decodes the stereo
+		 * pilot, with fixed 75 us de-emphasis.  0x809 picks mono or
+		 * stereo.  Don't pulse the soft reset again after this: a
+		 * second restart of the audio core often leaves the stereo
+		 * decoder hissy.
+		 */
+		cx25840_write(client, 0x808, 0xfa);
+		cx25840_write(client, 0x80b, 0x00);
+		set_pref_mode(client, state->radio_audmode, true);
+	} else if (state->radio && state->radio_sif_5_5mhz) {
 		/*
-		 * Forced 5.5 MHz FM (A2-BG standard), MONO1, which applies
-		 * 50 us de-emphasis.  The 4.5 MHz A2-M path (75 us) clips
-		 * broadcast FM deviation.
+		 * Standard firmware: forced 5.5 MHz FM (A2-BG standard),
+		 * MONO1, which applies 50 us de-emphasis.  The 4.5 MHz A2-M
+		 * path (75 us) clips broadcast FM deviation.
 		 */
 		cx25840_write(client, 0x808, 0x40);
 		cx25840_write(client, 0x80b, 0x00);
@@ -1365,6 +1427,10 @@ static void input_change(struct i2c_client *client)
 		}
 	}
 
+	/* Radio mode may have left 0x809 at its FM setting: restore TV's */
+	if (!state->radio && state->radio_sif_5_5mhz)
+		set_pref_mode(client, state->audmode, false);
+
 	cx25840_and_or(client, 0x810, ~0x01, 0);
 }
 
@@ -2578,11 +2644,21 @@ static int cx25840_g_tuner(struct v4l2_subdev *sd, struct v4l2_tuner *vt)
 			return 0;
 		/*
 		 * The bridge calls this after the tuner, so that the audio
-		 * decoder has the last word: this FM path is mono only.
+		 * decoder has the last word on FM stereo: only the FM stereo
+		 * firmware decodes it.
 		 */
-		vt->capability &= ~V4L2_TUNER_CAP_STEREO;
-		vt->rxsubchans = V4L2_TUNER_SUB_MONO;
-		vt->audmode = V4L2_TUNER_MODE_MONO;
+		if (!state->fm_stereo) {
+			vt->capability &= ~V4L2_TUNER_CAP_STEREO;
+			vt->rxsubchans = V4L2_TUNER_SUB_MONO;
+			vt->audmode = V4L2_TUNER_MODE_MONO;
+			return 0;
+		}
+		vt->capability |= V4L2_TUNER_CAP_STEREO;
+		mode = cx25840_read(client, 0x804);
+		vt->rxsubchans = (mode & 0xf) == 1 ?
+			V4L2_TUNER_SUB_MONO | V4L2_TUNER_SUB_STEREO :
+			V4L2_TUNER_SUB_MONO;
+		vt->audmode = state->radio_audmode;
 		return 0;
 	}
 
@@ -2616,47 +2692,23 @@ static int cx25840_s_tuner(struct v4l2_subdev *sd, const struct v4l2_tuner *vt)
 {
 	struct cx25840_state *state = to_state(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	int ret;
 
-	if (state->radio || is_cx2583x(state))
+	if (is_cx2583x(state))
+		return 0;
+	if (state->radio) {
+		if (!(state->radio_sif_5_5mhz && state->fm_stereo))
+			return 0;
+		/* FM radio is mono or stereo; keep TV's audmode for TV */
+		state->radio_audmode = vt->audmode == V4L2_TUNER_MODE_MONO ?
+			V4L2_TUNER_MODE_MONO : V4L2_TUNER_MODE_STEREO;
+		set_pref_mode(client, state->radio_audmode, true);
 		return 0;
-
-	switch (vt->audmode) {
-	case V4L2_TUNER_MODE_MONO:
-		/*
-		 * mono      -> mono
-		 * stereo    -> mono
-		 * bilingual -> lang1
-		 */
-		cx25840_and_or(client, 0x809, ~0xf, 0x00);
-		break;
-	case V4L2_TUNER_MODE_STEREO:
-	case V4L2_TUNER_MODE_LANG1:
-		/*
-		 * mono      -> mono
-		 * stereo    -> stereo
-		 * bilingual -> lang1
-		 */
-		cx25840_and_or(client, 0x809, ~0xf, 0x04);
-		break;
-	case V4L2_TUNER_MODE_LANG1_LANG2:
-		/*
-		 * mono      -> mono
-		 * stereo    -> stereo
-		 * bilingual -> lang1/lang2
-		 */
-		cx25840_and_or(client, 0x809, ~0xf, 0x07);
-		break;
-	case V4L2_TUNER_MODE_LANG2:
-		/*
-		 * mono      -> mono
-		 * stereo    -> stereo
-		 * bilingual -> lang2
-		 */
-		cx25840_and_or(client, 0x809, ~0xf, 0x01);
-		break;
-	default:
-		return -EINVAL;
 	}
+
+	ret = set_pref_mode(client, vt->audmode, false);
+	if (ret)
+		return ret;
 	state->audmode = vt->audmode;
 	return 0;
 }
@@ -3923,6 +3975,7 @@ static int cx25840_probe(struct i2c_client *client)
 	state->aud_input = CX25840_AUDIO8;
 	state->audclk_freq = 48000;
 	state->audmode = V4L2_TUNER_MODE_LANG1;
+	state->radio_audmode = V4L2_TUNER_MODE_STEREO;
 	state->vbi_line_offset = 8;
 	state->id = id;
 	state->rev = device_id;
diff --git a/drivers/media/i2c/cx25840/cx25840-core.h b/drivers/media/i2c/cx25840/cx25840-core.h
index 94f17bd76..92c2da5b3 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.h
+++ b/drivers/media/i2c/cx25840/cx25840-core.h
@@ -44,7 +44,9 @@ enum cx25840_media_pads {
  * @pvr150_workaround:	whether we enable workaround for Hauppauge PVR150
  *			hardware bug (audio dropping out)
  * @radio_sif_5_5mhz:	FM radio arrives as a 5.5 MHz sound IF (e.g. from a
- *			TDA8295): demodulate it as 5.5 MHz FM mono
+ *			TDA8295)
+ * @fm_stereo:		the FM stereo firmware is loaded: decode that IF as
+ *			FM stereo, else as 5.5 MHz FM mono
  * @generic_mode:	whether we disable ivtv-specific hacks
  *			this mode gets turned on when the bridge driver calls
  *			cx25840 subdevice init core op
@@ -57,6 +59,8 @@ enum cx25840_media_pads {
  * @aud_input:		currently set audio input
  * @audclk_freq:	currently set audio sample rate
  * @audmode:		currently set audio mode (when in non-radio mode)
+ * @radio_audmode:	audio mode set in radio mode, mono or stereo (FM stereo
+ *			firmware only)
  * @vbi_line_offset:	vbi line number offset
  * @id:		exact device model
  * @rev:		raw device id read from the chip
@@ -81,6 +85,7 @@ struct cx25840_state {
 	};
 	int pvr150_workaround;
 	int radio_sif_5_5mhz;
+	int fm_stereo;
 	bool generic_mode;
 	int radio;
 	v4l2_std_id std;
@@ -89,6 +94,7 @@ struct cx25840_state {
 	enum cx25840_audio_input aud_input;
 	u32 audclk_freq;
 	int audmode;
+	int radio_audmode;
 	int vbi_line_offset;
 	enum cx25840_model id;
 	u32 rev;
diff --git a/drivers/media/i2c/cx25840/cx25840-firmware.c b/drivers/media/i2c/cx25840/cx25840-firmware.c
index 02df45ccf..290276f37 100644
--- a/drivers/media/i2c/cx25840/cx25840-firmware.c
+++ b/drivers/media/i2c/cx25840/cx25840-firmware.c
@@ -51,6 +51,12 @@ static void end_fw_load(struct i2c_client *client)
 #define CX2388x_FIRMWARE "v4l-cx23885-avcore-01.fw"
 #define CX231xx_FIRMWARE "v4l-cx231xx-avcore-01.fw"
 #define CX25840_FIRMWARE "v4l-cx25840.fw"
+/*
+ * Optional audio firmware for boards whose FM radio arrives as a 5.5 MHz
+ * sound IF (cx25840_platform_data.radio_sif_5_5mhz).  Hauppauge's HVR-1950
+ * image (Hcw73MlC.rom) decodes FM stereo there; the standard image doesn't.
+ */
+#define CX25840_FM_STEREO_FIRMWARE "v4l-cx25840-fmstereo.fw"
 
 static const char *get_fw_name(struct i2c_client *client)
 {
@@ -65,20 +71,19 @@ static const char *get_fw_name(struct i2c_client *client)
 	return CX25840_FIRMWARE;
 }
 
-static int check_fw_load(struct i2c_client *client, int size)
+static int check_fw_load(struct i2c_client *client, const char *fwname,
+			 int size)
 {
 	/* DL_ADDR_HB DL_ADDR_LB */
 	int s = cx25840_read(client, 0x801) << 8;
 	s |= cx25840_read(client, 0x800);
 
 	if (size != s) {
-		v4l_err(client, "firmware %s load failed\n",
-				get_fw_name(client));
+		v4l_err(client, "firmware %s load failed\n", fwname);
 		return -EINVAL;
 	}
 
-	v4l_info(client, "loaded %s firmware (%d bytes)\n",
-			get_fw_name(client), size);
+	v4l_info(client, "loaded %s firmware (%d bytes)\n", fwname, size);
 	return 0;
 }
 
@@ -101,6 +106,7 @@ int cx25840_loadfw(struct i2c_client *client)
 	const char *fwname = get_fw_name(client);
 	int size, retval;
 	int max_buf_size = FWSEND;
+	bool fm_stereo = false;
 	u32 gpio_oe = 0, gpio_da = 0;
 
 	if (is_cx2388x(state)) {
@@ -113,7 +119,13 @@ int cx25840_loadfw(struct i2c_client *client)
 	if (is_cx231xx(state) && max_buf_size > 16)
 		max_buf_size = 16;
 
-	if (request_firmware(&fw, fwname, FWDEV(client)) != 0) {
+	state->fm_stereo = 0;
+	if (state->radio_sif_5_5mhz && !firmware[0] &&
+	    !firmware_request_nowarn(&fw, CX25840_FM_STEREO_FIRMWARE,
+				     FWDEV(client))) {
+		fwname = CX25840_FM_STEREO_FIRMWARE;
+		fm_stereo = true;
+	} else if (request_firmware(&fw, fwname, FWDEV(client)) != 0) {
 		v4l_err(client, "unable to open firmware %s\n", fwname);
 		return -EINVAL;
 	}
@@ -152,10 +164,14 @@ int cx25840_loadfw(struct i2c_client *client)
 		cx25840_write(client, 0x164, gpio_da);
 	}
 
-	return check_fw_load(client, size);
+	retval = check_fw_load(client, fwname, size);
+	if (!retval)
+		state->fm_stereo = fm_stereo;
+	return retval;
 }
 
 MODULE_FIRMWARE(CX2388x_FIRMWARE);
 MODULE_FIRMWARE(CX231xx_FIRMWARE);
 MODULE_FIRMWARE(CX25840_FIRMWARE);
+MODULE_FIRMWARE(CX25840_FM_STEREO_FIRMWARE);
 
diff --git a/include/media/drv-intf/cx25840.h b/include/media/drv-intf/cx25840.h
index c8ff9e65d..0fd8fda19 100644
--- a/include/media/drv-intf/cx25840.h
+++ b/include/media/drv-intf/cx25840.h
@@ -255,8 +255,10 @@ enum cx23885_io_pad {
  *
  * radio_sif_5_5mhz is for boards whose analog tuner delivers FM radio to the
  * cx2584x as a 5.5 MHz sound IF, as the TDA8295 does in FM radio mode (e.g.
- * the Hauppauge HVR-1950).  The audio firmware's FM radio mode does not find
- * that carrier, so radio is demodulated as forced 5.5 MHz FM mono instead.
+ * the Hauppauge HVR-1950).  The standard audio firmware's FM radio mode does
+ * not find that carrier, so radio is demodulated as forced 5.5 MHz FM mono.
+ * If the optional v4l-cx25840-fmstereo.fw (Hauppauge's HVR-1950 audio
+ * firmware) is installed, it is loaded instead and radio is FM stereo.
  */
 struct cx25840_platform_data {
 	int pvr150_workaround;
-- 
2.53.0

