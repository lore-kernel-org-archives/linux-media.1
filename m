Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473856;
	b=bKUxcnSpF5wR/kExi66gmd21xoCeu3Z+4SSDdAiLxI2/JHbsd/RwyGTk1rbc0fFx0o0N
	 R0ndb7nmnVeojieHYfZeYGKwLKZP01/K3TUe+LEICQTrsB6z8/60a76j10QkP49SnMn1i
	 Me25oWdxCJwhvgyPHK8xzJMwadJQPQwc+Qlvl4DHcxnaSxUq1XhBgipZheRcAVQXjJB1y
	 LtPbMFOz4LpGDJ1KQ8ogiefFKhLpBVASGsnt5uLX6eAnnczH407M7m2UZlxWVUr3BdRRQ
	 AJpyIEaA4n2hdkGM+7DKMPaa7LPH4jwxHrJ4OrFiF1OZ12QA2LXXBb2GdS/JoGEvSBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=caTSnsBrTqe94LDzn8TNXzbenXC+l/bvRrYsgGczlAE=;
	b=yMxAeJ3gQbjZAttEY/OvEkiJAVIMAHMz3MQ3pR7Aka15MIjokunQFJdS61EaIcg1+DNG
	 d7AEnsguOEeZSKum2wcuBmsgaTWbEM3J/rMRDyjsuBcyjXdeqj0Tv5YrtBl86hvzTzjZi
	 yr+hRnyQHdBP6Hzd1tE3TKArE6v4CzVxMimGFIZB/pH+YMMi2e6QoY2CagQpwQnMyKWR2
	 LScMA+ObcVpQa7adI3oZGAlcyXIatWUFpefN3vTfh0hULJND/2YXhqWzTHGGPsJCDdWYy
	 x2YdWY2i/0NTnsThrFIC+DquvHU0y8eY1zbe44cQQMZDhc4pfF47E19wgBewRt1kn4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qx1+s8q;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D740606A323
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D740606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qx1+s8q
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so3736887eec.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 00:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794473855; x=1795078655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=caTSnsBrTqe94LDzn8TNXzbenXC+l/bvRrYsgGczlAE=;
        b=0qx1+s8qLZWIWAWbqA070ck8AaIJ0zFwuvyDK0RU+jNnluK9wao8FyEcxplBm4q8PI
         WzPQ8MboInroksTMHTkz7DR66jv0KxL68L3I7aIlSY3fdpxbj11WDo0HpQiSKyn2MoEj
         uZygIuy+9KUYik3lLYuU6WTm1S1mhYVhtIuyD9MDB0Q/ETtEG70I0/a8M8LLSX3mMrTN
         ANX8s5iCX4TNxb66fLLy08VVB05mRTbc2vnmP48TmnMGwrJI/bR/6FdLPnSeYDwhUUTY
         uYvVUu7arduWHpqzbBrVQWF4d4P5b+qKK25WOp5MInzX67GDtUjn8X3AUzCswmsD7/pU
         NAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473855; x=1795078655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=caTSnsBrTqe94LDzn8TNXzbenXC+l/bvRrYsgGczlAE=;
        b=CRn7xVSVEDA/g13AZPUJLctbBYYWzfZIJ016Zha3j5xBTETEWpPwyWEEh8T/2wyBcd
         BRx3tPge39lQXPHC84TDbKPS2r7VybliAFZKIl4NWw07yb8T5P/hJMCcRWhpebXNCVtz
         E/Q1/xcEch9sbSe6HgLPGcNCi2AcHYfwX5YPgX9Pew/ggWCN/l4d2apMli04bOyn/aTk
         2YWg/mDdikyFxVmt29FMLYbhMgU6pJRFL+xjhwBGkFoIb0CIYv+dcpv5mRojjx4Ahfdr
         j2bZRWk9qQW0/6FHp3RA9qYiJ8oTch+gHW6tK9XlhYxvhHhzZ+hoo/jaqRaPRxyhM59s
         C5ow==
X-Forwarded-Encrypted: i=1; AL+hErFzvGP3RO7mC69HpqpnLrL+YEJHK7o00tJg5UDdwZFnEJUgxHjjLLGR3s1PBQTvpn8Kw2P860mXWOnzRw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+9M1QVW1T8xprunb+vgF1vVKC0jQ/CV2GwhnugmIhF0Aw/vSqK
	yK3xJKz3GZFYl8avWHv9Vq2HAVhISBtE/ltfSOu2c9jwzV5/iAji7+lg
X-Gm-Gg: AYBFou12+CfXnCZtcs25j5o/6FSNM2UlxF/INng1scXhiRaAACLww0mM3Xm1xUuDNt1
	ISYbnp16slAA36Yp5iW/L5AZBTk95oR4MxjqkD3vJPtGJzX+6RUHKX3CnIedwXvRU49DYS+1J/q
	UIdslUuEAbs48DJldCMeQBUH3N/wqiEf6UkXoED7MNNs2hRCIbWM0d4+v7y5Jqef2eS0KdPoTki
	svx6YvOYcTXPD5YlPWxc2iJoWMzQ18WaCTpbANUnPv/bS8upv8BTCwijCg0/CrBgMhJgAilx8QR
	eaPrkW+Czax9YUaeGQfXNWJNXCSFFsa2UfsPYoT7B29FrvmofU+OH9rI7ikIqOUVxlfnekaD3+G
	hpwae6ucZItjiYVvtGt7In3QA4t20Zpe8SugkDk+9CKS/fCHlC8T21PYxSDurhCros2j9a8PojS
	uFJfxGKj5DCzph7lG1H1dNJByyexobU0ZRMYzJcM0sJc8sUW6p0jlPepk4DbOXo4aGVA+OMWd3J
	PkVovzf2cdKJcsvRkux2N9aSej7yxFOUi0IvT1L98M+Yp23Brfyvri8O1pS4c46mb3QmfOreb7V
	X0drgHRHot9geGEY7Hyi+pQ9DA51THHIUU4XhXrAxFXibYY=
X-Received: by 2002:a05:7300:561c:b0:36e:2626:4ace with SMTP id 5a478bee46e88-3768366a866mr5645746eec.5.1794473855002;
        Thu, 12 Nov 2026 00:57:35 -0800 (PST)
Received: from world ([2409:8a28:ae4:7f20:114b:916a:a0f2:66e5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm22163168eec.3.2026.11.12.00.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:57:34 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: [PATCH] media: i2c: cx25840: guard media_entity_cleanup() calls
Date: Thu, 12 Nov 2026 16:52:51 +0800
Message-ID: <20261112085251.734109-1-w1355457260@gmail.com>
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

sd->entity only exists when CONFIG_MEDIA_CONTROLLER is enabled, but the
two media_entity_cleanup() calls added by commit 634be628b5cc
("media: i2c: cx25840-core: Add missing media_entity_cleanup()") are
unconditional.  Building with CONFIG_MEDIA_CONTROLLER=n therefore fails:

  drivers/media/i2c/cx25840/cx25840-core.c:3964:41: error:
  'struct v4l2_subdev' has no member named 'entity'

Guard both calls with #if defined(CONFIG_MEDIA_CONTROLLER), matching the
existing media entity setup in cx25840_probe().

The failure was reproduced with CONFIG_MEDIA_CONTROLLER=n.  After the
change the driver builds with both CONFIG_MEDIA_CONTROLLER=n and =y.

AI assistance: the fix and this changelog were drafted with the Qoder
coding assistant; the sender reviewed the change and ran the builds.

Fixes: 634be628b5cc ("media: i2c: cx25840-core: Add missing media_entity_cleanup()")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=222245
Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---
 drivers/media/i2c/cx25840/cx25840-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index 7066b2252afd..91794ec59e2d 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -3961,7 +3961,9 @@ static int cx25840_probe(struct i2c_client *client)
 		int err = state->hdl.error;
 
 		v4l2_ctrl_handler_free(&state->hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return err;
 	}
 	if (!is_cx2583x(state))
@@ -3986,7 +3988,9 @@ static void cx25840_remove(struct i2c_client *client)
 	cx25840_ir_remove(sd);
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(&state->hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 	media_entity_cleanup(&sd->entity);
+#endif
 }
 
 static const struct i2c_device_id cx25840_id[] = {
-- 
2.56.1

