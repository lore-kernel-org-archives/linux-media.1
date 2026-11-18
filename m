Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039664;
	b=f4YoxNJNd+OPa0L8mwg55Vi+37EDvo8fg5Dx37hIz1ARys6f+4SjpS0YAJXqvt6si60U
	 gPjPI9YGdxLxinhaxtAgppqZdFQikDY8FsTOk28LKMX6HPVsSE3q9zKN3A75sIgtgDHmH
	 LMUyyDlXbdSdAObYHZqN6WwlraSEQZV2LSJikUA6txBj/Vt3hGbl9Tz+kstzykAQhSbfZ
	 hcc1rSi8EIBKQ/Op8EwGXRQ0JVphstm1zFlEJ2E7ZwDEYk+nWCOlr9Glhx7cg9yPyUDlt
	 1hogjC0DITv6rS+7xQ5y/E1HD7gCNMIK5AvOsxwCObZ7GU6abAPNDKrTFojQr6w9xkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8aEHZB7EqKIg6JAblchur0wLhe4h5mRiTbmkDXl4jHo=;
	b=CFkiNNmjSNk0+PB1MrDsiBwjTGlIBdCGVO5T1gWFI19autpU6KDeAJfTavF/TArBWTud
	 LHmgSF9J3QGibg9VsDBXR/YYbxSvSY6DTBbl6FKMrIwCpx+qT41/ZPvXWW0tp16fR1e31
	 0ZKv+Z6Zr8MqeJUaZpgbcPr5yUEfcVLxmIEvow+M5Mn5DTxogqQoWjEOUcN64E3Rch3Cu
	 uUMka6EZSqtK2Jvxhzo5NL5BOixuEZS5Rf83B+kihxWsB8m2HHL+C3UTxx8B5JyDrbISy
	 MqOyDNBumM95S79FhWlZwZgg11ABrb2Z15wLq0ZE5dPn8HB+kMeN73Mn7cww5iUD4xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caKU6pmP;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AEC60A260E
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 22:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8AEC60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=caKU6pmP
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso741462f8f.2
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 14:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039662; x=1795644462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aEHZB7EqKIg6JAblchur0wLhe4h5mRiTbmkDXl4jHo=;
        b=caKU6pmPXY5fhKk39Jp5MQNPtcDmypoXOlEKwE4dYEuo5oO1RlOvTjsJdmeyCs8ks5
         Ce6vH1NmhW2q+8fW1yTtP5fzz4xH9jfsLa5RwKqxfccmOgbtoAVDxdtsUr41/mKa+8C8
         ZWhqSp0QxG/RD3FqM61GwGWH46ztEd8KLLEh1XIfVX4IYzJ6gvHKI25o5fdu2akal/b2
         VXPMHMHvCI5AjFEmg4bCz+EmXf8ES0iy2XzmVYKGvIjxIKliDTGXeQLn3PczkNxxwTsT
         X9DKQSvTBrLczGhFYb8szVPY7W9zFnulLS8/ZZ78GZWBAup2rdNNOpHuWbgr8CrTFKUG
         uWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039662; x=1795644462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8aEHZB7EqKIg6JAblchur0wLhe4h5mRiTbmkDXl4jHo=;
        b=GBHahYNlVbxGWb1tnrT1MMKms/G1N0Ut2vIYmZYCAGmOSp6hFMqjAjXfqNoR8zykaK
         SDW927Ttu1PIzXeXrt4LQx+e8InSEPmnnn07i4P1NP4VmdZ9tSPZBfHyHdohK0v/HGav
         A1qVPIdKz6g0EnjU/Aa+lfAYuEjC7PUuD8/GIqr53dglf5n0JaYv7GzZawUqoahPx5kD
         N9IORZuPTqAS5kcU2tMOEHjPp+QGQ/1lnF+CXum2qPOLt2X/xF4svZAfx3tkk3aJaIKo
         ExbHkle1Y5T5v9DYNyCnrDd77Fg9KWrgcEvRAudjAi6QiFKIczM5aRHQMrgA3GthRaJQ
         rA6w==
X-Gm-Message-State: APuU4Z9CHPAwT0x55i8y4DcE3OvoqWWvUjfDbxjwBjRa34+I6clb/Bvv
	JnxR6XpPRowmj+Sh0jLwImdduAjhxzQrpoRZd1cMII6bxbWLVVQlYYHsh8HhAN0k
X-Gm-Gg: AZFdTZdeO76HsaMd1fklqXpaiNndOyzJ06C/5zIEsizu9Tt+c0rLdljbq7N4j65jmj0
	go9RNY6h5A+icYLASiqDU+Gh48kKNmbv47SNbgulB3XfqiKg0sHN36gkVwvl2EbvJoqWDqqPtZf
	o8Z0wx4+msFWwRwYDS+dcBfYpZumZedQ9FvYigKh31bgyBNvquHSuy969WXhFKCDKf2Uc/ni55F
	jSpHqN6fqrjWCnejsvrm5x7c1wX3NHWnj2EPb1j6QGDFtpp1I8ocrp7q/BWFrWKuji9tt36ABsA
	on25387rRduM7zTZsrCvc9AC5cRSHcgM/YyE0qxQS6LoBnsStxMHuoeND5Lf8zi6IYfVAQlv4/p
	FHkCWGGHto69Y5Dw90ZZFaEkRB8T/iQoBU9ymmh9h3Pogqxmy4zSbOTax3NO1O9XFLInEpG/DNX
	shplgA5n1SkCD3xnh9S8GNqYpg+J2CcEqgD0J7myKnDYjN0WPy39KpnT6+5HoXy0ddeC+xd4Cd+
	V0n7Ht3haNFyz4RlxYeRS5/89476BKpl9+0UbQ1gj2qXH8SCYC6CvW2WHEUTAPZktHlXcXKxvBc
	ZKpCRE3AxsIuNTFIllB49fPi4JpgrSYEKhsnnNBlYnjTe/IX/KfzxjYxZF3z9N2Q8wPuG8IA
X-Received: by 2002:a05:6000:2a88:b0:490:369b:f50e with SMTP id ffacd0b85a97d-4a63984c073mr7179459f8f.19.1795039662145;
        Wed, 18 Nov 2026 14:07:42 -0800 (PST)
Received: from Enricos-MacBook-Pro ([2a01:4b00:b82b:de00:c5e0:cc6:391:83e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3f7sm7541073f8f.24.2026.11.18.14.07.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 14:07:41 -0800 (PST)
From: Enrico Lorenzoni <enricolorenzoni59@gmail.com>
To: linux-media@vger.kernel.org,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org,
	Enrico Lorenzoni <enricolorenzoni59@gmail.com>
Subject: [PATCH 3/3] media: cxd2880: lower routine tune and L1 messages to debug level
Date: Wed, 18 Nov 2026 22:07:32 +0000
Message-ID: <20261118220732.29246-4-enricolorenzoni59@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118220732.29246-1-enricolorenzoni59@gmail.com>
References: <20261118220732.29246-1-enricolorenzoni59@gmail.com>
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

cxd2880_set_frontend() logs two lines at KERN_INFO on every tune:

	cxd2880: cxd2880_set_frontend: sys:16 freq:...
	cxd2880: cxd2880_set_frontend: tune result 0

and cxd2880_set_ber_per_period_t2() logs at KERN_INFO when the DVB-T2
L1 signalling, the PLP information or the BB header cannot be read yet,
which is the normal state before the demodulator has locked.

A channel scan, or an application that retunes often (for example a
media server rotating its tuners through the muxes), therefore fills the
kernel log with routine messages. None of them reports a problem the
user can act on.

Print them with pr_debug() so they remain available through dynamic
debug.

The two set_frontend messages have been at debug level in an
out-of-tree build of this driver on Raspberry Pi systems for several
months.

The change and this changelog were prepared with the help of an AI coding
assistant (Anthropic Claude). I have reviewed them.

Signed-off-by: Enrico Lorenzoni <enricolorenzoni59@gmail.com> 
---
 .../media/dvb-frontends/cxd2880/cxd2880_top.c    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
index 4daebb7ff..ca101b51b 100644
--- a/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
+++ b/drivers/media/dvb-frontends/cxd2880/cxd2880_top.c
@@ -825,20 +825,20 @@ static int cxd2880_set_ber_per_period_t2(struct dvb_frontend *fe)
 
 	ret = cxd2880_tnrdmd_dvbt2_mon_l1_pre(&priv->tnrdmd, &l1pre);
 	if (ret) {
-		pr_info("l1 pre error\n");
+		pr_debug("l1 pre error\n");
 		goto error_ber_setting;
 	}
 
 	ret = cxd2880_tnrdmd_dvbt2_mon_active_plp(&priv->tnrdmd,
 						  CXD2880_DVBT2_PLP_DATA, &plp);
 	if (ret) {
-		pr_info("plp info error\n");
+		pr_debug("plp info error\n");
 		goto error_ber_setting;
 	}
 
 	ret = cxd2880_tnrdmd_dvbt2_mon_l1_post(&priv->tnrdmd, &l1post);
 	if (ret) {
-		pr_info("l1 post error\n");
+		pr_debug("l1 post error\n");
 		goto error_ber_setting;
 	}
 
@@ -906,7 +906,7 @@ static int cxd2880_set_ber_per_period_t2(struct dvb_frontend *fe)
 						CXD2880_DVBT2_PLP_DATA,
 						&bbheader);
 	if (ret) {
-		pr_info("bb header error\n");
+		pr_debug("bb header error\n");
 		goto error_ucblock_setting;
 	}
 
@@ -925,7 +925,7 @@ static int cxd2880_set_ber_per_period_t2(struct dvb_frontend *fe)
 			(pre_ber_rate * kbch_tbl[plp.fec][plp.plp_cr] + 748) /
 			1496;
 	} else {
-		pr_info("plp mode is not Normal or HEM\n");
+		pr_debug("plp mode is not Normal or HEM\n");
 		goto error_ucblock_setting;
 	}
 
@@ -1087,8 +1087,8 @@ static int cxd2880_set_frontend(struct dvb_frontend *fe)
 
 	priv->s = 0;
 
-	pr_info("sys:%d freq:%d bw:%d\n",
-		c->delivery_system, c->frequency, bw);
+	pr_debug("sys:%d freq:%d bw:%d\n",
+		 c->delivery_system, c->frequency, bw);
 	mutex_lock(priv->spi_mutex);
 	if (c->delivery_system == SYS_DVBT) {
 		priv->tnrdmd.sys = CXD2880_DTV_SYS_DVBT;
@@ -1112,7 +1112,7 @@ static int cxd2880_set_frontend(struct dvb_frontend *fe)
 	}
 	mutex_unlock(priv->spi_mutex);
 
-	pr_info("tune result %d\n", ret);
+	pr_debug("tune result %d\n", ret);
 
 	return ret;
 }
-- 
2.47.3

