Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794276332;
	b=ZxSQ6GCZhzkp32+u9YtbjNEJ/sQNi9tBYWBwW8LIPH8LRe/w4OObaJzo0V0bNmt/39XG
	 KKxKK1NazLX8o0mEDk7NqMMxUstb46SpzDYuzXRCGAeY0a1Owg+7AlcgbPXsgQVi+IRYL
	 WF2cKEqGPnRCqQVFo5EY3ROc8nCdkQu+qkDe0etoGGd1GOb3fdeklMSQbdlQZ6GlOJCSZ
	 cgjKlT8ycs1goAcXL5AeIXuqAXyJPPR8tqzfX4MGp0ttSRJ2bwVFztThI5xMXmzyy6LFo
	 uKGqs6ICwrt0xn/7HPhs7d+Hind/h4kpfDMiHVA1dK45aC5mXO/Gcxb4Z6FYQ8uKtaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=5ly06LzxCxcnT+eqtxnGyn9sAp0YbS1j8iArjzdSjzk=;
	b=gs+zdeMWJP4sJYahJLCHrlN7cuk8xrbYAa1saSLR9iPYesBJ4hnYWRJ5RNRW3wrPrdq2
	 XwM1VoGb2/dVNmF844ig9Nd5MUs+M9WFnB7TFZNpVEVR6coVZKGAQBEpgoMpG0sBpaD6U
	 8h/emXsXETOPBKWjSwJVbnZlm/TYwllSKVF+Y3H8Uyty41YA7xa8Tj0uVCF2wqb5ttYLP
	 40LHCobaunR/gS5hNTVuVZ1gH2lZUa9uFI4AMAlThty5ExEWkcK1vm/E8PgTjW1fzUpuX
	 o1vdhahQwdb7q9kx1rKEuZVU7deNg/qTHiRdzY4ufuhaHqedO5Mod7IV/xDbkbGiyaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WeSmmqPj;
	arc=fail smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C901E606A330
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 02:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C901E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WeSmmqPj
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c445c95d553so205469166b.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 18:05:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794276330; cv=none;
        d=google.com; s=arc-20260327;
        b=FoetXVdayioB+DqMrE0inmLBIiXEuOw3ruW7c9vrRoDyUrpvgujE//4eAXRSUPhqhw
         5Su9bAb3FShOZp9tKc8rfM4j/O7OZiMLHWbXe9jm6bT+rmZV/FomB97LBI7RpgFCeqxF
         HObF62GgVqP83DymtecUSByTs2asEKlerUf2OYv6Ub0L7HmpmkH4/Om+9dicR1dvoAnT
         urbfD58mVSPs2ZrDDOb3X6Mx+v8oAOzuX07HLMwJqUlBKBfg4hGA36iA/7dwW2yJ12mT
         CNHPwl3NJ1jpVvtAxOWfUo7hNCvRTb057XOHBvgM8+t5U1qGbmzb3WWsNNwwnwPxuGF/
         8K1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5ly06LzxCxcnT+eqtxnGyn9sAp0YbS1j8iArjzdSjzk=;
        fh=wf9scyzlr+c0/jWCDi7J4pFc4Iqf8/wfkqkVuJdFsic=;
        b=Q1u7M8dx18moa4T0vEQvKFyqkj1F2lEQWqstxIrj1rTb+0i2UAnA8XIYmi1VZtMpej
         B/2Wp2hvqMJAPRg/4/lI1+lBolgI1eZ1hoIEfmCyCewVlS9SoBJoLvPaMLyrrAlUuT8g
         km8BroF8Z5jEX2XHkld48VS0BM60r1ugW1xW3gLKGfrJyaO91qS6dJqabTT5j6FOIsQq
         0E/VT8uUJP4HnpzZYjHFzjAQpWXgwupdYpnNoX5OkNon2C6Fl3isD/y7QgFCtf694rpc
         va4urU7Jb6ejpb+T/dk2DBpQAU1DoYpNwzkObjmSQhZoHVsFgg2zZtG7JJ/UYNgORKGy
         DBJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276330; x=1794881130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ly06LzxCxcnT+eqtxnGyn9sAp0YbS1j8iArjzdSjzk=;
        b=WeSmmqPj9oYt6CbGz2WJL1YHOSbW3KRP3BlaJT3/RZecDRCwFl9shRmqGLP+4GWoJR
         iUGkcG2vxUqZb0p2S2Wrq+uynYiIFP9Dzml0Q8pJmy2//UEsRR5NFRTDPabVXInnvo/v
         VZKGPU7xyXY6+d2xJu53l9S4ztCKhYEQE+AzDQ3/s7J7hpyjlCyGC1NtFsLRszg91uRo
         SN+gDbsxK+pDUOcGzhrN7GFM6fB3EbhzsWBaRx3p1rF7ebWMT61fsLe20jRQBsblZRBU
         uEdURgh/7Rp2GsTZV2YT9wKjy6WXLZ6SDM47f+KOZ2UIiLrHD0yIaZHrB8TdmGLOlbDk
         sc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276330; x=1794881130;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5ly06LzxCxcnT+eqtxnGyn9sAp0YbS1j8iArjzdSjzk=;
        b=BycV/XhlKQD4I5EHG1fAIOKEFGui/Y4aScoU/aw5H8wJGG5O+AKy5WSQDuIU8vLMfw
         +rDv507OVeij9rSv034O7gwx8x8T8qlSxdwS4qDVZpDcZZSpDwFdw2/4lQdNMQjsYU6k
         84xYGm9Lqkw9jKRSEIpI1qAjdNWa5rDMNbOFj3F5YejRIedH2fDk3hiIHzDc6RImh8FM
         SpRw1BVKoBxw+8dAOFrocpU9m1ARIRKhMftna++C/AOhd/FDjqnkpaXxFG7a4PThK9nC
         JKb+vb+PO1lmGs4Kdy3YkGLsKF2CKtz9hpPLgRs8GUrjJwIqM626/jkN5Oovyes4luRx
         r9zw==
X-Forwarded-Encrypted: i=1; AL+hErEFjH+BVkq1dZIsUNJNPXtS+/4+fvX2Pl3eCQhulJu7lFMOC70WXIKyofTrjh5LBYSXt3EkSbLtUlUsCg==@vger.kernel.org
X-Gm-Message-State: APuU4Z84CHazziv1qe5ylMf+b/dW+GmAHwkpKy7pXgDrIEFslWe0Js9v
	eXXbdLqzqPFnqeqdMWk1THtQuJW8TFuRDL4vxHK7gz5auAUY/tJ4ybHbMst9B5iAV6aGA/mOhHJ
	/726qctYarbMajcAUsP80ZqK8NhvUtA==
X-Gm-Gg: AYBFou3uhH+NyBzP/NeZD4hDRBxEVtM/gyOTFyni/aVKn4iM5yyGCvWeFK4p7wMJ5g4
	jp2EUuwKRmrF55saqPPqYF/IgCmdCsNbnePqi0iHJCv4JH6AZv/P9x3fwxQ4yXhVM+yK+No57xJ
	T861AdyAliDh/vlajWHjKVPOcjQ0bloHBf/UG8x7eLEEs+gcq9fVAvHM4DTlbvQgCHYhPUOqesp
	UbDMI1JGXnALY99MsslOxLSOPcBOwC/EDG7LMUwXrsJNtVqHxHPajhhjiuYZAy/iTJRii2GRAAs
	6GprtkHlPizegyubKoy7XWRN5E21dAopQHcZat7LD5DOX4TxgSsaRNTKP6e5SicEmrApJxVUXXG
	RLxkCVewmix00AUdpObDmpPLCYEXb20/+wqnLK4Cns3zlcl0knUuTJUbu6UqxT4guHefyXc7x0u
	IpsjoO7I8nfMZNehhN9hMSw2TztEhP6kGodgJOhTgnhOfOP3RNKP/M3vmC/nStOP8+
X-Received: by 2002:a17:907:c5ce:b0:c33:ca5e:8ddb with SMTP id
 a640c23a62f3a-c50495fe76emr88017366b.28.1794276330124; Mon, 09 Nov 2026
 18:05:30 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 18:05:28 -0800
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
Date: Mon, 9 Nov 2026 18:05:28 -0800
X-Gm-Features: AclHuK_B1IgAnEVdazOZdTLnofngIFWRqke7PWcMcLBdIVd8SA8s9C2nwtymCu4
Message-ID: <CAGEsz8Hvy-jde6K7vL4B4M=hpZpTYz2a1D_qza81uyhD=Fr8Sw@mail.gmail.com>
Subject: [PATCH v4 0/2] media: rcar-isp: fix core IRQ and probe error handling
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Fix the core IRQ lifetime before changing resource-error handling.
Patch 1 delays IRQ registration and releases it after I/O drain but
before RPPX1 destruction. Patch 2 distinguishes an absent optional core
from initialization failures and preserves deferred probing.

Apply in this order so resource-error cleanup cannot invoke the shared
IRQ handler after core->base is cleared.

Both stages: Clang 23.1.4, ARM64 W=1 object builds. No hardware testing.
AI assistance: Codex prepared the split and descriptions; independent
Codex agents reviewed the code.

Myeonghun Pak (2):
  media: rcar-isp: release the core IRQ before destroying RPPX1
  media: rcar-isp: distinguish absent cores from probe failures

 drivers/media/platform/renesas/rcar-isp/core.c     |   44 +++++++++++++-------
 .../media/platform/renesas/rcar-isp/risp-core.h    |    2 +
 2 files changed, 30 insertions(+), 16 deletions(-)

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
