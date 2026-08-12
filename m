Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7FE37B402
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 16:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550777; cv=pass; b=WRCT06QLnkOIZmdFnbCHo94G8kCTz5NF2WLx3w4LaCgSQN3RsSToL1LhDk1O0wKjrO97+GvOi84GZRb+O6StDrX6XRLWdKMjMPIqdYpgrQzdpio2rTd0KMk0uB+dfPfYLn1m5kWtP5nshM7QzVo9Gh18HnD74K4vEy0tMvDDxZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550777; c=relaxed/simple;
	bh=J9mnqO6eJ4ZveGNY3D4ObFWr3/57QctvngM8TX1zOA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jm5j0Iv4wSKw1AFlWA/yl3m9Zpc/xqjm8YpjQPtR5yrj+fGFxUW5bntFymnzn/PU+zwEVicfuYrGlzyofwKVzYnEta98HdZM1xQrsLN+l35dIgAFPOZi6xv2wP5O0hGkuEVCGpX31BxV35zY8kWqB85D2UmHnhsAKgx1zzW5Ozw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bMrCuosY; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bMrCuosY"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4994d67d260so54925e9.1
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 09:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786550774; cv=none;
        d=google.com; s=arc-20260327;
        b=h5ui2e0A6bO5szg5IZ2EpXpxvkf1hvo+2Dpu80BSWzVbEpnF7yQCeK3TZTOriE+Te+
         bIyzrK0j+AucMAdlMGrTqQHWbfNck7d0FUkAq7ANGb3+b2lRFx6KeLPP6dcBKv6os0jn
         DvSOLjv2YbYX/BSdZ/GGnqkPDw3FLd1qQwQo9xp87ffohj/Yay4wNK/KYfqWwtAggOfl
         hpY+2IIyVtf9ygnxeV3vfFj6dqgec5DpIlg2M9RDRpewUNLylQ12snVxFhD12cJECRHX
         qL1qYzM5gzcZ8NGHN3LecXkIFF/muGm8jbjHSi5Mj1tnMiWeGUcv1eTc/3WSP3lqRg5f
         pn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J9mnqO6eJ4ZveGNY3D4ObFWr3/57QctvngM8TX1zOA8=;
        fh=Qxzb6yFF4S/PITh3GuMMlj5RrE1IR19GQqyVeIlK1X8=;
        b=EodDSbsrePSy/rOSqxsyGE9CspmGR2OBa1sCMBeGO6rGSUyxGHUT4ilxv1AgYTUzBs
         GHhwEuBbLz8aKnGWHH9L3fdNkuSae+vZXzfqWwXyYcIqHamDvK/VD5YiWwunok0KRvtc
         omzR8vcQfpblfFesEv0zYr6XYr9Z2oNoiw4wHSlHnk/0g8OJ2+Ki/42SNRXm9pRNalY6
         iTS6ELSciwhLzswJXrKBkh78puDLfiX1eS2bv9yTeaDFhnaGEeqxjxxqoD5mHcGXTfgy
         3uhnaiFMG0ynLjJtrq6ZEhyNMMUaud027138F/oONGjBuTexdMhp39fnL4SPYRbdoMIU
         /Oiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786550774; x=1787155574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9mnqO6eJ4ZveGNY3D4ObFWr3/57QctvngM8TX1zOA8=;
        b=bMrCuosYRVpYcUkmfIhmXsv/BaraLNYJJFjJa4C4Qva6/fBZuz9TPtaWzwJsyfjacQ
         huujSeJbEOQeDrR6enOI8fy9RDuBfT9gQghuZKmnrCHJrM+DmzjwZJHO4I5wupW0jyLv
         +d//LTlHJ21GqcHrPsV2LQuB0wK3ew5HWZP3Tn3nZO1JizkQ/sXQsqK77KC7PZ9Y6U8z
         KS8FyhXijHc0Bg0yCwi29ZZxHkssTraCF8smtcY3F50aQChzrK1XwKNN1sx/fOFpKhfB
         C88iVJYliM1Ayt+ZlI1XqpzKabt/Uo4vG0uJWPIYHcFNj0+2QULCWB4xPwPF3UyLawoI
         tpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786550774; x=1787155574;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9mnqO6eJ4ZveGNY3D4ObFWr3/57QctvngM8TX1zOA8=;
        b=OCCg2xb2LkR87+idIO6dEAc6qW/DFFaAhHD73+UR8ClSMVUXWPa7qApEJFAy28Ham5
         +TCoV38jvWVM9JdTIe7g6PYzKVc1yOTYfRU1012VHDcsZAiZltmTor35s8RW9VRKmzi/
         sV9Of+dbKhHzLhb2WbZLHj58UTUBmhprDkn1+rt7HhGQEc+avCRb5wvgYW5qgYvF26Fd
         ysUg27tBpuICs+yXQ0dsxcsbn8Puwe6HQ8ruhUroxCm9siKbUwgi+uDuNgu+/OSjZiXF
         jvOMpytF38uxtSearGiZ1j3xLFST+rkrhox2eUNYdoBaCGis9saVtPwKvK72Hq+bRLJu
         Px8A==
X-Forwarded-Encrypted: i=1; AHgh+RpSoAXNii2xTRLZzyNxAEJ/AdLFv99+qitfgaucFGUhNRfmmgTGgzWdwHShHM6nU4h7+mpQYH7i/PTtHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynhgIOQsf3ulMHXWtDZ0QP81+i0rdO6m8Yq8NogmDMAuezW/oA
	1UjAXbW6m9j9yC0xZG8ticmwVYzwOIiPFRzwkCr5H6L4pkA8u/YfNERCbbxdokATingHmevOIVo
	ULhoV8EAiyr5Iz8esPzW/CdeXNjz83/0epkHPPpHW
X-Gm-Gg: AR+sD12xPcDa12HpbbsZYwOvV61NwJaUVOySpQ14vJljKvWoRh64NR0FDdt1tktKDbC
	VMWILL+0/Pv/ivJuu3EwOvzj86OkDYZ0by8clmUXYzu1J0Srv1K1xao2Ih/4hHmN/2D53OYl+Dv
	3zUxfDEieOf0ezBjnvG0+5En05/pxqBYPhBJyOO2gFQ/wh2HlmYvDkIf5hQKKH/BiZspmQL615E
	YVV8Ol9HSA53DAQSj9P5yg1466Ree0gXamJ+9RNunusLDL/SJhfbMVOaSfKmHvKHp8Vl0dZ19Z0
	2SBidqFWsDaA+riSGdwRSIIAHZdV2+lgCSvaLhc5x/AIZsdZyRBn3i06eFB3Fj1LgBe5Wdd0cyr
	aVhuXGzmskGkVUXJ3JM2HO0xjUcVD7jIAdc0cOEJrFg==
X-Received: by 2002:a05:600c:a192:b0:495:4593:616c with SMTP id
 5b1f17b1804b1-4997c2e7c70mr1158565e9.1.1786550773969; Wed, 12 Aug 2026
 09:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811204123.3198370-1-tjmercier@google.com> <CAO_48GEUhpyeenX8Vu1NoDnvzib5FGv3rOBYNYwQEWu1-6cjaQ@mail.gmail.com>
In-Reply-To: <CAO_48GEUhpyeenX8Vu1NoDnvzib5FGv3rOBYNYwQEWu1-6cjaQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 12 Aug 2026 09:06:01 -0700
X-Gm-Features: AUfX_myIZHpwdUvC8ZYvqUsuTjt-Hphx_vEEPobdfDAGB6v3g7pueyskoXW0GVA
Message-ID: <CABdmKX0uiX=QKFAYgwwBPHW-X3vh-Rm7w-cNp9EsJzQarTzDpQ@mail.gmail.com>
Subject: Re: [PATCH] kselftests: dmabuf-heaps: Open heap device files O_RDONLY
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, christian.koenig@amd.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 8:02=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro.o=
rg> wrote:
>
> Hello T J,
>
> On Wed, 12 Aug 2026 at 02:11, T.J. Mercier <tjmercier@google.com> wrote:
> >
> > Write permissions on the /dev/dma_heap/* device files are not required
> > to issue ioctls and allocate dmabufs. Applications should be opening
> > these file as O_RDONLY. The BPF dmabuf_iter selftest already does
> > this. [1]
> >
> > Users are pointing to these selftests as examples of how use dmabuf,
> > and encountering permission errors on systems where write permissions
> > are not available on /dev/dma_heap/*. Apply the principle of least
> > privilege to selftests which open dmabuf heaps by removing the write
> > access mode and using O_RDONLY for the open() instead.
>
> Thanks for the patch.
> >
> > The same is true for the vgem test using /dev/dri/card.
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c?h=3Dv7.1#n49
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Thanks for the quick revieews John, Christian, and Sumit!
