Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AF6581256
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 14:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653779; cv=none; b=ZfzF3LkBCBoHL4Thv3NiNC9QAHlZwSB2F7ON6Qh3HvvF5pPyYZyDj2I6gIJZoSRrylPBDJUk5nHb1VbY2Clbs9nk9adlJY/rVnNEEfjq+3CzpzF7dXRmmitCyHTlt+W6UniGAYIbJrXr4YIRXyQKjv1ixKLZqKl1Wg4BWH/hmj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653779; c=relaxed/simple;
	bh=5WF8VcNkm/QhAqH+TgnbaHxVovZYWfwOqxhhljrRvjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeTWUgtJVCucOTyQrMXR/v75dyPVjmgidxkYh5w0LEck6uP1jkGm8xnLycX1tkT8ULacklFMaxyeC9OrnOJ9+r2R3Qy/TuvGv6VPRUHKq1WU4RNKJbFflozUbFwa8hQJETTfYnq3+2hx23R4+DrZTL6uyuiNH4ikmvUkkgR4d44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=OVEWn/ds; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="OVEWn/ds"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bc5bfso234168241.2
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789653775; x=1790258575; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5WF8VcNkm/QhAqH+TgnbaHxVovZYWfwOqxhhljrRvjc=;
        b=OVEWn/dsUGk0Myco3X13NbUxQ2N6DqBM+3t+cl0zpoHxP6xtU+yXBGIcmtWaZAW59F
         yPlozK/9GLNCzTZ16jyK8rZW54T0IkPSrvLHiFew2qITy1XBgR7SJxcgH6Iuin7S4TDl
         bSJnKhV8eIhYNUvNdY8qzrTjQU3NHE9fszm8w4B3e/REeJC6jZ7nG300iARqT04ZVJai
         UOYZzu3RZCp9zHqZHgyJioDFLuiqO255MyFWk1klwJHcB0FP3UDtSChNCxaTuMvm8oFV
         lnv5UYb5jN0zo+pl5fpPOG2xgvvKOvnZh3AfFvU9txO14Py8ReHD1/Yk/BGr+1H/fCiJ
         l0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653775; x=1790258575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5WF8VcNkm/QhAqH+TgnbaHxVovZYWfwOqxhhljrRvjc=;
        b=KVcKBj+Z7vCQfdBYDMEQQ4n+i2fQJg4g9aI+sro7NY1nVp6J4dFYUHvbWoOIs98CmM
         6Y0KRfKbSmq+XAQokk3KQVqfxmQmTqvEc2IEEXMENdgc5ygW8ta/Mqu9uEq44aaL0od8
         l8GsBpsB/WuJCcvAZMXglUBFGqz3n7kzRX8jQG/UCEk77iiTw5FPcJg51NC1NDzT0+Nv
         qqeV1K6L1v/AHHCr36RQIo3NgcJ20iHrs8eeckvhaKTXR8cLpC0IwGmMKgIrVnE++llX
         2R7BpDHhEgvxtpef/GZnIn6Cli2XNJBDR6Zver5+gxusESqB66qrzITrkZELEhxj1zON
         Kysg==
X-Forwarded-Encrypted: i=1; AKwUvByR+DDX3L+wQbXGr1tX7VAZFdlOABdZTtc4pcbBO4aHU9Wp/+whvGH4meqyp2fa/LLnsboMqiBc+NnWBw==@vger.kernel.org
X-Gm-Message-State: AFuF++k5YZqHEknIQJK7knMhX+3mzePoeIIqqkhmFtmAmcwqZtUmz14k
	V8XL3MOsCDKQSYle8r3GHA+rkVF7B6+pTzrHE53B1hD2MM/pJDtGwV8wz+4ccovjh88=
X-Gm-Gg: AYBFou2Z9zsYzsQXOktbp3N1Zdz6rrNoJ3hEcQ9vVHGCZ525cAdK84chJypzhLXK/Ga
	cndf4wvYCxYQx259+0GxFqbfyztVRNUDvG03xGJbx1nNcGuO2/UyIYwIKCSKSLBk053CQFGYo/n
	moyBWTpiawIMt9hbckpDJ1Fz4hF3SxUyh/Ur3miwfmruUBjL0QT/QX/JB/aLs5vwt7yItXnFRyu
	PEstg2bSD1lslLwBjcL+b8SakO1fBn4usHT/ApGy3ueWjW2Y6kY0qI2S5QrWWFr9lpMZWt+Aet6
	/yfd3HEGBol9cGpf3+l3zBbTalOkl4q+fBcXWmF+rsmqUjey+RTNRo5LCKBdex6Z95Puh+wszPH
	jlzCxOjf6Si0uyWn5xAZebqEPjHOer14k35MmdanD2siiv+9tHYhyGOaTfoK9TK91j66YaL9WdK
	ArL4hSUhGyiEuV00X/CvADcTnpRLC5u3UnA8Af5xHBGT3yD32GwFSwXZ4CIT0wcTnvbXn3Gxu3/
	TgwomC/oTE7yYQIy7HP0OaWTXUQPlHOMXAwDKB1nwKOU5dRE4jW1ewJ
X-Received: by 2002:a05:6102:a189:20b0:7a2:63d4:3d25 with SMTP id ada2fe7eead31-7a263d44d51mr364707137.32.1789653775451;
        Thu, 17 Sep 2026 07:02:55 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123bec59fasm50600486d6.39.2026.09.17.07.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:02:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x7ChR-0000000Co7R-3O0W;
	Thu, 17 Sep 2026 11:02:53 -0300
Date: Thu, 17 Sep 2026 11:02:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH v6 18/18] RDMA/mlx5: Ask P2PDMA whether ATS takes a
 direct peer-to-peer route
Message-ID: <20260917140253.GG3196566@ziepe.ca>
References: <20260914-fix-p2p-acs-v4-0-v6-0-5ef07ec9ef06@nvidia.com>
 <20260914-fix-p2p-acs-v4-0-v6-18-5ef07ec9ef06@nvidia.com>
 <321890690ce83d1943b2f678bd9bee9b8c895b66.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <321890690ce83d1943b2f678bd9bee9b8c895b66.camel@linux.intel.com>

On Thu, Sep 17, 2026 at 03:56:12PM +0200, Thomas Hellström wrote:

> That is, a flag to tell the topology check that some transactions
> *will* take the host-bridge path due to IOVA being used, and that the
> computations including pci_p2pdma_distance() need to check whether that
> is possible (checking whitelist etc.) and return the corresponding
> THRU_HOST_BRIDGE mapping type. Translated transactions taking a short-
> cut using the bus-address would then be hidden from the driver.

I imagined it would work by the driver passing in what modes it
supports and Intel GPU would simply pass in ATS only.

Even something like mlx has variation, only some operations can opt
into ATS, many others are never-ATS.

Driver should not make statements like " *will* take the host-bridge
path" since it has no idea.

Jason
