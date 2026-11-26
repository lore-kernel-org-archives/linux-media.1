Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672618;
	b=Y6T9m4g2rxJogSvuxUBLjxwpg3Lh2tbfrF/CcIMgT/jZNZzz2vOl/IqDtuHNgOv5wkIJ
	 iLaoug0J+B8RYsHGn0WeBPoFk3lmAbK4rufuLcXsyXVR7gngsz23xFnue82dqcZAHM7o9
	 jjvth4X9n6tWAi11uiMAB9MuersKDrqjDMslUMnWDp1NbXzTeWKMIIRMwhRnOKzgIlPMU
	 twMfJxrNmHQDynK3XKZWfCzD43uGnEESO65ldZiPlc29hfZ7LWTLDOubm4kJcRNzrvaz2
	 eF+Q5xfkgPyGG6/Am2L2kFh9hSYX94Dv+EiDO+9yeRcM0UDV2TjZw3EwqBEIY7NtwaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GaDF/oabtnPz5CC+z3Y48KsX5H9ec5sap3k/VVqc69M=;
	b=QOSBVhGvw7qsXmzo5rBh4YFUJDbajI0eymakUUjlk2x7VLQ+sR4vufjztAz/PIEMqwfT
	 Pow5c8W8LnmPB+TO18g046C9NotdGC0cgJNM0vs+gbaMylQHmKIAZKkN0EFnU2tqco4Mp
	 OW9H39AMMoV4iGZsyO5eFtkXuEd2vp3g7D0X9H6wzz1oBTVQKRX1p9KdjHokIx/btBl1D
	 arKSe3Dfxucb9WbQHVw0RiVrCNIq246QbZHKU4q5aLw9mbWtKo3/7FpI6GhV+rSEKdVQb
	 GgI1rRt9NLwbUbWLXqQ5Toi4sx0DRTx17QQDWk0tOPxQGa7W85zAv0xN4wlrN6fHPnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggdGyTHK;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DD9606A321
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 05:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87DD9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggdGyTHK
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386ab9ab619so8598699eec.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 21:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672617; x=1796277417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GaDF/oabtnPz5CC+z3Y48KsX5H9ec5sap3k/VVqc69M=;
        b=ggdGyTHKICLNcWcMun1QBSRIj+w58Q8fDLAGuRoUVpqWwEYcJl+IxC0paMlWlrjzj8
         LkGy2S/7LOjq3cxbx+Gx8CPb9F24aCXiSNacF5N/VuvMLIc1qGO7kNqUEymVtJSVrYrJ
         btK0pCq7u4HBVGSiYT9T3NV7J1umh28GUfrkEpmjYVo8itfIZXcSOcfu5jRvnrPrCy3M
         7lsAwtRQ5AoUCgB5yL6MD+Jf0lmHeydBFXU5tefO9XjUv6B9bArbtDfpndnB0S5UwVHY
         T4ppcVXwvo82LuNSccQTzYmIEw9SH3NGX0WteqaLndZ3Rlka/hL03DlUiqyvgC8n3w1e
         Hqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672617; x=1796277417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GaDF/oabtnPz5CC+z3Y48KsX5H9ec5sap3k/VVqc69M=;
        b=AknCDMbzS93Cq0ow3xQNhrP6TpgtiXRZ7bf3lpYs9lQQtSejdwCt7Am70gcH0oQz+0
         n5uWESyS343PCQPYfh9mRTqDFBROtTmFsvj1qFxw/Xrj9tfpAvdm+5ao+bBuh9KmLD+L
         3ltO1bJuL14K3VPqbkCWhlbv0sUKGYOSnhA0318SsHhtuwduP5pAyZfc1HCr1fSNxpt8
         E0yxsS8ELhiDLDxRWzefC8PRbe7Z91QAHWJgP2hyI8T38BvfRY5k3G4Qh4ssFtXm9GM6
         qlmCu1WCV23OmpC/q7FetoKGlwSU8MZFJ/W3gW3bv9T84eNI+GB2wZNPhUcnK/3kR7El
         8tDw==
X-Forwarded-Encrypted: i=1; AL+hErHwEto4LeCkvMgquZwcGtZF+mLNXYdGI/shP/rika4B2EkJjyusonGv+HpGdiZyTaV0fo6CPZguI89BRg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9vMC6Rs3yQWmNw21nRZRkzj6hqdAcK8Mxr11bXI2pJvXr8kXh3
	GDPHfS2O0HSNdg3CBHW1fScBZKnrmQcgisnNlGLyZAJA2mcbIEQhyOI=
X-Gm-Gg: AZFdTZdJlqozB46XWiNsdWTPX/dkGZRA5/QKeB7+8h2SfhrY3Ji87wRL3FAJhFQBv1o
	TglJrP2jvnsdp1WVvlmjDBJVqrzY9xAHnOLDvMuimukUvUfSc4mDFN7/Oz6JWXZKotH/Q6Z0fs8
	zdX+WBO//5FrdcVS4497xIycZWbyQ1UARBjFaHUYR+XVHGv0b1Quaat8gaCuQutGKMO7GEUke0j
	AfhpL4g7mrfLXzeSIb+rZO0XMjs33/6OATF749oOUzT/9Avw/UyczECFAzKOtV4MqFhrfs7TxhY
	oOoErV98uZ5ZAFHeFam1GtUDJfEe7KcwwOb0HnSah3LUBNlnoqUXeHJX631FamNDPiCHWJ102os
	5w5MT1YEicvH3JnJ9F1kPI0OCGAP6jUjjdJeJqgz3S8C1Cf2IG6t7/Gn54ku+uIUDM/w9BrrFnA
	Gc5knm8c8FGia7QoQE5hWiqMSq1k8T0JHR4WcrGCpYA549PYswfrca+m/3S/kx0cNDyRP9e6bZo
	l4izOz4Qdq5CnTgyPcVFzIYaAVaANooH/lYAdAfd67xQfJTZ4XpauyE1yvMj2NdfOYL7Ennsp5K
	BbuP/GoLFybbiK54qXrB10PogvLU48RNiBJDJUTr+cAiRNxKfwxmnoXF5TkgXazHVzE=
X-Received: by 2002:a05:7301:4201:b0:385:b8f4:755d with SMTP id 5a478bee46e88-385b8f47ad3mr20537639eec.20.1795672616579;
        Wed, 25 Nov 2026 21:56:56 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm57523404eec.15.2026.11.25.21.56.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 21:56:56 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: tvp5150: Free connectors on probe failure
Date: Thu, 26 Nov 2026 13:56:51 +0800
Message-ID: <rc-b1-20261110-vc-28-73976feaa334@gmail.com>
X-Mailer: git-send-email 2.50.1
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

tvp5150_parse_dt() fills core->connectors[] using
v4l2_fwnode_connector_parse() and v4l2_fwnode_connector_add_link().
Each connector then owns a label string and a list of allocated
links, and each link holds a reference on its local and remote
fwnode. Only tvp5150_remove() releases them with
v4l2_fwnode_connector_free().

Every tvp5150_probe() failure after a successful tvp5150_parse_dt()
skips that release. tvp5150_mc_init() and tvp5150_detect_version()
failures return directly, and the control handler, IRQ and
v4l2_async_register_subdev() failures go to the err label, which only
frees the control handler. Each such failed probe, for example when
the decoder does not respond on I2C, leaks the links, the label and
the fwnode references held by the links.

Free the connectors on these error paths, as tvp5150_remove() does.

Fixes: 0556f1d580d4 ("media: tvp5150: add input source selection of_graph support")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: arm64, GCC 14.2, W=1, CONFIG_VIDEO_TVP5150=y, CONFIG_MEDIA_CONTROLLER=y, CONFIG_OF_DYNAMIC=y, CONFIG_COMPILE_TEST=y; no new warnings versus the base object.
No hardware or runtime test was performed.
The path is taken when tvp5150_probe() fails after DT parsing, e.g. a DT-described decoder that does not answer on I2C.

 drivers/media/i2c/tvp5150.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index c889624..efbb588 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -2158,11 +2158,11 @@ static int tvp5150_probe(struct i2c_client *c)
 
 	res = tvp5150_mc_init(core);
 	if (res)
-		return res;
+		goto err_free_connectors;
 
 	res = tvp5150_detect_version(core);
 	if (res < 0)
-		return res;
+		goto err_free_connectors;
 
 	/*
 	 * Iterate over all available connectors in case they are supported and
@@ -2232,6 +2232,9 @@ static int tvp5150_probe(struct i2c_client *c)
 
 err:
 	v4l2_ctrl_handler_free(&core->hdl);
+err_free_connectors:
+	for (i = 0; i < core->connectors_num; i++)
+		v4l2_fwnode_connector_free(&core->connectors[i].base);
 	return res;
 }
 

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
