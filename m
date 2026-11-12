Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513895;
	b=bpXGQWeih1xTtjYOh8WLT4/vI4kC0CoUpS9MGa4n+a6XEico5UASdJMpmTsZ/F0gPXhr
	 yXTTkoVOn00HvlEb3oM6PDrAYJrkm22KOBU/ZW4nDJ4sormndtvsYSZHpsYHQN+H+oDoB
	 gT4tlld3SO2/4QuMYhIOXAS+ft7iVIcs8J07gr2X561SH+2Vc6j5t1F/AUmGVcCzvyLzp
	 9JBTkI9YzP4b+zoZ1ObysPvvQ1akilQCPBCpaz9uSnWQ9ciogYRuclD5ePvZg8UHbCkG+
	 Wh9nU6+UmyVMVLf3iC11fWtD+OZADB5WXv2oDdHVJhIFLlDNoNuU5whLiLEH2mBc6gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=WcAHgOOesRnpg5Fo7kmgrPBf3yTrJRhLe8HkoymNW8o=;
	b=dxU5kNP5kFfdtxZL8LmNrTjpUanyDXsfgfP/xmaTC3EWCecQ3QbOSIqeAfRFNnJoY/jN
	 cQuBrIaAsnX1YyT+WHysACQlEa4pLOs+EUrcUuzUij+DSvzfGP0WbzhI267YXSeFLAkh4
	 wFwFmjFa2VJEcr1Qr89oVETccyUYaWxCUWuDGVguk5hyf3ODwb4z08NWP1FU3BD1eEORk
	 /529mQkHHC5v9uTq4l80i5el0Ewh4tyit5DT9V2XhBDREMrK+Jq7IyJlx5CgoIsMZXVy8
	 yQaCjVp+1IO36oSjtNHeDdj56TfnfPvDH7/enV8A689hRDQxT/SFdtwKbTnwDh8mXxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vggPxoWo;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9602D606A323
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 20:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9602D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vggPxoWo
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso1841025ad.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 12:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794513894; x=1795118694; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WcAHgOOesRnpg5Fo7kmgrPBf3yTrJRhLe8HkoymNW8o=;
        b=vggPxoWoiJ/39E89qJZJH9FH/Pf989NSXBHeza98erDwU1o04E6KcfuzghMwxyqzrq
         8DBZXZvES0wlkSqPXtaZWtHFrYsS7Gm84DIAkiGqHuYJED5N4SS4iOtPr2rDTR8fE/OH
         SND5G9fli5Z9ZKhR/L5taQWjs6a9O5XLC7S86BCxzz4+Rk7/p7uho1Im3fDnYrDb7rpz
         6fGQM6eHHQ6gZXSt/92od+AN1MoZ4Xq61XQ/AvsYfoIait3kbgDNKbw2ZOxvdKr9rojj
         BMS6VQr38yYO58k9M0QK0gXMc0qKx/t/q7HvC5TtiCCNxTiJKzTsmQsNaTGZ0lE6uzm1
         UhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794513894; x=1795118694;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WcAHgOOesRnpg5Fo7kmgrPBf3yTrJRhLe8HkoymNW8o=;
        b=HfRV5V+MXLYGi0mUSr1VYr1MWVBO7Czmxu4jBl/V43ZkqSNC8McORx4wLse6d75OqV
         gurJAj5xZLBcWcNs8BI381trU93pmyLOStyPcZrzSE46t5q1V/kDbG6gdqCH7xr76QcZ
         rKc2iTByBXJzTD4u7BEs14cmcC4OfomAS9D4d2YkL9QMYFtwKE9rZ8UCDxxwuM/b4lfa
         Q1v14OczC0kxB1PGTni2C3roJrr5/2GPmXaFwsxv4uniPxRtjVLLEtFTN0ewR8wjPB9h
         L0ZPHkotgedMMV8tUnqb8h3VLnDrKybb3yqWw/D5khJBEiR0XRsSaHl0WJ0obJ+D9L+P
         wddg==
X-Forwarded-Encrypted: i=1; AL+hErEwiT8DYq5WDVnqUOFJ1poaIBPYHfQNoSS2BuSVVbu2O6BbkFigSqFdZuMU2IW+ZIomk5bTCWrfatnYMQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/a3oW0zt+wzrCZ0G2985QWPoB3PDtrdCs+kaheVX9a1mXQI3rt
	kyRGYbA8EI4K3SYd29o1+f731mHQMpM+PLb/1gx1y5n3F8BbwENeBk3B
X-Gm-Gg: AYBFou2Wggo8AUxwYgOPOG894m4LhMongMsab1yhWq6GSDOtaPW+Dqx1QBJrp1cyCuu
	GCCJgC51lQf6kscjAkMxhqe+FsCsHA/ENX9zVYThJQrgXjoxwbhKyUxQGf496rnS9DKhjdAmlCI
	U55R0tRg9jI+zud6xnB3J1snQxlWJmZe389PsrGs2KtABRT/CZk4qhZseR40iVLxRGzmE/nB3UL
	+m0GoU3O60fR/ZmbCfg7kj2DspS84lhLXVx2SuUQLjuvxl8lxKNhn1XTQcsM4vVShStsoH5A+0j
	hnxAR1pwMLUs6hrsVm02hjtgVFiZgxiXioWBuJO64VQccO3+S5pw1xuxSPGtIFbMCpAGhilzVd/
	EyyNCcPsR4noqpiRhtyLi6LYbpDr3kK/CGuROsqmGBBNuVCMOKjNGqsB8z5bNZToEjgy8g4OUf8
	SXqE3KFp/TtZwTsqF9WyC8va3T6jyH72/NfD72uSDbKo8GshGAkYdX5ASc7BAJgjJL55b19gu0H
	llifBre6rjBklXcBNszt3ROaVI4DoENnVkufCkolEf9bk0mJ1LpL0Dvj0V1KfxHHC6CW+XhNIDA
	4q4MPu2WuEUSfIh4crHbY5f05JCLwbAA0OGw8jTXmMV4Rp386gKED8Wt/HDP393pIYg5ihQYjqg
	HBJconkjEt8aOUHI08lZzhCYpmhcl0E01tw==
X-Received: by 2002:a17:902:fc8d:b0:2e8:79d:15ec with SMTP id d9443c01a7336-2ee0d664b70mr4529905ad.6.1794513893558;
        Thu, 12 Nov 2026 12:04:53 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75c980sm536275ad.25.2026.11.12.12.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 12:04:53 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 20:04:52 +0000
Message-Id: <DMTI31CK7EAZ.TT2P5ZN7BIVR@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Philipp Stanner" <phasta@kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH] bpf: make dmabuf iterator stay drained after NULL
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kang Chen" <k.chen@smail.nju.edu.cn>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
In-Reply-To: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn>
References: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 10, 2026 at 04:51 AM Kang Chen <k.chen@smail.nju.edu.cn> wrote:
> +/*
> + * The iterator state is one pointer wide because struct bpf_iter_dmabuf is
> + * part of the generated vmlinux.h ABI.  Use an invalid pointer value as the
> + * "drained" sentinel instead of growing the state.
> + */
> +#define DMABUF_ITER_DONE	((struct dma_buf *)1L)

+1 to T.J.'s point re: DMABUF_ITER_START.
bpf_iter_kmem_cache_next() does it that way.
dma_buf_iter_next() leaves NULL at the end of the list. Let NULL mean
drained. Then no need for the 2nd store in next() and for the long
comments.


diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
index cd50024..1bef87b 100644
--- a/kernel/bpf/dmabuf_iter.c
+++ b/kernel/bpf/dmabuf_iter.c
@@ -156,6 +156,8 @@ struct bpf_iter_dmabuf_kern {
 	struct dma_buf *dmabuf;
 } __aligned(8);

+#define DMABUF_ITER_START	((struct dma_buf *)1L)
+
 __bpf_kfunc_start_defs();

 __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
@@ -165,7 +167,7 @@ __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
 	BUILD_BUG_ON(sizeof(*kit) > sizeof(*it));
 	BUILD_BUG_ON(__alignof__(*kit) != __alignof__(*it));

-	kit->dmabuf = NULL;
+	kit->dmabuf = DMABUF_ITER_START;
 	return 0;
 }

@@ -173,10 +175,14 @@ __bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *it)
 {
 	struct bpf_iter_dmabuf_kern *kit = (void *)it;

-	if (kit->dmabuf)
-		kit->dmabuf = dma_buf_iter_next(kit->dmabuf);
-	else
+	/* Once NULL is returned, next() has to keep returning NULL */
+	if (!kit->dmabuf)
+		return NULL;
+
+	if (kit->dmabuf == DMABUF_ITER_START)
 		kit->dmabuf = dma_buf_iter_begin();
+	else
+		kit->dmabuf = dma_buf_iter_next(kit->dmabuf);

 	return kit->dmabuf;
 }
@@ -185,7 +191,7 @@ __bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it)
 {
 	struct bpf_iter_dmabuf_kern *kit = (void *)it;

-	if (kit->dmabuf)
+	if (kit->dmabuf && kit->dmabuf != DMABUF_ITER_START)
 		dma_buf_put(kit->dmabuf);
 }


Pls take T.J.'s selftest as patch 2 and tag the respin as
[PATCH bpf v2].

Also you sent fixes for css and scx_dsq.
bpf_iter_task_vma_next() has the same problem.
It doesn't hold mmap_lock between the calls since
commit bee9ef4a40a2 ("bpf: switch task_vma iterator from mmap_lock to per-VMA locks"):

Pls fix it too.

pw-bot: cr
