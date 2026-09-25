Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3484E4312
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 18:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361747; cv=pass; b=KF1NXUU4NEJkiAz4/L7f0jbwg/Na0Jx3c5Z3dIfUMfZrx/GQj/9SctrPGuSGTtLhv7yVY5Yb4j8SctS16AyOJnAC13+IbdCuRrhPkZY8aOLjtHaoeeqJ2lKmp3Rh4DpfrmmM8JGGh6yhnq1Q/NKFqJAJRLfte6QOE9rnQJCH3c8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361747; c=relaxed/simple;
	bh=hrTFA0SFmbn2rhmMV3Ste6+KH/y0c6VQdoL8hcnAOM4=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrGFGqDEekrvTcvw6ql1ORWDUhwFiTBBjoDxKG/2X1/JkYGMMMysix40d6Xaxind4wlAmuwYMbYXT+tdxfThtGTjpY4vPOGIFVoJRDY0jKyQ0IlCkOXcQcpMtt980ZGJxrETfvg/QLFhGok/7t1JcxO8RLOrxAIIs1See1Lifp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pO7e4zZo; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pO7e4zZo"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15d3so154405966b.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 11:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361744; cv=none;
        d=google.com; s=arc-20260327;
        b=p3jnWSZllmAf2ACCMq5likujHxd1bgssy8cvShkxTaoZg35/qAMH3GdXvfrJVrJjvG
         TDwu1j09KxDMlg6wQPh0CED2Zj0Obju/TqfzVy34ljYRMhuqj3JcqQgqGF9qyAHXBwe7
         j8T99Sh8jO3ZA4dO+EXQxQh/89iYq/mguM7EDuewHxaG7xFJeOWbhbRbozcM/FdMBXDs
         y/m2HyN2QbDlPBbgojQKrL3mm2ipF8fNvD3dGqm0REF5kTsCEUd1UX1Aa0mKi1hYXbEG
         y2TLHXZK73tnPmW/bnNl5Mxa3odp6hYp4xvPl+9gCRDzX99HesQD5WaYDxLqqIFUc2sI
         D36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=zYr/lFJO//fpk4Ze4BmIq34iQIgTlgcqYAY84Z7aXAg=;
        fh=l7wu14yBo24Z5bW/ETTiPEx3ad17u+TYwkQxH6vlllQ=;
        b=S5V+8ko4e5STQlz9+7BsgwAz4m8ZjFEyCJdVjmM7qWzK5Bky31bapSnqiZS7nrWsTE
         c1DO9PQRSwA4w+FDclh1AQ9r8H8WNYW6t9yKoDXdXanq5noquN8m+Bwl8lt+426vZNbM
         TbyalXtEurJD0i7wB0VKXxsL6pLfTFLQEV78YaR13h+y49oEYalpnuNuCuB5KLrABMdE
         k84Bt/dOkMST6R2VaEXbId56gOShaUOpzFNqQHmtcLZLOJ6ASpbgLiC8AM3GaAGR6vRi
         MTWIRGjO2Gbz5jCQSb4kzvuWlDCjSvV3vSDu+ZMRbZp9GP213KrDtNSQH7qlgFtTAMSA
         FOew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361744; x=1790966544; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYr/lFJO//fpk4Ze4BmIq34iQIgTlgcqYAY84Z7aXAg=;
        b=pO7e4zZo1519ppE5GIz7ojI4kdnqQwVuj82ZTdM+2vrqECGG/E25Ld3Q4tW12Rdc/R
         Tz+E04YrbkoLZfXVrcMqzOcrmlvaEUKygB/asD9o9Zijn7sW6Jopn+e8Hd3Cy20zvofT
         cM8gwG3i7nDA33Bn1keVRr+fvfbTzuKPRFa3HLFkOc0t8ZBnk8Yu0CaNcn5zBfNVuDZY
         /K7AyIjWEzQGdiIYN9AI6hRqHVOgmpHuFE5De2aXFiVg+DnPMqt0HGAQyZ/WoXOYyRKz
         bfDF0RFeo61dPkkZi8inB/Gqcbm/JJCj7OAEPvv65ETHGjcltWdAhErbSaUEsrRSYffQ
         9ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361744; x=1790966544;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYr/lFJO//fpk4Ze4BmIq34iQIgTlgcqYAY84Z7aXAg=;
        b=nFPEMA96A0CNoE6p46quCK2o+EgDGT5X9e/bd8lqAv74DnauvB5tH3APp4XxG5fmCn
         UKJgxn1jqjaYs+L+FzIi3D623tk5ZhnRZOAgWCR+Ewr5t8Tks9XzUaiSYNI6yydXm+T4
         8RSdBWVS3A0VEwnGDABaGkwo3L0MLQ4NDELrLb0TWNyw/uYrLNTYXbKTCLzbl4DLM0S9
         SApcADnet5+a7axZ9mlqiirr40k+ZBvv/7bZPKM0YL4g3BBVMocoZ7l4HBrHM+lI9tRg
         donh+UNu1WrWEhtUIO/v4aSnbLUsB9RZ6pd8DOxaPvIDKZJ3h4TkoKLrWyM36dKxM1/V
         gWxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtlzKQu2T+wHPtiFBvqePSG5n87E+lHhKtCANG5rgHTz4bniRljvT/jqe0y37o/YBvm5OenSrD+lsljA==@vger.kernel.org
X-Gm-Message-State: AFuF++l3apChdPXc6XnPNNxLMS4tYUjQ0MfnePShhQYavKtOmE87fhyp
	U8eu+l3+ZU6e6tklTi2Qg1Wh3oRRB1iC8bBr0E08G1IeFB3EABSONqz4GWOr/5z+nxcJEU5NU7B
	OHQnlNapIH13D8amr9oT6VfYpihMyOA==
X-Gm-Gg: AYBFou1IYjCdb56jPex2Qik21PYbBzEhVLWSWWbGRgYQ/vvDlgnqVnIkasxapLkzGdX
	3EoPHM4RRuVxvzelIjwKGZet72gmbuG9piZACBQcRkG44gZDa4HR1RBjiVRF5N/LJvM8SbQ+JMO
	phhsp+m4J4dEra+0jhOl1xNRZGXEQPlwhyzlaL/WpRljc4e9VM99/1u0Jti/cUVexnm3zFlB/i7
	1JDwHlDDe1niNPEjbpJo6OWKcHnoLWShVjUw9wiLasAQPBFzPxaX2iQxxs1BVMxUUbru5whb2wz
	3iIfj4C/Soxv+dBiRTccMgtNGT3gaKPjUBc00XZTUcQMrAJXoma7veUHbcOQLX2HFLRY6nkrUSC
	bXOE/fL1YAl2yYBPRyoCZTgbZfI4nSBHtSy9vdpDh/FIUnM++nq6D08UQiBGjxNQf
X-Received: by 2002:a17:907:c602:20b0:c2a:f360:1c67 with SMTP id
 a640c23a62f3a-c2af3602870mr155361966b.35.1790361743598; Fri, 25 Sep 2026
 11:42:23 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 11:42:22 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 11:42:05 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 18:41:10 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
In-Reply-To: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
References: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
Date: Fri, 25 Sep 2026 11:42:22 -0700
X-Gm-Features: AclHuK-b91Uq58Jkr9vpiDUZfFWzBSqSctMSgFDJ6Ik34Htw_8K-UmJ0z9VCStU
Message-ID: <CAGEsz8GXrP1p1HM3TNJ4nWnL0GLqgp=pjsiwA-v-28wVosjtJQ@mail.gmail.com>
Subject: [PATCH v2 1/2] media: venus: hfi: disable IRQ before freeing HFI device
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

venus_hfi_destroy() releases the interface queues and frees hdev before
calling disable_irq(). An IRQ handler that has already read core->priv
can continue to access hdev and its queues after they are freed. Clearing
core->priv does not revoke the handler's local pointer.

Commit 640803003cd9 ("media: venus: hfi: explicitly release IRQ during
teardown") added disable_irq(), but placed it after kfree(hdev), too late
to protect a handler already using hdev.

Disable the IRQ first so that both the hard IRQ and threaded handler have
completed before clearing core->priv or releasing hdev.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260612103333.5585D1F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c
b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e7..e7e4e78a186a 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,11 +1689,11 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);

+	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
-	disable_irq(core->irq);
 	core->ops = NULL;
 }

-- 
2.53.0
