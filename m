Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919821;
	b=kP+wimrwuNL99XQcQpswrEK0ezUbaWSsQIsV/546xUCpBm/aIa5PkdXNovbFFn2oy7Qb
	 9CpFExl/927JGWgh2dKD1DswxhHbcYjFvBA2ve87oTMFOcLmMI2O1Mwj6NP4xlXf0VSGm
	 vnLGSnK/Y9nx7pbrBPx7dx3qXL/YeFd3RpJXE9PFx7srarmcvBCiBcyTskVE2CHJeJ//F
	 vueaWYAjaUy7vtLBpRh4SqBrGmMZBbJz+c0i7rIPEML8A6bU2IV7a5wiHkCTX/LRsk47z
	 7NY3dYzAQfyyYZwU9chsG8EomT/61eCDZrU9k/IMxspAN5I3M6qJQTcyi1mc5nzswFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DpHn/b+lnkpqldRhdQd2AdNSJxGyQdVQXxSDDmKfaHE=;
	b=uXmpKet7t/TpFPjw5h5nQf260ReZNwqJAsktd1oXIRKdni0PxfZrjPsnCxDPizR2/Z4m
	 XRrflU8aBJaftkXxrN3PBFg15PoQ0o2KIuWjW1158qF4VMKyqzRHvozdxU2MIltIHDBaK
	 Xh2rNqU+n8QYXErWB21DstoCZXp0bflqN2cGPr9ZsaEeSNpKWjG9fCNwErxeWaNCdFWZB
	 gW4lRkY69Sx0b58tLO5pjKRthsnsCMcds1TLnEh5aTQpRv70PoZsP6eBo2OxDadhL+GRJ
	 1ydiv8AFWW3hCpyY7baplMvD9kEqiaztu8TOL0UJ9PLLS2GUj+iferkE/oBZs4Dq4eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOmKAXpR;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C43606D809
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 23:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54C43606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOmKAXpR
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so271675e9.2
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 15:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793919820; x=1794524620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DpHn/b+lnkpqldRhdQd2AdNSJxGyQdVQXxSDDmKfaHE=;
        b=iOmKAXpRoy4hy3zfxLqqdj6L/M3sswXn1cm9vpwWLVSGjH0qGMjdSzwSyDKR5bwuFU
         9a8TQ9gNaSWviVDx1GdOBd3S3XHPp+NLrrnTCTmLtGpq7n0HcSo//SbwA4/qMLmrRni2
         euwxHxHoACliUB2VYhHm8Xu3w70YcLBn0WgfL+r8JN/CsUuFyIlV2Wfd0woXmtMu4ZKI
         qkZRb4Lp5ipjs4iWDdmqxOPtdlyOsZrtzeWlPsZNA1jyTX3A324qPHTVGihY9DEdpaiW
         fxW6se2m4ft/wXJzqrummD6Wkje5qCNcVZaYfKOLPB19CgrifLXZGd3z7oLve8s73PO6
         q+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919820; x=1794524620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DpHn/b+lnkpqldRhdQd2AdNSJxGyQdVQXxSDDmKfaHE=;
        b=1pjGA8l6aC0CzHWS8MnNzIlYZRZkxZe8Pu7eLfuy+PpU5ZBxZhG8RmLfgC0aqRjYMU
         nNmYq14KSMohsKCHqM4nCGw2LsWQu7PjxfbOl022w6qjyl51TyX6+OEYC3UKGM5PVg3F
         4Z7u4yAu4ZhQOJwwQFiplpFOs2YcWQf3Xzr4GLUYCd3tveV8nsTe9zKjOaV/4oMUfP0J
         kcRerSuVmtEhiUrW0sudNj1TptgKPGt/3DNpWhr4UIXOPvo/FJgu3Srd6I8D872M9Tp3
         YAYNwCMjVHELwcjs0xcmePCqXgzOClBSCSGe4g4Lsi10/ySpKo06udoXdHmZr7smRIUD
         jLiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWeF6PNGZH6eCrSq0Fvvz922l5nObfQnyDc+WDzCkwYRSNgvJCEWNqeW9J/lfTWY6iNjgRC6XE24Br7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+DANhLSJw+bHU7WkhkcGrVWaBi1Qb3128sY5q3DxgpF3Tj2Pdn
	SE1snZl/u1cWsB9GnAH5FJFW6JWeg/IozXGhU9NgzrQjzqjm8Rh3NbZa
X-Gm-Gg: AYBFou1Xl/tCvCKv4PPd3Zpcuzbe/eIZPfxIAACEf4AbUKE3CQIhfzmXmagkT/l6GR4
	Z/n6jGpvEVA+UNR9EqMYqBY8f3tnrcecDGNE3ym0s7pi2xxYjV6Y0znd7zVglDBrEMiAOkX6mGm
	4B8gTE+mESx2BDfu0t4AGSgHKA7SZJfkJRsf87GOD4fRgGAQ4itP2iJ/uYMURAria+W/Rjdgwdd
	f9krx93npkqQ1SsBhax0F1jurS5E6VXMA8G+qPIogu6mC8ulksr3CyRN40d9hvWUIpH47xBJUIK
	sAM3nWN0ADES+fLjwduhZw3W/Xrk/FuxFsrWFpKk5f1NTTTcSsauJ0WQMyJnBM1m4Ay9YLkHqlm
	fdEHsq/DTtaw7ekhULixa/Ft6CbJzEa2WF9I7aML26ioiOMIGjVzlU/1RR6tffYrQhnyP1ctNU5
	80FmDdaKj+X7BFlOqzGl3G/U2dpWBxnrHgDXd4nFmR9FetZuwtEuJs62+4Choq6nbA/+/i1G5EN
	l31VjRVml5uNEc+H8Cc15qz9MYwF+kHzYY53hCChTwA7d+ez3oFbu/0RW51D/eru9LvPBBxoPqu
	IBhcx3kgbhEF4SUSADXH2vC4KXczc2/PSu0Gzwvr3P0kL6+f738/G7EvzJKF5NhMMx/TlEvH5ue
	86vbxN7yRe/XQTtE=
X-Received: by 2002:a05:600c:34d0:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4b6ddee3291mr8491095e9.10.1793919819682;
        Thu, 05 Nov 2026 15:03:39 -0800 (PST)
Received: from figssurface ([176.223.29.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2029209sm12267215e9.11.2026.11.05.15.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:03:39 -0800 (PST)
From: Afonso Figuinha <afonso.figuinha@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: i2c: ov9734: Defer probe until the fwnode graph endpoint exists
Date: Thu,  5 Nov 2026 23:03:25 +0000
Message-ID: <20261105230327.10852-3-afonso.figuinha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105230327.10852-1-afonso.figuinha@gmail.com>
References: <20261105230327.10852-1-afonso.figuinha@gmail.com>
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

On ACPI platforms with an Intel IPU the endpoint is created by the
ipu-bridge code when the CIO2 driver probes, which can happen after the
sensor driver probes. ov9734_check_hwcfg() then fails with -ENXIO and
the sensor is never bound.

Return -EPROBE_DEFER through dev_err_probe() when the endpoint is
missing, as other sensor drivers used on these platforms do. Return the
error from probe() as it is, so the deferral reason is kept and a
deferred probe does not log an error.

The change and this description were drafted with an AI coding
assistant (Claude Code, model Claude Opus 5.5). The author reviewed
them and tested them on a Microsoft Surface Laptop 1.

Signed-off-by: Afonso Figuinha <afonso.figuinha@gmail.com>
---
 drivers/media/i2c/ov9734.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index 8f39609ad..5f3e277b9 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -837,9 +837,14 @@ static int ov9734_check_hwcfg(struct device *dev)
 	if (!fwnode)
 		return -ENXIO;
 
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver,
+	 * wait for this.
+	 */
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
-		return -ENXIO;
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
@@ -893,11 +898,8 @@ static int ov9734_probe(struct i2c_client *client)
 	int ret;
 
 	ret = ov9734_check_hwcfg(&client->dev);
-	if (ret) {
-		dev_err(&client->dev, "failed to check HW configuration: %d",
-			ret);
+	if (ret)
 		return ret;
-	}
 
 	ov9734 = devm_kzalloc(&client->dev, sizeof(*ov9734), GFP_KERNEL);
 	if (!ov9734)
-- 
2.53.0

