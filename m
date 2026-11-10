Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279552;
	b=Lhpm1Z2gr9fbvW8j5opQ8JO0k2ZiM4EIFyryhhbMiBGE4r5tQOwOkt12ka/CR3hDHhVY
	 Aqtfn17he4ye3GwFtcLJEcJ7VqEnP2gPE3CSayfMigpEEsGC0VsSwkwDgnZZa7WRQGZ+D
	 npNVg/FqyyMHXKdyG4oIRymT+BeREzQSo8tt+RvTPjUL+zDQ3QtSYT3H+8BIYMVnK8eG8
	 Z8zFKBou9Bkj33QQlQwAZSvqEmD2GR8YDfW+7+iwhjaKp3QoHXvRj2vzgdpX8mnXc0hlc
	 sBikd3iypDc9s17wG0G3jO4sN1mhRU5JpAqucRPomFtpiiIudGP19/0KLx0iXrSPWxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/llv2MA0Uu9HzZ4DlqqdaC1DQImqzo/WdhLsEFKXeG8=;
	b=xIG2diDLGSTk8doGtqZ0ShmnfTG9mb4T1H5M8i3lcDkYJNSTfrUc0yFMtkv4jAthRn21
	 OB7moBPnuFGLNFLLWU9+12wkBIVmDYKvg5s/WHorej6krBNM7krpC/kgtQAg9kvWmSDbB
	 5lIoCzkOskEfHIfkWpF20EOoH81EJbsHWHa6VwF24UwR3T3rhyrys0PrWwoId4mw/p5AS
	 MV21X4H7T8STrTp9NepKFkcamWHs+URl9vvNtbZ6Y5ftlrCoTOa6QdXi7g09zOgzmzFZr
	 5ZFWHEsClvx2nWCohywZB8ekf+lVx/rpUiWeAvqk4U8AfwxxGzGbimM303ZsFLetb5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=naWTOGU2;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CE3606C6C1
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 02:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48CE3606C6C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=naWTOGU2
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5361e313e63so14362231cf.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 18:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279551; x=1794884351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/llv2MA0Uu9HzZ4DlqqdaC1DQImqzo/WdhLsEFKXeG8=;
        b=naWTOGU2gSjd6fPilXqbw+pukxzR5XvO6U4Mrjw4nk8Re85wpSrdZEuq0RNODlTjSU
         9f7MW/awKMO8QcHu0p7sRT7MJCha/AkkaYl4ZH78a5vNjaspLgHy00QJv3jb4ySbeO86
         BMRZU+Xed9gwxgfh9dHbCaq/dw0TqaW2lmEEyLBs4B3tHXSrKbNwdOFJcl0HL+q3Iymw
         Cz+mLQh+MyT1gPGHj59aGSf8cmpQEWJSwWSeoE3zq9mEqLEsKifZMS16ycm4SF6mcKou
         OmdYtb8iCEMjctoNJyuor4nsiclIuzog0qauuwHXqlMdKtWsV9hlc2cEHpZW1SgjLiFx
         jHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279551; x=1794884351;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/llv2MA0Uu9HzZ4DlqqdaC1DQImqzo/WdhLsEFKXeG8=;
        b=2kuHrj/IvxJf9KgyVOC4jpfgQul5oHEcv5g7kPTm4BLKrZ0jMY4pEdTMjVDsJ7aIGd
         DNL3fx+gTsZovbA4tP9jfLnJXsUgmZppSR9lo5iTr6O8wetrv8c8U0N46i93xLM+pRGp
         LTYUJi3ty3Fyvv9bzFwAGz2ydLSvmxcGDUqRF2D2TY0EfdEjcTlZFAZ7x5y4GB7IFD60
         Fdejsk4FjXLdgmxxdzIHYTMetxe4AbURVmU8rsglR4zV1RK5a95z8VDtHrJdDza51SIU
         0XuQMJVTvSzNel+V2QyMfPXVhtZI64Af/ELJ7A9tFagyYf4psz5hjFWtehOaZhfkSYl2
         h9zA==
X-Forwarded-Encrypted: i=1; AL+hErFrml+MSkzMQ8SwnKpRLKiJYoWyyQ6z+V4jRhveJyZIZyS8mYg6viJje8d+jFAeI9uBv+2gI0HpquuQQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+dtVq9ieb3VFEuyrHSA2cUf+HEeThlMwC+F1IeygH6rSdKV4gc
	t4G89edWDjAEZK5IAUACopyqC4nSyvilWGVIkVqsOrQYC8Ao7aIGpys=
X-Gm-Gg: AYBFou1CLFwu6YvnOmU6TXQuNPqWhC5Nirj3ta2/rnGV+mJz7ksk0zkQYt+xYlsSAMM
	pnMM66/N6DWkbxom2e8Li9xamHN1+hLhcQMJH9p2ghrE9/gC3+wGJyR8Z9SNE8hFfq+tIR5oO9m
	BTAkSYMsrBRpXhIaTpyXYszDK20ILBXsRVrDAo3OdhVbzlqRGCQCjB8RllcaKKbMTAu40qoSYZM
	vCuqFIvuMExhgyKB3I8Jz8sOoPmju578Vp06D3dVFsN5dbZe3YiZDWuT+hm7lD8jvEmnrOumofl
	qmfRMoF/T6PBGqHkFQ0l84+YOws1vxa2j5cxH0uLbJvI1niwfrU86r7fMIw5daijsKfFgu2A0CU
	OzHVFqIEwVXxPJaUVaA+HbuVTnoa4oShYqiZlDTn67QBQ3jylnGNcBADV2yrPhap53XFdG0z/ha
	wFP+p+GxTp2MplxPeBF6sieYL+mmZYdAKs3tJzqUlNNqsyBwiqJEGue80i0p8bth9PkBj62aZte
	NdE141wC/KvALD5HoqGew09nYj1mam96HktpLlC54dNS7VbOjNw0RABS0WnkRMuqzOkb9bMsYf/
	/FX+gaFJM3g0+c6Eq2Wsxs9u7PV4gEW2dPsTsS4aJy+DCT8rbkDTo9c2BLErD6OSI2Y8lopqXzj
	PwA6tR3s6Jtl86+uDSulfV+GARs7bE1lcHEuYJ65iWs5yYEH5nqh4IvZ2Wps8MwEZaeZIfnntn7
	V2Sc/cA0iT0rg=
X-Received: by 2002:a05:622a:164a:b0:535:20cf:96a5 with SMTP id d75a77b69052e-55524dffe9fmr21124881cf.7.1794279551084;
        Mon, 09 Nov 2026 18:59:11 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550c21e1fbsm12601771cf.27.2026.11.09.18.59.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 18:59:09 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v5 2/2] media: rcar-isp: distinguish absent cores from probe failures
Date: Mon,  9 Nov 2026 21:59:05 -0500
Message-Id: <08f232218753608ed1a95744d6de14c70a3104b3.1794278853.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1794278853.git.mhun512@gmail.com>
References: <cover.1794278853.git.mhun512@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

risp_probe() interprets -ENODEV as an absent optional core, but resource
setup also returns it for initialization failures and deferred probing.

Reserve -ENODEV for missing core MMIO or the renesas,vspx property.
Preserve clock/reset errors, defer until the referenced VSPX device
exists, and use -ENXIO for malformed VSPX data or failed RPPX1 creation.
Convert remaining resource -ENODEV errors to -ENXIO so the parent
rejects failed initialization instead of continuing with the channel
selector.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Suggested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v5:
- Regenerate for git send-email; no code changes from v4.

No hardware runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 14f3c8f3505..0a322014f3d 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -800,20 +800,20 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 
 	core->clk = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(core->clk))
-		return -ENODEV;
+		return PTR_ERR(core->clk);
 
 	core->rstc = devm_reset_control_get(&pdev->dev, "core");
 	if (IS_ERR(core->rstc))
-		return -ENODEV;
+		return PTR_ERR(core->rstc);
 
 	of_vspx = of_parse_phandle(pdev->dev.of_node, "renesas,vspx", 0);
 	if (!of_vspx)
-		return -ENODEV;
+		return -ENXIO;
 
 	vspx = of_find_device_by_node(of_vspx);
 	of_node_put(of_vspx);
 	if (!vspx)
-		return -ENODEV;
+		return -EPROBE_DEFER;
 
 	/* Attach to VSP-X */
 	core->vspx.dev = &vspx->dev;
@@ -840,7 +840,7 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 	clk_disable_unprepare(core->clk);
 
 	if (!core->rpp) {
-		ret = -ENODEV;
+		ret = -ENXIO;
 		goto err_put_vspx;
 	}
 
@@ -860,10 +860,15 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
 	core->csrstc = csrstc;
 	core->csbase = csbase;
 
+	/* Keep channel-selector-only configurations working. */
+	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "core") ||
+	    !of_find_property(pdev->dev.of_node, "renesas,vspx", NULL))
+		return -ENODEV;
+
 	ret = risp_core_probe_resources(core, pdev);
 	if (ret) {
 		core->base = NULL;
-		return ret;
+		return ret == -ENODEV ? -ENXIO : ret;
 	}
 
 	ret = v4l2_device_register(core->dev, &core->v4l2_dev);
