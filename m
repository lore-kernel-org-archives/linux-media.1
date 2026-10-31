Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793411095;
	b=NWJquumAsqBQBVAnCzHvhNAR/FwqoVehGG9Sib3VxCRk3SiD5YG1PgtK+5riYbJVZInY
	 kXxlx/uEVarkjhuczsZdsqfBbFAAly2kfQM7SPuRHlWHtCdWa8qzq71Ntoy0Yh1nobt7X
	 8677wtgeR3UQ8ObT8NLHETdu6C+cjiuMnq8bcgS9QZmePR7Sfy+fjFDEHcN6rcAcv/MVh
	 ECiZQ5+etmZrUCkeNIRmUn5wuBabHvUC+RQlK8j56UOr/w6ft7GDSgmLCRDmJJLueJwk/
	 WZOaJWjC+kJewfUJDdcklX4cGVGzW/m37nVFy7UVvc352ew6vfbMSV6yqBSuwttOdQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793411095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6DRdlfcgy+vOtjFUomjk9wUyOs/aRXJNwlIvfhUtZTw=;
	b=xBjYLcbnrj7TE8jCff5ErIajBlT2sKF0g6YQx3BbXIKG6kQbdHAuvFe0kHxdyjqU6CiI
	 RFWmWgzdAaC304Cd/0OM2LDYmVKf2SZ9ZYOd1z+5TwE2xmhFT6nRPcFsZKNXamZJb1Q22
	 VrOUnbRntLPVw1+nU6FiAfOZHC7wGBYfRczaFhggrRAbv2/gPDlIwSnRwQam3aG93cbxz
	 VLlOrO4/lFzA6IiIuZ6phgDqIh16h9FP5VjmgA88TxmX9rI29t8BYNwRJMuqp4k+ICBrz
	 5JSfEEz60RhDsPSqXr/EHLgDgBTuhm49Nj6NU1qATyuxudSETgxMLxRksu6VK4cy1TA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pTSxiqGX;
	arc=fail smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28171606A31E
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 01:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28171606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pTSxiqGX
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20d7a8984so10015e9.1
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 18:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793411093; cv=none;
        d=google.com; s=arc-20260327;
        b=jDW0UR/Or5gAfKgkVHdzIZo5ZyEJ7ZOtLnubnsqk5tiQLRlK7TkRibG2etlbmXH1bE
         84oACNOZYbrDCKVCWLL8LkhdY+XrcsU5ByhC7NfHz2t8ehEa/XvJqHRi+LTxolGN2rN0
         /K8MMsj3mhaV+jYKJ3AOkG7BolE/DZMf6x5KJ5eX3z9DZEt2Kr65wlrR+ar1h9PDma5G
         HZeVC+XKX8WpCGr9A8pCHcyDvgB1WQQ+yG6wClBfXA0uqVwtF7Iu9DY/4Hypca49UGOT
         E/p3Wtwbsb8QfBTE9J5cQXIkSZl4wqqbqhWRTe0RaF5fR1RJpS+f5Zvw9fVKDBVpXP8J
         w/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6DRdlfcgy+vOtjFUomjk9wUyOs/aRXJNwlIvfhUtZTw=;
        fh=xhFxbduYF5hdKle9+VLG+YsURO5zV5EzTlJJG3SSLQY=;
        b=JdSXVgU7UZRISgr9OpGc6VWFgtKVyEJ1Spjy57HZ/FuyEaJ6KdCeSRzdjDE2sq6R0t
         TIh2vO23J6dFpu+6swyPrq2fcWDorku186OU8zKlvlYy6FcQgCKoWef2KNpCYzstqbRO
         S7f9me73EwUarLUWFdgG9q2BtOi9+A5+gluJkzEb5v1YU7E5GOOqDe4ihTqJF6YVDFh0
         R5E2SZyDnEotaZ4+KtVo6nDOY1jFOAurp4cGXa8qYFG5nAW/UpNqji2fmmq8KsVgcksf
         +Rc2/503OciLcGWbxSd22B96CrSmX+DRdCrSA1xlNauHPMeuCbz2bDrrS0Mh6Y6d/M/E
         Nv7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793411093; x=1794015893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6DRdlfcgy+vOtjFUomjk9wUyOs/aRXJNwlIvfhUtZTw=;
        b=pTSxiqGXeKnIFTgIRow4invbDjsAiH2zV+0YXZVm+lBwyoVWkFdITWNiMcG7yKVf01
         6cFyb/HbYDwNG2aATzPG6gFN2IRQV92WN5bNaZ5rHzhBF3AV8/qi+goJOPdgjcZ3rUbk
         HwmCt4WleDebWqlk/QaMCYAYOXRMXQdZILHvTpCBCsNIFi/RAAuVK98S2ApdGpxqMP7h
         WpiItQjZE43YaWmQwxk/iuvRBP7zBMLoEqpb2ma3YEiVPHXtaStd19R7h2ZfHRUakUMO
         e/5/bvnZZYIeuorAp4zSgc8GtEI7GmDxY/j902qLCrndoYz2nr4oFlsy+SZlEFxldOEb
         HiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793411093; x=1794015893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DRdlfcgy+vOtjFUomjk9wUyOs/aRXJNwlIvfhUtZTw=;
        b=umOOO/Ed/TFeQKQjs0A75BrU1P6gPOhgRu+KcFqS9bQ3o2Qg6BRa5/Z4EF06m8/8xT
         xaB9gbkoOh+J1qRpkgpDz/g3VVkTnzm7P4vHFp5W8e02DmnDv9trnLHwoGBO4ntjGcEq
         xRx6n4GKQ7BZ4GxSAGE4hYDiotXR9QB8urvuqhTE//cvLhODr01iaUCS8a2R9CWpN0Hp
         jvxah6cD/2TMZOM2flqXlS/fx/xYi4b6BnENyMDAvlXnZKiOswT67zOy1egmQkVvIkHa
         e4OgFFS3/+QYBV97a56eAlIeMfam07I6VrFc3TQIpXRMgpVCh7yLGaUMEr8xEClHRPvE
         FVTg==
X-Forwarded-Encrypted: i=1; AKwUvBw85DA9rsVkjGFkP2PMtDeMYu+YHrMF1IU7c39JOdgbfIiVTIf6WC9MkUDgoUt8rzlgyL8+/WfWG5zKQw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKo13RgdtGuMD+30HGo247HuJWz5kMK40R79RUjTcsiCLHn7Y4l
	el3iqAIeTDyCfkyLOt090S+FUCRCnM2ERt0F10sYsDdOFL5eGEsTbu7qSUFbcHiC6CMf3hSHBxF
	aQBcmcQCbbAI0b9Gz20RNffP/Me3T4YJXR97b1Ycx
X-Gm-Gg: AYBFou2zvdNapC0DW5Sy3WDytBbYygDf0u3rVQYXU0H3fpEJf854OT7F0LscjgwtA46
	LMrOXDs7xvcFBKihFY1ctBKv9VBYttmq171At6U3Iyn8DEWIsZ6Hf1lqNomNfHJ+mp3MMMnLh9P
	9XwOF7QBeg85WeJw4a02k34OLt3K3fqBXDS7M+EYOPv0w9ZLs2tWSjqRjfCRXfTnqq6iI6x67N8
	HLfv6ljLDJgdDJxE28vJpsH/s0nvLVtrR0IuiKkt9tuUd+K1Q8j2j6+oCojAWqS+hzDQOAyk93K
	VGNoeGq/bf8hu657zXNUrzw98N3LFD6LmsWGHZU7mUznBVuo8qHmLG3LSIWyS4KGv407JynV8VZ
	YFIOmdtzT02f2HxEewF90StmOfogbFah/xfpTCyYwduu1QE0pOmoZjYz9kIAmMRWL1vt7
X-Received: by 2002:a05:600c:a183:b0:4a2:ba3:236e with SMTP id
 5b1f17b1804b1-4aab73beeffmr1795465e9.14.1793411093182; Fri, 30 Oct 2026
 18:44:53 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <18e3697ad6321d35.3137322e32332e3235332e313736.e98e6.0000sendgmr@google.com>
In-Reply-To: <18e3697ad6321d35.3137322e32332e3235332e313736.e98e6.0000sendgmr@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 30 Oct 2026 18:44:41 -0700
X-Gm-Features: AclHuK_pX8cbPFC7CZhySlOC0JMrDf_CX2tXJ-CkUmaeXv5SLhTNx2Dk4KoCGew
Message-ID: <CABdmKX0YRmr0ovk7teNQdXdLmC2LKruT59EQarpDMFcxoOFcQg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: Reject private mappings in system_heap_mmap()
To: Chris Wiseman <chriswiseman@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: John Stultz <jstultz@google.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 1:44=E2=80=AFPM Chris Wiseman <chriswiseman@google.=
com> wrote:
>
> When commit 381295758792 ("dma-buf: system_heap: Rework system heap to
> use sgtables instead of pagelists") stopped using heap_helpers.c and
> added a custom system_heap_mmap(), the check rejecting private mappings
> was dropped.
>
> Other exporters and buffer allocators reject private or copy-on-write
> mappings in their mmap handlers: cma_heap_mmap() and mmap_udmabuf()
> check that VM_SHARED or VM_MAYSHARE is set, and drm_gem_shmem_mmap()
> and ttm_bo_mmap_obj() reject vma_is_cow_mapping(vma).
>
> However, system_heap_mmap() omits this check and calls remap_pfn_range()
> even when userspace requests MAP_PRIVATE with PROT_WRITE. As a result,
> subsequent CPU writes to a MAP_PRIVATE mapping of a system heap buffer
> fault into do_wp_page() -> wp_page_copy(), silently allocating private
> anonymous copy-on-write pages whose writes never reach the underlying
> system heap buffer pages.
>
> Reject non-shared mappings in system_heap_mmap() with -EINVAL to match
> cma_heap_mmap() and mmap_udmabuf().
>
> Fixes: 381295758792 ("dma-buf: system_heap: Rework system heap to use sgt=
ables instead of pagelists")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Wiseman <chriswiseman@google.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

I wonder if we should have this in dma_buf_mmap_internal() though. Any
thoughts Sumit or Christian?
