Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E52397AF2
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 23:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789428279; cv=pass; b=bRel9mwD2JwBxDEoJAUgMQ4udWoX/iXevskpeY29241rLO2rGGnrreFMkTNVJUuN3B4sYYUvF2zRWAu+HjizWVCmQzgdSCK/tv69wCYz+Ed7Bfs7nLBj683HsausmBfzw3kNSK6NpVbQXV627Rw8GzOLQLaP0ovmaB7Yab12acc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789428279; c=relaxed/simple;
	bh=7p4q/8XpWdajN+6pM5dO5w0pWVy5g2TnVfIncKpHzXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUWmsCW6ACTcnK+9Kx6Oqf62lRQEW2YEJ8qJiHrawsm9xGp66OngdrNpXhXNGdvXwvqjeH6WB+TyPJrUXTQ933tMxFPSAdeGys5ajoxqu7UT+1aOeniFWkwEDrMWFVLqfc7T+7XU1lid/o5BWC6itJGaIhlz15ULIFT3BhPGboM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vG1a5IlI; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vG1a5IlI"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3bc34cso8495e9.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 16:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789428276; cv=none;
        d=google.com; s=arc-20260327;
        b=iaQ2elDFIj/e8hkbMZukib3RIqAkxdQs05ng2AZ1cxPLvYpEOk8rtms00Ci27M0T75
         mpeUNUoirMd38djFtFJS4KgbemNiSILAZZRKCtHJd/x371QX13GC6lUhtOle1BIGRTA4
         cZaGct+iu+IoDNz2Plc9mESYp+LQlacE/urtqMFoHXnmfrhYUQ6JJnZ/qnI20autY2CJ
         xSstDR9k+gPsYfqUCvJzhEoQtiCXnOMjVZxalizYOx3bucgZIqM6w3Bm2gelfZwaTNlr
         QAPo7y108Y5e8EahZsMWxRhDWWnf6YdMrmddxRsaxNuQv3lIsbriDzWWZYwVUbDmbUNF
         9aDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7p4q/8XpWdajN+6pM5dO5w0pWVy5g2TnVfIncKpHzXw=;
        fh=9dfLDEI4N9x10WusCzPOfEh81cNq85/XM3WejpqD+Sk=;
        b=jsYuW9W6QvUgT0Mjh1ctp9B9RvwYnVVzQ5dlewFO0RoTnc8AckoOUqQhWZt/GM/7E/
         HNU/1IAdo2IFa5YWkuad1QyuYEWFf6hO7Z1nhXUlsXsQxeeDKU8e1jpEDYwxkHqHXwHf
         fdojblpMFUN1ncQhpNfuciJmJnAxfSRB3wV6ol8RQewMwg0OUSpR0MG9I1zIVgio3Mf9
         ADR1kCtWFiriYASjfyP3SMdvD/IH5PqLJl1zidDN0NpOXiddQZnsdtIlgVGomcbyPH8F
         Q1WD2/Ln/NIYcu0Z8y/Yk079tAN30pMm5vYunGldWCMfHHohtim46n/9Q3pn8BhxgSKX
         3rCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789428276; x=1790033076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7p4q/8XpWdajN+6pM5dO5w0pWVy5g2TnVfIncKpHzXw=;
        b=vG1a5IlIKdghq+xDVheYqyafNkJDolWsOtRcvsDGo1UlzC4+5vrur81qQpaPRiKJOD
         GntjcK5dBAWsDtTQiS0nA+jnLSIfCIjFrqmGWYHAN3ALPtHbqIPosMMlgRfIpJhPb5dw
         OK3pb53Y4UpfSoMeFqa7gL7zbbNmmQ2aJaMemFerMvLnB5k98ZaiDfmnJ+chlx9pR1wP
         q3lSdLdhAsIMOmnaC5UFDf2elyVgvpD+hhjfm7FfJm/D7aoNnKC1laOmWd0s6psWoRGB
         1rnOlJhZ+MNJ3KqN3MIpYOCsVIno+kCEBv6gbfhjelOAjmwYHknwoKU9muRt6FiVS7Mv
         E7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789428276; x=1790033076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7p4q/8XpWdajN+6pM5dO5w0pWVy5g2TnVfIncKpHzXw=;
        b=mPpqMEnTIMcMsWgSI+0G3Wybhccto91+FRwCFAyTz7cBqedQQ69O2L7Fh+ezhLbkE0
         da+G1DXws6hA+4VZA8j/C8c4Ajne1JL7gzGHGBMN8fbAlLMpa/8uB4cvTGcl3JcG/IoG
         sRKid3jI1x+ox1CWoBAuCqD3ylbJJd8t1DHu3tKev0mRN3mSIhlO3of0+YNpTwG+Jau7
         3lwup87+uUkZ9FIoZmpRrenN2MOPTGYO2qDCVLgwQ3YQWB9VJymvTQzYmucmxTuYLNVI
         125+5XkmkolzbAPHPjXOSVBdpEnzllPdw4v1Pb2AcA2cP0etsnpcCUVG6UicGiUBlQZU
         DNwQ==
X-Forwarded-Encrypted: i=1; AKwUvBw459L+cgGxVS0t33qnseBgEWunDUa+BamjE4HZP5E8rrM+UMK6q/Znp/D08KL09HwzG+qK2Ad3ybBFGg==@vger.kernel.org
X-Gm-Message-State: AFuF++m3zXEQXTTEZ8JgDFbUUOHWQXklC1ZKTk3znD0MI9VundKnUroB
	DFcGWiFgEqpR94Xi64LCB1n9NnYCMQnZ+qhLTeQnZ+W4Cc8/2/fEfBNGhFVzl5aaoAd/16XrWlV
	ozxepaOwoO2ZiMBQtfBUMAUkXn0LSXsFR8puDwAa7
X-Gm-Gg: AYBFou3cdlYdFTPv1SjdmqdMbYnZB9s+j/fln3ncwW3utIRz7ihf0Er/B2qOSnZXNjL
	A1b58rO8Rkk4Wad2yHh9h/I9xhYLynxL2tqUgsVkzaXDBxipDdBJSzYBVp0jcILkdQCyP9CIEqe
	a+SVS9b7nwTlDxCUqJrRXbK5G4eb0MnbnOmII7wMJW8rjHO2MI+zEBxoU/s3mwKRo0TblAZ8VQQ
	oJiTrTb4GBvlUlFKp/mFl9Y3mzYhg9GPhruwmAJPx0vTk+HBwcLsZFfRBtPzB8kUVryp0vcrSvp
	uMVh2+bsu2PMl/ec/fLbrDxhoeiiYMdGCH556p22Uz6kXCQzzYSrkpdjAf+tOY4FZqstVP5vD76
	35r0Iw9FW7w==
X-Received: by 2002:a05:600c:4252:b0:499:c3da:6f40 with SMTP id
 5b1f17b1804b1-49e7daa1eacmr259015e9.4.1789428275379; Mon, 14 Sep 2026
 16:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914212258.2657788-1-dave@stgolabs.net> <20260914212258.2657788-3-dave@stgolabs.net>
In-Reply-To: <20260914212258.2657788-3-dave@stgolabs.net>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 14 Sep 2026 16:24:23 -0700
X-Gm-Features: AcwNN1XWnnbhAeWCdYdUleWL6H4kAfKBgLjOO27tKKfVi6W-pWHl8l94S0Cfe5w
Message-ID: <CABdmKX2-3vZB0Em3iUK2H3mbQMpv=v4P1Syj9tm_bsKnP-D74Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] dma-buf: system_heap: fix the allocation ladder on
 non-4K base pages
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, 
	benjamin.gaignard@collabora.com, jstultz@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Juan Yescas <jyescas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 2:23=E2=80=AFPM Davidlohr Bueso <dave@stgolabs.net>=
 wrote:
>
> The orders for large base page sizes are calculated incorrectly, and
> currently only hold for the 4K case. Order 9 is intended for 2MB but
> will be 8MB on 16K, for example. Adjust the orders/sizes accordingly.
>
> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

We've been doing something like this downstream to support 16k base
pages: https://r.android.com/3907360
