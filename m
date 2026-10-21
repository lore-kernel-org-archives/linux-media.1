Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.68.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583924;
	b=RgsqzP9QImdRmcEcFKaoeiBYsiFkZMccU12bPL/4cxiIYaElYLEWrpIpWPBPtLMYanGR
	 RwRJtyrfrZUEhIcxca1jg1kM6rFZMGbZsd9DqBBBeeVr5XykVrhFljA43IDolBKflYm6E
	 mov/OgI8zUtr3cTYyfHNE+V0NvDy88XWSt6ySl/o1roZhx54wA8e/b/fqxAkNJmYkooXO
	 GOk8ew/DNGbOrjrAZtEyA2syZDZ9g23gGBKcY7RxiPVEDUosfb2V88Jp4fMAdnqvWzAWK
	 0I78afRk3rbSZGTuATKZBiFvLhutdkqwg6Lro01SXAvp5mQWHm66MHuCFqWn+fbA7Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583924;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xg3I4r30V+WrKLL/PJt3polWHt2hv/ZEtU05uBM+K2s=;
	b=CVRLYA4cFWTHKabKl1EOxQsMmgoz5oXzC/PrN6PMagfl7lrMKZo2BvKDnPzTZvwlWRZA
	 rm3eXHbqRWxwhqJRtklOZurPVDbLM8Km4fGh63m/X8MoOrxz+MmJQ7pKrlPBwY2XEGcV2
	 +8OpdAIEKJn/1vFGlm34TxfCUrsZsUiKKtJAHRbdKm1hptnO6zLeDhL7y8LPpCrNCZF0/
	 mmQkjmrrpkGAnnJ5ktPbTxu8GodVWq3z5QJv7QsftpCFwGNg7anoz3RX4CSd8b6xuncXq
	 IE8ypfnUbAMYSO2WSQjWCGcO2wfupIsXe6NeIulIqXUzEyz/p4AvfSSzvk/bbOl/6+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=G+8w1yt7;
	arc=none smtp.remote-ip=34.2.68.31
Received: from sonic.asd.mail.yahoo.com (sonic-usea4-0032.asd.mail.yahoo.com [34.2.68.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B75C606A323
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 11:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B75C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=G+8w1yt7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792583922; bh=xg3I4r30V+WrKLL/PJt3polWHt2hv/ZEtU05uBM+K2s=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=G+8w1yt70xb/zVbOZuxkJjTZAKqemJGolOQ3E5sBsXn227LGLmlLOPTQG7MG927vjIp8vRtaBcmUOGYew3BJd8f0oSCMbK6gZVu9/OfoGxU0Ikumj58JNq3FkvZplJpOCB/dFyWY9OiRGpKkwr4peIorLpLMCBWo2VEaSZbD60hDCVVc1Rmo+PZ4+o4dmqK17mhi5eHAuRNsR2YcxqLmgt+lhS02Rl8vGoOVL/lv9PWe0amtk3fmOoKjSWptjW217P5HRbmoM1JPDi7qPzIHahUsc3uC526fMe/SiZD+CgCSMKmENhLTAiUNuDi3XkOC1AmaERQ4DLz60YAhTsQYcQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792583922; bh=PDK4EQmWMOMYbSyoJuW+ZLbZgdth7mAEXyb7ko+gfFC=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=NhZzpAozhH9NAYZR5673scmXdVcgiWJI3QDcQ3oS8miuYcaO3iORpoemSe72vZPdbZdMp5+jvz7R826HTVWyek/186mQIXRoMic16MlI8VLOQrTeLN5oUfxltTvxL52hH9aKrhYDqoZQhvtTXr2OGddumP/C13erdxGdEKKtXQbv/58qTpZfmsd7c8O2hT8oiDQVrzOWVINr9EJ55/CvlDQfB/9IUV3MrY8zx/wESz0HBfJ6s0qlLIN29eYphbj9MjnFllqBqFVdyjq84gPDJP/CfLfoc9foVDWtpl83KpLvN0d6o/j7Z9TleMXyTrHiS73KxYhsLnoNwPiLjqK88Q==
X-YMail-OSG: nEkKZW0VM1nLXXqqEss_GJAVTQAjcv3B7ybdRza.e0gOpbXNxfwzeoH05rKZqoC
 gDVXbAnQUiPRgDNxuz6fuqn6bOBzBeh5T8lRAO2faO5JUPQcrvwYJiT5MBLCjOzQFUYS7vuNxsEK
 fWXHfyYhVr_XmzwneKHNYpmeqaQ5mViYk7NDsT_F4LgwXTiYq337X0oKkDtY5_S0nDjflUJ1CAKq
 3wHVaCt921LzoXTOXx6MmDFRU211d6CwWiP1I4iiJwbZyViGWHs0_AZiwC1ILVAz29BnKlI46TNg
 M2O97K1eF1_rPNln52TNYtKiYudl1TomSzksvVeBrcaokL4zIePN_HgY_fwgPdTZdJVFXsGx7lne
 KTSwkvTY.CLmJU1kAh83Yx73uVZmMcWYVKPS.qHeC5vLBOupsRrGqecKavtMH2jE8gk_bLWAn6QS
 6dg2WaNzZ8HxftB8qK.I7Nfb7RRGBTOzo2qZEkBcOKjfx2tb_mzEKcrKAGKRhijLVqvGSG.gnxk5
 IbJDyT8uldviB45rX5QLk1hTd5izJGp10mIifeqSuE3ajxujMIQCmPgpIo1o4yhz3FcwuyPIHgSU
 AMczztchu8gYC8P_jRTfx6S.3vtKvPZwGbEtxQ76.igI_BHZQq096MzZcziikCvUfuTg34nuUqeO
 UcrwHL.JdlqnXzrdvWmiPEcKJMioTHTvBfTCRS88_ht89sqEoJNQJVFvdFuu6KWvZLgFIfB6GAEq
 kpC5bEnyGYPXXVFgYk4bTN9OJxzyCJYVtC0CMVLWEwT_tmCkyinZwYh7adB15LZ36Dgt22Z2Zhri
 x255uPbZNlBQOPlxt9jGNdwGx7lqcyqzEsoLfOa0BDeKi9f4zolDUsfUkToa9fK.QmgfY3LduKs2
 VgwMy_R4QNwrlGkKDeoWT0DgDgrh3a0fBgpeZks7cUVUQ_gugi3eIikS1_XUsidnleb_kqHp66qb
 4YkJ58OiLR549U9HBvLu5eCMBCpWGZTjIkDsYclILROHCCOvZI..6WGFR7JIC_Iagx1aGkwt4coA
 V6GCkPnI.SBBxstta3I5N8j_wOHw5a7gemCgboskHEZLVGBu7YWUWRuTj4W_nr1jQm7bMAv4T1Sq
 xMaN3E5dxSWMvllHgaUrSla5JcotMVPvX0I1OV70p3okkC312cmvERlhTD8.dvT4cnUxeUQOaKYR
 7aAPUAIQVfLZaa3vcXw5QLZbB7yCPSgwhLsu27HwulDPAxnDhUXxbL.hoqLzNRzRLe_ihfHaPJgB
 vHIi4LHgEF6Wb5RMUNNVCAwLyUFBqnx5QNBKQ1MVw.lw2IogZk2EdcRYOyPId9UlI56k_AJjZ3wW
 362s6JZ7SmpZa2lNsk9mtESx9_YBiLBIipNoTaf.cWKgvHwgoUTQqqKat4kzjBOPWZxaoyuO4jn4
 j_JDfmyGqlbCY9BjK0.r1rVhDIW4hX6fuqtxmV_Qnvtg8ImH7YoRcZ7cuf.lv9WwYbaiMPAe9RSZ
 46P2Fr3XWYFJ8XIzxwDMn94.dAOVHPKr8E.ztVrjhaQOlHuXP9hznq.VxcEsTZkv8sRvNY93iOd.
 Tt4KvTWkDJlHLRPvzHKYGtSw42Su0G5E2Qwv2V3guhRVBQ2wsQEJjDhoC7BfMbStoIvhomduxx9_
 Reo3W54uWHnQim6tXpiWFGTXkyy0Asyx4QNN80wzwHp6XmvImwzZzl03Ev_tJ3u9_oKkkKtTrWHu
 mHfHytoS4r8wN96dS7LkzRYTrvooDbElJHZz_Tnkx7NLJFLDZIp41Ok.CvKRdM1H3ij1GmfqyCac
 vg49gycDbJQ4JX1Tr.vpGVhd1udkijevIZGbr8okqRlZd4zXt0F.rpOEz1QTnwa5iqOY.LtDaQeO
 Urn0R0btq_3sYHezrnP6AdmdfNwgCYcloJul0sHDeoS8hzc98E2e8VUBlExURxA4HDl.Tsjta4xA
 Q.XPdKcLTqjsEaIQ6FGPNBXLwqkW3Hd58juQxP0ntQ1oUXQmTqKBbiGDdGuY_sj.tT1D2X2HzKxi
 k6Y1yb7l5ZK1Hnc54T2BfstV3hNsbZxuZXImBy5qB
X-Sonic-MF: <stealth3m@yahoo.com>
X-Sonic-ID: 8e0a9245-08bd-4777-bea8-03a134d3e9e2
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea4-prod-sonicconsumer-svc-104 with HTTP; Wed, 21 Oct 2026 11:58:42 +0000
Received: from dip106.lsn.bf1.yahoo.com ([67.195.177.115])
          by hello (SMTP) with SMTP ID 335e7936c2db7179f5b6ae587ebc3b0e;
          Wed, 21 Oct 2026 11:58:38 +0000 (UTC)
From: Ext745 <stealth3m@yahoo.com>
To: linux-media@vger.kernel.org
Cc: isely@pobox.com,
	mkrufky@linuxtv.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Ext745 <stealth3m@yahoo.com>
Subject: [PATCH 3/4] media: tda8290: report FM signal strength on the TDA8295
Date: Wed, 21 Oct 2026 07:57:46 -0400
Message-ID: <20261021115747.1864231-4-stealth3m@yahoo.com>
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

In FM radio mode the TDA8295's picture carrier PLL is off, so the H-PLL
lock bit that tda8295_has_signal() reads is never set and radio always
reports 0 % signal. In radio mode use the tuner IF AGC level instead
(0x28, T_IF_AGC_STAT): 0xff is maximum gain (no signal), strong local
stations read around 0x90.

Tested on an HVR-1950 in a dense urban FM band (stations 400 kHz
apart): 30 to 84 % on local stations, 0 to 26 % where the band is empty
(87.9-88.9 MHz); TV unchanged.  The AGC acts on the whole IF passband,
so between closely spaced stations the meter stays near their level
(73 to 86 % across 100-104 MHz): it shows that a signal is there, not
that this exact channel holds a station.  Seek in such a band can't rely
on the level alone.

Assisted-by: Claude Opus 5.5
Signed-off-by: Ext745 <stealth3m@yahoo.com>
---
 drivers/media/tuners/tda8290.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/tuners/tda8290.c b/drivers/media/tuners/tda8290.c
index 9ff0aa8cb..a070cfca2 100644
--- a/drivers/media/tuners/tda8290.c
+++ b/drivers/media/tuners/tda8290.c
@@ -384,8 +384,22 @@ static int tda8295_has_signal(struct dvb_frontend *fe, u16 *signal)
 	struct tda8290_priv *priv = fe->analog_demod_priv;
 
 	unsigned char hvpll_stat = 0x26;
+	unsigned char t_if_agc_stat = 0x28;
 	unsigned char ret;
 
+	if (priv->tda8290_easy_mode == 0x80) {
+		/*
+		 * FM radio: the picture carrier PLL is off, so the H-PLL
+		 * lock bit is never set.  Use the tuner IF AGC level
+		 * instead: 0xff is maximum gain (no signal), strong local
+		 * stations read around 0x90.
+		 */
+		tuner_i2c_xfer_send_recv(&priv->i2c_props,
+					 &t_if_agc_stat, 1, &ret, 1);
+		*signal = min(0xff - ret, 0x80) * 65535 / 0x80;
+		return 0;
+	}
+
 	tuner_i2c_xfer_send_recv(&priv->i2c_props, &hvpll_stat, 1, &ret, 1);
 	*signal = (ret & 0x01) ? 65535 : 0;
 	return 0;
-- 
2.53.0

