Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.68.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583920;
	b=pBnv+OXRYSSZKpoGZ+bE6aZXSLy5hsnrUTUP/+kqRvzzU0crg4rYpzTtrs7XfwMJQBws
	 PTJ8NH1ZDWpJk+xYOFVEhTURt28kWd1aDf1Y298qR3aID2ymPk27xq30bqbvom1varhf1
	 VTLM8MMB2Q5gQE++N2TYt74gwclvkQCs44n3VxjX2nZinPIpJUb/vUVNe4+Gq+zwNI3IB
	 uf4veI9a1eXreXNFGFkF7ADWmJmFai0BtmDIRRnY7upxKOW8Zyire7cmKkmpzThJHei1l
	 jEj603rePZjDOOXJ3JTvPQLcRp6ly7R3LRfi3rTp0zCjvQe/sD1A48ikqwGyufjbM8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583920;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UKkC+VFQKctQJYv6zMUlH6ncOPhbBLNp7rURvocpYaY=;
	b=R5NA/diIQZH3aDsNXOaIt+hb1XxM9UteHviYfxhtk2l8TG5dFSkuurw9ipKlYJV2s3Qf
	 qUQVRh+W4qVIcogLFSPDlH6+iSzwt3vWw4bVV4Nc/NxRHdmDTnMVoPLMzgoGKAdIDhGHP
	 Ip5IyG9XATAI+bK1JBRKL230XhQ+Faio5NtJCgzBVglJW6XCNj8E3pxYkTwITnda1hGcC
	 J6gxRf9CvdmnXhvSIjZ8pA7qE3zpK9H7XBVC2i7kh5C61B+zSn1BpKtm5S/IB12oBOZC8
	 KkyqlMNTp+65yOalMqSoxHcaUSzHZFJhsbXqHU1BBcaAh6GkjcYIC0JHc0pDEawhJcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b="YQfd/bKr";
	arc=none smtp.remote-ip=34.2.68.31
Received: from sonic.asd.mail.yahoo.com (sonic-usea4-0032.asd.mail.yahoo.com [34.2.68.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17828606A319
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 11:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17828606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=YQfd/bKr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792583919; bh=UKkC+VFQKctQJYv6zMUlH6ncOPhbBLNp7rURvocpYaY=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=YQfd/bKrdLxRIt3UL8aZywk6iU3G3Eu55igJW9YXZwGgyh6G2zhzCZ+00Yaxm/HtKwVL/6lYzYdVS0euu6SKTm4etnJV9QPBpgAcj2YAPNjl9jBA6za9HDAApeNE0jOBysNuL04apKiwEVNqEfyM3zt3MULCI2Y9wwKLG0cqiEDoq2L8Keiv5XK4/RjMBULkTjJckQbtYBHSaCBwB1FqiVX6QgeIkgyyXdaMcJxKdtUUA2oAvnisnGadB4iLhjVcXL84D0iI7HbpktM7N60n3pPzi7/NW79QlhkmJtvEAXAvAJHHuiSwy3HoZ8CF73Vy58FeVoww0lnEjspg7BaKSw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792583919; bh=qCR6V0bRfi2gxEgY1k41s9xjBLF2OVhJYBb7GmwkQwu=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=j306qhMx1m28JfWk2ZvMUzb/itDms0wZaA8/DHa3/mJSDTIJXzdiPLbxUlolwoeU3G74C/qEUuu2mYvbBO1J1SNEDLUf7PBLwEKY6nNuPd57dkZSsMgEHRozc5pLRQ6/Si7k37YJtkyizUMV92oEc06zX2NHkZGadQAWA8NJcBeWMsTcVGM/Sj0XDYyyeAqNwzOn6YkOglCX0x3+11qVn9FYMP9PHf7m1ape9Pc1JC4XCx/RboZ5LHdikbH6gN/NC/TVmxJVcyq5m9E7bjGfJh9p5oif5KcXarubAWrfFUoZQPWAaAGeg09KoQZE4yBtsInUdQOOPjfKlYul5OU6hg==
X-YMail-OSG: 5y1cFoIVM1mRF3HV4LUv46vi5W43Pf_nrl67UTwphOtpmX2.Uf_csvLlN3EFsLb
 7g1LCzzBkx8yaQUbCDPW2M3x6x0cG_GQ_SX_S9Qt7Gy.82Cj1x2jqiw80MW0pbGDdq0m4Xkbd8WF
 s7CwkcvpwIWf96aS3gbfLV1H_bAsIEWoUcpFdlNCfBvbyIAqEmazdjLuteFrx0A6VIv98PVs6l15
 oKrQPSlglKqmLtLdJYaoc5vD2pN3m8dbNYEFDFNUQKX7FbJIgQBFyW_NZc5sTvcr5mvLOxS9_fuH
 GBh993aSogTd9lM8zR1X_dFtAEgmhrHG03rAqRjkFeMysygSltrwplUlh5RSbooh9kYZsl6BOyhY
 bsakpfNqsBTJD_luzMb5QP5qXd90FT5JAYtaG1B0xMmaRAG5RhOXmpyyM8g.Y15pQqZyUm.plbAc
 TTQCwJiwQmb0P91wT.VI03wJOYYtQYbdaKWzyjXws0BP2ir43IC3fosCRFFQdaKa7EF2HmQ5trG1
 fNbXdTL4iYUJsVsEA7C40aI1AP1YiGiKUqRaqLYVDupu2uxdQdhyzNhoNdbnlErXMyqxDr8GcsLp
 s7X63xgHO0ReE.DxX19LEFbbpJg.NrY09Fg3WhF17ARdKGCNOz2o90VQyxt8QJ_rTDX1GnF_bstQ
 mAQszCSYobfSpvzeo678C8wxRmxfbX0Neq9SbrR84vIOdC3LPb1VE3vtCOKAJ9jCE6HIGz9nysLV
 KAyM7rr9wn3EHdqIftLUsq6_bXqFd9XKgNHc4oeTBcGlHKzPvXnA3UU2YLAdN6ASGwwcjWGKbD1F
 bFT4xo2lRHVlbvmpN2Im8vV9HpxGqFxfCXOOmQ2nEVwUza8.wFH9fm_Ja65e2KG.8_Fa3szgd8jB
 Uz.5OJPDuhe7Aw94eReuJCiHsLCqDT_X19zvYQX5Vgfe_Wwn47.vWw3GxHXoq4yDlv6gVHfF5_mg
 L7t5PhQjc1k8OsGs6wwiyq3bVGXboG6SEPTKrYQHX.kBFbT3MM.phGTKXs_w_k2TkMWgqjE1iyVo
 5EMvNXYtmgqF6a0667h4PGxvqKMrNyPLhCMMZGMitclo0cwg.7zr3SD6hWMUemvabcitQcRxcFwA
 agHxzi.ZMxP58XTFd2ER2rCf70KX.MaifO2rFeuNYeKGzYaJ5oW0AOQNeTZjI43zZ4Z4vbt7dJ5q
 xZtxzco95EHaAl5L3xGmGC12WaWgBZYRYyCDya5tgfqWHO.Vm2.Loq.tZreMnYDDjgQ.YtailHUx
 YOtvpBZNs5Q9ckVE68XZ9II1KNBFi0ey8Q38meSMAwPbBreE_wq1fyVETyN9jCPYv4A9v6X_wx1O
 xHaQjlWaT9ke5zQuRyXn54LWQX7Jrfqh5ofrnZ5Az49mROOz6IJG_ConRILzja3Gj2yzcRPbsp6M
 NA9Em0rgyCOjEb0kP8.wRD_SNV5mplIuXPrthBqLFSoYOMC4Fyw6bo5mRSQcYXd1XN9sKyiB9Efc
 LrGSaQ5NWoZOh1eXg0Hn9_gwOQ6fnC65vUwoMR.LehH6eOgGaFs06uGW9Cvi9cE4TMV9BNKwyALp
 PozSae53OSUgOrnJyq6gNAEQijC32kM7G9XGAFGkalXe1Ooq6s9wdaIGbJZz7LS424ITfVdaDDHw
 jqX3R9NL5Q2W6uFaSOXqF4mSo4qPgGHxozUG5VYpEp2L5xPHcgqIgcELP8clLKsP8bIFdxUlQJbl
 iAKbMRsrKIdtQNK3JKUayilKK3UtRoDcXgZwrP3BFv_JblIoW_4a2kSbg4Z_F9bzHwcKW70bOpgm
 DNTu1HhkqhPEiFQITD6W.H_gSr1vV1B0A_4prx9fYTsAhQPSWiI3R6uum7DWoXfbxbdZxz9to0A0
 ocMAxAIRB1B4vinuqJUrGUBIHRf135Xo_DhpuF68qYZi5avx4b.BCtqG96NhvMtTDE4SOA4bvKSK
 eFRQgLCTOnDNEi7S_5P_IUBnAHYuEe621QqwgZauJy_iVnrsyihlcSpMJ59N5bS3He7Tv9KI1khE
 4byoruMEvH28yV..4i6XGYSijDqaQJe0EtzBzCjeqLNY-
X-Sonic-MF: <stealth3m@yahoo.com>
X-Sonic-ID: 4e905745-6c9a-41d3-9a1e-e8d71b074128
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea4-prod-sonicconsumer-svc-101 with HTTP; Wed, 21 Oct 2026 11:58:39 +0000
Received: from dip106.lsn.bf1.yahoo.com ([67.195.177.115])
          by hello (SMTP) with SMTP ID 335e7936c2db7179f5b6ae587ebc3b0e;
          Wed, 21 Oct 2026 11:58:36 +0000 (UTC)
From: Ext745 <stealth3m@yahoo.com>
To: linux-media@vger.kernel.org
Cc: isely@pobox.com,
	mkrufky@linuxtv.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Ext745 <stealth3m@yahoo.com>
Subject: [PATCH 2/4] media: cx25840: FM stereo with an optional HVR-1950 audio firmware
Date: Wed, 21 Oct 2026 07:57:45 -0400
Message-ID: <20261021115747.1864231-3-stealth3m@yahoo.com>
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
   take effect immediately. TV's preferred mode is restored when
   leaving radio, as both share 0x809.

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
 drivers/media/i2c/cx25840/cx25840-core.c     | 138 ++++++++++++-------
 drivers/media/i2c/cx25840/cx25840-core.h     |   5 +-
 drivers/media/i2c/cx25840/cx25840-firmware.c |  26 +++-
 include/media/drv-intf/cx25840.h             |   6 +-
 4 files changed, 119 insertions(+), 56 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index a7b4cae01..e5636c562 100644
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
 		/*
-		 * Forced 5.5 MHz FM (A2-BG standard), MONO1, which applies
-		 * 50 us de-emphasis.  The 4.5 MHz A2-M path (75 us) clips
-		 * broadcast FM deviation.
+		 * The FM stereo firmware's automatic FM radio system (0xA)
+		 * locks onto the 5.5 MHz sound IF and decodes the stereo
+		 * pilot, with fixed 75 us de-emphasis.  0x809 picks mono or
+		 * stereo.  Don't pulse the soft reset again after this: a
+		 * second restart of the audio core often leaves the stereo
+		 * decoder hissy.
+		 */
+		cx25840_write(client, 0x808, 0xfa);
+		cx25840_write(client, 0x80b, 0x00);
+		set_pref_mode(client, state->audmode, true);
+	} else if (state->radio && state->radio_sif_5_5mhz) {
+		/*
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
 
@@ -2578,11 +2644,22 @@ static int cx25840_g_tuner(struct v4l2_subdev *sd, struct v4l2_tuner *vt)
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
+		vt->audmode = state->audmode == V4L2_TUNER_MODE_MONO ?
+			V4L2_TUNER_MODE_MONO : V4L2_TUNER_MODE_STEREO;
 		return 0;
 	}
 
@@ -2616,47 +2693,16 @@ static int cx25840_s_tuner(struct v4l2_subdev *sd, const struct v4l2_tuner *vt)
 {
 	struct cx25840_state *state = to_state(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	int ret;
 
-	if (state->radio || is_cx2583x(state))
+	if (is_cx2583x(state))
+		return 0;
+	if (state->radio && !(state->radio_sif_5_5mhz && state->fm_stereo))
 		return 0;
 
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
-	}
+	ret = set_pref_mode(client, vt->audmode, state->radio);
+	if (ret)
+		return ret;
 	state->audmode = vt->audmode;
 	return 0;
 }
diff --git a/drivers/media/i2c/cx25840/cx25840-core.h b/drivers/media/i2c/cx25840/cx25840-core.h
index 94f17bd76..e23e05034 100644
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
@@ -81,6 +83,7 @@ struct cx25840_state {
 	};
 	int pvr150_workaround;
 	int radio_sif_5_5mhz;
+	int fm_stereo;
 	bool generic_mode;
 	int radio;
 	v4l2_std_id std;
diff --git a/drivers/media/i2c/cx25840/cx25840-firmware.c b/drivers/media/i2c/cx25840/cx25840-firmware.c
index 02df45ccf..fdebd3ceb 100644
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
 
@@ -113,7 +118,13 @@ int cx25840_loadfw(struct i2c_client *client)
 	if (is_cx231xx(state) && max_buf_size > 16)
 		max_buf_size = 16;
 
-	if (request_firmware(&fw, fwname, FWDEV(client)) != 0) {
+	state->fm_stereo = 0;
+	if (state->radio_sif_5_5mhz && !firmware[0] &&
+	    !firmware_request_nowarn(&fw, CX25840_FM_STEREO_FIRMWARE,
+				     FWDEV(client))) {
+		fwname = CX25840_FM_STEREO_FIRMWARE;
+		state->fm_stereo = 1;
+	} else if (request_firmware(&fw, fwname, FWDEV(client)) != 0) {
 		v4l_err(client, "unable to open firmware %s\n", fwname);
 		return -EINVAL;
 	}
@@ -152,10 +163,11 @@ int cx25840_loadfw(struct i2c_client *client)
 		cx25840_write(client, 0x164, gpio_da);
 	}
 
-	return check_fw_load(client, size);
+	return check_fw_load(client, fwname, size);
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

