Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794231874;
	b=asH8zvQdWA+z4C3VHacqDj74HLwLKkjRPydwrgB31uy97btCEzwyBNQpLczxyFGowoCD
	 sKRHBkpOdFzPL8yqjmUNEql5EQy5cBMa3aCJCIDzPVSkp8jD9SDduNxsRWFQBp4BhoFLC
	 v7gBgiHaz9pY/ajR3+csx9QzgNorFZE6enIZa1t1vFvs9uOJlVww5hHucyhZAM6OT+iv2
	 AfY5kI2odjNxbi7W1jqmD4oLeUSFV8AcH6P8hiBXe851L64qCyPtgly7PqBlQ0mK8g4/4
	 yfjM/TWLvutpdwRJV1Bg3HNm7lPqyHcb8hUmiO5dkTNcpcI2c4aXW79KFBypmhCfjmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231874;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=bghOY7pp4PqTwolmTpdD1zvT8+4Tek4EN2nSOV+gjQQ=;
	b=bca9f/IbXYKeMdZu20P/J4qBGSRcdzhVUDP4BAdf2wET9c+2b0QNPINcMGFE+dr5nNL1
	 nlsS023QVezilaErctZqXLy1MoYumY+AHj/QefXRpRUW9tePL73yiSlw+HndBVChsQJOZ
	 pnyHdxpvtIrsos8m9X9mlfakCpQGEo9V4mhodX/yqzbMh9kGeJYlbOkMWEMJkm98sRNl+
	 cJb6IOX8d5VKsNCR0qRcroa9SLL3F/ky0cqPfdRhejCkbcYReGcdjjsY72MA1kYSx3k97
	 a3sPeA1vnX5bIxC5VhyFBJiAEuIxFbZD6PG8BHUcDvANGybDH/XMJ1LduXGZjvagulA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TImMvHFX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YvJeU9XV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CE1606D831
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 13:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3CE1606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TImMvHFX;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YvJeU9XV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794231872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bghOY7pp4PqTwolmTpdD1zvT8+4Tek4EN2nSOV+gjQQ=;
	b=TImMvHFXpxlE3RZ/IESRjzXY1Bz3uz7xYgDzlWTn5NUo4sYbsDhB250NNUtPlMXxdG6DBc
	WGLwO6SrQB9OF8tN3uQs4q77tBIalQZPSuzMxkuyVzd/PCVOY7m+CBdrO/4kVUtIPdziQv
	zULBqgLEhzg8pLONbEyJmnj8v9psdCA=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-zo6j2nKvPqykIxF8yRxrhw-1; Mon, 09 Nov 2026 08:44:31 -0500
X-MC-Unique: zo6j2nKvPqykIxF8yRxrhw-1
X-Mimecast-MFC-AGG-ID: zo6j2nKvPqykIxF8yRxrhw_1794231871
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4e778acdbc6so1026087b6e.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 05:44:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794231871; cv=none;
        d=google.com; s=arc-20260327;
        b=i5Edj8ydylrKkSTk0YlMiCSECvrcOd1xhsTd4SlNfAeo5aGrN5RrpEZTMh69uEl4yR
         Ug+3GaMyOfkAUQjATkC0I5ESGOtlUMMOMTRWr+7Z8IoAlqm1qXckKXqzIvZZZGacl2bA
         twMnz0OA2kRRy5JWiqJuRTDkFY3SX6GOcndfveW36ES+qqVqu+ZmQJApm1At7geZnfDQ
         +Wuk3ydAUSWSgD6NNUAUQv1kDJ+3ilAoAf4UF+Kf9vDiLZe9hiR2QDCflBK6vQY5GBRL
         gD10XQ/8/Pa8yhD+f4QqtnVlVuYHVO0tZi2xeRPlRxzEalF1qu1P54CJcVZXxyR5qDD+
         UsEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bghOY7pp4PqTwolmTpdD1zvT8+4Tek4EN2nSOV+gjQQ=;
        fh=mhnpMF0VLzjhrNfP4oPW+V1+Ue4cvI2ILbIqpl7YsMo=;
        b=pRyv5h+54XlGIdJzsKw81MWa/sUBjGzULNx1XK6ndLzu5QVRtLBUZWHxCrcdLRumjv
         aZlBtlb9EA55c5ITUtCXZwRJvWTOG5b0bEj8Z3+ovw0WNwdJMRzr99Zr3vgvhf/1xeXw
         C//uyILVGRqCnau3GZunCNs+FuuBCf2imhROJe97i0aVKvsNVsHvNPja5mCUAdItlu0/
         mIW7/lOQUPq/jbct3x59nKGFTBWBnbFCjP8CCh4J0RjD+iGAnI8asU6/6kuQgsCIquuq
         j8dm1VdCDRSOI+EFE8pgjOZirTdgunN2Ke6h59wLsknWIyUKjPkW4XVxa4HUt2t4yD+q
         4QLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794231871; x=1794836671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bghOY7pp4PqTwolmTpdD1zvT8+4Tek4EN2nSOV+gjQQ=;
        b=YvJeU9XVwfRisHtjyrCD+g+YGGD92Y4vF2X6jtfhy6ghLt1eFKkMwEPTldRNTAcYwI
         GItFYO/P+dcWYTGtr8Jy81fAkwVcwgfbfg96bG+xjrb/OnsMZLb+hZW5MN3U/ZKjDpC0
         BOcktFnfPUXucHdwF1+UR4tDqvpRyDMezw8t4YfkxvDhMjaakRyGd2bAZ87J4j/v9ugf
         hJ2UzlhDvtuOcRc/LSpuVIkVHAqmBkkuIvITMWlo8AhVzCCkUw0C8YPHftpTxw4nf6N3
         L7byH35l6GMhiO9yNgS5JmHr9mlH1MPlA50sUGYgHyc+7k5qS/eYAJOO66qnWTunj81x
         ywUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231871; x=1794836671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bghOY7pp4PqTwolmTpdD1zvT8+4Tek4EN2nSOV+gjQQ=;
        b=GwegRhryBZ119p5mfq3KbfTPjla63jp+EiQcPv5It1OvU+t9aFVcxtIVR7IbBA4QNG
         l9Na8I72BYEU+u9A4urBImQLcG288eWpjAtQuvFdQFKSY2HigtCvRB3ewUmxH1l2+/ab
         3vuvwF9PhzudZmxwexLSYvqHf45E6tIC2JNgynoHjBaaORoU1KSNWeMPbEKmQFDHPqnh
         II1nUas+1QLtd7KOdqeJL3Z7/mkovcyVFsPuMwqMYm7yo00fIeFPnooBkjb4Jg6oWsp2
         plVP9j0MrDxRrGRKeSfM5+npXGBMf0CtKXyZDpOl7Jju8KMyJmvcsOCxRsKvPcgL4mh3
         2kRw==
X-Forwarded-Encrypted: i=1; AL+hErEelIbPQLlL52DZimqgU6+O6YSqv+Pg3TpyO16qUAIjht735JlXHSTKUddvK20Geg5yMjeWz28xBlfNRA==@vger.kernel.org
X-Gm-Message-State: APuU4Z98UNlozTNmdqRybG7hLsBiLxmYIxXmttnh2TOAiWuB6grJt3w4
	5U6JAIxXpEVrKqeY4Kfp30uLPh3mm8m0MwzJD6v/g05dREE5jLCUrCNqufJRZWkMCVfosEcnhTa
	+qvghg3DFG6EV8eKnK/WCaOPoNTqmtLJrygnhYgpZhiP9jkO2Y7B5b7t2W5+hXftJHiTT8vD4j+
	AkREYSbVokB+wSyXK4y9XeLvm7nO63NxXtMUOZ0JI=
X-Gm-Gg: AYBFou2M2rnVAQc0Uzrpysga+5Rg8/Et1loJksEf5QEeyPlrw4xMpGH3PJrD4JQqZ5o
	Nuq/JkMX7pW1ojr7vYJ5qF93eZeBWVXSZ3vHz3wPwIEAzY/4maIxe5sJgL3rxx2U5avfRV67KEo
	9zL4CCvksjseytg08+vDfVDNVuhYYm7pKKMDX07OUpSDhJI5sxYDhi/rBI
X-Received: by 2002:a05:6808:4fe9:b0:4d7:17d5:6c9b with SMTP id 5614622812f47-56814022659mr2709776b6e.9.1794231870735;
        Mon, 09 Nov 2026 05:44:30 -0800 (PST)
X-Received: by 2002:a05:6808:4fe9:b0:4d7:17d5:6c9b with SMTP id
 5614622812f47-56814022659mr2709756b6e.9.1794231870169; Mon, 09 Nov 2026
 05:44:30 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106131829.3228926-1-cui.tao@linux.dev> <20261106131829.3228926-3-cui.tao@linux.dev>
 <1e18fcfd-785d-43cc-afd6-d181bf8305eb@amd.com> <CABdmKX0nCB2hT+iMh=BB-nC=fUBPof8YvjvO-gtEw+zcHZgvZA@mail.gmail.com>
 <b0f530ef-bbfd-4112-aa51-82fdad6c4ba2@amd.com>
In-Reply-To: <b0f530ef-bbfd-4112-aa51-82fdad6c4ba2@amd.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 9 Nov 2026 14:44:17 +0100
X-Gm-Features: AclHuK-kxgj3T37bjFOZ7HtSClpdxsaDMPyjW53dccz7zE1_ZSRFcURRmSZwzSI
Message-ID: <CADSE00L3AfcnfcboK1TdPQiW7ZW1KpxG70b1oyWFqpLciOG6ng@mail.gmail.com>
Subject: Re: [PATCH 2/7] dma-buf/udmabuf: account the page array metadata to memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, Tao Cui <cui.tao@linux.dev>, akpm@linux-foundation.org, 
	dgilbert@interlog.com, mkp@kernel.org, loberman@redhat.com, 
	jmeneghi@redhat.com, kraxel@redhat.com, vivek.kasireddy@intel.com, 
	mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com, 
	stefanha@redhat.com, sgarzare@redhat.com, rostedt@goodmis.org, 
	vdonnefort@google.com, mhiramat@kernel.org, jgg@ziepe.ca, 
	kevin.tian@intel.com, axboe@kernel.dk, linux-mm@kvack.org, 
	James.Bottomley@hansenpartnership.com, sumit.semwal@linaro.org, 
	phasta@kernel.org, joro@8bytes.org, will@kernel.org, 
	linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bobbyeshleman@meta.com, mathieu.desnoyers@efficios.com, robin.murphy@arm.com, 
	mason@kernel.org, harry@kernel.org, vbabka@suse.cz, cuitao@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 11:56=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 11/6/26 18:25, T.J. Mercier wrote:
> > On Fri, Nov 6, 2026 at 5:23=E2=80=AFAM Christian K=C3=B6nig <christian.=
koenig@amd.com> wrote:
> >>
> >> On 11/6/26 14:18, Tao Cui wrote:
> >>> From: Tao Cui <cuitao@kylinos.cn>
> >>>
> >>> udmabuf pins the pages of a memfd and hands them out as a dma-buf.  T=
he
> >>> data pages keep the accounting of the memfd they were instantiated in=
,
> >>> but the bookkeeping around them does not: the page pointer array and
> >>> the pinned_folios array, both sized by the buffer page count, plus th=
e
> >>> transient folios array sized by the memfd folio count, are plain
> >>> GFP_KERNEL.  A 1GB buffer costs about 4MB of uncharged SUnreclaim
> >>> memory, and size_limit_mb defaults to INT_MAX.
> >>>
> >>> Charge the three kvmalloc allocations so the creator pays for the
> >>> metadata it induces.  The system heap in the same subsystem already
> >>> accounts its buffer allocation;
> >
> > Only if the mem_accounting param is set to true. We (Android)
> > currently depend on it being disabled because system heap buffers
> > don't have a single owner for their entire lifetime (ownership often
> > changes immediately after they are allocated), and the kernel doesn't
> > have the ability to switch who is charged for the buffer memory quite
> > yet. Albert is working hard on it at the moment.
>
> Good point, making sure that Albert is on CC as well.
>
> So basically we not only need to charge the backing store of a DMA-buf to=
 somebody else, but also the housekeeping overhead.

For system heaps the housekeeping size is fixed at creation so it
kindof fits the reservation model nicely. We'd only need it to account
for the overhead (as part of the MEMCG_DMABUF stat probably).

>
> Mhm, this here also complicates the charge transfer Albert is working on.

The transfer would just move the charge as a single unit. But yeah,
the complexity will come from lazy exporters or any other exporter
where the bookkeeping grows or changes.

>
> @Albert not something we need to take care about now, but please keep tha=
t in mind while working on that stuff.

Noted. The issue already exists so my series does not make it worse. I
will note this for a follow up series.

Thanks for tagging me!

BR,
Albert

>
> Regards,
> Christian.
>
> >
> > Could you update the message to note the mem_accounting param pls?
> >
> >>> the data pages here stay with the
> >>> memfd.
> >
> > memfd / udmabuf is a little special because it uses shmem for the
> > backing store, which is already tracked by memcg under all conditions
> > (except hugetlb). We don't currently use udmabuf, so the lack of memcg
> > charge transfer for udmabuf is not an issue. But once we get charge
> > transfer working for the system heap it'd be good to follow up with
> > udmabuf.
> >
> >> T.J. needs to take a look here, but I fear that this might break uAPI.
> >
> > Thanks for looping me in Christian. The buffer allocations cost
> > gigabytes, but these metadata arrays are only 4MB per 1GB of buffer,
> > so I don't expect charging them to break anyone. Leaving them
> > uncharged is an accounting gap though, since someone could spam many
> > udmabufs from the same memfd and only pay for the memfd pages once. So
> > this change is ok with me.
> >
> >> A lot of the DMA-buf resources are intentionally not charged against m=
emcg.
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> >
> > With the commit message updated to mention the mem_accounting param:
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
>

