Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861221;
	b=tmKfE0eNhLU/BCM9kJSVxfzpi2zi2z58rBNfhccHOZ5dyjen73LBiWeIOrIRw+6rWBXX
	 FJ1H8bLh0ms1TvFpLeTj3sE8NJB4fFD5gQNmRF8lH/NAr7+BjtgCiACbl2TrpU/RxgpHW
	 9dnVcM+QYEWaE0gNBr3Oug297rKY1OhizI3kKQKqE/72ZCmB0K1W0ZDdVD0NCKihXDnKn
	 vrxkGD0Z0R/go7qVwI+g573TyPLVssiXu/wTqt6j0kwOF+K2+0etY64AXSWaCvMcmFkU2
	 8OMDr2YNibBVGHTyHlminTZZv3cIHyZfcVZIA8dIYxD2S0Diyxg/NKt8ei/KkCv84Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FRUBObM4vFL1TGf3o6s1ZDBsKZdTJ/3jimI0MzXw8Fk=;
	b=0XwEbwV77oK+402PF0XjVPYKasPlCPK2UuDLLmCSgWnUfNLSJ3ibdTBhBBktXwKe3w7U
	 pPMVDEfkNwXHv/dz1Rcjsu2ic8Z+UCZWd8zsHnJpk0mrWxMaCVHlRF+akqE6Xy9NAHOey
	 J/AvIQOe/hT/n8mRF4sLUknRo4dnIoppepxMxrFcBiWM+HLbjOy7SFmlGON0luTl0OuHU
	 FH2HtMBhz/u1CxvssHOp5RuiuYo4WXopa9NWN/WmVAvzsj5WQSb03uOpMDLYUhvbIhzRu
	 Z1Pj9/MSUG64So53aNwFDzsiHG6M6IpjtUAv6wpVhhraOmcWCBXTSy10V5E75Su+eUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=W8qlgedU;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276C8606A33B
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 20:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 276C8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=W8qlgedU
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f3c616c84so367357085a.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 12:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794861219; x=1795466019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FRUBObM4vFL1TGf3o6s1ZDBsKZdTJ/3jimI0MzXw8Fk=;
        b=W8qlgedUXT2a/t6lhLP87IFTcy14JLKYa/mLodRolDlr9xZZQGxtW5Noy7E031dblU
         MZyTiD0CS6csrzNdM/y/kT9cZThOJzBfJnBjyuudT36134JK9rL5Y+cJlR9PkLw6In16
         I1GQFmpXC+GQjLACTJo0WVW99izKDBVRyEpioO38WVT6BB7yoB56iiO/mZo9HLJwUqYy
         WRepiT2m5sdFzS0WIaIky8pQ9PM9gsPwA3F1oZ8AlieRWNRm9qrQr3NdwmjMdkz0t3US
         NP5znb8aU6kvol1hpUX4T2gg8E0YcF+imIMZKWdgwp2eC1/JJZ5bvYf6eHZddNlll3GG
         nyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861219; x=1795466019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRUBObM4vFL1TGf3o6s1ZDBsKZdTJ/3jimI0MzXw8Fk=;
        b=eXbuSqBdfeLkcu9Uj6sO9GkmYO2ctsCS0XVouIqCQT8ReUeFWIv0ilOkUd+9e58fNq
         gnJd2L2YU6G3H7cju1m2pO+ZdNILpl0mJNIAEfZ1eeys9n/tIZinCOPy4b/eKQunIR+l
         RbCR5J4aPnCsrJs5XtlO0x/mm85DPzDEa+GdsdIAQ28Bgxclrllhbj8kC68SAQa05q3n
         unDJxnpGGVFthwzoH/XiV6/cP6KNbSieZfQAz5jvT9D8hBcbcrYarSTu3subqSdDpsjp
         K0O3IbqW5zv4/8mbTVsqqTYIjgTkt7Udm+QgZRELswpPd7Kepp9hjGKYuzN2K4eFuPrN
         jWHA==
X-Forwarded-Encrypted: i=1; AL+hErGz1z8EJmzEAthVRi27RLuKFl9VGKHBRgHYA0XOQ5/R5PRBH2UgpRv2lzfmGohAoEpObyt9bjpMhoaO1g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8UheQMUSUa8Ts6ynW3Y5UnGcbT5SNEC+pDYpXGni/q9C4Asdht
	TQPCO7MRYfDb+MVTtXobSXfKjST60klHA81iPz/nQ8dxBKkCXJapqRO5meR9ozgcdCM=
X-Gm-Gg: AYBFou0dZDPI8ZZISOllG5k8izFFCVXOQxJR+tMK2mCLFl7LyUOTXwYXtU7ufIMhNzq
	VAA4/keJTpb86o1n+0ueIXnJg7BnGW3e5Al+uaVgVOYOq3/V73MxL4nOkZxBi3rTIoWYCX2V8py
	D3GwMANOh+c2W6fMRJiJsHb1UPsKrxTOzstHfogsHklsL4CRuCKLo6orctiQDuZitk1t5JV6RSN
	mvd0BYpqS0WBcT2j9kfOCdnmp9OzCmRsgUhV5/Ajf90hpELD/H1MwhOu42pRubu2wlkN23Yfopi
	0NAdSJDYlM5gWSLfjP+6+JCOsB81dEjB+SloMBMzKXbWaqmBLLwM4h4s9t838mcs6xSr24raVW8
	sHd/mpLd10JrjuoA9aB4Qqdk98/ZmcGTlXfNGNwtXq7qTr7eUnQR+/rZiBoq4iDzlK7GToeKwDK
	p9kswnnHTpPzuyzFCNV6xeIMrsW5IV7RoikskP25B7itew5WF3WbeQOo6O5fQ5JIxhnJE1iBmJY
	qasPC7pkmVM9vrMQpmK8NYMwgrmSi1AIFcvB2tHhrwW7G7m9QASZmdRsQuiZqX1QfZVhgW5jybO
	ls1q4Q==
X-Received: by 2002:a05:620a:46a6:b0:949:733e:ddd8 with SMTP id af79cd13be357-949733ee766mr1034555085a.54.1794861219140;
        Mon, 16 Nov 2026 12:33:39 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c804f9esm930800685a.11.2026.11.16.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:33:38 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT3OT-0000000ARJs-2rZa;
	Mon, 16 Nov 2026 16:33:37 -0400
Date: Mon, 16 Nov 2026 16:33:37 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tao Cui <cui.tao@linux.dev>
Cc: akpm@linux-foundation.org, dgilbert@interlog.com, mkp@kernel.org,
	loberman@redhat.com, jmeneghi@redhat.com, kraxel@redhat.com,
	vivek.kasireddy@intel.com, mst@redhat.com, jasowangio@gmail.com,
	eperezma@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
	rostedt@goodmis.org, vdonnefort@google.com, mhiramat@kernel.org,
	kevin.tian@intel.com, axboe@kernel.dk, linux-mm@kvack.org,
	James.Bottomley@hansenpartnership.com, sumit.semwal@linaro.org,
	christian.koenig@amd.com, phasta@kernel.org, joro@8bytes.org,
	will@kernel.org, linux-scsi@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
	iommu@lists.linux.dev, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org, bobbyeshleman@meta.com,
	mathieu.desnoyers@efficios.com, robin.murphy@arm.com,
	mason@kernel.org, aesteve@redhat.com, tjmercier@google.com,
	harry@kernel.org, vbabka@suse.cz, cuitao@kylinos.cn
Subject: Re: [PATCH 5/7] iommufd: account the hw_queue page array to memcg
Message-ID: <20261116203337.GA2481588@ziepe.ca>
References: <20261106131829.3228926-1-cui.tao@linux.dev>
 <20261106131829.3228926-6-cui.tao@linux.dev>
 <20261116195213.GF2452510@ziepe.ca>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116195213.GF2452510@ziepe.ca>

On Mon, Nov 16, 2026 at 03:52:13PM -0400, Jason Gunthorpe wrote:
> On Fri, Nov 06, 2026 at 09:18:27PM +0800, Tao Cui wrote:
> > From: Tao Cui <cuitao@kylinos.cn>
> > 
> > IOMMUFD_CMD_HW_QUEUE_ALLOC pins up to max_npages pages just to check
> > that a user supplied queue region is physically contiguous, and the
> > page array for that check is plain GFP_KERNEL.  The size comes from
> > cmd->length, a u64 that is only overflow checked, and the array is
> > freed again as soon as the contiguity check fails, so the allocation
> > can be repeated concurrently: a 1GB region costs about 2MB of
> > uncharged memory per attempt.
> > 
> > Every other iommufd allocation that scales with user input is already
> > charged, and the pinned pages charge the mapper at map time.  Charge
> > this array like the rest.
> > 
> > Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> > ---
> >  drivers/iommu/iommufd/viommu.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

I'll just apply it, thanks

Jason
