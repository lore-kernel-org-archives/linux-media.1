Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962806;
	b=unxAPDqOFhj2aeEe+f5qX0B5pPiMaV47SE1wdswWwh9wo9lO2lLMmqkVtiaFiEkkXun+
	 aeEPtoWfUDlW3NYToOHxSbqvY2CEzywsrpIWt51QQj8gkSCoDpg25D0OYuI1aPpr6Bs/w
	 ul5BnkadFd6kCUvMrqRz/kiIQZu3lApmbyo4ZTidSZy8khzBNVBp16inuwJ6ZP/61o2zZ
	 E2iYPg14hTfL5dMN+eH/MKMB2pxZfOW3tObWVFfM0hR8DTZgv8xUz5AwLNy1j3yVSim/j
	 ALNlBoxYKZos06FGc+UFmUZ7fHj7NiWdCQcpDJNPB19W2AB5oCRZrGj9h8lIXwfUUUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
	b=Wt4NjHhfYFXlv8R80PtXMMbjnSmRJ2BbJ/yNeJP0Dt0guMZt38u14d3tqWAgc6niny1L
	 M6pqYnGam/sF1gjjcco9RJm8uUtzAaL9HOR/AIjIpxSOQdZR433jFgALX3k/R5oMqxrck
	 3BV7M3Fskx1vo7XvfJ9K0guVk8ErClyz/G5ijRyt6aFcgDIUDwKpDjJce7FroSnJIRFzO
	 MlEfdZ1NJdYD4BzrgixZt0vaqOXpJrBhpndap3hEY566+yX0a2TnVL/D+MYHKM6HAQSL8
	 5nctL/JDbSvrOVAs4PWdAmYujlet/u1ZjOHPEZpPR/Vhdh2VC9Fh05pQaR1E6ruheTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GXiPy7lh;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69156606A31C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 00:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69156606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GXiPy7lh
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so625336c88.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 16:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794962805; x=1795567605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
        b=GXiPy7lhSczITyephtO2ckKsgEYqh7hIYmMg9mfHVRdDTBfc1RIzY1XIJYVdMs4WgW
         eqXCWPkgqDZ22ejtTzLDFggpQRKx9uFFDWXaV6SOuBjCycxeJv/lPVAdYcC8LXFr6sxj
         1U8hVd+7wUlWpiE5PfwozQLKHV3kN+rcpUssvnx8ACwGL8wU6zHtTfI80G/s2UYgPi6R
         hGHVWIL51xBKckWrWYBJoxPM72lZq7AJqhB1qCQy3QGhb4it5+uU/fEAn/O6YvIV5lpP
         EbrgoTJ359cJQCooAJl5SteUkxMQyyxJBK7bB4sBAE6dU2RckwtM6nJHZoKbZh83v+Kw
         YHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962805; x=1795567605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
        b=QIUWMlJws6r3dC67rfm4DLYLa1Wzh9+aDMwVTQNpCjEFlL70LgIe4mSXf4UU7sToTG
         Aeb6fsfe+UE53nQfen+o8RGeo1ghJbPSmkQ5e6D77L66yPrduUtFXzy/oX1kUekYeFZm
         PTAF9l7N6EAEKLXCqnQDMaO1k8zz16mPoOEQ9O0ICaFG7/9MYKeH/zFeOXkl4NgdJWJ7
         UWCxgry3pNYpnT07eGaw5G2rNEKRLGojoo0gmL5ZcR0SJJIG0D5+V8Ue7p0M/hoN4FWA
         3FqBNslezUmBsmzFWGRbmF+tHRGnEsv2gp982edcVI5EX+euGGJKaszvZtdNPuT/gsUh
         Fi5Q==
X-Forwarded-Encrypted: i=1; AL+hErGLYMVBgYqgr/CyiJUe2fCltiOjhytbUkaLnSVclgcilpbjKiRcHyl8p4O6eG73h6Mvh4dIbYcFJYUBCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZLyHqtDSUfyNPRcX4didkf+i2fwKZy0PEv8m7hXe2CpbwPyqZ
	1tjbXHZoPVjvMHU3/b1fKj3MLZ57/DdyvDhxil1AIoUuJX5o91AVKTRu
X-Gm-Gg: AYBFou1vvR+mZENl9hcP+pTLepukmbymUggATmclGU4PxMuj4UI1z4OuQCbtEQo3HOV
	eOzkGEOVvKka25cGb2wJtWZCSZkR342rPmM/FIPO0/IOvm2cIWUr7l80c7V3c8SWdRnjAo49Rxe
	MypWxf7fUgP3tlTFUxTqjujTH47ihCkfjEPYzQ1vuk85uFAARMREBSKnHQDxGDRpOqtr0nkQ5L7
	/zwnxrtfATI+YL/nueHVcTZCZhKxVQeqdP/6Bch1T8kat/wrXan7PQTAPYQuHOHK6mClkgiMtDM
	NmvFawEIHA4UQwMhrT6wAc/ewYPuv2ZWhuOl4tSyiEqhD17OcV7NA1urwXKEtWO3K2Lnp2Z7FB5
	cb4c0W4JA355B8BtGDuVMA9V3CGHkOLDdN3aKjrih93lHSBj9VhLuzcYY+Y9MwBqd7FhngLCf89
	PYj817oIR0zKgE/NlTYlqkR0bGDGsXwFkhSIhlyPElhnTLbtaGawwl+EjGiiBGA0n+SnPKZiDqh
	SePycolHmFEhPqPUEWWIYZsqu+rUqBPqEcb4j3FjeIBRJ+0dNScw5dbo4s5ZHEp4wj7XuSnk9dx
	OOJFv+t6IDbxrZy1ktBj9oHPX8+xMwzVD0dwFAzT29I0o2c2DHN4kBXhSFY=
X-Received: by 2002:a05:7023:a8b:b0:1b5:3e3c:142d with SMTP id a92af1059eb24-1b543d4f82dmr1069798c88.42.1794962805520;
        Tue, 17 Nov 2026 16:46:45 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm1765194c88.3.2026.11.17.16.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:46:45 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulo Ravazzano <paulo.ravazzano@gmail.com>
Subject: [PATCH 2/2] media: i2c: saa7115: Guard media_entity_cleanup() calls
Date: Tue, 17 Nov 2026 21:46:00 -0300
Message-ID: <20261118004600.369915-2-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118004600.369915-1-paulo.ravazzano@gmail.com>
References: <20261118003742.363133-1-paulo.ravazzano@gmail.com>
 <20261118004600.369915-1-paulo.ravazzano@gmail.com>
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

