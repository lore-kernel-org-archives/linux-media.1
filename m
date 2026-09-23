Received: from mail-dy2-f35.google.com (mail-dy2-f35.google.com [74.125.229.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F31B5237B8
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168437; cv=none; b=mMIt/tpN/s3WEm6PlnZ96Jq4C91N+Lc2os7msaFdWyllysP/bj5dVrdb3T5OaL3bvGUiGPP3yXa5fyZawCSHR9q7pTKjsMMMw5Ji3EhRf10L1eUpCFH3CozuD0C1beceXGb8SOK7etLuZSVIle5lOgSFEt73AJvkj5mogvru6Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168437; c=relaxed/simple;
	bh=3lvjhy1fcuALXtgW37aXB9csFPun7VRHCuWT7ETMTgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwSA8JlJHTxxHO1MUmdeNGngpi4GmQ7ZPZgTPOMo8+pp+N9CUCrt4r37GXZA8kW0WWoxdTJ5+HAp1AvdFyqZ6Yur8LcGTkZlxmpywnYX74P57VLwIBc/MMI9BwHEDpE2248K2nkvMhgGXpdf6usulvY1715qWKvlrygp+6EYroA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=K0rLcy+D; arc=none smtp.client-ip=74.125.229.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="K0rLcy+D"
Received: by mail-dy2-f35.google.com with SMTP id 5a478bee46e88-3381a6a05c9so342724eec.1
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790168434; x=1790773234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3lvjhy1fcuALXtgW37aXB9csFPun7VRHCuWT7ETMTgM=;
        b=K0rLcy+DlzzEesXx+1vxOWulNr43O3q6RGFjO8P04UiZI6AlA/8TljTXjqxLrhn19Z
         BDpGfboZLhqfK1E1xzOmHlq8fyZE2xdGZiWQrViB+mFWE1RuP2tbxSp7aiWg3RilhYJX
         8AIlV/5xYx0eU5nZ0Gsng2MmAwJ7orLExwsAIQYXHju22RHmK981rAkEkVHs7wtJs4d6
         O1B0D4+imxEgt0/YUb9+GCPxV6QFXzHknYrurBSsu2Z0DQTgQM76rPYepCkbmgUVtj79
         bYhwrO2CcztKvlcgNNL9WqitImH5C6JD9/PItwJzihcIGK45CTw0ToqigYg6xP4A2bUW
         pZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168434; x=1790773234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lvjhy1fcuALXtgW37aXB9csFPun7VRHCuWT7ETMTgM=;
        b=upNCKQt8hOh5QnUm5mjBzcUhpgdETrW5/GHko9I+OUfA8ZRszQcY7VenVZatJl8PLo
         DmW8FXQ2jct41FudhSptb3NctBqsrAxG0f/DU1X8A6wpVj+jpHYj42nfY3NPb5xnM3be
         iYchTUZ5FrIT52idytJyK8VdZ/R90TOP89NXvwbcyAKtRsDYou9I5RgZ5ZkiTJc4Kmy+
         a53UFHkSu2wkml9XaRk/uDr9keSvRIRcil8jVQQOc0Em88UTsKgqowfM8KAPGURPNa2K
         KWFq52RsEN53L3AxfrLyNCVgtKhx6yR3U82RdxQzV+nIvmyKKYBmqFVhClqYAnBeNXsp
         WuOA==
X-Forwarded-Encrypted: i=1; AKwUvBxDoK4pKBm6ANmiXjPUxteIg8eAWAFb5lr4BNdfp/oq7uHKWqdGFG+KWcdpdVMp0nreQI68oGfCQC76oA==@vger.kernel.org
X-Gm-Message-State: AFuF++mka0q8pz3zLPjIgcwv4wIqHuXkpkxrPOzisThSHmmaVzWpZPzd
	Qv5NWUj8NPB9NKywZ6jeQOOr7pr1mXMdlT/xomJOBSwfoxVon8GLiSbwMmYcO7E9XVY=
X-Gm-Gg: AYBFou3pYGJZkNHcAYK8iAAvwQm/Ee91ifdLz5mqYrDIAUUMGL1EX3QQbIn/8HmWGwg
	94qFwmuovpKLCKIkpWwwr5lPmbU71OMYMIvnc9ff4IIyEXzSqgnEtScfvr8a9xW/00BrYz61U+A
	d+NHDaEMWVIrJaotkh0cgP2gwTpJffjc0dZ4YKAkPgfyloYWueBY5oZV0U6oBf3fT9NFvFXq3WA
	racW8f986w93revWLqn9BFJPgY7aX3syjrGC4EScFgOw/mEdt+eygZefScLC7XIOYwvjA49qP7/
	EgDa9rnkGXrCBaoh/lf2do+9WNq9O1wkWcIVS7kP216bu3Ys9lKkVx5fKD9rBm1qXxEx0wbA30O
	v9144yuOSYAwuoveEXFMYmloM0XModtGCZm7tGZQLo4hzuC+q8n1OEwAU/htEnpB6xFRPYqB1Oc
	H4QcXIwyXfN++3Ot//JnIeUEFTQhmW7A088KusQC47cSS8m8rDnnoR+N0=
X-Received: by 2002:a05:7300:7949:b0:31e:b832:be with SMTP id 5a478bee46e88-33e8c24a34bmr2627336eec.10.1790168434062;
        Wed, 23 Sep 2026 06:00:34 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96358e2bsm6859478eec.16.2026.09.23.06.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:00:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9MaO-0000000DYPQ-01dr;
	Wed, 23 Sep 2026 10:00:32 -0300
Date: Wed, 23 Sep 2026 10:00:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <20260923130031.GE1540250@ziepe.ca>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arOfD6syXOgQhZYA@arm.com>

On Wed, Sep 23, 2026 at 10:42:39AM +0100, Catalin Marinas wrote:

> On pKVM, we want set_memory_decrypted() to zero the buffer
> before the host can access it (I guess currently relying on __GFP_ZERO
> allocations). Since no cryptographic encryption takes place, there's not
> much point in memset'ing again after the operation as the content was
> already zeroed.

It sounds like this a pkvm unique thing, since RMM always makes the
memory hidden, pkvm flow should do it too. Either inside its guest
set_memory_decrypted() or inside the hypervisor like RMM.

Hypervisor doing it is the right place, hypervisor always needs to
ensure guest memory is cleansed whenever the guest gives it up. Either
via a private to shared, unmap or just exiting.

> I don't think cc_make_shared() has the right information on how to
> safely and efficiently do the zeroing. That's only known to the
> set_memory_* backend. So you'd have to propagate the flag down.

+1

Jason
