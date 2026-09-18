Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB4C36C0AB
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 23:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789774567; cv=none; b=GIzIhtclVZK1P4DG4LhbaWNUXSSqNSeLx5aTcFVThxEYE7XQJA9tFhmU++al0cfelv8TsMvhtLKia1uxtYuFGkc8tUIpOZzNacG5cyNSyu6BQDi5zT6ZheFW6xIfNxrV1A/rkAHZwiE3PCVKz7kAuxUtNhoF4KMWsVfjBpG/3mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789774567; c=relaxed/simple;
	bh=G9DM2Of6M5TWxY6xCT2obytznk7tMmjDSD83/pDsXoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VAIzJ4MZB1gfO94MyALxtwv03Y86VvwRP+QjD2GcupiV+AqEazCbGYno6obX82uulhf3ln9IBDwS9P5h7CyLeavy1bm0BJlB3I9InBLf8VRwuqFgpA8ug9eAR6AIs/zMh7U56yAxmVNhV4yUIcFlHxeLbPjnfFW32hYpAsSuyTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PYPc7qUX; arc=none smtp.client-ip=209.85.217.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PYPc7qUX"
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-754ac74c495so89840137.0
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 16:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789774565; x=1790379365;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ntk2CWh32Ga1v8+3feA2R++RUDSg5e9QTrLv/pF7Lgk=;
        b=BCLUsz0JNUV2ebJqJe3HwwTKXCluTkyZe+5Op3hN/smg9CeN/bsjMMJUGeiEN7DkYQ
         X6ZjRtQkt1v2E7BMtgmGANcWCBbBX8bXcywaWpe+8Cp+whRuWBNalmp4kIIOetzAwCnP
         fZFfCDeyVtydNPReUlywAcZI5duIK4tTjcARAsiq92c14WxZ6T52YjRlKwjJS5mXZ3Wn
         0ZHSFV4ytoHTTMno7ZnDwNG0Eii2cC7dZud3EeZpSMjAc3PHE0dgxZ/68TvS+P4hL+6f
         QpEVSWba9U2U0zDvPjfYApLKVdTFCrowIhhJr/4ZCOi0wF02xVtprqPHX1IMvJjRrZ/U
         n8UQ==
X-Forwarded-Encrypted: i=1; AKwUvByWIW81GIj5h3JBigtnSOAAmJ8asey4oBHi9USDXU6uk1SqHNfpUZ2Axsr8W/00SULMH4spptICE2su8w==@vger.kernel.org
X-Gm-Message-State: AFuF++lUNVCNXfIvyTGHA99AwgIAlcewzstEv/+Z+IGENRqo0+Jq/eYN
	uwwT8sDZJG8wh1krw4+UHqQ44htc7va8v914F8ZTu9OHGvPyLRq2xILKdL4DM5v4xle30l0NDjL
	Hr6io+/CYpNHA4C9+5JtRl3t1OZVHXAIYImgr5/5RXjVLVNrv/fgZU0v5NRLZkDfs2c9n8nRMG0
	ZLyPQ9XYzSsiP1vFMCwym+McXGtw9VESMuk6DZ3XKv1VI3/+PGu1l5n3tSxsqgLt0Ur8wD0uUBN
	yfO30OqQGVKzXbgtICDMos=
X-Gm-Gg: AYBFou1TjSMaJ/wrwTMflLIUhH0cyvDFY9N38rRWNX9DB4328s/DX6Nd9Tlvc+RPvHr
	eRDDu0QD/6/OtsSXvP8E4rMbJ6+uSeamg+EjXLJoARQEZxtWeyLTEzXtWaf3o4/f+Jlytu5ziC/
	y9ZW0TLIU6BGqr1P4kj0ohatyC0aIbuV/YTWcPuf8LAVQ1J1zfKY0A0+quUGtpfALkZRJMjaLvZ
	+qiX8eB92dGKmFDSjZ0et20C2M04770gIeaT3kZCj8QhjkyLuTJR+K1SYUloYp7LAxhgiLbuVoA
	unY09eDR1yMuLU6aMJZ8H+FWWQsr7co3G19dwg6AL1QJz8K1V+kMLIMatWi34pNK978MErj/x83
	o9aS+kToeKG5gD1A4uqL54LaeBxcOCMcURRt5KEkgQa71m8mfLal1Kt19RtX5XPnskCDqGuKGvF
	NRIr0J44fBlgpuRJ/06RMvg26dmuJUyk9anKUJvnHC
X-Received: by 2002:a05:6102:8092:b0:7a1:f7d2:e843 with SMTP id ada2fe7eead31-7a55d7947e2mr1904548137.19.1789774565044;
        Fri, 18 Sep 2026 16:36:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-984b4e96298sm223072241.0.2026.09.18.16.36.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Sep 2026 16:36:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e087a17dfso2295321a91.3
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 16:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789774564; x=1790379364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ntk2CWh32Ga1v8+3feA2R++RUDSg5e9QTrLv/pF7Lgk=;
        b=PYPc7qUXlrSRq6O3USzKyKWXUvVXterfuCDQNio/wTQTvmmzZNhW7T7d+YFfW7DMVZ
         CrTmjWaUN8YYuRkbVwZBE0MmCl24GzSePJDNU9uGmRqE6Qr1N8kwLTJR9QtJ5vt0HjBy
         3OAjcquzjkhjwpx1gUrdPDpj8ni22W5D9gP/o=
X-Forwarded-Encrypted: i=1; AKwUvBxzKPcO7t4Hsie3Rxx5/1XkbB6NZddOkEm9VVb0QI4okCXps6ao5N07qSH58ipWfD+tCvmNd1Ky30Dkig==@vger.kernel.org
X-Received: by 2002:a17:90b:17ca:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39e54cb43c7mr7837827a91.6.1789774563811;
        Fri, 18 Sep 2026 16:36:03 -0700 (PDT)
X-Received: by 2002:a17:90b:17ca:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39e54cb43c7mr7837811a91.6.1789774563362;
        Fri, 18 Sep 2026 16:36:03 -0700 (PDT)
Received: from [10.211.247.235] ([216.221.25.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311ad4esm1741803eec.5.2026.09.18.16.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 16:36:02 -0700 (PDT)
Message-ID: <ac49be70-f10c-442f-a4d8-54075ffcf8d4@broadcom.com>
Date: Fri, 18 Sep 2026 16:36:06 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Fix GEM_CLOSE returning -EINVAL for
 PRIME-imported surfaces
To: Claire DuSoleil <claire.m.dusoleil@gmail.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260917181312.12473-1-claire.m.dusoleil@gmail.com>
 <ac19e380-e93d-470d-841c-7bd3f2b0b86a@broadcom.com>
 <CAEcBvW0+SqM2zHbaDS+JycXxc-ztzvixKtHVSVQby9viVH=+eA@mail.gmail.com>
 <CAEcBvW10sKwD2+Ro6o8Fq_9oLwsedq405f=gjQ+OMbY72=+VFA@mail.gmail.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <CAEcBvW10sKwD2+Ro6o8Fq_9oLwsedq405f=gjQ+OMbY72=+VFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Disregard my last message, I had not seen Zack's email.

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
