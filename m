Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966245;
	b=PWOpS1HWDoI5BN4HLsBXtwJw/xziKr/tx8mfa3ndJlZqDtRfSLRT5a6scJ59eLMYr2Fq
	 G80jEEScf2KsBAXireMINIe9cRle615BsuBxzQqvLQqKJuU2plalpysvnTuGOR7zFYqRe
	 Sv5REIoXBHuU04S8zZokEZoNadoUtAaugctxjl7co5PtaVqpeHGA05uYolmZim4Y/oEPw
	 zQzGa8n5yGnSBdFjS+0908QQzzVLUv9Hjjrj5wVE1u/RVEwCJXuxe0vnyv4d38PdM0tWw
	 +BIPsmI7ne7SGpDyZgWet2XNB1G2GiZgxPWwjeqOUC6Cza201aWVtua4o3iuOps87dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o/13JpO1zRcDBDzrsXvuDTR7qD9FgMs5FIdfOlUy8Cc=;
	b=A6DzVIHOtYfWg+uN+dqtBP9cyvsKwomNy3N6dL6+BqMvwn4jwG0FEwf1FZGqPxxe+6N2
	 qc2yEGwZJM5KIIUxX2+ZksY8orQK3h6/2xm5WwJovWGYl4WxyFrUU1Rfiie6f4J3RO3Z1
	 sGDsNZ7DuNSU7CSOy/T1eeoYEDKcZLNKIK/hFlcVf3th7Xm/CwXqykrsqaoQ7WGVpig5I
	 OeGvpgHyFzix6roUkhePt6I7VgLqtHS+x1dJjfwCcxCU3Z4xTaDZfzJKkLHhUJyeaL/Ke
	 W2mwDmqC6gbvw0ETbs2nnBhpycaGmlNGRgEohTLY8tOZrF4hF36/G4ZE3dXKZWbzmqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="alf8aK/r";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0B9606A32A
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 01:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB0B9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alf8aK/r
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-382f4710a17so110674eec.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 17:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794966244; x=1795571044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o/13JpO1zRcDBDzrsXvuDTR7qD9FgMs5FIdfOlUy8Cc=;
        b=alf8aK/rxHDQNWioVmrt/Rn1wYM+M6JmvKnC2JiSIwkIAFwc6q6rjMmYmh8DhT2aRP
         +yjY7rIJa3A+TTuKYYUbxkixz9o1DuZNaN7qa1WlTCqKTD4mVAac9KtUpi6MnEGDK3CY
         5GKbPxa6uZGTqycS/oZeFRmwvgIi+cMgmBQMELiVQVjDqeslLxDi08x6ODySU1SpaVKQ
         6q4K31zgMzWP2BD9LNbYQsQW8xEmsDWcpBSnhDQbFFnr1E38SVLO9rGIHJsseuFJveQ7
         mAU/GACD62fx1lS2dlt6rGHFT/OSkkLNmBQk4jJ0zYtp/ZMIbkgj4s4FWKKsIwCNPGQB
         L1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966244; x=1795571044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/13JpO1zRcDBDzrsXvuDTR7qD9FgMs5FIdfOlUy8Cc=;
        b=jTX0XW6LvfK0gIG7kW1/1ThE3Zcqo3/jkDJOFJnhp93TcQVQdv0pqxrW1PEMpwkAH0
         f4iySEkKp0ZobjZu0VzE+oRITkkwbDmaV444fub8WFzA84zvIy+pVoJfAqCf9CHdCmVQ
         jxTt4qQp8xilgdT9XOaM3jwcbnf/ZOtQBFm7UIwkYd+4JkRZXUWzpYdfSuVc7OL/L/+P
         GOP3FPGaszUSv30ZCKHs07US8bAKX5SDWXHG/a9Es/154A/+OwoOlIMjj/vzjeYSCDT6
         2aLdDn1wwnTJfB7gbyZ8qeeFwZEnTh+PPPqsug/pJEfLA3m4AHFZqgQmz7AEF5m80VGF
         9K4A==
X-Forwarded-Encrypted: i=1; AL+hErGEm75LUEn4o4cizJ2VNo5RdfRQNAO1vliLkmcYeXmYDEKgBxsE8Tegi5YW5gvd1L6FIYE80gBSLk0AzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+4u9vYcEF18FA/HnpiXGLVh4GYg0O9kwvXPILFkelgr3sGI1Rb
	hOfLyViNJhVtIpezjRiAwMTLPlGis4iiEUGZpOLxWQQYR0h6aObmOm+D
X-Gm-Gg: AZFdTZcxePhCEqm70a+X33ppIobJldgkNoSv3HlFY/0hUT0o7UY61vh659umdRNpI6r
	VXjSVcjDBWzUS7kRAB7kyk6fVd/MW2aecmMO7QHPo1wyN+ejRSC38wiWfa5RiXcCULDfxd35Wqp
	mdN37rH8JxaxEkSQJabKXze4YMP92l4qkhSyruw9qsz4PnLWwKLylgTIvrIK+ov0C/jrfy9O/fk
	QVW2+XoYmYdJbI1k2YxJC2TFxbw1ZxU+HseVztPtiu2dOCudvCxLbSJzDGOs+xZQnRtWj4hVdJP
	p1Czfvz3rbevwlZj0OwdbWVyaTuuT7UhAagveO8aZji5Jvn0/To1Vy63kgfbLd/UY6WIqq2l4+l
	dkjyBDJH+7oxw5ioc4+9H27g0wvH0kbtMeR1Azh7eJjKQtw3Lejb/mJI0H7fNcqvNZ4FA6ZaXFu
	4VMpV/alWvnYpEByGbkUiKAxV7wd3boBdIGnR3v+9glytbrUWZlM66AxWgx/CHgOrz9TNLLm/9E
	xZJVdUU+RaYcEKcXJA3Nm3RcskoMt5ukjj2nJHW4xaBwwctAEgThLKBx/e1rzIMm5fhaZ3J1IbY
	Q+4GXrncrvmhtsy0RdD2pjk0QWcxCsTFb/Nx6oGAkpPNoYYcw6GKbav0BwQ=
X-Received: by 2002:a05:7301:1807:b0:376:77e6:a66 with SMTP id 5a478bee46e88-38280a3d9e6mr1195349eec.16.1794966243774;
        Tue, 17 Nov 2026 17:44:03 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm2157822eec.24.2026.11.17.17.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:44:03 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulo Ravazzano <paulo.ravazzano@gmail.com>
Subject: [PATCH v2 1/2] media: i2c: msp3400-driver: Guard media_entity_cleanup() calls
Date: Tue, 17 Nov 2026 22:42:34 -0300
Message-ID: <20261118014235.419385-1-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Member entity of struct v4l2_subdev is only defined through
 CONFIG_MEDIA_CONTROLLER, so the unconditional
media_entity_cleanup(&sd->entity) added by commit 87d1307b6791 was
breaking the code when CONFIG_MEDIA_CONTROLLER was disable.

Guard the calls with #if define(CONFIG_MEDIA_CONTROLLER)

An AI agent was used to find the bug. The correction was done manually.

Fixes: 87d1307b6791 ("media: i2c: msp3400-driver: Add missing media_entity_cleanup()")
Signed-off-by: Paulo Ravazzano <paulo.ravazzano@gmail.com>
---
 drivers/media/i2c/msp3400-driver.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 8c2edd462..8f0b385fa 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -717,7 +717,9 @@ static int msp_probe(struct i2c_client *client)
 	if (state->rev1 == -1 || (state->rev1 == 0 && state->rev2 == 0)) {
 		dev_dbg_lvl(&client->dev, 1, msp_debug,
 				"not an msp3400 (cannot read chip version)\n");
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return -ENODEV;
 	}
 
@@ -813,7 +815,9 @@ static int msp_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return err;
 	}
 
@@ -867,7 +871,9 @@ static void msp_remove(struct i2c_client *client)
 	msp_reset(client);
 
 	v4l2_ctrl_handler_free(&state->hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 	media_entity_cleanup(&state->sd.entity);
+#endif
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.56.1

