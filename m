Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED6C4756DF
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 20:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786481892; cv=pass; b=GyAJ0WSM3piWaU7M8T9QLCs5LcvShBxMrcrGC0gw1INeebH/6EqKvaBdRrgn18Aq6Ew5/0cHhiujUdhG13RdzVCDmuzKNnuctHqJXWKr0ZjaEh8zJKPWwV3TS7oil4I3osrFpenrsc+BxoMj0RuosD6NOPOyiBla7HUi9hES1F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786481892; c=relaxed/simple;
	bh=2HxJNolFAmmdynxiD24QiH/b/aKUErhnmhqEKLHulNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XYGejFAAMSXukBQ447XOFWMcFlkZR5Q+OsjotGKR0ngbm6RoOT6zCXgxJ62sK0e3G1f5lJzACcy8t/U3SQtrUUgqr54PTv5/hXktRlwgCZWAHJgnya/KcwG9DIPPitvjF6qFU5OL5xOVCwj3NdxPRP6APuqzjOcQg4q+TDS4e8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NzWTvtrf; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NzWTvtrf"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso164030a12.2
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 13:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786481890; cv=none;
        d=google.com; s=arc-20260327;
        b=YnjCYxgTtt26GRxHNQgctNCJeKLWi3mXlC08yXwg9xh3v5FK+OHebrfEquJ6c2a7oA
         +NjggWQ8KqwJ5OVbvD+F5xzTaYrcSBysraqwY+VjV72Qro9jnaYnqPm5IMprXVbjmdWV
         EhyZ4MqwhMstySSccUPuM8ztkGiDVnI6SEogQANRnijv8YQvnkwdXKPxv35oRzTe7X/M
         VRZbpQI8+19k9u+RKM7je9VBMdC0eQuZw7uNQrAI0LUIEM90hokRJnryVshdQH1hGN9e
         OrkEA5tf0ivbFfosP9aVLgiEjABR7DaaeevjTgm6bPln29Mk8ZICkeWTALzxh7eM/WyQ
         oTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2HxJNolFAmmdynxiD24QiH/b/aKUErhnmhqEKLHulNk=;
        fh=W4qC+1VMGJOlgu+qfLO0HY1hSxOw/HQwPsAm26fFBBY=;
        b=iSgRZKVKCpapaeDVRtG/0v7AqngO07/6iDMFxrXcgsFhgBg6IPBPR/ijNwGt8iF5lT
         hMnwmACWIZbALafdy4qnM9e5ZOFLf+Ftgon/nS3nM7xbwyvpXTeGj/myMBzYcRNKTtJt
         jZVUPmv4LPULZ3ns5NIPOCy/Wyiguaw0Hw2WzzGGYkCDlqgqw5Hs9o/y6nXZSpgVy4hH
         7cNpkDk+yDucZ+UA4wxgu1arb9a2vjOcJBnxvNhleYsxSM6iiWi0yReOvqfEc3l7HcUw
         IoCgNJw9mqRjlcB5accSTmoZMnepicyyYeCLcxe9KnHKeRM5SGefT0wPCO7CwGWYBv64
         Yt7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786481890; x=1787086690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2HxJNolFAmmdynxiD24QiH/b/aKUErhnmhqEKLHulNk=;
        b=NzWTvtrfy96nK5Lgxq0+pRu5Bp6lmuZoZTsowLe4/X6uPmn+20M3l1aOF6OB0n434W
         840//RHdPccbuEVZrw/qhOk7p+zAdcH5mj53jXRHaYMGbR7dmPQH1YLkfE+FQY4gxyhM
         fa+oWxKlas3rTdGljqjCVY7LNy6YsaPQlRJ8P0z5q56KxDhPxKI+QUSX/KVVSg62nqXM
         JoPrlWFMlFqmI7R3W3BdXl8ZhXIHM+xVJrKGxLrcmWdSgs+6uYDbECnA31Qkh8NJ9p3T
         AeqG8fdVvcInt9/JDaigI7va1S//XlZODUMvGwu1IjIdXDiyceAGfGkKy/oiQeKgSmKR
         UcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786481890; x=1787086690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HxJNolFAmmdynxiD24QiH/b/aKUErhnmhqEKLHulNk=;
        b=iQWIkFzQYn6N/G20VkU4myTVkLsLBlyCa0wMB618nzxZQ4sbpuTc1bQWZIETJRvoI5
         AZ9BsbPj+ccur91U5Ik1Q4hzc6O5LDB6sR7wJSsDOi8+NgUiojyyg1cShA0N9oCG+GPe
         viRd/AGySH/K9QEUUIIaBSHW6ZJXSdkadhTvZwVufltxMAcpvhvI4eyI1moObegrV3Zh
         jpKqbeXSWcFFxAQ1ZQqZM0G52xys5ShaVUDovpihRiy/QWRat7Gy3S8HxK8Cp53DrPF7
         nk+4pMos2fObGB4yNT805t2O9wJ/6o/bNFdxMft90stNhB1DDqUYvuliViNP09vkqYzV
         mAUA==
X-Forwarded-Encrypted: i=1; AHgh+Rp16Pn/AJAGjzdJRg1jGKtxVHKVDTfjfCc0ezc2/sLjCyXBRWWEtrifKRqWDe7Y4No9ZdvNT13YlP83Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53C+EBVW37gdKQxY9INVIwV615Qpej3a3b+7rPL+5TxHRdw4i
	qTPZYaNGGHbpCk4nMd9Or17T/RO283Q4Hwe+xgFa982Kgft1Q3bvPY2WOboqz6qfeeGTru+/GbT
	q3wo+PbwIrIyPpmpOT8JqlAA1R1452BCU+1Oe2E0=
X-Gm-Gg: AR+sD13CtOpF4IW0Ty0LjnAewpxujKjEtVbg28G7s/Gmlvb2Axr3kLxQ5DEenK7LaUA
	TNfKgVGWlLPWI6JpTW2OnQnFWXv/xAzVxIu/0Wcu/BVvlkTpsWOYyKmnqH9lyXppnxx8MHyvTFC
	Iv/iTczdxzIjxdcEmZngbYZaF7qP4rNVtGlvsQoDp+oHEI7/pT4XxbaCEm20f1tyXJejAegSi2G
	l8/WRA2mfkN+rcYSSblQyqMNIEvQUPFFYB6Ddm7aVLfr5hoYOP+furMYZPgokLAE56NRn+DksVn
	R+MK1dwIXq1T+KoiUVpThseMXyxRSx/KgdBpRBpPrl4T4p6OQIrfeCqJjb4OVVRaRkRSefCwel0
	9KUNUYDRQK5CaGs/1ZoPW8acumWpkeN7c1J/yf3gKDnvp56iYwr+iuQAtgfImvTnIQ/2g4Vxz
X-Received: by 2002:a05:6a21:6014:b0:3c3:8d4c:6679 with SMTP id
 adf61e73a8af0-3cc2baf91c1mr8926509637.20.1786481889874; Tue, 11 Aug 2026
 13:58:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811204123.3198370-1-tjmercier@google.com>
In-Reply-To: <20260811204123.3198370-1-tjmercier@google.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 11 Aug 2026 13:57:57 -0700
X-Gm-Features: AUfX_myHUGWyest017h6R42yiKHyXXmXDv2AxIQm6g3i9kVslMqq8mjeEi_Jdwc
Message-ID: <CANDhNCp8TTQF4j3zCt0EaQYfvB+nGRrM73Q43aQi0jzUG+ormw@mail.gmail.com>
Subject: Re: [PATCH] kselftests: dmabuf-heaps: Open heap device files O_RDONLY
To: "T.J. Mercier" <tjmercier@google.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	christian.koenig@amd.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:41=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> Write permissions on the /dev/dma_heap/* device files are not required
> to issue ioctls and allocate dmabufs. Applications should be opening
> these file as O_RDONLY. The BPF dmabuf_iter selftest already does
> this. [1]
>
> Users are pointing to these selftests as examples of how use dmabuf,
> and encountering permission errors on systems where write permissions
> are not available on /dev/dma_heap/*. Apply the principle of least
> privilege to selftests which open dmabuf heaps by removing the write
> access mode and using O_RDONLY for the open() instead.
>
> The same is true for the vgem test using /dev/dri/card.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c?h=3Dv7.1#n49
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
