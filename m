Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966249;
	b=afxtgC8Ef2iN/R0PiVqqqxSVnhGbBLnZfL45L9oV07SZ6iOsIYvtVzXqxjECzZfuPpY7
	 AFW6yZcJm3bu0R6ka0VdU3p7oi8eiTdwuolzDTIo1XnGFeIMSORiq2r0CdmK78410QV4i
	 IQaVC5pTBAZdTK0HF911m2R1C1GCPFs44pfQKGX4c5JAnSwab3Meb+/zQjMHKYUPAcBxp
	 2boXh3tyAyVWnKd2MVEIits6gSy2wBpG9yAqFSD9i68UG5cjOIUVTq3XgejOsbd1l4dSS
	 I5teyzAq+FwX7pmhuLyTX6leReyjClYgOwbw75zNoLhkxpE6wCJb9AmlP3/lO0B35/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
	b=SfKhCl4sbsgA9vdsTEp5RH4BJJg53J01EMex/WgBgURD1C56fioK7YlwqMQFCmjLZuGo
	 QDsBF4CJSwp4dIwCic5yJGeKdmeYXbC4mxoLa0TyWSEIZK0+UyRLJAcj7SvPqUy7WMTmW
	 WrTUhIBXqd584ojKiwdw0i50x8ITHx0ypDkBxOZSm8vc90HENDdGepVkPtcGoXp/yuVe/
	 SoSKZquCCZVNpmTKlE0urQ7S79r2jjhI3s1+vZsqB6W+tZWPaqCTvkXBaku68261GFAZC
	 B3vFRIkNXxzWu2HD9Ug0lm2tuC8vcEnXXp1Iew1/NoraT2PsBZKpaFBXAsVCNy7Z6NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="srOS/ykz";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9976606A31C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 01:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9976606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srOS/ykz
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-381f65e4e4bso861101eec.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 17:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794966248; x=1795571048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
        b=srOS/ykz3dSNDqloWipBs4oVtUh28EAQMJKnKgDd8CzAWxxgw3VwmpdbwuV9izrH6V
         EKmeofezDel53zYmFKIqBqqOEzRzUq+PnqQ6WMkJs7V2XP6JQ9f0xUUaALoCFIcrzoou
         1Lu+daVcNyTQn4EkZE5eGAXVLINlUevDoKNJtt6haz6dV5XeyjHBww3zJqFap4bfFAfJ
         GyzqbsJB+0H6sn0ZNbl8oQlmd/B+C1QLHM3qCio5Zzmdpl5uKQgtBAycq9PqCDCwgMYF
         spSih4ZD/vogfvA1WTsHH+XaSn1eg0FGnxph46w6uyGDS52CwwGTTJ+iMPdc5QkuoaGq
         PNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966248; x=1795571048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
        b=GUWR+j5dblrSKHdmtxHxVLpVDd2OCrwr+m19LVgOu3v9JkXIq625TTOnAflFx6w9tD
         Bj5GXv1mkkLeTl2LMEUi8PKUQChKXIe2DBILHFIteN6AQNB0HRzrn2aW00eNf+PQ7THi
         +VsZ5hroKWajDPK87+0ixltSyOueUzfetvjwybvLTN23+QAhRLhB8gt5pjUtNR8qz/Z4
         XWsCNbsmNGrU26DTakNwrCiF8gsQz4Ryhf5TasYRavkbP2Oag5ux88DSaBz/XfS9pYgc
         5O1do4Q4kr3kZB12WQWXBzk8e4Rfdeiiupxx6Pq52c5xvyHW/d6xKOA0AssltU4PDm9C
         PCqg==
X-Forwarded-Encrypted: i=1; AL+hErHlfuoqtDb9rwIKmRV61ZSFIHgEyFhSMUEsnqsQ77+peNZKWIrCVYTAYs7R7CUxGse4mWm1u3TvNHoXtQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8DavFdywGF+rKEPJV+pDtLPToO2pbqWoFbHTNn35KYCopLTb/J
	cIg07xaxulgRY7wOywe6RyuLCsX7u/4wNCAfhKgdkG9bxoai26t7V6wh
X-Gm-Gg: AZFdTZf5D7scBmW+ado0sHslJ4pp0J3BOSxH/S7kdzxYVovx2voQ36eVVq18peDgYqW
	y8X6iBhCkI1VoHf+J1bNVAS2qqGAFBDveKnEXtGXnyY2H/d5Us0JYR9WXcuB2hgthi9yY+DPQS9
	0M8GcZV35yK2Rb0EDUM2n0Ll/XBJ2Pit0xi06l3d2ZfsrwOW1Nb6NvtAf2c8rQrQw5gFbpM3T3Y
	v7UKn07pnnuKr8dkZmhesqm/yIAXartZnMsyEjE0ZQYDgislG4ggTmD1/5GWyUdWcbjGEq8Gdho
	bLLOa5aVE5WsVaa6qdEBQdKUs/mNrXDauo0egzjE7b+aH5j+z+8By/oFxg3pall4j/ceina/BVW
	d8PUjvwugazB3Oh56R92Go7QhQb6L3gT3KHgBNfB0xwuqvpCXL4z5/8cdO98xlARhb369WiPNIZ
	JftmluV5aFPUq2HdGfQ7hGF5DNfh+UXX8Ch9e8Jn6+w7KIfqr+bFaCcnJTiRDh6Pt/8riNk10jP
	+61mJijRcFm5eeGmSEslZXGc6tHXY0vMALsBJiN3XJvmnHL36eFLiPiMUPO5b0L8q5NiXqsP16j
	GdlC+c8vqZa/kSQzlxMivMWj/9FNKTwGvAXnoNTRLOVo8FZiXEhKOIuvwJY=
X-Received: by 2002:a05:693c:69c2:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-3828141dcdfmr960224eec.26.1794966247812;
        Tue, 17 Nov 2026 17:44:07 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm2157822eec.24.2026.11.17.17.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:44:07 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulo Ravazzano <paulo.ravazzano@gmail.com>
Subject: [PATCH v2 2/2] media: i2c: saa7115: Guard media_entity_cleanup() calls
Date: Tue, 17 Nov 2026 22:42:35 -0300
Message-ID: <20261118014235.419385-2-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118014235.419385-1-paulo.ravazzano@gmail.com>
References: <20261118014235.419385-1-paulo.ravazzano@gmail.com>
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

The entity member of struct v4l2_subdev is only defined when
CONFIG_MEDIA_CONTROLLER is enabled, so the unconditional
media_entity_cleanup(&sd->entity) calls added by commit 6787d5189e32
break the build when CONFIG_MEDIA_CONTROLLER is disabled.

Guard both calls with #if defined(CONFIG_MEDIA_CONTROLLER).

An AI agent was used to find the bug. The correction was done manually.

Fixes: 6787d5189e32 ("media: i2c: saa7115: Add missing media_entity_cleanup()")
Signed-off-by: Paulo Ravazzano <paulo.ravazzano@gmail.com>
---
 drivers/media/i2c/saa7115.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index f4015f113..32c526df1 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1868,7 +1868,9 @@ static int saa711x_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return err;
 	}
 	v4l2_ctrl_auto_cluster(2, &state->agc, 0, true);
@@ -1927,7 +1929,9 @@ static void saa711x_remove(struct i2c_client *client)
 
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 	media_entity_cleanup(&sd->entity);
+#endif
 }
 
 static const struct i2c_device_id saa711x_id[] = {
-- 
2.56.1

