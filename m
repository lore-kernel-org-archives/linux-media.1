Received: from mail-vs2-f27.google.com (mail-vs2-f27.google.com [74.125.227.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01C0559CB7
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176888; cv=none; b=Waa++HoSe6AGxcmqAB0dGnn3rDXpKAaIvciol8q+icDsYpmwOzGZWoghNu4fuxV98lVgtpHdnBXd5jQjfXujiWLbSPQVBWN11zOHLKm+WTKOYgMKCIQQfHtwA7YJ7ZurpFZvCQ5gnA7yp0Bx+zCl4mEwX/MdYnFkVZItJ33T4IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176888; c=relaxed/simple;
	bh=FuSi1oPqqK51hcEmla4NiGsVvsoifIYHIz4OYEHBKSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blKFQYIYla29v+eNZCvLKasLk5CyQf4WEIcKw/jKU57vY+TRMowqnIrZe962n8aOgx1YVLJGnfKgZtpe2b5wLsgkhlz4XMgbik34+CJV2KsVSRvQiVVTQFXjx922MfEHluvAcF6v94LTxBI/rgTKpMc0DE09oruH4S+Nn1PvucE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=I4QCRSKQ; arc=none smtp.client-ip=74.125.227.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="I4QCRSKQ"
Received: by mail-vs2-f27.google.com with SMTP id 71dfb90a1353d-5c963d7503fso436421e0c.0
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790176885; x=1790781685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIwOLjI09a3UXj303jplkjBLREygxuyiG19PHUNbQ2o=;
        b=I4QCRSKQFavp5nvr/CyNtXnv1Sgq9wrr7Uec+F34G+t/gw+Jj/kW+AoHHtrLydDd9r
         fdwyxQWIXh1KWGQNkB++kRWsq6v21my2Gc5NPzghGDIMdDGpeGnS/WX5NodXftY7PY1l
         3uKfvlssqZUp2w8SwxgXXzxwrrPwzl8gxQyyRn1aH/Af32nlvbSenX5vrgY3/g5wy46x
         3jcxiqxX/4C/0NIKlaIsGpizF8onFkzzM9+9VZ0EzlRf8w5H9nxGjeycoHooqoRuQJsZ
         /dvBqNQWq0xSphnr6hu8TKbFPa7GyvpcCOcPWDmxnEju17y1pyzbCZOBhsYVSLG0XI4F
         B3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176885; x=1790781685;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIwOLjI09a3UXj303jplkjBLREygxuyiG19PHUNbQ2o=;
        b=gVJlxh6HDf/DhKKa2GckQi/HCztMP3kTRlQXeDKqN/NHzqywypkDJhwBZUyXu1tU2H
         fad7rjGifP/jR5Wtegf5fMOeb5+N+26Nu307oZZYs4c15qZf3GQ4a+0moIvZDruR1GkH
         +FiTgHwDyIfY/SKQCwPh/vmJQAYcEgDU9NZ7mhKYBtfScPZI7KDKo84kcLmJh9MkUTF6
         wfaOfKwKVDwtEDohKZnjyIhp1di1PeiNRVXStlA7U8grtl+zwxT7xR1f2BW00GxOMYsM
         s6SstgWpzn30d+GaeKSpE6Up3Gf1P48KEMw0ejQ1s5+v7WWuXobLSyoI7GwGakx1x7cu
         s0uQ==
X-Forwarded-Encrypted: i=1; AKwUvByEbp/1/YL/Q2tDziJDmYVvI5qCfwfw7RhOppPV3eXc6TLtJmMiNj62hfzO070QzWMLbCF6jGnbfX5WCQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nBZr/65w++dtjquhOji60Fj7u44zI3CvcwUgC+Vrpgq+OCNAZj
	a6yfLEGvFmY3al2Mi+en7mx+v+kNUn+bgzq+OyWlPbuCk/FoDI3YVFfMivUgBz5HKIw=
X-Gm-Gg: AYBFou2k1/hP7SyuFOOvyxeeodAB+KQTz5igzVNAn1HBHRtVocRfO+t0gXDFnaZyiQd
	wGJMTTOiA+nTyb2iVrcljVV7hFP4YFALCHtdlzEShtjnOCadlZW2wSJabBo0csuI6LvPsoIxqks
	fHEnsqWyS4a/as1nvSMpx9ua83NjsjZGQxIm02PNQ87JtSpBT1AG8a6Rya78RqltO9PShKRKUzT
	sZA+sOQOh66Kc31VDpJsT7YcTZyar/pBIuUR8KAoC2P6nAV+lSZayucdGvWRwHNNjBN/y6aFAzL
	J1MF9xrs2UyhEnMLrABE7LpY33cjnAk1nmLyJQafjF1+veYRR3v0RKnq1qx2We2qT4Qd72o4NlN
	bL6rKLN4YxR/RsdX7wTOFHwrNSBT5Heg38QvOLfREnN/h1w2sZrJisevi0L1++oTjiJ4H321ac7
	VmgzL0BrlDHkRAJRDUJQTXRMHHvS7nzuYL7gEmlCjERV57
X-Received: by 2002:a05:6122:4896:b0:5c9:a60d:22cc with SMTP id 71dfb90a1353d-5c9f16b9729mr3999503e0c.21.1790176885467;
        Wed, 23 Sep 2026 08:21:25 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c277636e4sm181224485a.41.2026.09.23.08.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:21:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9Omi-0000000DrJM-1RIj;
	Wed, 23 Sep 2026 12:21:24 -0300
Date: Wed, 23 Sep 2026 12:21:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>, christian.koenig@amd.com,
	Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <20260923152124.GG1540250@ziepe.ca>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
 <yq5a5wzw2ree.fsf@kernel.org>
 <arOspFxWZ1DjgcAr@arm.com>
 <20260923130611.GF1540250@ziepe.ca>
 <yq5atsng10b2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5atsng10b2.fsf@kernel.org>

On Wed, Sep 23, 2026 at 08:28:57PM +0530, Aneesh Kumar K.V wrote:

> I'm also considering requiring the address passed to cc_make_shared() to
> be in the linear map. This is currently required by both TDX and CCA,
> while AMD SNP appears to support vmalloc addresses. The only user of
> that vmalloc support is Hyper-V VMBus GPADL setup
> (vmbus_establish_gpadl()). How should the generic CoCo shared-memory
> allocator handle this?

vmbus_establish_gpadl() is the the same wrong abstraction as the arch
code. Get rid of it and use vmbus_establish_gpadl_caller_decrypted():

		pdata->recv_buf = vzalloc(RECV_BUFFER_SIZE);
		if (!pdata->recv_buf) {
			ret = -ENOMEM;
			goto fail_free_ring;
		}

		ret = vmbus_establish_gpadl(channel, pdata->recv_buf,
					    RECV_BUFFER_SIZE, &pdata->recv_gpadl);


So you made an allocator that returns folios, now you just need to
use that allocator to implement a kvzalloc wrapper. ARM can call vmap
on decrypted memory with pgprot_decrypted(), right?

Or maybe this can use vmbus_alloc_buffer(), it already does it.

Jason
