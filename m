Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880124;
	b=afyleIV69VTK/AeuduzwWn6mfiYJ/OYARo3/bZyGsDB/8Tdl2ne+asWCljvBb8xdQwxl
	 5moob6ha2tgt1BWFQughQUC4s8QpzEYshVwRKAsxPyS9xvFHMzwBa7n+8/Y4AuLixmOcz
	 8GuL+58vaS6vvGpjSOW02rU0CP9kcGl46L49p+b+EMgwTPYaVzxaA+g/hTsxJdLajb7Kg
	 HXijnKgqM2DTPhLLy4XddRUBbAY1uaYlFThiWxoQwxkSeiCqeasmV6C5y71kjetn0fUnT
	 XsPwyc6q3zb4Ynhyqf0VYqNGVUTwSArSg1g1p8z3jaTkBvnO4rWCGrX3V7rfM/vKlrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4UNIcfLh2UmARAy7gKdF7vRyfbS9uaHEze4ik/95PcQ=;
	b=Q+OARUAJvf39sPZvN7mwRqxpoH8MfM6G+9H/clwCcVi+CiUxNCEpKIPvd6jOSGbDBkrN
	 DALZzM7WgYqRvE4mdjuhYYe5TzKhb9S76ag4g/n0Qlq/AkzxxwlRurlDGorBxaIxWYKLN
	 um/4ukJLt0ubaJjbdZ1J6t1mD/+XBKBrx79Cxb9bWrSLRGEi2r8kciLfN8xq1jryXYeNr
	 nGFalOo+7piXn188jqyw66o+E78fvV/Aiyh6JgJ1x/SnhDpXyeRGTa25XJvzcKURU5t5i
	 L3fwJLbasYQ7wTwCcR2hC7asPohHreD+PRydL2seMlb5LQvZfX6ZqyatoR8sAvZyarg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X8D70t7Y;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD5E606A325
	for <linux-media@vger.kernel.org>; Sat, 28 Nov 2026 15:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD5E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X8D70t7Y
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so114987295e9.1
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2026 07:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880122; x=1796484922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UNIcfLh2UmARAy7gKdF7vRyfbS9uaHEze4ik/95PcQ=;
        b=X8D70t7YzynWqvpBu80kvugfAAPkuzNiG/M1kd1gbDUL0bl2Z03/nJQuPmVcjst3KM
         XdU+Qw1H4I3ihxX2uUF33/2R84qK4z+/BJNYVWqX30MRGK7ROL7QRHCMLYw1Q5ho7y8R
         AEk9oYLYAfYd+p1maz1Eff3xM9sYwbNI92j5DootxIZ3yN6vqawtSlbpTDA1aVVY8FFK
         xt3CnjnhvIkkvZdLt1PbCGjzaBqlfH+2xZ48zFVlgKnouYm3zAzePoPFbkCdaLuFhSSk
         s3MA4kHOjzj+SdklGwl2+ONCSvU+Y+ML6EHWaA9CiOas/dpQHJomkmZK8jbJsXYE4IKh
         xcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880122; x=1796484922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UNIcfLh2UmARAy7gKdF7vRyfbS9uaHEze4ik/95PcQ=;
        b=a7jj+VBo+uCezuWfcn2gYaM1QxQs3TZ2imrSYQ7XJ25m5dg9v74fVMrtwiOfcGeycZ
         WzUM38qlVN+uf5xA5tBNHkoQLkpOq+E4TcMjWJrQ/5vN/sb3OKym8IOGI1Lf7jFdz7ur
         k3RB4dFZjS89qIn55PnBFpwgVuClb3NrkQkTXudQEip52/T4OA6XLHOmRQ3OHWV0HJsb
         JBavHQz3KuEv2SkkQHOFbf5sKPT71/ceJ7kYJruY9LuiR30LAB38BpxNOi+pmp+o/7AM
         m0aPEfCVENGBKwCukjcb+0TKb/RlgAECHXUaq6hjvAKuzaE0P6aTv0MugTn28ha3hSuf
         X9+Q==
X-Forwarded-Encrypted: i=1; AL+hErHO9DfYPnIjqphrYrsVSUb68ztFeiEb+NU1J6KD9uYgN+x9QKbL3PpTSrN+/684/E1N7/v+LVsQfC24Fw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+gNjZZwuwZSGBFZBPcHzHg20gHlvR+OwgowaJ/npT92ruPGxB8
	b0R8yIEcLH8XhW+OwfxDVJExvLcaLfgZpVaGN2w2aIrneFv4168g1/sF
X-Gm-Gg: AZFdTZeCmPHD/vK6egW1Bvdf7q32uJEADumlubvVuvZ7E1cjajI1SZUj9KTfLLRNPWp
	K3d1vbou6rfUJSEB2hRjy4zaRpTUF98WDtZlFrjpAOVdLTq0i/Uhzgn4PbH405efA8KE4A0oTCW
	ZRNFBcD98jdP4UpnhKqxuZsVNQBCchA5GXehH6O9bYXamrMQQUblRYiuSAYkhJlGLqKinPtHgDl
	/8sSaAbDwG79+2oDw6fZLC9flpAARDLgg6fQ8L3DH6TQfS3yNtDn5wu1/bDQ11pz9glQZn2Mw0x
	/Uh2BOxzOwV6oJeoCrkJEVzjBpB0OjrKdYzttoAHs+8/90FG+tAwA2n7Hb4AUvmeFcYiyUSGimK
	vK+b1oix0NTjP0MehOi4QdLQGpMDDkMU95HOqOOugX6VLDBjzNw/jcWtXyfoaUW0xloX7uGsGwb
	G7wF1EPOVNCZmVA3qNbg9/XY3vR0V8wNRx3kw6HBgKzS5h991jDUTxx/4n2788e3dvpQHT4SOJs
	GLmfcZC88+WR34maP58knsxOc5/qp1+DmRS5xCi26VT6lLymIcmmnoJnFAsenIqKejdEbN1QHDM
	I9BJnkG1Qm2g4Parja/xrLaAvc5Hf8vgISBRFGsM
X-Received: by 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr571761385e9.3.1795880122490;
        Sat, 28 Nov 2026 07:35:22 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:22 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Sat, 28 Nov 2026 16:34:58 +0100
Subject: [PATCH 2/4] soc/tegra: pmc: Register restart handler from early
 init on ARM
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-t20-soft-reset-v1-2-0db458c5996b@gmail.com>
References: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
In-Reply-To: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
To: Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, linux-media@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=1FogJzqzHqWpDAjuCweRHcTK3ViL2zXlOiygHcXOspQ=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl63hotdPHJj4Qa2g4NqnKVxrb9lt2dU18b8s462Xh
 vxlvRU3OkpZGMS4GGTFFFnMHgp94Znn9X7Dy62dMHNYmUCGMHBxCsBEGPIZ/vBubk5wqHlinHI8
 ufDsya5Ss9teUv8Eg26KFD/lKo6b8oaR4YyB2NSN96+zaR1YYbrL5/9Hm0luNd9yW1/s1s46mGz
 ZzgYA
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

On 32-bit ARM the PMC restart handler is registered at probe time, which
is deferred until the core-supply regulator appears. If the kernel
crashes before the PMC probes, it won't be able to reset the board.

The handler only needs the PMC registers, which tegra_pmc_early_init()
already maps. Register it there, using early_pmc, so restarting works
from early boot, and don't register it again at probe time on ARM.

Also switch early_pmc to the new register mapping before unmapping the
old one at probe time, as the handler doesn't take the lock.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/soc/tegra/pmc.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 721e9596b07d..fcd9a644d97f 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3090,7 +3090,8 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (dev_to_node(&pdev->dev) == NUMA_NO_NODE) {
+	/* On 32-bit ARM, tegra_pmc_early_init() registers the restart handler */
+	if (!IS_ENABLED(CONFIG_ARM) && dev_to_node(&pdev->dev) == NUMA_NO_NODE) {
 		err = devm_register_sys_off_handler(&pdev->dev,
 						    SYS_OFF_MODE_RESTART,
 						    SYS_OFF_PRIO_LOW,
@@ -3168,8 +3169,11 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 #if defined(CONFIG_ARM)
 	mutex_lock(&early_pmc->powergates_lock);
 	early_pmc->rate = pmc->rate;
-	iounmap(early_pmc->base);
-	early_pmc->base = pmc->base;
+	/*
+	 * The restart handler may use early_pmc->base without taking the
+	 * lock, so switch to the new mapping before unmapping the old one.
+	 */
+	iounmap(xchg(&early_pmc->base, pmc->base));
 	mutex_unlock(&early_pmc->powergates_lock);
 #endif
 
@@ -5182,6 +5186,7 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
  */
 static int __init tegra_pmc_early_init(void)
 {
+	struct sys_off_handler *handler;
 	const struct of_device_id *match;
 	struct device_node *np;
 	struct resource regs;
@@ -5235,6 +5240,20 @@ static int __init tegra_pmc_early_init(void)
 		return -ENXIO;
 	}
 
+	/*
+	 * Register the restart handler here rather than at probe time, so
+	 * that restarting works before the PMC driver has probed, e.g. on a
+	 * panic early during boot or while the probe is deferred waiting for
+	 * the core regulator. The handler keeps working after the probe, as
+	 * the driver hands its register mapping over to early_pmc.
+	 */
+	handler = register_sys_off_handler(SYS_OFF_MODE_RESTART,
+					   SYS_OFF_PRIO_LOW,
+					   tegra_pmc_restart_handler,
+					   early_pmc);
+	if (IS_ERR(handler))
+		pr_warn("failed to register restart handler: %pe\n", handler);
+
 	if (of_device_is_available(np)) {
 		early_pmc->soc = match->data;
 

-- 
2.56.1

