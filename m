Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BECD577E4C
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 17:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098008; cv=none; b=s9DVpX9PK+Ca+8CIK7tTPBcpo94WqTuNRE4ES5yWZNWkT7qdjMF242Pidtl4BaTtEHHYXbU36nogw9ZaW2dozhWYSplzUB9RvKAm7qXcs5eGJIMni6tYN6ChnMYrfxlkVV5FF9ul904WBaOHUXS51PbnQBkjBadQcXvUf2TuCOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098008; c=relaxed/simple;
	bh=ZsMda0uwAQyf/r755/L9LfI3ibTlAaDp5ifNzI89+Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZYYI27691CP4Z8jvW3jHlWoDbX85QObxH7m1s7ZtFc1EKs45TCphNSUkj5j9UalY1gXIjQe0EdwK2xdpVyxVy+hOy75RCDJYiOiY3e6LUOxaUDx3cTiA2oLz8sBoH6n/SPBSNAZRuRrueUZ4WyUsR88StCAf9KLcJf+RCbKL2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=nO0jjZKj; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="nO0jjZKj"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-8137b129131so138452a34.2
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 10:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790098005; x=1790702805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZsMda0uwAQyf/r755/L9LfI3ibTlAaDp5ifNzI89+Ro=;
        b=nO0jjZKjDmw1JP0Rn0SyIsCUKuK6bDVhqqm4Sn0eYFvuk6Ys5Qt/qKNDAwAvDISuQo
         Hrbs9OfKzh5IltehgwisuXsHOWcGLyKaCelru1MTjWlLcJWHIQdbEox4JR2wxZyixupB
         Ri7MtsbsueygkLdPC1igR1kX5IJdYSe3xwjT+25snNyYCQH3rLrJCboIbXa7EV/19tEg
         WDrqCrX3esVBcmAQ7Y4Bbm6XHaMOmTNj4Ze6JoNeR+Gh71nsloqvETqewCHRbD5nO6gZ
         GXOMFiXKaUFao4rp862MDO4hVl/SWcV0B/dnz60lI5J0/+GyPFQSdokK0BEBCp9Y1all
         +0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790098005; x=1790702805;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsMda0uwAQyf/r755/L9LfI3ibTlAaDp5ifNzI89+Ro=;
        b=hN1P9DQ9LCoNRi2Ayuzo5tCiNsPBL1tIoY2YA0lhcznzSATQ7h3d8v+k0cF2DPIHP8
         5eEcUiRxDE5LgMHcR96EZVJtEoRkg7mAFJJD67tI231tszh+bfijrlEgqMd2359ofjfS
         IgRFsO3yezPEtc1Dj9AEqvHU9t/KqKGkz95cT1lHxlbBOmX0YWaIrH+N3uTfuv/+js7z
         KmWlxjH4BGxJbojbRrBCgpjKtdhdnjsh/O/Yl7QnU8cIywEAJJI6yQgKPKtjGJA8+S1O
         PrOlOaz/lCa/v0JhFZ2JzVSJP7CLb3RVDiGt/qzi89z8c/zIi1REAtB3Kp1fBgjzU2Wd
         Ki6w==
X-Forwarded-Encrypted: i=1; AKwUvByIkSgKqwoc700I2idS6Y8KjaCPwKZVcougUuH6kzkSjZZSj8xxY8N1Q/mJfmPcPv8ZN46D1cxyiIkKMw==@vger.kernel.org
X-Gm-Message-State: AFuF++lLatwLbZFwcpHzYToyRAAKj6jLhSG+fEpHb/KWwYDa8HXxZMFU
	QAAYOXjKRy0zBewWixDvWMslr4oJ130tOfuPWYOsjdeVx1fEo6sTvDVgjoeY0iucjrc=
X-Gm-Gg: AYBFou22z1Vy2bNWRKi0hc23YCd4l7bYPkZ6zSc3sdgDku6JL/zBSekC9MEs1P88sTt
	qo5YqnKGD0PHPZmlQAbp4GXS1kZEbbx6W5Ezh02ydoQW5CEnUhLrIA0mqMRSob7x+2jo5mBdvGm
	fYR+U5vD1fkxa2wTJ8w6uy4FU3kj/TKFbQqD/ArfykFW4PY76IQOuAo5sozkk7fiNYwpUIvxHq3
	a2FmwUn2l3CEqkFFZF1BGJpUPI247qpXDAh00QJWvsc9CEi+9+xZMZVfhxPKL9CcJUqdNtLZhO6
	Ub4bMtf/xIJmd/HsBzr5MaFe1WTvhgJfc0E1NdZ1VXXfCgzCLLFQg11p8Yu713Ztjpco03GBSFA
	Dl3QHzM3sNUMjbVSwfJr8F7GJUnYUCMglCN7Qq2ukOzmlc7iUO9wkz0N0R+OFylBUDzymLIHE4E
	24aHc9YIkS/tj7E1lSYidgx7UGYd6kjiIWAQdNMt/Afwip
X-Received: by 2002:a05:6830:82ee:b0:7e9:e488:3bce with SMTP id 46e09a7af769-815f0071c0bmr324985a34.6.1790098005310;
        Tue, 22 Sep 2026 10:26:45 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81603fc79dcsm103564a34.14.2026.09.22.10.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:26:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x93id-0000000AWlt-1Oeu;
	Tue, 22 Sep 2026 13:51:47 -0300
Date: Tue, 22 Sep 2026 13:51:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
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
Message-ID: <20260922165147.GD1540250@ziepe.ca>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKsFofudnTYpXj1@arm.com>

On Tue, Sep 22, 2026 at 05:25:58PM +0100, Catalin Marinas wrote:
> Does the memset() post sharing logic work for pKVM as well? If nothing
> clears it, we have a small window where guest data is leaked to the
> host.

Same question for RMM? Or did they define that the RMM zeros on these
transitions?

Jason
