Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962802;
	b=ki0Rv8NsKt9p/xcuXTfGjxcDesg0j94m0JhW2GE7leMmoMi6QkduZvScKCXJanr6rsU7
	 5PTI52DgAKYKUXxU+XOsIJL2AoiOjyZ6u6W4PWyExGGb533jgVK9e4g0yo2ydBGpuhSG9
	 juwzooRxZ5jjnKnB1ziKeXtIXHkNw5DKFmGNWW/XI5QE+mocfROyu1+VGbc/CD9sFWAe/
	 rT+dcp/YI1+D6jzXWEJfDJiTkeH6FPC5TRj0dSHynnpQja7HLMRwj7p7Ne1kkMImQwF0c
	 cA2W6t1XxxlpUjH5IM5eMRRYLnmQFHLusRoPuJ5hh3Qiyjw93l87BRoF2GHL7GNYbsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pllyLf+++bwuw+cTuPHNT6Ou6itzbDvqjnXe+1hShHA=;
	b=jhEenDBbJNepZm3/070TavKl27yME8UyPee1RXCZoNA76JHaavfWoIX5xEc3uX2B92RK
	 LrkqYocBg//pkcChqFsTmr9kNoqUhyt641C0/yRGBCeoC2fns8GloNuPc51Xc+rh92Kdc
	 1blnkhsFqq1edwYmpEwQhWMm83d78+9QGYXEcrt2KlSjnZ48s3tzKHqCtLlSoVHp4O86b
	 DkrL3lYsfjK3fNAs/1vRHKgHX6Jv5UwdtUlGS+r2uri804aSInCZ/XQB6nYMlhTl2ojYT
	 HnVtycNpSsFfkHsi34wA66o/iOLt4pcC6OVq3ghIN2Gfu8AAPf6OKhe4M8goZPK62HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SUY7QHz3;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E2C606A32A
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 00:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51E2C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SUY7QHz3
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3acec6677so698466c88.1
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 16:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794962801; x=1795567601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pllyLf+++bwuw+cTuPHNT6Ou6itzbDvqjnXe+1hShHA=;
        b=SUY7QHz3pMDMfnHttkyQCDMUYCeQQWYF00CuqnL3hqx4GgCkONUWo4pR3teU8v6NM5
         3K0xyH+zW3uaYaLe6aeN/yKqyPhgDAY87UUBQMwPk1YdgjtmSOUSQuFDyFQNwJldJjTr
         h8eRUWR8FJ2Crt01B1PRF7nz1CZ658b6PkNwQHHUdgDDO0KSDjfISPhZIWz7BWzSQ/jg
         Ki6Oqxy71CeEdkub4IXgEvtMTqAUROgaTzp6o+e+xvjlwyRUWWAoFuqkFjRl1muR+VQM
         1OrotrQ8TWDu45dDZUaX4kmadhH82uI7LrzAqpoKjZiFZBsBHQcJjXUxtcSQ36qkBhfF
         4gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962801; x=1795567601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pllyLf+++bwuw+cTuPHNT6Ou6itzbDvqjnXe+1hShHA=;
        b=adAMdT2yBt1p1a+foSGOGm7VD7W52rNP29/56O1pBNaLAXgPAZPcLeTaRwdjmM0mep
         Thlu2OgX3gfzfWJs1rVIz1Su3y536Nxp+edW49yC+QoOHiIELviMY8otYPxW4aUcWAoq
         mc9UHbLvIZLOyavxnkJH0h5Rs7pn0ERaB242C6ILHDI33QJSODaB5kgcjZCuOUSyFz6P
         1hnfpW44tRA0RsW5fI2GFSqL48Zo1kGzv87oNFm+qcvscePXWr5dBh4bUHLHMmaDatMB
         4CnFXj7etnAPeEDhBd8BZNtnqLwI8Nkm0qPKmH9xEDAlNa+OuG+SNGage/QFqDz8QzNE
         DAIQ==
X-Forwarded-Encrypted: i=1; AL+hErGha3oBZOC/cLIrWfQt+wjd+u+v0fWe+kSs+444pnyeqfFE5NZUii3imLM8KZfcY9G7dofRYFESak7VHw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/xC/8dPTz7PlmvTnYPsJyviZYygVobHHLfANecLpR//RlphU27
	WjzyvPSW96cPd9DfHgyolW9f0rxu+/LBb5vgXDSrmSePp26JNFTlU5yO
X-Gm-Gg: AYBFou3ttqr9zxZUv+dMmEY+z38nlDazo0Z6k+ThbTh0K7x8mRSd2fioRvhpYJeGctl
	PFLMDMt7hIXFYdnIvN8bGtpadlQD+trD9405Q8Fq6A/XBbeDo2d74/tlnQ46HiwptZRQEO3EChg
	24I1+QtE3+kb6cuBidKBrlYYgAAkUONYWDLQz8By1JwoHYVYXUkOgepVNl46ycQPJeuiohTDJh0
	H2fe78QS2DMJzK8rty5v7414AcFjJEita37o7U6TUT7+9dx9pjMbq/gLM1hdfdLv3uZGIvd1OSx
	XaBCBqKpGnUnigtgyeT/EFNUOte2ySzkp1tONK8WHvXS9LyvKlDwZ4fhJGNE2q4Aw3wycehBcSS
	A+3g/h22wNxvrEPvJ1zquDVSvu73XwKcqHDvlOOPX0F6ygUIONPosSC6A758/1DNm+c+5yzdqmf
	QiTkR1/nV/uKlTfb8+Sr1Om39lLpiYQZfwPJqWct71g0s9NluqXTfoYkJsApn1NbXwufVRli0qI
	DxWXnwsDX5K5eXTqqLOSYR1IY42ckMPGQS4yGjWuZ+AR7BDq2zdVYV9ffVjMHFMoyNPN9dgaTwo
	EBePP4bYmfFW7Yyw8YE6/J+XAPTnYmvs60zEnfJtWXpp1cHbtT3J81RdE4Dt0nPSAPtYLyeE2JK
	7/P6/
X-Received: by 2002:a05:701b:4549:20b0:1b2:41af:c21c with SMTP id a92af1059eb24-1b543d4b57amr983339c88.39.1794962801203;
        Tue, 17 Nov 2026 16:46:41 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm1765194c88.3.2026.11.17.16.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:46:40 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulo Ravazzano <paulo.ravazzano@gmail.com>
Subject: [PATCH 1/2] media: i2c: msp3400-driver: Guard media_entity_cleanup() calls
Date: Tue, 17 Nov 2026 21:45:59 -0300
Message-ID: <20261118004600.369915-1-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118003742.363133-1-paulo.ravazzano@gmail.com>
References: <20261118003742.363133-1-paulo.ravazzano@gmail.com>
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
breaking the code. A conditional preprocessor

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

