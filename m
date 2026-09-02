Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7C2399892
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 23:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390484; cv=pass; b=a3Y4lNFZE3T7sNR2LqA2FJGaX1736faAOsn2bDVvXozn0qaTQb6R43ZwttliMY6jMzAYJ4JBJLLHwpjBY9PARBNKpJNBoukqObnMw9a56x4FA5um8cCFBHWreSSvLDy/qt4CrZnviHnpwBToErqB1rQMSE9eelUjLLw7xKZWRVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390484; c=relaxed/simple;
	bh=qTbmbR4TV31oKppyK1FzJBEXPWjFHR9x5HM244L3neo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2ZzyPQR44WhaRkOLmjBhuhY+7YEirqbQEa+QNpPMCHSDBi2K32nS5MBRzAfIOKoBZGhVVf88Pkkh4QB5IZv3s8dNni5rAbSw/OlUNypb9LoYHcw0Khmm1KwwF0VIj10z7lVE2C4/u9YFNDA6Odg0jcEBdz6uRlAVLKCkuECEmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=0oF+7oTZ; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="0oF+7oTZ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso2203279a91.1
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 16:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788390481; cv=none;
        d=google.com; s=arc-20260327;
        b=gYsaRfSimnXY3ipz7pl+LWA/akUeOdO04DbGXq1NUUy4uAF/u4Y1jIsf74OGFS7ptn
         6KFv+JeJUc/3liTQ7oTy6UAZBNtUihWxHg3csmPkJr3dP73+J5NdXm4MHD5ZN7+yf+/M
         XfKx+mgoa8qIBiAlhtHrNf/oTZXbahnkAo5TPwOBFsWZVNBunVS6zrtr+Lxzjomqn6bM
         uQWi4/DuS2baYZPT8+MNkGME85t8W3N62HzsHxlpgGChVcFbgwScRIQ9poYk8dY6nEKa
         tjDVBGpgLEYCWGhKnd52Tr+ZIusrq5ftJyWYJ0BplZD/tIbq5g8meciELA1oIkXefR57
         61kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qTbmbR4TV31oKppyK1FzJBEXPWjFHR9x5HM244L3neo=;
        fh=ugTgxWVcntVJUwZzBOLyW8AUtpzONX3SGtYeWDPCXsU=;
        b=bvAW7/fNPkTun74J+MX0JQk6Rkqe2lpDcmnaDLDZyrmTonFmMJKHH6uDr0IA005gB1
         fyAQLNdxa4Swkn9mUxYdFotNShxow7mScYdcNeYGkKILPnQRXjm7AJjiyd5XDx4Kl+ql
         5LwBmj5NCxWFtAKq8WgM/LvqMdnNvAeZbG2GZBPa5eHwJ/roIiUVUm9Lq9cB8G7rFSCH
         BOtsShcJh/7bmtRLoFNJTYJsX6FBFQskjSaKGTFPd/J9x9nFszYJs5Mqy9nXUWJHBTWK
         uuV8+UZEF/M9hnqzRAsT8c9JIm0v2WlkJqliNnKMKAqJsF1V6+oZN25m8CVQHSybOQMQ
         4Zbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1788390481; x=1788995281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qTbmbR4TV31oKppyK1FzJBEXPWjFHR9x5HM244L3neo=;
        b=0oF+7oTZDJCEPJ5GxamqvPfAO34tnu0De+/xzfpPjLEoV6fqiQbBTDJNvklTqryXWz
         4DUGZ9M4It8Hr5MLPcfGlofAv1uxt7W12KHGRuAl8wX8Pa5EEEaUv4VA9tavpBLeRXu7
         LtueW1Jc617D0bc/p3XpQ0vSzEMTdXTT47OXuFFCgW1NoE4ATKQ0a2SaDx+stXMr9eJ1
         gjtJXnpxVMUpjpuMxNteucXPuTjm37hzv62t/R54a+27K3WUxPFCURihaU+/mdUDKhAa
         mRSr2owqyc4kWFBIBsgITWUTY+xT50RAWK2lezkbAUho6oUKm+nul+xFZGTQVQ4yA/C5
         375g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390481; x=1788995281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qTbmbR4TV31oKppyK1FzJBEXPWjFHR9x5HM244L3neo=;
        b=B4XVheWkUTSKwT6DYna+Y7gorteb1t7J9vg2sOYJW6WOdLskyvSn8Mlr3k85d6n16P
         E4aT7YWVvdj6NoXWQF8yREvUrJGbnGfkxKbRgRSQmrZ57jn3A/qKzHH1csZUXmzeDEvm
         xlHhevUqatP0vjba7+HZyYy68mjPtV4qkVBw453jEISGyMD/DQaEqQUlxI8kqReb5xCL
         U1uJKtC0FSgQcjZvs/JIApF3S6HAwVh48mn/Gb7DChe8olxJwd0XaC6oFRTST8Uat2fA
         OLrUqpn3ZDzuNTKujqbesKDob9D75w6loZig42Jf9lr3zqRCumEcPJHadFHsZKxNZfAK
         XyOg==
X-Forwarded-Encrypted: i=1; AKwUvBzBXF/lMTSd8Tlsn+5y+92z8jkikUAgqQ9EYPzMBJIaYi6M9r1eVo1DHvR4xtbPuN7C9MVz5NkzFc3tHw==@vger.kernel.org
X-Gm-Message-State: AFuF++kt6TsZPst3kRUCJAIsbGDRfs1CCiMeVWFqSNFD+ctQXnYrNt3D
	JnRTK+TcJfpQMOLGc6CSFg04vKMmZTvheV5vwripVq2qAhyOVhkuD8pgukPXt+RWW+u5h6qzFYY
	oqMAEkVjoYET6wdxOeEuEq9WpGzWsEQgZfKetPZAbosw=
X-Gm-Gg: AYBFou3yREvOrgFYmGvxtlpexqV1abe6+UA5mr8CnAV3kKx5cI/3Hk8EoDU3MzxTPyz
	Loy1K9bU0b25EDkYKDAU8sRS7h2RYVaVea0v4c4HyghZQY4q0HZgnKOiokDjPa4Rg70chsqHpTp
	8FH12/MATZKifg9yk72PB0J0dj5Af2pZZZuv715wj7T3MKCF5NHWCVqIhPARyd9Jhbedf3pTiUM
	6jtToYQVuxNNcep/wypAZmoV/n/JFPd5cQ/n5Ul+digOHYjDPUdYyfx2/TYwPQ2UT5ql3lJuo94
	MnsaftdeGOmlYQVBuZE+rTtQLajuMYLBPntCBqVGl8sIE7m8zyQj0rFy7YyLLqjl5yr1/4c0zA=
	=
X-Received: by 2002:a17:90b:3e8d:b0:396:4cbf:45bc with SMTP id
 98e67ed59e1d1-39aee153e79mr9644253a91.16.1788390481503; Wed, 02 Sep 2026
 16:08:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901170849.4052816-1-dhu@x6u.co> <20260901170849.4052816-3-dhu@x6u.co>
 <20260902120832.GB2890729@ziepe.ca>
In-Reply-To: <20260902120832.GB2890729@ziepe.ca>
From: David Hu <dhu@x6u.co>
Date: Wed, 2 Sep 2026 19:07:50 -0400
X-Gm-Features: AcwNN1UWr9DtGOkBk_AsJGV3X93dnPOEvrR1ndZaMb2yMaRxX36LCdah5a513PI
Message-ID: <CABdL-LTO5OKkDmtXpiLury=2n6q6Rcm42_qqz8U+JkEu=v886Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] dma-buf: Split sgl by largest page-aligned chunk
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, alex@shazbot.org, 
	ankita@nvidia.com, chriscli@google.com, david.laight.linux@gmail.com, 
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, jmoroni@google.com, 
	kevin.tian@intel.com, kpberry@google.com, leon@kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, nicolinc@nvidia.com, praan@google.com, 
	sashiko-bot@kernel.org, stable@vger.kernel.org, viursachi@google.com, 
	xuehaohu@google.com, Leon Romanovsky <leonro@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 8:08=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Tue, Sep 01, 2026 at 05:08:49PM +0000, David Hu wrote:
> > From: David Hu <xuehaohu@google.com>
> >
> > Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
> > This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
> > first entry, resulting in non-page-aligned DMA addresses for all
> > subsequent entries.
>
> This patch is fine, but pedenatically a scatterlist's entry limit
> should be bounded to dma_get_max_seg_size(), though I don't think it
> helps this. Operating scatterlists at the size limits has proven
> problematic in a number of places already...
>
> > In addition, a non-page-aligned sgl length will trigger an edge case
> > in `ib_umem_find_best_pgsz()`. In case of a discontinuity in later
> > buffers, we will have a `va` with lowest bit set to 1. That will lead
> > to `ib_umem_find_best_pgsz()` always return 0, and break the promise
> > to find best page size for the mapping on the NIC side.
>
> That's an IB side bug, the newer logic that joins adjacent SGLs should
> have avoided it?

Hi Jason,

Thank you for the review. I think you are right on both counts.
Regarding the IB side, the new SGL joining logic in
`ib_umem_find_best_pgsz()` indeed avoids the issue. `mask |=3D va` is
skipped for artifically split, contiguous SGLs. Since Christian has
already pulled v8 into drm-misc-next, I won't spin a v9 to avoid
creating unnecessary noise on the list. If you prefer a followup,
please let me know.

Thanks again for catching the IB logic detail!

Regards,
David
