Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782053;
	b=zPVTANlLQeV5TqP4Bs5CSLLzEYsvTDa32IsG6R6ZZaPz1KLFCJoFR8ZF95n4w6DTT1ka
	 SrbqyamiSWRm3Jl1B/zOFlROiiEVdbE1nPnaoXQndYv8pnNBCB9F/UhLGBIluTnvaUPYB
	 twvGr8OqZRAyzDmtJNnm2TKn9TOCWSWp7W+ECaXwzo6Y3+5AQ+4IImdK9DwGzGoxdtOYV
	 GVxfJMhUFiJttslpt5lpTODVOEu95Ehy4qLHt58FVeQ+5Z/m1U3X4ccmHmZ1lmZNgxTc6
	 eJufyjh/5UplpZrWEiKoRmXfO9EnxwALw/0plZKYxjh2HvLiw6SRKoeoy97HL2cIP+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5tf4s8d8+MZT/ng3kYJALwtT1EAbBRaxelT7QvlTQng=;
	b=L/JSMbN57DLKNHmuGVPrNANlWUpHa9QWEGZ+NNnBoidkz/LxmUV1xzzU+1OPEeDJqMbQ
	 c7MXRdM66uO6pYYItfy7XP1888jHDlR4VeWKSiJMgl94xo1vA6soAfAy9rDQGrDiFjonL
	 bHia2w6RLLCO0yxieUhwNMVrLUKtk88rFBKBSGXmyARrsTixD0sh193dxF7rAa/GcocAG
	 BzwuZnIb+jfzgd+d92gOf9hzPtgFVSlfkTufqEr9apXg+Fu9bS/mhNhMn1qw2uP4WNN7b
	 6TmBv5dQYXjd1tKzd7SQrorU/2yCjJBzklTX4+2v4GRcj7v7d+j+VQAEy8J75fw2c5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bzc4Cg9j;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B6F606A321
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 19:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4B6F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bzc4Cg9j
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53669f7b518so11399651cf.2
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 12:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792782039; x=1793386839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5tf4s8d8+MZT/ng3kYJALwtT1EAbBRaxelT7QvlTQng=;
        b=bzc4Cg9jHc+EwZ+EF2GHA00SaE7XNzyRJ2jPm8VaHgqzKDLrehIHY+5e8wqB1yH17y
         sndSYk22aMmceP9P1fMLTu0Z4V8EzlM2RGsFmTw4gK3j741dLn2NCvrwBRx9Zs2Y9Nrl
         IH1Flz0MwkfAlUgvicHD3GXb1HCVFF/PCxVAEn/OVSguv9eR9Zs++ljRZWXpHTqI+xAr
         rfcFCA7qmIwN9IxX9GeYG2HRZ3YRwMSM0MH1BmgGZbTGcamONR+rAGI29PTmp5avInXD
         sAUAnL9pEXhpYTml9nJyCuJ6EjWQTeYXwbhCn5SvYnMgGcHEU9aguEL9UamXbiSuNSk7
         hQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792782039; x=1793386839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tf4s8d8+MZT/ng3kYJALwtT1EAbBRaxelT7QvlTQng=;
        b=aDt1NAU/SBI6d7XsYEAX3JNnG7CKI3qpVeQ99WnB9TM2P2+HWnugT9P6vHYvcGnBEX
         a7upxZO8PDsHEHje07uSE4/OubAjpASK4jngbs5hVz12f+RdD4yZycRwDy0Bvh17mba0
         TrlPuOKn7dH12RjkIKAg12ApDt+QduuDJRTCXvdAS/uB1uODAnYetpMM5yihy/QRjYZY
         joCIZGRP7Da1R5XadSZaSN/EbQmrC1RW3GHQyQKy1UaI1i8KiB6SidSYgwmrMIp7OFlc
         OgUxP/5kmQ1e2L1yPhQsLBmAxXWwAcI4/w5dRfz+IVTHe2jgnGyJx3GzfCPXxLVtkWw4
         Jg4A==
X-Forwarded-Encrypted: i=1; AKwUvBxz506QPE2ljttxS6+LGytGciu+8O1clra5huWAFsmvlp050FLUh61xeHUz+vAmONckeBIC8VrOkXzaCg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL9i51GVgijrnzTl/rOd4xwFhFRUEffcLbOReU9+ePkoV7EyKze
	Gb0vuiHG6MzlharEJ4hgcx7MrSzuWfGEvbxp6Vshr+ezD5Qpp+f0WN6z9+773kwj06E=
X-Gm-Gg: AYBFou11ddvzJqYLlIdOOwPUyDOnGuzC6wD1s1u+Bne/suLf8zkyvpAiYFwecjphZSw
	UASNJtYKzeljs7S36cScaB9uiValixLInnQoNu5RaEms5XtImO9yMfOtMBePwnSLfHYTiD2zm6j
	CJjjOo4Y1GXmlZOCmYRBPr8RzkpBlRrCIqfl8g+mkeRL2Fvk36h83IlLitfJ6ktjvbpYFAlv2oi
	I4SQK5ARQvGsO4yI1TAh90pF/1sBASPHN5+AMO3NEDwbnQFlJmY5AMh0/HLNlNlPUGgQI+OqRdz
	G8oqqa2Lk+lvkUcwRc/548UFRjkP3mlqmsgfQIpKFCu+t7EaYAAtPgS0dQtERPMySIU2RQ9e0/6
	KaF2QHnAPpYJo/fDQfr69ThPVYSMiQ17Dt/vBeD3SDDRy0snpZ2NDhzdBO3nDIe7qHRhIk6UgNy
	CpdBpqzqH7j1+sSkfCjbkNNBHySuSa8BkIoCRL08lielG9504GP6ik208GTP8Zoclpz+Y4MNyR1
	CYdgYlsBYXFmYz1vlU5t7OspoucyJ7hoG42CBRcLxHSO0pXgJ9nrxo9sXrk/aCsfBLq/cYtCI3i
	q1dQAUauRljfhfaV83Zxx/CHA1dNrO5fKJuFrg==
X-Received: by 2002:ac8:5d8e:0:b0:535:a5f9:7520 with SMTP id d75a77b69052e-536c26e2168mr47897061cf.63.1792782038589;
        Fri, 23 Oct 2026 12:00:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53839709ed6sm1185741cf.16.2026.10.23.12.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:00:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKKVI-0000000GxzN-4BG5;
	Fri, 23 Oct 2026 16:00:36 -0300
Date: Fri, 23 Oct 2026 16:00:36 -0300
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
Message-ID: <20261023190036.GL3977851@ziepe.ca>
References: <20261023155914.GK3977851@ziepe.ca>
 <20261023182715.GA2798722@bhelgaas>
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
In-Reply-To: <20261023182715.GA2798722@bhelgaas>

On Fri, Oct 23, 2026 at 01:27:15PM -0500, Bjorn Helgaas wrote:

> > Yes, the ACS combination is selected to avoid ordering issues
> 
> Does a user have any way to know whether the configuration is safe?

No, unfortunately in PCIe so much is really difficult when it comes to
deployment :(

> I'm wondering whether users might use "pci=config_acs=" to configure
> ACS so things appear to work as they prefer but may not provide the
> ordering guarantees drivers depend on.

I imagine that could happen, but on most practical systems the root
complex will blow up if you do asymmetric routing so there is an early
indication.

I know this because I've help debug such configurations at
customers. Some servers helpfully MCE if you do this. Lovely.

> If that's a possibility, do we have any notes in dmesg that we are
> depending on fabric behavior that the OS can't discover and verify?

Maybe, it could be interesting if the P2P logic found asymetric paths
it refuses to permit it.

Jason
