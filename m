Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.68.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792711576;
	b=YdTIVXqwwoKnTYrCaFB4AMW9CNpyYbaid6WBO8B2OSEFK1IUxYeuH0X+fVCqDYHlWkT5
	 Pkg4BbQDftjQzF8qfRy+dgIEkaIsjRKDPH/uOaQfmh04nhSGJ1b1j7FjD4NShbPuRIchd
	 oEeYCeSwHr/3/T1YTwSRTdMRo0t6REe9XjVJaJXgE9s/6Gu705Wp8I+maTZrMMEXQsZHR
	 sSwZMY803qgq2R6aCWLzYG29OBuHAeRFBWSGC1GtWrMMn+3A8Z661b83P0bDXpZEeyzal
	 9cLFXWj8+usSLukMCkK3PYn3XUjNeTqo9SUr1mxbZ8cSS6qldB2K5Xi4SpZ7mwUd0lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792711576;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LCcCaqJj3xT1RMCPxDbKrkwQVljgTjf1OgYToCZwLWM=;
	b=TKkOiD1cZ87zVNb/iYHn2xSd19lt297sVzt7Cn2SuFsRAvhHHHLqlDwkbj8UaFNOgbed
	 f+Lnv7ou6s86EolXE9LXd1nJcUI+Ev+PLiZOol4WM+5b3XYJKRdiSFiuQAYVac+wx/6S7
	 FrntniitG2yTNu9YSPbmpyTw2rW3U6i96LFLeX4a1NvcDATSlZc6dfj18ZLA40LCUfcFn
	 l1aJXMOfQQWPgvdIb13H2H6iZ1pgjmiZCTpIZXaZhuM5r4RXYQOtXTwpAIuxm/4EETv8l
	 0RFKRu5MyUCAXpCfYZTp2o6y/YjvT/fpQAReA/tTJmLt/KyzXGBj7OEt8hFBjid3cug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=D2jf5jYV;
	arc=none smtp.remote-ip=34.2.68.31
Received: from sonic.asd.mail.yahoo.com (sonic-usea4-0032.asd.mail.yahoo.com [34.2.68.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69FE606A322
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 23:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B69FE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=D2jf5jYV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792711574; bh=LCcCaqJj3xT1RMCPxDbKrkwQVljgTjf1OgYToCZwLWM=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=D2jf5jYVfDtHKLQQ0kxmRJUNoQzQzapTUTvonwHJfE7PmxZ5K2ccQh0TEw1YtO439IJXYETyj51mcHwEw25CL8Fr01SMlUzhIzmZerivHft1vunAESfjQwzRvN8CiB/gvPJhkIJ36Xg9aeJny8/rCSzb/wHsfcyyGhmAAJXTlFToHqHkDFDxVLs92+S9tM9TEeEZNXj1D1TomkzTTjdpf9Bs2UMQ3Ph7FOXVmGzPMJNwjSE2o8mXNbUaNqgOmsn0WEo0Ns9sDmh0/qxO6vYDU4Qi6osWl6An+vlwEHDMtnR1jfCh6qwTkXOP1/ut4/X8y/tRF0wUJNJTe4k51cV2IA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792711574; bh=6nhCy+QN1N1V+IYrsE0duuqHlmoaT1Jnnlld+O0lkma=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=E8fcU2txdFydPQ748Dg6rBny8A7eggXYIaadzbtAHEPtksVmWS9Tfs3Jh4wJsGXmb2KwAeVwUu9DkdXY/L2Bkvf7vAPaWiA7L/MwQ9u23MT4X4/1xsV0j6ioWPayXsBiW+Dn66tS/Kr551HuBdV2z2y7H6RwQ1sP1xfuEA0V4h4KCQblrUkB9cDBlUryMwIHETbuxJvBacYR96aoQw/IqQEAhvHC2OzHgK2gpvuRpjMpg8qWFiwDLbx8G3bsKmRjMJcFkwwsqtowSQ6spkzMmwsDQ/TAWmQX8g5nuAGGViMld6Vi1JwO4TsHPW6LxwKHOPh5LUfyWKDUgIjyhsgGXw==
X-YMail-OSG: jsb.dJ8VM1k7H03UEBTdb8YLNETu6E__oBSzMDSiw9bqd2eQuEAXp8eYSWgETZ9
 3IwVk1baa4YRnly_dS8fYBEi2XJPsL0ZaHBRvD7tUyXaZ6IPI9xpaCNo8gdVx76BBj_uwRiapE8Y
 FtccH1T72_J.WP6AT.NRhDIxbGZq_S9jxKPG0jAKkWeBJyugo8iOyqmEcPjEsaUr.SCCJaWH_nGD
 WZTxPLLxboQySFC0GCx3hc3mibmZFCE9jo7vWe9T2rmLcwnq45yozlfg5jKgk6ZWHzASq6LcxZHP
 M_d8QKvTXm1f2KdF9qS.Ljq4hse6gDe.X.NSvQcDd9R1Lf3j3GK.8Vm3Gnn_an5k3l5rQsKZsm6b
 ftLw1Obs2pgsBSSGnOQpOjxzpACn7VEj619I4bO0kmriQAG_8FwI.bFG1ugkfAQasfdgaAWR.vyd
 HY3oev1LKCuVdSD0wFkO30w6z3BxOh9EHXNpRFlw7zvvRmqnmBw8vSBF36jXWuE6cwyv4w6MN_k.
 TJbLRDnpUgzCcd8fkbbUATKN6DdNIbYQD1Ixvz4O4.vewWWoSkz2sRsu6BiWyqIXV7lXbhM0c91r
 7ZClJc.K5ZZc6gsfRfKceo6UmGw5TuXF.rirTBmBfw.XUBzfkTMOk7dDLdNpuP2s4hZXfaAKeW93
 LIbJ5DkXf5jG22Cv57g1HURqG7HRAfhDUqqsc737VZau8OlGX9YTJy54it7vlyCy6gCszIJxL7o6
 PjzZiJgBBlKAueHszWtEbUuuhQwAfMbqCPY.WLLs1rj35bNEUOZ4tpLe6ZndYck4Hio8N6LX5w1K
 NiPK8yK1nqNFsM1gSF68WM2kFit_xy9LOJ0vRl5BJ1z1kEkkLBQuG3teN4T8bz2nuvzs26O.lCh8
 mBvXnofXt1r5qv34ExoWgrgf063ISKPKpk9q0Nng0hXq1KKXFMNGffFQHjwI6GuP6ivI_aSnLgRI
 VhQKxyaLs8X5iGEYSeV6NtbeHfduedWlI8oDpGBV.gjWiWiop06l4OXwhjW6UgUS4Duwh8.bd3Sc
 xeLxr7jb1iAhENzt.2k72XgqZrd9odpByTwWm5XcBGcPxplqspyT9O1fnyQG.CC19QfS5V0sGsib
 .s85nRAfvjQXkRAaS17v.YQC3ztMex9Nuelkc8QNvm1PRCqCkUqdAVB_oWLwYAkshXpqR_AevLtH
 DN1Y_EDNlgL9j1kc1ldVAcu9ccYXYakqNNwqb2TOYkP1WSduUin9zp0XzUS3pPxUOKJ7GAQoBlYD
 EkjDFL1jXw6.QYJmwjOlIFVgofF4qt14QAjHw_V848Zpz_h01lnAE4Msh9n.nsGGW1jJCCO7CAa_
 bE0F9CdKCfU4P.xv_P5sUMUzKFxGd3TsJavpF5WwuPGmX1FdCd4x5tpQ39Ti.SE_V4ituy6X7jVr
 hCqNeN9z4U0LnQAqBjjIC2iQgMvhs0.rpZsrt_rE2lasV_eBDkU0iMDegPdTXZSr2ktiHION45af
 4_ZycChoiwc_vKvdNjo2sShMbJVJoFxnHfxBIEFa29tymccVYdKvI.pOKvYdACtpb_NspShoA7Nw
 IsFqdAFF.AGfOGLRuT1KL2jrM6aJRSvCC2nSZ20H8JdoVZUaMYHPZoNUyroAjiL8PUpWcZmAkBfv
 BVB5w9RIcwd6tmktC_elExLOlI30HKss3qi2uD5Mf2Hcm9.wXwYkPx2Vn5dzm97wxCH0WYk2dNBY
 ZjNGxTou6fGpW8lP48YcSyOC5gtaqJkoXhM5mUgjg7mKThZ4salI06sITwzW93VKl5_oIHcC88sd
 gYH14Lv9MJVEtdhHCFYsealgDn0VqHDX4WDEBbpy7msKURTXNKvLLh6g56EH3HwyoOLv5V4OjgVc
 VSrL96VXSnbz_k3or97w3s4g4YIaSecB_VV2JzFNCbcwMUSyCxBPPL9xZLOPHZutP6S6yd9m3nJk
 ZrCTk6EbdNCOB0.SApliqTCHVUcfCNAsh7ycufrUOLsjU1_Osr9csA6zZaFdTsvO3a_XC0Yor_Xy
 v8pXFB7kG9ehCu4U8z27.le5vcjZRp0r.YZZXGAazfw--
X-Sonic-MF: <stealth3m@yahoo.com>
X-Sonic-ID: 41476b74-7839-4ddf-a8eb-b3a7ba7c1351
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea4-prod-sonicconsumer-svc-103 with HTTP; Thu, 22 Oct 2026 23:26:14 +0000
Received: from dip117.lsn.bf1.yahoo.com ([67.195.177.126])
          by hello (SMTP) with SMTP ID 81a0382c6781dfa1b88c965d2a3d9a7d;
          Thu, 22 Oct 2026 23:26:12 +0000 (UTC)
From: Ext745 <stealth3m@yahoo.com>
To: linux-media@vger.kernel.org
Cc: isely@pobox.com,
	mkrufky@linuxtv.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Ext745 <stealth3m@yahoo.com>
Subject: [PATCH v2 1/4] media: cx25840: demodulate FM radio from a 5.5 MHz sound IF
Date: Thu, 22 Oct 2026 19:25:45 -0400
Message-ID: <20261022232548.526232-2-stealth3m@yahoo.com>
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

Some boards feed FM radio to the cx2584x the same way as TV sound, as a
sound IF from the analog demodulator. On the Hauppauge HVR-1950 the
TDA8295 outputs FM radio as a 5.5 MHz SSIF on the cx25843's tuner audio
input. The radio setting cx25840 uses (0x808 = 0xf9, FM radio with
automatic detection) never locks onto that carrier with the standard
audio firmware: 0x805 keeps reading 0xff (no standard detected) and
only noise comes out.

Add a radio_sif_5_5mhz platform data flag. For such boards force the
5.5 MHz FM (A2-BG) standard, mono, in radio mode. That demodulates
broadcast FM cleanly, with 50 us de-emphasis (the hiss spectrum of an
empty channel follows the 50 us curve within 0.5 dB). The 4.5 MHz A2-M
standard would give 75 us but clips at broadcast FM deviation.

This path is mono only, so say so in g_tuner for radio: tuner-core
reports stereo capability for every radio.

Tested on an HVR-1950 (model 75111) with the pvrusb2 patch later in this
series: local stations across the band are clean, and switching between
radio, analog TV, composite and ATSC is unchanged.

Assisted-by: Claude Opus 5.5
Signed-off-by: Ext745 <stealth3m@yahoo.com>
---
v2: unchanged

 drivers/media/i2c/cx25840/cx25840-core.c | 23 +++++++++++++++++++++--
 drivers/media/i2c/cx25840/cx25840-core.h |  3 +++
 include/media/drv-intf/cx25840.h         |  6 +++++-
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index e90d71fe9..a7b4cae01 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -1302,7 +1302,15 @@ static void input_change(struct i2c_client *client)
 
 	cx25840_and_or(client, 0x810, ~0x01, 1);
 
-	if (state->radio) {
+	if (state->radio && state->radio_sif_5_5mhz) {
+		/*
+		 * Forced 5.5 MHz FM (A2-BG standard), MONO1, which applies
+		 * 50 us de-emphasis.  The 4.5 MHz A2-M path (75 us) clips
+		 * broadcast FM deviation.
+		 */
+		cx25840_write(client, 0x808, 0x40);
+		cx25840_write(client, 0x80b, 0x00);
+	} else if (state->radio) {
 		cx25840_write(client, 0x808, 0xf9);
 		cx25840_write(client, 0x80b, 0x00);
 	} else if (std & V4L2_STD_525_60) {
@@ -2565,8 +2573,18 @@ static int cx25840_g_tuner(struct v4l2_subdev *sd, struct v4l2_tuner *vt)
 	u8 mode;
 	int val = 0;
 
-	if (state->radio)
+	if (state->radio) {
+		if (!state->radio_sif_5_5mhz)
+			return 0;
+		/*
+		 * The bridge calls this after the tuner, so that the audio
+		 * decoder has the last word: this FM path is mono only.
+		 */
+		vt->capability &= ~V4L2_TUNER_CAP_STEREO;
+		vt->rxsubchans = V4L2_TUNER_SUB_MONO;
+		vt->audmode = V4L2_TUNER_MODE_MONO;
 		return 0;
+	}
 
 	vt->signal = vpres ? 0xffff : 0x0;
 	if (is_cx2583x(state))
@@ -3972,6 +3990,7 @@ static int cx25840_probe(struct i2c_client *client)
 		struct cx25840_platform_data *pdata = client->dev.platform_data;
 
 		state->pvr150_workaround = pdata->pvr150_workaround;
+		state->radio_sif_5_5mhz = pdata->radio_sif_5_5mhz;
 	}
 
 	cx25840_ir_probe(sd);
diff --git a/drivers/media/i2c/cx25840/cx25840-core.h b/drivers/media/i2c/cx25840/cx25840-core.h
index 8b89e9068..94f17bd76 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.h
+++ b/drivers/media/i2c/cx25840/cx25840-core.h
@@ -43,6 +43,8 @@ enum cx25840_media_pads {
  * @mute:		audio mute V4L2 control (non-cx2583x devices only)
  * @pvr150_workaround:	whether we enable workaround for Hauppauge PVR150
  *			hardware bug (audio dropping out)
+ * @radio_sif_5_5mhz:	FM radio arrives as a 5.5 MHz sound IF (e.g. from a
+ *			TDA8295): demodulate it as 5.5 MHz FM mono
  * @generic_mode:	whether we disable ivtv-specific hacks
  *			this mode gets turned on when the bridge driver calls
  *			cx25840 subdevice init core op
@@ -78,6 +80,7 @@ struct cx25840_state {
 		struct v4l2_ctrl *mute;
 	};
 	int pvr150_workaround;
+	int radio_sif_5_5mhz;
 	bool generic_mode;
 	int radio;
 	v4l2_std_id std;
diff --git a/include/media/drv-intf/cx25840.h b/include/media/drv-intf/cx25840.h
index 8b455d9dd..c8ff9e65d 100644
--- a/include/media/drv-intf/cx25840.h
+++ b/include/media/drv-intf/cx25840.h
@@ -253,10 +253,14 @@ enum cx23885_io_pad {
  * is to select the audio standard explicitly. Many thanks to Hauppauge for
  * providing this information.
  *
- * This platform data only needs to be supplied by the ivtv driver.
+ * radio_sif_5_5mhz is for boards whose analog tuner delivers FM radio to the
+ * cx2584x as a 5.5 MHz sound IF, as the TDA8295 does in FM radio mode (e.g.
+ * the Hauppauge HVR-1950).  The audio firmware's FM radio mode does not find
+ * that carrier, so radio is demodulated as forced 5.5 MHz FM mono instead.
  */
 struct cx25840_platform_data {
 	int pvr150_workaround;
+	int radio_sif_5_5mhz;
 };
 
 #endif
-- 
2.53.0

