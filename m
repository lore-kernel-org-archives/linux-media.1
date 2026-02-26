Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B303939BF
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 13:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113554; cv=none; b=QGt0lluQvEiHyEGUmcd1cRJ6eJG4Gh+lLLqaGpkz5MqaCOQtRCm3l6GBqS6lvsyw7rcF1SySU2fY+b336bdJv7pctz7A4xj6BA3YockZW6/LNjrRq+CJCfNo4uqmZvFzTzi8Ndlru41dNaB+B7M40ee2sLmgaMSWzqqwX4imjpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113554; c=relaxed/simple;
	bh=7cZiRZeegMAN/TTz+JCfEK/A3QXMSIxdg2vnTLfsHyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZQNADcBSCtVgZ6DIFgZviW0WjSxp48iEQuT6t2CsCOT9uiAtvphoqNJvJ35FQpTuN2WtJkMR23xGfE+2nvswZk6VYYUuGD+hA8LCfBLUuK/rpHXdExVkCZ3QuoEjDtHY8ym1+l5uYEbQSIRXzMPOQox3Mfvf5I50B/HVdDILUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vajud8Gg; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vajud8Gg"
Date: Thu, 26 Feb 2026 05:45:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772113550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkIMrpYm1KdU3cU9ItJMZ6NttQZCM67l72DH8n80OYE=;
	b=vajud8GgT9YD52qua+5kbAsn1oe1msd/UJT+JLadvyyKmV6nd6QrfsG3Ptke+6XOJCq0UQ
	FF67owIaltxgRWsC03zZafdS9jeMvQ0c96JpnSdzKqkaP8upii2KeCA7cZDWHY1cpzJEtS
	Hw0OGY+MjxwUrFqDy3UK5cIfcO1+ayo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, Maxime Ripard <mripard@redhat.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Eric Chanudet <echanude@redhat.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	Albert Esteve <aesteve@redhat.com>, linux-mm@kvack.org, Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
Message-ID: <aaBNYqv2xJ4QEyh4@linux.dev>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
 <a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com>
 <20260224-solemn-spider-of-serendipity-0d8b94@houat>
 <56400505-8a13-4cb2-864c-cb785e4b38d4@amd.com>
 <CAPM=9ty5mbMAVHPO4mRy1jKGnpChr7gK6uMtco2=j7MMJGpZdg@mail.gmail.com>
 <d1b287c9-46ff-4345-a410-7e1cfefb5c66@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1b287c9-46ff-4345-a410-7e1cfefb5c66@amd.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Feb 26, 2026 at 12:32:42PM +0100, Christian König wrote:
> On 2/26/26 00:43, Dave Airlie wrote:
> >>>>
> 
> > If something is in the main memory pool, it should be accounted for
> > using memcg. You cannot remove memory from the main memory pool
> > without accounting for it.
> 
> That's what I'm strongly disagreeing on. See the page cache is not accounted to memcg either, so when you open a file and the kernel caches the backing pages that doesn't reduce the amount you can allocate through malloc, doesn't it?

Page cache is accounted/charged to memcg and usually it is reclaimable meaning
it most probably doesn't reduce the amount of anon memory you can allocate.

> 
> For dGPUs GTT is basically just the fallback when you over allocate local memory (plus a few things for uploads).
> 
> In other words system memory becomes the swap of device local memory. Just think about why memcg doesn't limits swap but only how much is swapped out.

What does "memcg doesn't limits swap" mean?

