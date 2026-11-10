Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794276508;
	b=zRbXFCthcs5AcGRbr/Yv3FQczrVG2yrykiVbsPvsGiOdHvoldtkgi73xwQ0lVC9a13ev
	 Aso0lanBEaAwuFJ2PZlEsZynE3DEx0j8JC32x3y2omwZxmNDMrQfgSBTz4ce9QjtN0Bij
	 /iztB38OtISf0+h3uQvk5xeNnL4B9AC4wRT89yfUqX6raS6AZvC9jNWpqeeO8eKKpZEqe
	 a8p+I1/G0fDlBm4rvk+e+Oa2eQ2/OqFwDIm1SwKsH2LUMIHUVG8748bSmLNkpfDLcfVll
	 9i5WpogPThBqJ7SP5A073CghtQQMNTEVn8PthfNP8sg6ijnM/Ri05yWZxQ8nQi0WazQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=xzg2mafdxdFEs1lOpJlsFyILGqsWsSSyX3pGfyNClE8=;
	b=mphyT8xmiF+EDv3NeBEwk5NE45DwTh0uM6lCn/l8/zqzjrAYFfF57Vd8VoYCJyqNaEMp
	 C4AbqZwkCIzGTyAHjUm0fm3dU/avzOxsP7tunA3S2hdcDURIbjW6u0NuWYZVPMFveV7gT
	 EQDpXBlsTzVizq73IshbmMtgXqr5kKF+KHILwIHhoRUas5nRJ+su5i/9FvD8D5wKiXmS4
	 n/FofNIHiq4VoVf3DZ5DPNWgu+7q+2/TCWAC0iUM9P7IZHr7zCRZyjJNg4tyER+yQxjn4
	 tVa7rSkvPeTeGU5Y0/bJipRo+uD85LLeW+1sOt6Z61D3aWseuvl3xnKHSP3yufleJ5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g37a4kR2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E34A606A325
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 02:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E34A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g37a4kR2
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso2253495a12.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 18:08:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794276506; cv=none;
        d=google.com; s=arc-20260327;
        b=G14yzIIF4jofpamyZJX+SPRTcx8ufAcfO52C1JyIj4SXmklpgbM3mes2k2cXtPTXwv
         FI4hah4p0FamK27vklX+DvJB8x4kZz4W80ZOgU+OHpZa02moR0fwC/dUIPeuXulC8iD+
         IAnvX2h6kHShKfRvoW10ZGzttHGVA72AZkzd5Jf891BkDoBM67W3RFdILjQBk8pXQEeE
         YewRUxd6PfGpS7TY8Y59OZkRfAS0jZDSoIsqddu46snvhq0y2h/K/YL6xzZM4ZZVa9Aw
         0e4QlTweGLWkWAwGioIJDnMmYNavMbXzPtIf1s2FPR38tnEI7l1FNimygi2nlydyEOMm
         WikA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=xzg2mafdxdFEs1lOpJlsFyILGqsWsSSyX3pGfyNClE8=;
        fh=jwDN8wraOg6EYv6UWurR4ZQ2JCmKWWRZtV4PNS8/sUU=;
        b=mp89d0kLzBoSTVrfxp+GxsZR7WbmTWWpBXCQwuu+pge0DxBjiVl9RZzoqSY9ZkechU
         zkJ7PDJF6at27t2aEPkjOjDhUl0lZN/ASSHjpI+kSdcYMx4yNgOEcIISz6XscsX0Pl+Y
         4X/dkv0r/9AdntcV7BKz2lBZzeoZc6gR31Tb5CtQlANe8eC6dQP5FqITgMqCDoScCP3G
         XnRGz8zkXhXKGviH9W17DN8k2zr6oK8qgDfLLZNcKKYaoC7hYf7gWc/0Nxt5cmdqaRCp
         j+LD4EtZVAi8UQxoF0JNy9meugY9x8UH0jO/+/OXF6KOkKUkHBfYM9AgOvHgslOyfz4t
         QKxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276506; x=1794881306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xzg2mafdxdFEs1lOpJlsFyILGqsWsSSyX3pGfyNClE8=;
        b=g37a4kR2OYKgQA6R5gsDZ3w+ZslaVu5nQQYNH6WhIbL8yiCQgzA7D2ZFEzzf/Uyi1L
         ms+IVBX416UN0axrp2IrbT7uQDhVyGpa/n+iK4ZTlddd0PpEBhkuxCh+aUB8O5awVI4e
         V7toYv5zJA5WX2qlPCVlnWyJaefJxlDH6kwtknCChi/fd8EyO7Sb8gHCBeYRtYqp6kdF
         bpad+lD4UgzPg7O88Qdg+nBBBfKX1hZYZKDXPyvt+F02rGBnw0jjmUg8WSQXAlnbJK5D
         +CxeTkQgWXy8raJlGxdWhhSn4XIhjN/sb3JCNZ5ddWfRnMJBbJdpjLK9JvzgTa6qRgy6
         Kl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276506; x=1794881306;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzg2mafdxdFEs1lOpJlsFyILGqsWsSSyX3pGfyNClE8=;
        b=DbY/OBTgjqHbEdjZiHICdCxVxfitRvEUu+JYkr9TNuDo6BGvGufkrRR6mC0LQntdcU
         ud+MPUQXrOL3l415eVoYfx6BZVpDn0INqjVJdfR6rOLuxvqB/53TI9mSddnYn8DZ7Ei7
         WkTCrx5y5saSPX3PUKTcGHg6c+Ig3Tdop91yAGq76GKNK+6fxzNUFPdMcw4KWf1UGqBo
         9rJSF3L6KTISPxHCPddUluFiSL4IRyJF8N8RcVu3BYDlWn7DUqVk5QzecBOtC3fCpuvB
         tdTj5JD4qZhIAsE8fpiHuwvveXupBqv4p83T7X8Ye5ekhTBvkQEMwKCDdQ5CsikC4cjw
         wUVA==
X-Forwarded-Encrypted: i=1; AL+hErFtuWRFKovH1aH+FIVslkmyXXhLoRTu+uzRtWi5D+Se7TZRZZnotB3WTrIM9Q75bfh+ZJtdiUrCFKeBPA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jFTD0gfpaBTBiwMKhyF7oD8eB7MLf3jJiWjhJWGgMoVEFnv3+
	Fk8LjoC5W5rhX7xRPaThQAD/iSYQH/BI8ZJPdzYjN6c77T5yaH5RDIz21/CSOevmL5/OLJLXWQH
	Z0pHpaHyOJ2wMN2wwacoHnTsB+KL6kg==
X-Gm-Gg: AYBFou27Wz34+kJ2CUh6MEUupp0gSWIY7h39bakqA8Wp9BHxxr2hQFzZklwCcZ+khjE
	bTRB6wvbUodBhPQI8CQKOtyZzOe8VGF6aoYaqfCkwJgXYNF/2g519YCqBbhA3euXfq/fArc7sXs
	+xtCkfIZQ8rWtyv64vvLh79HhwEiky/RSVcq/VsV9TkqvH76AN9u8j0wHq/DsQgfv8TOm0Btq7i
	gcjF72Zv4+jQ9nGrNuLo16ZgAU0BJrk+O2EEskvzYmORM9yqCDMYGP7oZ0N1WYAmF9cQSVIaxbQ
	hY6ofNDv3ENcAMQmBd/8dTXZqCtDH6I/Au1ml3qID78qTCNA9cdV6dMllBPInfyrC8Xe0uy8UQs
	3yM6Kabfbr2tD3v6/bG8fvzZGFbVSqQrR8p0GBix7zgJGlC69rhrA5bnCoCDUbNzl80/4gfkIz/
	nZIpd3ZcV+f7TqpC9xE1JJC8p1VP6bYjCqA28tMkHvWQA=
X-Received: by 2002:a17:906:f58d:b0:c41:7e99:c6c2 with SMTP id
 a640c23a62f3a-c5049656cbamr100998466b.44.1794276505640; Mon, 09 Nov 2026
 18:08:25 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 18:08:24 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 18:08:11 -0800
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Mon, 9 Nov 2026 20:07:59 -0600
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
References: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
Date: Mon, 9 Nov 2026 18:08:24 -0800
X-Gm-Features: AclHuK9zIcEhLJfPfTc1f-zmgRBrGB7NhIU0-U0vwWpTSSE_uoc-gqIjLG_ZynM
Message-ID: <CAGEsz8G5RuLvQUkfg-H0zArwLrPuoCWEt2tNO+nMssu+w38sMQ@mail.gmail.com>
Subject: [PATCH v4 2/2] media: rcar-isp: distinguish absent cores from probe failures
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

risp_probe() interprets -ENODEV as an absent optional core, but resource
setup also returns it for initialization failures and deferred probing.

Reserve -ENODEV for missing core MMIO or the renesas,vspx property.
Preserve clock/reset errors, defer until the referenced VSPX device
exists, and use -ENXIO for malformed VSPX data or failed RPPX1 creation.
Convert remaining resource -ENODEV errors to -ENXIO so the parent
rejects failed initialization instead of continuing with the channel
selector.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Suggested-by: Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v4:
- Handle resource errors and preserve deferred probing.
- Apply after the IRQ lifetime fix.

No hardware runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c |   17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c
b/drivers/media/platform/renesas/rcar-isp/core.c
index 14f3c8f..0a32201 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -800,20 +800,20 @@ static int risp_core_probe_resources(struct
rcar_isp_core *core,

 	core->clk =3D devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(core->clk))
-		return -ENODEV;
+		return PTR_ERR(core->clk);

 	core->rstc =3D devm_reset_control_get(&pdev->dev, "core");
 	if (IS_ERR(core->rstc))
-		return -ENODEV;
+		return PTR_ERR(core->rstc);

 	of_vspx =3D of_parse_phandle(pdev->dev.of_node, "renesas,vspx", 0);
 	if (!of_vspx)
-		return -ENODEV;
+		return -ENXIO;

 	vspx =3D of_find_device_by_node(of_vspx);
 	of_node_put(of_vspx);
 	if (!vspx)
-		return -ENODEV;
+		return -EPROBE_DEFER;

 	/* Attach to VSP-X */
 	core->vspx.dev =3D &vspx->dev;
@@ -840,7 +840,7 @@ static int risp_core_probe_resources(struct
rcar_isp_core *core,
 	clk_disable_unprepare(core->clk);

 	if (!core->rpp) {
-		ret =3D -ENODEV;
+		ret =3D -ENXIO;
 		goto err_put_vspx;
 	}

@@ -860,10 +860,15 @@ int risp_core_probe(struct rcar_isp_core *core,
struct platform_device *pdev,
 	core->csrstc =3D csrstc;
 	core->csbase =3D csbase;

+	/* Keep channel-selector-only configurations working. */
+	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "core") ||
+	    !of_find_property(pdev->dev.of_node, "renesas,vspx", NULL))
+		return -ENODEV;
+
 	ret =3D risp_core_probe_resources(core, pdev);
 	if (ret) {
 		core->base =3D NULL;
-		return ret;
+		return ret =3D=3D -ENODEV ? -ENXIO : ret;
 	}

 	ret =3D v4l2_device_register(core->dev, &core->v4l2_dev);
