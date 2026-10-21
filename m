Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.68.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583916;
	b=wCqV56ouNclPmvnjRu4lRGE0Q/82m5/hN2D1Kn5aBS7oVTaCpvRmvzf4x/QbCSHW7EQo
	 3HSaFaEeheXiOw3yJhGfZtTRCLWTVrxnw3vsYdKuj14IedyaJGH1jDzHTVY/LxYNidj1S
	 R0U61ZLgxX/NC/DNyw0UXN8SzqW+awM7WajQeLOSTtDJPsr/p+y8rlEBrSnV0t8ppLLEA
	 EZWkadpaQ4NZ9XmwPqmfRYM16e6ZYJo//E9j4pkQR2qy/mFM2KYKMhKTq+Vn7Zjacl49R
	 W9MaE+aMNCzLtC4SJsKpbren1mufLQYGSz7RBCYVlnGajl8TuRy3V5ZpWSIzzXRgjXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583916;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SytDe/cRX60OeQ/0DQXC1eciS5Y+XQcQzNM/G2ASZJ0=;
	b=4QpAd6qxsbrjUhtH4CJPR/v7aWcMKSPFwjnDWrjyd0mzpglcTy9uz5EsfhP6gsCY9cij
	 D/o1ocObewAEsMweI/+zHW2mdm8xH5toKNErh8DDzXSTPIrNMYKt5vCD9NhLrug3FoG7z
	 u5iHpQXnQ9Cos2A2npe5x4IF9aJDiLMrL31bfZ/ol2aIb0T3p86VIy0XqCJ1BfRGIZHKc
	 PxpMq9+IdFSlTOQ8ovBeyum89J13/EQT9JV4+2f7BkJwa3wK8py6yUVCgUWrAHCXs96Ut
	 2iFENYbyZ2VmZ/2Ju8GEXBWZQ7s/nnl7RVhTMyPx0Oe+xIs+g8/aGi0KkCiLgQiq2Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=F72eZfPL;
	arc=none smtp.remote-ip=34.2.68.31
Received: from sonic.asd.mail.yahoo.com (sonic-usea4-0032.asd.mail.yahoo.com [34.2.68.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3590D606A319
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 11:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3590D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=F72eZfPL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792583915; bh=SytDe/cRX60OeQ/0DQXC1eciS5Y+XQcQzNM/G2ASZJ0=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=F72eZfPLqaDvBmrgLP73D2r4dII2Mrt475E443PUw76pqk0mt7XuSn+0Pm2Q74mF/lJe4Y9CxtD5kp2Z5LFZlYl3CTvExs+JEdkiCPrL6j9YCL7pBmLPvFikG1YWqfGSlmfcXwIi6eHFgDteMslKVQVow7Nsy0mmgNOFgAns+c8r4PiFQa84kv1xksWDkIJxOyC1R9QylgFbtP7WQLIp71Kh7vIWHhjUVVhqTth5ped3qu9mSZ1RZZ1/i+rMdcDBO/JQxOr5v6ETloqC05dwzpwFKHxMJWtRD48NVBWz4BpDHG7/4dX0TiPMVFVCiVKaU0fSlbfr/I0UjJxzlI6gow==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792583915; bh=hJtktlK9WplmDZCZYoq8dvGIAF+vjogxhxgxAxaTwDD=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Mxf4NZDHSj0/J+0dB3ieM5pzhme4vLV87uzfRDy54VhxXLnVcRy3Yyf/y7lufhBmaPbbYFQlGr2LrPdKATSuERc4wo/FQWUCDPAy1fI1jMTNOjngEW0zsmxVHJeC2MPaaV/rUCaDPttmabaO3sdBv6hJAJz90MP5xfBhUHmVelii3CdaaCAXKFmc7kePcf3ylaLPWje1z0xQ0NRLcrSoD8FWVWIhMoJ01r9kaIACP2TIOAfzsi0XlRChFzZso76AnnG9HBDPrFOrTh8UD/SwXY+9aiYjlCAj4y8KoovHE1VV5mV2jGBlWBN2rh54+eLaM6pAlNvtbM7BzifOYlS3qQ==
X-YMail-OSG: 8RS9F_EVM1ktwwxHJoAc58Nf2lQD.mqHCDPkth_g7Y4RXboV49Rwjuf4yp6ks7M
 t.TfSNcBmPfoXdjSSF1bRq4YtuC7CcA_eFGNa7LJg07ZUp.hEDNVxk.dlcOS1gLVJ_aMVnH59a5f
 _4udW_txP56sWSWbBDVuxq1NiZaioSM5uV9BPz1iJsIj_Ufx5BmT1i8M1gH_..pjGrBIHfG.xfU8
 i5c4P.1H_.IfWkRNRhAewARlusrJ_lHRPFkBikHsKMPtfViGdtFSw2Cp6T1uG2Drw9IRbmO6bzNp
 OGqaTkXI.0I0CcixvWnSKQHl0y7B7MW_ni9cFmoDOjNMSLIk1Jl5kRuGP8G3iZOHoXkxUfBaEIqY
 eaWnfSns9phk1_ZQuxRpdt6vGuN5_MEoH.4Qfy0RluHmEtLa1FtBW9KyvWyY5ogmPD503fGChWwr
 jVCb6IZGpc9xsKktMYSSNzXWhJ_rPUZXbAKwx9hQK9a1Vxqaa.jFTz.KbEpjE0t8B0EKRHoAx1G6
 5B8xNZ5cFqUyvyWPI35Yt8RXPmOGVFpb5XEOLb5OJkqE1PtHjzR4nvLDyOWWsW1vq3HfJeO1d7V5
 9zxvxBRUuCJvW9INk5H4MNo0UgmTRpUKwrbVjHKb54owFRfXJ1j3mSB9oZXvsYVGL7HudR0XccvP
 8QHQYCyg4Vqt6seU7ETiGJrWwqYRfiH0eYnrZg9zkx665Y83zcQZ72gmOyO3ODRQ_OHFObCIT0aT
 mHB9Df4TDlKsEGYFBjnPHWp25Mtr0JUAKpBLWtuCTTQNZbJQvypKO962ZwVSmRfWFOAKsG.QckU1
 Bbu6I6jIXovxHnvdZCb45kiUgvy_NX83RqpvI8kjEU0KZvpXNcbGzFtQi1xxTGuzdQ2Aij5WgZxK
 Rv.Azs_HxU4p_y.w6q7Q1YsxjxsgMEv2fQz6AB9UlVrs0YbLRn7M6fISxxtvQSZKMJa1NSn9WvQN
 tv13jduAStHdmEJ1U_f_J1QuGPJKZr62mAKiGMGRDW95n68.2F3FibHFlUQ3e0AOl4Xze3Fi7tBn
 VRPiFjTm96uX07vCRW9GbbWg8HlI_0xmrJ0gDjeN.8zj7wHGRv1RBkKa7KC4GMZ2pBYicXAJ3sGM
 01FdSQ0xHOjSBOFg6rk3bqEoMuax2c8St9xWS6GxWnmXXUKskebm1uyyg8AkCLlTUdMY7uMhgrpS
 TOnJy8OeV97_WtvwgzYrTPoTchpESubtGPh2yW6CDsiYW9m8UOSmbfXJSO8rU0DgR39EQhZqu2mJ
 yPiPYmepvE8SyVrLv.Uc4vPE8hCfZ.VeNy61bIN6IIuw9ZqpSL5u7qElm.ZVfKQhmiacKa90l439
 Wf6ShAwxunbd5Fg2Wptol00Ebm7phfkj6mYynegiJRrtk8g4yT311XUC9eAtOb2X5yg5X.Ls4w8B
 5ZHAYhXRoCAAcVIVo8PckMYvy5IxmMxblAaZg68.nb8_tUCZdK4FaDDygFv0tNN9Ox5msdIoJaoF
 Z6A4lBn3SPIxXsjom0hdG3eKW1q_Tc8YZmOlD2tLYUZXxZzZh.oOwgp3SxgehF01H7pzcMJNMSwP
 Qee2qJBCbz8XOqSpI.B8508gRaZRvOxClEbME.pDYm3JoLhkc2mSLiNc18V2HSUHCO.6V.RQ.h4s
 Fsf0jQgI5orlsf3igPjToCjfHd.ls42kj2FddE15dA7yIwEWV7jBPE9VL36QRYtbw0O4EWA.q3F4
 1bcXnKQJ7qfpe3d56L61cpZnskCgcHlFhm74ofDHIP_l.KEquLzRCCGOM8W2HkrVlRRQK7ZAmCsz
 F8gbDJSiia6TJW1qIfQiRp7pu8bmlNv6en35ObQGBV6ghyn8uKqyukmyt9e6EqOCCqU49u7iexEQ
 zWsVyPGmmDqlf8scSHn.GCBV_wd3UL9e6XSl769eGVNcD.vXH5wj1op5pZ9XdxRlQZf3VXP84CRh
 4fXirKyNeoGjvOJkUtpVixBPIQxa3aPI__NrXhPPnatoRBi0aWSmbjEWXSmCDY1ibapfNvIBSOmY
 lVKQwuP432bP5MLjDwHldnep3uFmrldw1g90O_g--
X-Sonic-MF: <stealth3m@yahoo.com>
X-Sonic-ID: 57cc87a8-d424-4dc1-a537-6e0a3803dcbd
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea4-prod-sonicconsumer-svc-102 with HTTP; Wed, 21 Oct 2026 11:58:35 +0000
Received: from dip106.lsn.bf1.yahoo.com ([67.195.177.115])
          by hello (SMTP) with SMTP ID 335e7936c2db7179f5b6ae587ebc3b0e;
          Wed, 21 Oct 2026 11:58:31 +0000 (UTC)
From: Ext745 <stealth3m@yahoo.com>
To: linux-media@vger.kernel.org
Cc: isely@pobox.com,
	mkrufky@linuxtv.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Ext745 <stealth3m@yahoo.com>
Subject: [PATCH 1/4] media: cx25840: demodulate FM radio from a 5.5 MHz sound IF
Date: Wed, 21 Oct 2026 07:57:44 -0400
Message-ID: <20261021115747.1864231-2-stealth3m@yahoo.com>
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

