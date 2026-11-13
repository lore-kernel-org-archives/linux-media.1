Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794589200;
	b=MfCSTnGkxFQhDl7FAvIRkB6V1EnCokqkybq2bT+IAvVhxKerL0aTsNyAqFhVbQggB05f
	 IpApjNi3JTzdGdmHaXFOnM5phWy9paGwq6fSY6wbWtONZ7KOsdv14Dw58djW7uXL97ANe
	 Y2KJTEjYdd3iXlxw+JIbu8w/wIeuE5iq+lLjfepc1awMSLy3qC15bQ3IXTp89QLBzbUB5
	 oVagIZi85x1jIC+AZ+jh/nLVZLMSrchez06wYt3OT4dxS9UvtE5fTnNq606CZvk+5BgA5
	 Sq3rSN6R70HwkEd4QdzCmdSTxX/wBYasntuUtr9wNVrZG+hJZLMJYJ/BvQGjk+AmRRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ht73lIdKfLXzYIM4DvC0DDEzfXuL/I3GCKbyKODV+Yg=;
	b=uhiwrMVBLzBM48OGe6uaUyXyuXcoR63U3KRD06ryDRKkDnlduN5VZQ23NykdnLlzTnP6
	 4r2lge9XIEMNg+B/5Yo5q4MKq0fWnFQBuzKOMAj072ySM6vEUA/0kzMVMeBVimyudG4hT
	 ZX9z3ZFPLsUOt+EhhlaZueqarIiaCM1d9sAxtPc9SPOP7QcP5RvYhjLj7uGELMhoig0bq
	 EWiDs50eP1n61Tl3XpNYMiECRTpwae69cCQSVdmKVOj0Q6UNjybVjeEQo5MqZ0SoH4aTV
	 OTgnETA7GEqfsJmF54TEUc6t/8rCXg73VSujgqLhG+jcxBbKeGmy4/oCeL7e52PzBCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FYLt4ttP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B285606A8BF
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 17:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B285606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FYLt4ttP
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so88895e9.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 09:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794589199; cv=none;
        d=google.com; s=arc-20260327;
        b=jDeUglwtHaZuLem1AKG9Hk5P8zsTQ/zUTULRAvWqLshHKGO0vHJ8+vk6rcjYFPeQhG
         pB37MJicU5FEpuNEL/QVQpTVwX2EN4mIr8PtEGk/zKpal91U5lOXDUXA7h5sb6QBqHg+
         qRd9yzeErdyawSDlGYn0pVyAOsIGnt1VEps5/sJknBcpmFHZD0z2LUM8LnGA4M52CsG/
         TtVLmD0C2PTeAhOjgbCr0dCK6EXwZDky5692OlKPEmmrP7kQlWF3RTWyBCJ966jhPa92
         nW6L/jePdZlgRyFdSa3fDVXxvd/Lj1A/9zMHFzoz5n54dO0wDUvLJNyucfXZqfjvlikw
         Hwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ht73lIdKfLXzYIM4DvC0DDEzfXuL/I3GCKbyKODV+Yg=;
        fh=En3WpGHMfu97s99YStq02L44VwCpFpnHWqxJxF3iORQ=;
        b=O8r7DsoZxiTAZZVGYqRICvVbVHZRUv+dGFXJtelex9vMFpfTTO173/0oOlQCHPglDm
         w1ws9hOnXFNwblRMKAOE27wUHerQXRsO+6gT2RU7jQAGlzVr/wj/O55fOr8Dobi6SliL
         JLLbRPd7q3TKu2cMmo9+5GjaOxAWvHW2+e7j8Y3ldPeBhuoIInaFSRzCpzbCciZO+lZ5
         GD4+aU/zBh0vGvymPzRnj6ycbUMbCjISRl/My1B+57OQ8gMALuy7KO8TBDb6loOvg2M7
         kOQfvZRNPe5UAlyPmd6eMF5Gdbt5skV+kUMwK3rl5u0ulMNaIkwqg1qoVK6C1552U9pG
         ZaSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794589199; x=1795193999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ht73lIdKfLXzYIM4DvC0DDEzfXuL/I3GCKbyKODV+Yg=;
        b=FYLt4ttP5B2WVHQ6vCHPoKjcfSzLRA8ecYOiE3nk+gqHrDdCArmGFAfCyVT148EhQI
         skjMiEVfofxcg4nfQkdnRH/JuUm1GJzsPQ/7iVvkcS2U47+eiAF3fvSKLoC8XiZ6PpiN
         EsMq7P3BZPSdCP0gqXHlU+VY/K/cxaFCtA4aX2ZxI0lafAlFqO8dD4gj55d6W39NjDYV
         WLD5DXNDPLF0iPlngPDHrtgxmh9UxHCbX83YetyGUfWLNJhWfuAEtUAvsAxTrtXta/+h
         hzPHbYgbYCWnpaB1yL01GqPyf2qozPZTXq0xoJVXcTqEgA/Me6HcfB5kVIOOIIoj1a4y
         kdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589199; x=1795193999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ht73lIdKfLXzYIM4DvC0DDEzfXuL/I3GCKbyKODV+Yg=;
        b=mHBPnqKWIns6edDTlB71pvElZJrVFLuvdea73WkTbNDI41oIMgeSLkwMwphRJFgBOi
         JBsfmP1Tb5YtdYDvnQJshv3aMY/5ZsXwlKivdyFIK/Vbrmi2VHKQmJYWh7ysWcVe1KmT
         4mPIb2ibLoZcMo3DdVFR6hSKGzV61zR6lNNxh5Qyd/FZJBOap+zFkxjfl8tKn9rLfaAK
         YPqpJRIf4MtXVf0xyOQqq1sSyhtPF41/aaZco3++BJrQxY9/pCTkTkzxDnMl6hYIrd0Z
         UBPid5LSw+zm/fz5jn4X8Fm5Z3Z2BP8EXYux9HdER5dd41O0HmdPkjgsgNHSK+89pVFQ
         Qp+g==
X-Forwarded-Encrypted: i=1; AL+hErHx7tn9mKmWbxJDbeFs7eQSLGBhVO97Q+/1VQjpw85CS2ohT+Tm9YGrrFRmqtL+ygeyNAwWqrEiRPCHgw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8KnUbCrXUxg005r9UBxiUJd2bDpWGU6byAJYUNm7eBM1f3C/e3
	I5/hbygHL5jMEz1+DwXukLzSs7a2hW8IohnaLqKUCPseHVKDD4paHDaJFpNPhp6CIAvunV27cfx
	ScdRmYD5yk7Jp6ax71GWsMc45vQHpoasH6EHKst0H
X-Gm-Gg: AYBFou2m8+ZLega2NmT26Dlvk77i12e4IZ+uiwEy+340WeI7ui1XqAmMmEu1dmTaqrC
	YiqBtctl/HLtP8bRoiSlAyk8sIZ/fgwtqIw4uWv6ff5CR0laEl+TIqccpwUO0RIl4wvNiOzqBxm
	ox+e9AV02UlIV2RvBgsJzXI0T5psDVMOYNDXZZbGiDWwZTb1N31Hlhh2wkfhkj9gMsWjopMBV1g
	PQ8Y6tSeFrCaFVU21kRLICAdFAWNIB3OMgxBKHdft0m51vs/9LDnL1lnde3ZxV5iIglo1IMEPxP
	/0SSjJnZIQs+ckXwOLrTH5VqsRQJlHPkhSopLtTikc2tLz/3x3GsKpo4iR+JLjF3PxAe9ctzfsE
	gPdxj7UT1S2HSMn8MUm7PZPNSS8Tko7FekJRT5i7Bfr95DyePeg3SK4fx/IgmyNQLQEf3SbMVWU
	99yKWC7ex4HskYwAbBp7tIEdo=
X-Received: by 2002:a05:600c:ac1:b0:4b8:b175:c5a3 with SMTP id
 5b1f17b1804b1-4bb56e4edcbmr658015e9.9.1794589198370; Fri, 13 Nov 2026
 08:59:58 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113024447.922683-1-k.chen@smail.nju.edu.cn> <20261113035640.948458-1-k.chen@smail.nju.edu.cn>
In-Reply-To: <20261113035640.948458-1-k.chen@smail.nju.edu.cn>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 13 Nov 2026 08:59:42 -0800
X-Gm-Features: AclHuK-LFbMT3CtNvV1OqgqhSoIHpLJtutAfAmKAD9TN_Xuh-nAE2mDUwuHSl-g
Message-ID: <CABdmKX39KyeRFLwiJKpt0ZVjWkNcL62ajYNUjHfN4VXAqbHJrQ@mail.gmail.com>
Subject: Re: [PATCH bpf v3 1/2] bpf: make dmabuf iterator stay drained after NULL
To: Kang Chen <k.chen@smail.nju.edu.cn>
Cc: Yonghong Song <yonghong.song@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:57=E2=80=AFPM Kang Chen <k.chen@smail.nju.edu.cn>=
 wrote:
>
> bpf_iter_dmabuf_next() uses kit->dmabuf =3D=3D NULL to mean "iteration ha=
s
> not started".  dma_buf_iter_next() also returns NULL at the end of the
> list, so a next() call after exhaustion restarts from the list head.
>
> The verifier relies on the iterator contract that once next() returns
> NULL it keeps returning NULL: process_iter_next_call() marks the
> iterator DRAINED and treats the result of later next() calls as the
> constant zero.  A restarted dmabuf iteration therefore hands the BPF
> program a kernel pointer while the verifier believes R0 =3D=3D 0.
>
> NULL now means drained.  Initialize the state to DMABUF_ITER_START and
> translate it to dma_buf_iter_begin() on the first next().  The iterator
> state is BPF-visible ABI (one pointer wide), so use an invalid pointer
> sentinel instead of growing it.
>
> Fixes: 6eab7ac7c5ee ("bpf: Add open coded dmabuf iterator")
> Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

> ---
> v3:
> - No change from v2; reposted with the updated 2/2 attribution.
>
>  kernel/bpf/dmabuf_iter.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
> index cd500248abd9..390f6d730a67 100644
> --- a/kernel/bpf/dmabuf_iter.c
> +++ b/kernel/bpf/dmabuf_iter.c
> @@ -156,6 +156,9 @@ struct bpf_iter_dmabuf_kern {
>         struct dma_buf *dmabuf;
>  } __aligned(8);
>
> +/* NULL means drained; START means "not started yet". */
> +#define DMABUF_ITER_START      ((struct dma_buf *)1L)
> +
>  __bpf_kfunc_start_defs();
>
>  __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
> @@ -165,7 +168,7 @@ __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_d=
mabuf *it)
>         BUILD_BUG_ON(sizeof(*kit) > sizeof(*it));
>         BUILD_BUG_ON(__alignof__(*kit) !=3D __alignof__(*it));
>
> -       kit->dmabuf =3D NULL;
> +       kit->dmabuf =3D DMABUF_ITER_START;
>         return 0;
>  }
>
> @@ -173,10 +176,14 @@ __bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(st=
ruct bpf_iter_dmabuf *it)
>  {
>         struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
>
> -       if (kit->dmabuf)
> -               kit->dmabuf =3D dma_buf_iter_next(kit->dmabuf);
> -       else
> +       /* Once NULL is returned, next() has to keep returning NULL. */
> +       if (!kit->dmabuf)
> +               return NULL;
> +
> +       if (kit->dmabuf =3D=3D DMABUF_ITER_START)
>                 kit->dmabuf =3D dma_buf_iter_begin();
> +       else
> +               kit->dmabuf =3D dma_buf_iter_next(kit->dmabuf);
>
>         return kit->dmabuf;
>  }
> @@ -185,7 +192,7 @@ __bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_i=
ter_dmabuf *it)
>  {
>         struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
>
> -       if (kit->dmabuf)
> +       if (kit->dmabuf && kit->dmabuf !=3D DMABUF_ITER_START)
>                 dma_buf_put(kit->dmabuf);
>  }
>
> --
> 2.34.1
>
