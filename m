Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794276353;
	b=sA4EdttZEuRqMkIA0EiLZYHcRDcWJDEpr8en+EQFdg6Te7tB9t3OhD4G9zQOuCFynyo0
	 hzY64SQUSwrsVdbqhOamUs4ce9COhkm3Nw02A97DGYsPhPksCMfoxlE3s+4+JVlU/MJej
	 1AKIM7RBZ5AWL5iscADg9NYHrund+KWp6BTZdND9nj5heTbGiaOE8YJ8fTANFaYXDdvxw
	 g6D+Vu+2PACSZ3QsZ9NJvus65gCOYA5gqNORjFWc4iXjH+AS/NFbqHpIaCPqDD6P17u3U
	 2FrqCjeMEp0qBpP3QBCLYsJ1wu2WgLbNZVVlw9bxwv5RviaTRjMQFW1MKdcjhPL7glw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Eeq5wOXfk2/ATFa6gkhyCWFMX/JX34himi45U6XUrLI=;
	b=Vzr0iQwNL8DOFylwXzRaFrzfGrIrxe7bRxKbwK820N2zb0ULqiTCWQpofvWxaTPn0EZA
	 w/VXZwM8LW3NhYKbhdZJX3r3BdmNxtfbMs5duD+7MeGJh1mR+ufy4VyICuuhxT5cUWwX1
	 oIBVr9jYH1BhassdTCZa2qMdoqs8giIy/JehwT+lsR9hmOs8X8S/05XmjNSgGDhWYoUs6
	 JdcR6F1xHFwtAYNh/EKhpEL74w2CzT1pZi8Bmn3plzQdsIUDx0COUn04hxm6GzAhrj7vX
	 XyI0lPbbtRm46RoHkByzpL2PGAtC5U3BrfXjpGwLHLeix7550tDZXDQA5U40AE008UQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=miY8TFcZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B336560A2602
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 02:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B336560A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=miY8TFcZ
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d473cfff6so216764566b.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 18:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794276351; cv=none;
        d=google.com; s=arc-20260327;
        b=kOheqzWZtifT7JlzcvSdn3hSgDMQYl26kGvPIh+eQaTryct6vigwF/nHfa2YrzaeCY
         SB6VzKNowri3Vsqdl+iAJ8V+bd+rryq2rgrwaFhX+pwWlwWfMr/2KOqXQK2BQYkV0YLz
         ACdsZkUU6MckNZ+46BzcOKiEJFdZ66iDkw/LWOI80lVpcjNckP0plQMSfYs9Te100F95
         +y+XzYWLu02JQpc/WNNcuC/rKWU9afPCeJv48lQoF1GXu4PDCeD9fAC1ChNn2tmD3emO
         RlTbOWbLWPCmo62GjOCs47W2hLjHJ13hB1l4h0OfitCPYO9AEHTomlh5u+sDYkAc1MNb
         0Ptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=Eeq5wOXfk2/ATFa6gkhyCWFMX/JX34himi45U6XUrLI=;
        fh=Q7ihssSpiWVeyLcQW7c1ezJS4ixF+Kv+n/RNoRgu8cU=;
        b=FUGIlcLTQlSM7vi0LAJuXwI3RSUzbYg/EtBLntZ8vMPnQMk7WOotCS3jlfRvqWstgS
         uN4/V64qNCAEuazdiD3iAK7jEElB7QD6y892yM45+MAgEj9Gg5cqa7zrQXW9IYCW/24h
         DpUDVNUcQGRjpnZA3CwAQkAHnQjL2IvshTwdETnjraiTj4ogsDfuk0RoQqsDMcfelgKz
         ryKblgpYxu1UOnEvzwVPAH/bAtWfPiGbvcYFHm7gn7Rmz0bYTkGVY9pH9cDcQYi7w04k
         o60UcnsBtOLB3OhOUPlibPGEUpx6c9I6Rsomve8waM6eiryXRcL/5Bzad3HYzkx5aP8C
         Saeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276351; x=1794881151; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eeq5wOXfk2/ATFa6gkhyCWFMX/JX34himi45U6XUrLI=;
        b=miY8TFcZ2rbwMLQkWSsDD7zmZ6ooCAoUOcq86QZk8i41fGcql9y618JRlOnqnT6ee4
         O6BmRN4/erPMZ3vJ2i/O6d62S1w2jX3dbdzsxEiZZyYB8fi/+1t1s3UcBW5d3Ksdh0K6
         95qghzTlJWFatSeMWJLvfN19lDgMS/BVwtC34gHX+ShHcvFloNUOqf3GxU4uUyEC8w+p
         OxMqCx9Lhbz4p8taLazb5es9R5363LgPZYAEubiybrtVCXDd4SDeu7oSHqph39dFRBzV
         EPcOlyobqmHCKTnD1RgVIc3AMtlnKbC7I5FQSEIezQUlJWhx5SIQo2uJgYvueq7FdsI/
         wEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276351; x=1794881151;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eeq5wOXfk2/ATFa6gkhyCWFMX/JX34himi45U6XUrLI=;
        b=XBaWXfoMKlul3FKBoAl6wt/bBBK7Kn7Q0stsAfE/pNOGlW5y63mSFxBP7Aulx4Nroh
         XDPTeQaqL7tcujEbEXnax3xEgEEPZ+M4P9mqxnfd5OBz582R/cTcIVMfKz9zngJ+EqOV
         5gAlQGzsTL7NnPfuM/AGCjX8sTmPhdLOHAqPE3BJ0EoGg/yykxdvAstOB5uN5VAPL+NT
         UDiDzgHnzffa8+q9kM2rS0MVfoVg1t9qPEdsVkbGVu23ifA9U9sSRwpbZ1qt9azSbC9q
         t5zsPkuSszDl/iS9fYPtn80pufxQxN5Y2l5+4rfJUDBKpwCYEeSfDW45cyBzouFHivDL
         KcmA==
X-Forwarded-Encrypted: i=1; AL+hErFldXlUUx5JxgViU3TLm2Uwml/8QCWOAo5ErdyKE4XoHmp7TZG/iRjfXlHcLAXJYZv6SQzz/KdqCU8/Yg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8gEfjL5wJmFdErWLcOjz6dCwwyMs9yGp7FzhWLLQZ2dxNYAv7o
	23N+MMSCFBE0P8XGlEGyw91lPjSicLrdmwiVlDEGYGGGDyWsy5viWZm28QxySyy+snlQieYGw17
	lvY0rWTDG+J1sAuecpT9vZ+1eRMwm7Q==
X-Gm-Gg: AYBFou3234RMOKzywlJ2Dp2XRaCbAoFui76ESJt/52OYuQxcpfXv5BOZeAgaiqxZZq5
	MDv3RW6FPJeLFJEv6KB3VRD/IdZDPSu0w/babSMKISH83FKv3iDHeNji6JJvLnmyas90TKFzAM/
	Kidn5JKQIrlnHI6nBspj2qdv8EyxuapBEc1TiX/CVMTLIdYF90LPcw9F0KVoSH4jA4B/npJM9sW
	avetVZaRh2jO0BiEHMrg+z8YJUCHtsVLuhOOVriG1N+rJbPZ6womcw+oszO2om0b4q/jc+J/nNc
	cjYwjIPMnSCFvcPgyr1VTr3yctncPjkIxMn9Pus8K6cX8MpX4i8wlqbETz1lFv5YTaQkSNwnlgG
	rpVdaZqLLWDTjPAhpdOAzmD44wbg1lMRUOmRa0uxFjDnlwgLM7Wei+sbVBL14wWrFX6KLFp9U4i
	+sL+t3R8IagX0eHiHCK/SwrM2VQ3gRuXPX/sgSq/rAtiaG
X-Received: by 2002:a17:907:3c94:b0:c40:f89f:d91d with SMTP id
 a640c23a62f3a-c50495b3696mr78780966b.28.1794276351043; Mon, 09 Nov 2026
 18:05:51 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 20:05:49 -0600
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
References: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
Date: Mon, 9 Nov 2026 20:05:49 -0600
X-Gm-Features: AclHuK9rTjy88XXbmF3NgOYWoI2XaAbuNurVjlZRMzsYFXvkTmaFvaUM0hy8Db8
Message-ID: <CAGEsz8Hf1rpg-6spE_S98i0CKrOHrpGHeTZft=UQyA-0FChq9Q@mail.gmail.com>
Subject: [PATCH v4 1/2] media: rcar-isp: release the core IRQ before
 destroying RPPX1
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

risp_core_irq() accesses the separately allocated RPPX1 object before
taking core->lock. The managed IRQ can remain registered after probe
failure or removal frees that object.

Request the IRQ after initializing RPPX1 and the handler's state.
Free and synchronize it after draining I/O queues but before destroying
RPPX1, keeping completion IRQs available during drain. Unwind the
subdevice and mutex on IRQ failure, and convert -ENODEV to -ENXIO so
the parent does not mistake the failure for an absent core.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v4:
- Move IRQ lookup/request after initialization and fix its error unwind.
- Apply before resource-error changes to avoid DEBUG_SHIRQ cleanup
  with core->base cleared.

No hardware runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c     |   27 +++++++++++++-------
 .../media/platform/renesas/rcar-isp/risp-core.h    |    2 +
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c
b/drivers/media/platform/renesas/rcar-isp/core.c
index 586a5ad..14f3c8f 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -798,15 +798,6 @@ static int risp_core_probe_resources(struct
rcar_isp_core *core,
 	if (IS_ERR(core->base))
 		return PTR_ERR(core->base);

-	ret = platform_get_irq_byname(pdev, "core");
-	if (ret < 0)
-		return -ENODEV;
-
-	ret = devm_request_irq(&pdev->dev, ret, risp_core_irq, IRQF_SHARED,
-			       KBUILD_MODNAME, core);
-	if (ret)
-		return ret;
-
 	core->clk = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(core->clk))
 		return -ENODEV;
@@ -887,14 +878,27 @@ int risp_core_probe(struct rcar_isp_core *core,
struct platform_device *pdev,
 	spin_lock_init(&core->lock);
 	INIT_LIST_HEAD(&core->risp_jobs);

+	ret = platform_get_irq_byname(pdev, "core");
+	if (ret < 0)
+		goto err_cleanup_subdev;
+	core->irq = ret;
+
+	ret = devm_request_irq(core->dev, core->irq, risp_core_irq, IRQF_SHARED,
+			       KBUILD_MODNAME, core);
+	if (ret)
+		goto err_cleanup_subdev;
+
 	return 0;

+err_cleanup_subdev:
+	mutex_destroy(&core->io_lock);
+	media_entity_cleanup(&core->subdev.entity);
 err_unregister_v4l2:
 	v4l2_device_unregister(&core->v4l2_dev);
 err_destroy_rpp:
 	rppx1_destroy(core->rpp);
 	put_device(core->vspx.dev);
-	return ret;
+	return ret == -ENODEV ? -ENXIO : ret;
 }

 void risp_core_remove(struct rcar_isp_core *core)
@@ -905,9 +909,12 @@ void risp_core_remove(struct rcar_isp_core *core)

 	dev_info(core->dev, "Remove ISP Core\n");

+	/* Keep completion IRQs available while streaming queues are drained. */
 	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
 		risp_core_io_destroy(&core->io[i]);

+	devm_free_irq(core->dev, core->irq, core);
+
 	v4l2_device_unregister(&core->v4l2_dev);

 	mutex_destroy(&core->io_lock);
diff --git a/drivers/media/platform/renesas/rcar-isp/risp-core.h
b/drivers/media/platform/renesas/rcar-isp/risp-core.h
index 627a762..9e057bf 100644
--- a/drivers/media/platform/renesas/rcar-isp/risp-core.h
+++ b/drivers/media/platform/renesas/rcar-isp/risp-core.h
@@ -112,6 +112,7 @@ struct rcar_isp_vspx {
  * @dev:	(OF) device
  * @rppaddr:	Hardware address of the RPP ISP (from OF)
  * @clk:	The clock for the ISP CORE
+ * @irq:	The interrupt for the ISP CORE
  * @rstc:	The reset for the ISP Core
  * @csrstc:	The reset for the ISP Channel Selector
  *
@@ -138,6 +139,7 @@ struct rcar_isp_core {

 	u32 rppaddr;
 	struct clk *clk;
+	int irq;

 	struct reset_control *rstc;
 	struct reset_control *csrstc;


On Mon, 09 Nov 2026 18:05:28 -0800, Myeonghun Pak <mhun512@gmail.com> wrote:
> Fix the core IRQ lifetime before changing resource-error handling.
> Patch 1 delays IRQ registration and releases it after I/O drain but
> before RPPX1 destruction. Patch 2 distinguishes an absent optional core
> from initialization failures and preserves deferred probing.
>
> Apply in this order so resource-error cleanup cannot invoke the shared
> IRQ handler after core->base is cleared.
>
> Both stages: Clang 23.1.4, ARM64 W=1 object builds. No hardware testing.
> AI assistance: Codex prepared the split and descriptions; independent
> Codex agents reviewed the code.
>
> Myeonghun Pak (2):
>   media: rcar-isp: release the core IRQ before destroying RPPX1
>   media: rcar-isp: distinguish absent cores from probe failures
>
>  drivers/media/platform/renesas/rcar-isp/core.c     |   44 +++++++++++++-------
>  .../media/platform/renesas/rcar-isp/risp-core.h    |    2 +
>  2 files changed, 30 insertions(+), 16 deletions(-)
>
> base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
