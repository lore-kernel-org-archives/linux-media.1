Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.68.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792711579;
	b=hB3FqyGlgeeUB8uu+E3zyVgRCfGZUFeCHejsySU8c010U4OVsNuGyyu1msNJ3832RB6A
	 2iRgOz6IyBnbKjD4yGXp98aPLD/JcylIjqRjWet9WUm6g49d5EMwtuHqn2Q/z6PL2/RR5
	 w6v44Zr3nk2edaROHZ6iJ14zjW6kD+wxOVeomgPlSylNSVPf1n1srskD7ktHCWlPLxkvJ
	 e+il4oGXTFxbcbdgIbu2v70LiC9jKcbvsKfS4m7rtUvZCWrIeOBcDCQS0DdQhooFLfxb2
	 jKAEDFheUY7kpxNdRO4Iqwh0IOWjN8sugC1FLRPSfX8oEWLEjs32p9c01KUakf6yyJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792711579;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wxhN/UIrdTdpnRk6it2UqoTEzxIuZqfPCuUSmMXl+Zc=;
	b=YAeF+JWkB/a3l0vbtCe6zWOOX5/hw24jB6SFfFnPFzh7gRF6Sfml35JaA+VIQ//YJjtk
	 EU4usmhTX6r8JIYUPrt5ABnTi/rYUAxVH294vP2WWL/Tl63UMhU4POaxV9ymNrNsRmiYt
	 wVjSwgzykjwJrXRs0LeWL4uYXM72zNy+mmUE1l3kCfjzZigCwPwaa2xt+wA5t6jKlLEMb
	 7vDxZDFHG6eyWbwqdmATZPePb+Jovapk+x/xYuhl9NzfhjJHp41W5x9GziPubZzOi6h8b
	 41Q0mn1vcC0ZUUcKwZq+L9W+BStIonMWdonbh7xPgDofewhc4+qZb9+o38eFzPv5HEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=KpuAArR+;
	arc=none smtp.remote-ip=34.2.68.31
Received: from sonic.asd.mail.yahoo.com (sonic-usea4-0032.asd.mail.yahoo.com [34.2.68.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02BF606A326
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 23:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E02BF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=KpuAArR+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792711578; bh=wxhN/UIrdTdpnRk6it2UqoTEzxIuZqfPCuUSmMXl+Zc=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=KpuAArR+J2j8W4XvBw5p+bHoQxNbnJAxeIr8ntP5NkJwOeH0qxVc/NljjUbieSMx7vfGtV1cZh/ETgt9vzcW2omZ94OearQ5QxPHEg2I0H3czG7HyZROFYG303msoeAKkTX/ywpG64+huSf5JTOZiZt+GwAKQ337biOIZtNOMIp8NR2dmNealgaaQG1F4BrrLxZyt/NlNDMyhQZN0QymgkLisNWz8SN7/Bu3sgvE0UpMEsiUd5PrM9pziK4JemKYiGYM0hnuebRZNSV+7Bxomd19BpvYdqmbzWH31OU5SqeeBvgwGCM2znq9luBwtIFdpKSp40FxB9ZiRV8+DvRLYg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792711578; bh=6o7WzaJ55VQg6U/+6KiUFPrmphc8nbvtZWhYoyQQhlN=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=M7qAoD0Yc+XwZY6vGX5is/KVGLXHYRFaoJ71e8//fvVnLNbwp/fNfP360EnhEoh3bJ5Ck4kK3k87ugEkpOBcXHRIZWliJXrkKlsGqDn71V63ZTsXc4fj7n+327Afh6HEmKCz9dQUFCZmVYetAIjDz+WnlbjdMvHzgE8BIvBi8bnSMvrkJzgO+AoMvdLX3R2lhtGYOQ65z5iSbg9jrrbAuyxZcgr1fU70UnRgZPTSxDx975vS+0KpCJ1nom+xU/nQZlJQjzfpqnwOIR4OhlDu58ihTyR9jKb+b5KpOnFnsi67VM+lNClaF+iYNQt0QDgewAxhcJFoA+OgzfAGNetmbA==
X-YMail-OSG: dSJ._fYVM1kATjwtzbs1j7jXzAKmH1ZzNwdFELQ2HzXK1WSxFyhVQaqbdp9Kpmv
 vcG7dM1eXPn3X6WiOo1Lh8kq_V0hZYCMOOzu1uTSLtqpgIqGuk6pTkNVwx4zh5b0BwFt45ZY.yTa
 LzqPA.FFr8bUKQ0_nHN_hWH7Pk8oPNbRbQKygHKWDl01jJcV5NJugBnw4qFmFkFKmgPN1pm.3u2o
 VGpxk3q2S9UpBJ4Ig0SRVWliE1r167_lXLv46N_HhSR_7qb5ZgESlZ3G7KHpxssGZTTn1o2MPQC6
 pnEBLN_cfHsaZqmICCp_jwEohDYmVy6lySY6JznqjxCqT_W_GdZMZ.wQ9EoeC9RBbVM_d2PUwyGI
 Hz..QpdThf7vvqUOL3N2QIU9TGshVAfuOAZulujYia6X3SxXH68NFNZ8Xx10T8F3aeqqQw9SRkJ4
 N41H56RS84ALT8HQ56iK_molMJG_Ce32A3fPGGRBk8HbmWnzmXJyiFAnHLCXR0glsmoJ1ajbMuY0
 OIinLNvd1RPV5vxOY2gBEYD.jwqVF0izq.xHxJYICnD4pQH3Z6XiqwSmKLV8DP5D1SWVHCNISA36
 Sj6sIsQ_2E.ECjuO7OUyzhLKTVhz9fzlmKbJRsxypMqfB1K3E2nP87ywj61bwBRcwyg7n04iQ_Ws
 kzu.45K9hBfmw7urDL5BuvipBRP_Y8kKK9hcQ4dXmmUoknHhQgJFiWvpyX8XI2hn.PZ1sO_Qm625
 79RE_d3akXDl9dMyPIXXAxKhK60KrB2wj_LPMzuacmgKmOVROD7JZ_fcoHRflHMgatJL9fa9A_RX
 bj1FtwOMrjcf_xW8tpfz3bYkZKGug6tY4fxqdLIp95_3ByTOMqTKhtRM45RC66synzgvydOoFBLG
 6NVrmIzj8YOXdw951zT4SgwrzaAa1yQaiZKCYHKt0xsYjcCL3hNrqdVT3TEWatGzd4kJn2rw2do_
 UUprv4qfpRRiL1JuLoZ1dnS.weK79B6SD0_.ro6ujyJ3mQZg71nNIFGFar1PomKszpTO2U8cB1XB
 9Q8rjdIx7fQ3dZVNvqFYOo9KdVTva46Hv.En4_ZxeeaBmJBrA8ZTr3QQp3uretyLfjUl3R1Cqbz_
 XHacG7gLURCy95lD4C2.73LJGNfq5241hlxifZmS6pnMaKGzWUee_PAhjdMQ4jOOFJmlULhJEO7K
 uURg50KD8ToWWq_XeT.EaAkJ7S7MKE0tBlD2H7wDodiJWWzUxgPlLdgty1Ftl0rwIAAgEBs5Em24
 G2hCBoCRZ9pAL4UR10ZE2_4i7ARCDrxQRyfqgopxg6_R0AWOaj28LStZHOoW3n.EOWnfQcRbrb5s
 E4GvmDiB8jXAcvJOfQZWmU8u9BypQBTdoqTdIgWyB7PvkOfCDwOgQyWXigOdJprkmT_L1KuRUpHo
 q6rJv2Hsg6LYA_HceptJgjFJ4Bbg3_Gy4.MTno_XD1jkx9T.wkuoORuow6uMZPh_8CeJq3EtWr85
 oNb5isrYIeqQY7rVAWk2e.shPzIMPlZGh9UPWZ98UTm_Xd.XFTqwpvzIamB1AJMKarAt7YpRHAXm
 s18GUf9ctcfe3xzgYTstQHPihyZdiHq9J09C9wVq5Z7GNR.hGy1BTISeW.WlitGAzyz83bfiEiF7
 r1_kygjyMhpTAtiAApY_.dZgamvtGZu9ci4pl9.CdeJ.My_0hWzQfYmSQSfSTj71XORGQN85ccdN
 7ZGiTjhIPmNw8QKSWGAWJi2Dcu30gs4ZFdB50rm_SDSgvd0yciYGQMA1s0rxmZ_f.G7RgFOZcdFR
 ta67VGlKsCkutXqAsfbajOm8H8zgwwwbtcYE4vluuBUJdiE6PL0jknikTtRzVwtIkW5.05cmJpEd
 2lZ2o0XaIuuxTZoiov2hxfpFYbjFrFUyLHrmuLkhebKQHTcyXu.Gxubyet0bVxJWU3a39wQNd09J
 ZQ6YN8seVmbejuKur6CStKAamksW0mEYNjgMptsyRp.sz7cd0x2ismCDTh2SBCxRlNqSW25MJU3r
 CrEsDM30FLOQ.pwB6qCnpmu01rR0S6Fv2pvVfotLs7Q--
X-Sonic-MF: <stealth3m@yahoo.com>
X-Sonic-ID: 409aa880-e22a-4317-b09c-8907213e859e
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea4-prod-sonicconsumer-svc-102 with HTTP; Thu, 22 Oct 2026 23:26:18 +0000
Received: from dip117.lsn.bf1.yahoo.com ([67.195.177.126])
          by hello (SMTP) with SMTP ID 81a0382c6781dfa1b88c965d2a3d9a7d;
          Thu, 22 Oct 2026 23:26:14 +0000 (UTC)
From: Ext745 <stealth3m@yahoo.com>
To: linux-media@vger.kernel.org
Cc: isely@pobox.com,
	mkrufky@linuxtv.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Ext745 <stealth3m@yahoo.com>
Subject: [PATCH v2 3/4] media: tda8290: report FM signal strength on the TDA8295
Date: Thu, 22 Oct 2026 19:25:47 -0400
Message-ID: <20261022232548.526232-4-stealth3m@yahoo.com>
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
v2:
- return -EREMOTEIO if the IF AGC read fails

 drivers/media/tuners/tda8290.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/tuners/tda8290.c b/drivers/media/tuners/tda8290.c
index 9ff0aa8cb..7441a5872 100644
--- a/drivers/media/tuners/tda8290.c
+++ b/drivers/media/tuners/tda8290.c
@@ -384,8 +384,23 @@ static int tda8295_has_signal(struct dvb_frontend *fe, u16 *signal)
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
+		if (tuner_i2c_xfer_send_recv(&priv->i2c_props,
+					     &t_if_agc_stat, 1, &ret, 1) != 1)
+			return -EREMOTEIO;
+		*signal = min(0xff - ret, 0x80) * 65535 / 0x80;
+		return 0;
+	}
+
 	tuner_i2c_xfer_send_recv(&priv->i2c_props, &hvpll_stat, 1, &ret, 1);
 	*signal = (ret & 0x01) ? 65535 : 0;
 	return 0;
-- 
2.53.0

