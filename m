Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871363;
	b=3Ocs+2e9/33WJ1fMfA02L2Ww43NhvShqNKpBQKPUliOEIfvSSNJtnNZtDHyTQFYPTkDe
	 kT4Ixw/vHO03xXrZv4sLwOYG4GA277MvyLZpEGvzj6lnMqoYw1ocCgJMoOxylYjJsW9qi
	 Ui+JVquvtEzCErG9xfp013tX2VD9+cqq+MyGYBip2IIZpvq90PYEdCciL+ShHFmXgmt2e
	 zS3eb/Zxfl+CXDWTAD3wOC9UsukaVjDBFTaAtp8z34yBvXWelDRN9oTSOPKB+DBJboNZV
	 CemT4FkbA+sTc1pCU5jOWFdSoQgN5QHmazkVKKwiEbPykL3CthN6NfKnqXwoFJ+AfBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871363;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Rn4PUmQlghV6bDqelAkHDxWUrP063U3OOv3SoBPx5ys=;
	b=LLGHQJiwP8mid3/rH7MUIPVF8rSmw7s9YpWheCAn2aqx/eSJtoQSFPeFQ6Gsbj8KMQji
	 lvaThq2QWXZ2x8t7WuQqbXM0b6oh0CAL2BAsJPD9nAFSzusLEANcuKjQeRdBSIcjmh9/M
	 uCV/v5PxFnnvUk9gmqrfxoTM7KX80VkD+71wKaybsxQwj/a54vnl4S2CQlG0ynUJ2Vno4
	 0VGKNeSzmCjCcl4v+4OgvhmvHPpeOIrpihD0xlsoF6nBD3Q3VBMS3VbI0EIlyORNMAtd4
	 uOmWke5sZbuuxTSKWP/0Cz0KQmvGPCeReqV0W3v9iHX0yn3QbNuo8/ttl4in6VKSt6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=KcLs0iio;
	arc=none smtp.remote-ip=61.135.153.163
Received: from smtp153-163.sina.com.cn (smtp153-163.sina.com.cn [61.135.153.163])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43239606A330
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 09:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43239606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=KcLs0iio
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793871358;
	bh=Rn4PUmQlghV6bDqelAkHDxWUrP063U3OOv3SoBPx5ys=;
	h=From:Subject:Date:Message-ID;
	b=KcLs0iiodI2RnTvLzypYnmnrFyndxVrqRDFEGdgvEXoxL50HLTVfVn1eRvXFhR4na
	 0HD8jZqzYyiU6cP1qwtLwp4j02OAGotyZ90lRLYGR16bvcVWuq/mGgQuQoL+HavZkF
	 IgrJgqINwypU19BtHr9+1bHb9qPHg7NHh3GJ71kM=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6AEC4DF20000355A; Thu, 5 Nov 2026 17:35:49 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 212874456816
X-SMAIL-UIID: A9199AE68AA0430E97AE7DDE3DE72AD8-20261105-173549-1
From: Edward Adam Davis <eadavis@sina.com>
To: phasta@mailbox.org
Cc: media-ci@linuxtv.org,
	sashiko-reviews@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org,
	robin.clark@oss.qualcomm.com
Subject: [PATCH v2] dma-buf/sw_sync: Optimize the retrieval of fence reference counts
Date: Thu,  5 Nov 2026 17:35:46 +0800
Message-ID: <20261105093546.61098-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <75367a9a19c1e9a007422e0a1b8ed0acaca2492a.camel@mailbox.org>
References: <75367a9a19c1e9a007422e0a1b8ed0acaca2492a.camel@mailbox.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 05 Nov 2026 08:49:49 +0100, Philipp Stanner wrote:
> > 
> >  drivers/dma-buf/sw_sync.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> > index 8df20b0218a9..261bc98b1ed6 100644
> > --- a/drivers/dma-buf/sw_sync.c
> > +++ b/drivers/dma-buf/sw_sync.c
> > @@ -221,7 +221,11 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
> >  		if (!timeline_fence_signaled(&pt->base))
> >  			break;
> >  
> > -		dma_fence_get(&pt->base);
> > +		if (!dma_fence_get_rcu(&pt->base)) {
> 
> You must hold the rcu_read_lock() while doing that, don't you?
dma_fence_get_rcu() is simply a wrapper around kref_get_unless_zero(),
it has nothing to do with RCU. For instance, the use of dma_fence_get_rcu()
within sync_pt_create(), as seen in the SW_SYNC_IOC_CREATE_FENCE code path
does not require an RCU lock.
> 
> This probably works "by coincidence" since the surrounding spinlock
> also disables preemption, like the rcu lock does.
> 
> That spinlock, why can't it guard the dma_fence reference? Doesn't obj-
> >pt_list hold its own reference?
This is neither a coincidence nor related to any outer spinlock.
The comments I included in my patch provide a complete explanation of
the fence's reference counting, from the moment of its creation to its
final destruction.

BR,
Edward
