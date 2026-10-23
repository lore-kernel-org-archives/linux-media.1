Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792792912;
	b=ADCa4yZGR4KK7B5JXtWjnm/fGZa3SixJD8RaqOcXDc8flhCOeHm+bEUmXfi3WAevvznN
	 mspSbz49vaUoAfBwI9Zlq90fdRj2jTDb/uts6rZ6HdOP65WN2disPakbrn6Ftyc6mvyq8
	 Jk6Z+N5jvNHEx2/x7vsdror1WdJgDgerr/V1X1Jbx0WAbK5bB5fB1HMM5t66H3GUSQsmh
	 TSjPRSvS4sQkHGe7+u6QzBDYj85Cvma8eQOqcutvkqq0i6p+lHZSXL/ngfeqC2JSRPyE2
	 Tp/hb03TIUXXXjUrS+XZHbgBDT2ev6Az0qMu46HBEjDiSyQirsHqjgbu3reHg5nGKJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792792912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7bRloCtYRc/1CN8Q7Hs9aasGSanwrF1DkhN4CIO4rT0=;
	b=5Rwbf5W6mZmlL1GEnKnGUolyXOzi62jcjxSrDDEpDxcTcZ6OrV2eGdDEYzWxOEfuNA2Z
	 KDQrLxBgtnI6MXXBiOarZro8SC8YZy5GUAPG996wvD2abLFJYspFQ8a/9SqZEO86+DRAg
	 Y5/v/TnZY9DKRq6W9hM5ZDkZDldxd5kNxQnQJZrJf+oYP0KTUir+OZg9CPo8fhmUciq5A
	 HzRsudUxHCuGlmyYRWiFuOdr1wYRJeqy4vur65CqZxmkl9J9eli/v/QHnXwcvJHgvaDTk
	 1PC2gKAYIrRZ//dPirybPtBB7s2vOvS7tLOYIYmVZa02fhUArwaREVJys1pPecb/v2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=H2Nk80SC;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC618606A31F
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 22:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC618606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=H2Nk80SC
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5367cc15121so16544671cf.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792792911; x=1793397711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7bRloCtYRc/1CN8Q7Hs9aasGSanwrF1DkhN4CIO4rT0=;
        b=H2Nk80SC0IE0suPURnYr9e6hZbC4LBCNbP2UbticIu/vM5Zx8lZxl1WF9oIVeOGweJ
         W19x63RIXk3jCkb/8AZ9w0/6q6ZaY29bsZqX8VJh3ACjKIAi6gixXOH39qqPhJV0UGZD
         h9hrX7AQMBlOV6X6RgQiCpuKPLs0LqoIe0SH9hdfWiIr6eNHUZFFbT0I/kCisS92xxMY
         Ucn1ZlEpvxoCWlvTmp2e0dWk4YFXYfROdABgbIgP0F4SF8jcDI2aMT5TzMY19oaj7RhQ
         ktu/3+o+78VzxnRBhNe+IMPeqMjRjTTMOSsOLuA26L6BAOJT0HaC4+T4MRB1PHDXmGMo
         Ignw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792792911; x=1793397711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7bRloCtYRc/1CN8Q7Hs9aasGSanwrF1DkhN4CIO4rT0=;
        b=KIj1ZHFTUyji0s0C2kswMRe3/xnBirxxpYVbiAoHD+gpTtLqJpHWpyQsixx2X1jJC7
         2LKz6pbVFGDPtyimxY9MbLepRH+rwLk6+92XQWNRwZSR9mQnbsP5ITWORbYE/8Mb440i
         2IeGZiEC4tcCPxBOJAZG0wwWSa9OtqBP+L9d1e7uHijygslbScfWC+wjlGOHom+Y1QdN
         jNtw8aNplVjschqYJPVLCn8XDQuYyjx1dd47YFcMojy5a/y5EU9su6AHiSmaMQE5PFTk
         7gaYTVsrjvFRZuzKLTU9UAw8wtaVYzWpE9z7AQsC++MBjJ9DBGdD3IeKxaVgu7CdDtzW
         TkjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH+km76SzgRfRx2LY8lq9LF4QkT6VPta4tgcyYhiVazRAXIr/WBuNZlyF1t7ohml7XLEwWLR8NCzGchw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJSwJFSGoZezGNqtmaaJWWJD1CQCCigiKJDYUBzuuxyH5eflFYq
	KUZWecd+5zj0/US0DdQ3+LVuS4ftjO45j0Ib6O4jCssE54OvlneNCyrxbmILR9xDfog=
X-Gm-Gg: AYBFou2CpHsTZQctto7+vXL0pVLcekQHCaHHDxvlnLwFHwcYaCVFvnxAr5l+QVt967o
	aNG987YNGGfuRbMDKfhXcSZ/MVPQMVXtH3ckPU9FM+lVzZZpv27K3wcG8I5dW71z9lTA5UTiqBC
	vVTFQEkFVpSry6qI+Cs9NBi9tv14uecw89bfBgGXmgqiZlKVZcMugn/inwuueSxBDi/tTd//n4D
	iUuGLusilNJ4V8w75QbmeqNDMEOcqLJzMKewqh1D6cmJWWM5KUsIh6Tm1a+8Ahw3czuqQDZZO+m
	Dr+kgkOcFJMNz4xn4p/XS7PgPCvL/AxTrRP7aXjiK++lToyT4qdsVCR3bAG64l/5gOSLslF2ap7
	GGVc0J1ILQebKN2vYUbefbvCRXuizbac9hTyN5fY9EEOKCM2m51UOWdQ5gYuBO/0BqZJAZ582Mb
	9cAWV0mC4wMpN7qpmBqHTFNVdlNvb5HiY44wZWeLrEWkwXkr81mYPZRMEfLNCVNbXOHopQk9uN0
	Me91Fyl/3PnpJvhE691hxN6IYvTfAy6lUvJ9RnINJw0ZwSq5oBMuvQqWtQhryNhWzR543JyRgXa
	OwnlwnJCHC7fawK9lDN2tBUJEDgYQcCDyoZTOw==
X-Received: by 2002:a05:620a:4441:b0:93e:c12c:f137 with SMTP id af79cd13be357-940ef9c87e0mr54142985a.82.1792792910841;
        Fri, 23 Oct 2026 15:01:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f078a762sm18520585a.30.2026.10.23.15.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 15:01:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKNKe-0000000H7Vk-3jIV;
	Fri, 23 Oct 2026 19:01:48 -0300
Date: Fri, 23 Oct 2026 19:01:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v9 02/18] PCI/P2PDMA: Derive routing from directional ACS
 controls
Message-ID: <20261023220148.GN3977851@ziepe.ca>
References: <20261023190036.GL3977851@ziepe.ca>
 <20261023201531.GA2805244@bhelgaas>
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
In-Reply-To: <20261023201531.GA2805244@bhelgaas>

On Fri, Oct 23, 2026 at 03:15:31PM -0500, Bjorn Helgaas wrote:
> On Fri, Oct 23, 2026 at 04:00:36PM -0300, Jason Gunthorpe wrote:
> > On Fri, Oct 23, 2026 at 01:27:15PM -0500, Bjorn Helgaas wrote:
> > 
> > > > Yes, the ACS combination is selected to avoid ordering issues
> > > 
> > > Does a user have any way to know whether the configuration is safe?
> > 
> > No, unfortunately in PCIe so much is really difficult when it comes to
> > deployment :(
> > 
> > > I'm wondering whether users might use "pci=config_acs=" to configure
> > > ACS so things appear to work as they prefer but may not provide the
> > > ordering guarantees drivers depend on.
> > 
> > I imagine that could happen, but on most practical systems the root
> > complex will blow up if you do asymmetric routing so there is an early
> > indication.
> > 
> > I know this because I've help debug such configurations at
> > customers. Some servers helpfully MCE if you do this. Lovely.
> 
> I'm still confused about this because earlier in this thread, I
> thought Leon said you do asymmetric routing:
> 
>   Bjorn> And I guess asymmetric fabrics must mean fabrics where
>   Bjorn> Request Redirect and Completion Redirect are not set the same
>   Bjorn> way?
> 
>   Leon> Yes, in some of our systems, deviceA to deviceB is going
>   Leon> through different route than deviceB to deviceA.

Yeah, that's what I clarifed, it isn't quite accurate. The asymetric
routing is between Strict Order and Relaxed Order TLPs, not
request/response.

Jason
