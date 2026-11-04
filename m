Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822210;
	b=YFvY7HV0MuSqYmyCZ8E9JIpfgx4WpHaKbiwgL0crs7kvKIjELFPUdZ4Hnfv2OzLE+56C
	 mccSfeKjKiCdLK0yd0a2taawh5d6+IgR/oO2oOduExDKl/3Kj6PbknqWqotE0pELJoXdz
	 7yokOCovDG6+VfcM+jAMhK+is9YtoqviZIV6TdAVFwQKK4AaN1jiXanQaeTA0uHilf0iV
	 OdvnSdHrsatfYHu21Obnb+MFp2tSQRyffirvFalMXCbkl7mOnH8h5VEPkVBy76Cq3zgr0
	 6D3X5No4WP8ls0NwNvXtkTeIY7Y/9hXtJqb3KtpE8mtB05TNFy2Ds6qmBQeMKC01GFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=H4EFhcspofR4b1uKve6jkW0t06ZcJnK+4e01jxgUvKY=;
	b=hzTHKBp4uMkTNiqGNjzXtvMkb8l2ndCvLuSQccIXG4IrF6hRjLuKYS45DcSZpDzvgHc1
	 wMhkT6x0J4SYJ3GDX+Il13DJ9fMax+QQ8NgkbZmFyELQr+ERKCEQb1AibbH0uD0zF3nKA
	 lZluLlqLATewKIljU+0dJgF+5KxIyQUcZuASaf7qu9wrYQunNOFcacKpR26BwaLo4meYh
	 D/qhrNOwnjlCR8i3rAzUlpT/Xsg1YU+Z6fUkn/KT/TxJqlPOt1jjHeFFkPuozW8UJfHbi
	 tUCmt9EuXaKfORQn17JeQWwCfg7bHUi4FEzVK7MCMuErCtlidViZHhHNYj55GzdEzGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NOYbjt4I;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A098F60E7516
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 19:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A098F60E7516
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NOYbjt4I
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-917aca1aee5so14517106d6.2
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 11:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793822208; x=1794427008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H4EFhcspofR4b1uKve6jkW0t06ZcJnK+4e01jxgUvKY=;
        b=NOYbjt4Imc3+qorIumC+DRJZJAO0qhFz2+pHwAqi1zEfxbu5bWra1k03HlG+YF8OE0
         WKjfE/pOBFyetohPjOlWRIhA3mHsvRg3GEzx+kZNd85Tcw9pNYivl5EYC1NXy62tmniP
         gfHDnSvMNrT/1wmCWo8qKmeaA6avWngSwYmx+WOENThvjaf8vGgHAM8uDVShiGtqafNB
         dZi4T7vTdEPrAERrYO9q6y9kwI0R3aYEicWhk+Jpjlz0jrkNcq8bxHaiqcO0GVGivwc/
         nsafW92bbB7UgGLKxsQlYu14YFh/SmKKEmptiEwveqc9jy3+1WkRK+IFeCBabo6QyWsw
         eAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822208; x=1794427008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4EFhcspofR4b1uKve6jkW0t06ZcJnK+4e01jxgUvKY=;
        b=MTqigCN0DvVvsOSDXFc5VQ+zlAO7bAu1hkRy0dS35Y1a13VMNgvSY5hP9yG5tLYK94
         QSmeFcOco6DeF556QENfRF8yCejF7puyeyvTaoN3ezZLuI5xIKp1i12MDK56rFPTLsG1
         CveMBJUbJ9flJ5CyO2BHUw4QrYl+ISpUbfLLAKenycBoKUvTmqZCVNl9jgs/Rx1PogQK
         NlmehzMNV6sc/nyCZwQJ9iQFe9Ot7clc9gfVLtRv4mhhIkZHChWNcE2JKJdbRa2qXAuH
         3feBrXpFJU/SH8mcdHC9Hazeb+YMFuw2xbKxL9a2Ws7zc5B8Ncz8cueVoduwiFKaEUrw
         98Fg==
X-Forwarded-Encrypted: i=1; AKwUvBx2z808GWGQTaWT26bKrWbamsYB/gZXo+tncXW8iB+Q+0bNBOPbVMexJjnZfMECi7YEZMqH22vyWSMtgA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+G8BGBkacoYqkoD/ggCxMfgmhFgAu6oysyp6xit/F07kT1Z9GM
	Gyx15bhqwO6Y/8Qi+X4/DtkaBxQlxV0Dddw4QRdDm/LHdb34EMQGnibZqyDaLuXeT+A=
X-Gm-Gg: AYBFou1BvvGJTpe5NT9PNYmOaZ+OA2ZTJLxZewtMhjfZhXqJYacGkY1XgceBZ8S1zcF
	J4x+xr2Kt+1qi34IKC8ezXCvxmZ6RtZ2Bb22c+/FnmMR/3ciZU17HA18KrYNIwISTpYBnASduUt
	js0yNXBo/kxqUW4BSLbSgOa7oi4OnGiBIqbek/YfKr7sRETgVKSPYZTYNhTQ9r0LXALMtVPJ8UW
	uMP95UrWcFm6uNnSblSk2cmIo3KXSSPWdn3sinZLs/bCdkFzME8Mq4+NXedA/gs88wdw1ZMogc9
	rXVI+3+lxc8Nnnp7F0e6S3CGYEqEfFBA/gjTemZJnJ5KXjphhPEdaV6v55QDeFPX6HDIYNbFo+k
	GD9ENGFVmOIJbf0CRK+86Ix51SOUZkGI6VfmRxlNvCfcIsD77gf6DCHoI5AFdaz3/TrrBVjF3tc
	A8U1psPPfamL2awzsWFmYofGtmZ4dkhzCWNOA25cgU68JuXvpVa+nzHMmbsRHLUndAguqQExeIu
	zVpsMk8m0aABhLNzRrCMvS3x5a1pkhMba5bCUYHB4/Q2hVbLW0CboPMSyPiO8a+vLwM0LUMBTvk
	DBTreEOQEuGmW1OOtN6E/xZK0TEFl+vhj8IwsXEn/1QD5drPPlNvewmmkF4hxMWn406rRw0ogYx
	ijBPR6L+j0g==
X-Received: by 2002:a05:6214:2dc2:b0:917:9cd8:f26f with SMTP id 6a1803df08f44-91ca4b1b1afmr281180966d6.25.1793822208495;
        Wed, 04 Nov 2026 11:56:48 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e7b1e92sm27199686d6.45.2026.11.04.11.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:56:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOh6F-0000000HJlF-1F1D;
	Wed, 04 Nov 2026 15:56:47 -0400
Date: Wed, 4 Nov 2026 15:56:47 -0400
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
Subject: Re: [PATCH v12 00/19] PCI/P2PDMA: Route peer-to-peer DMA by TLP class
Message-ID: <20261104195647.GD3889730@ziepe.ca>
References: <20261104084328.GP264423@unreal>
 <20261104171412.GA1247928@bhelgaas>
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
In-Reply-To: <20261104171412.GA1247928@bhelgaas>

On Wed, Nov 04, 2026 at 11:14:12AM -0600, Bjorn Helgaas wrote:
> On Wed, Nov 04, 2026 at 10:43:28AM +0200, Leon Romanovsky wrote:
> > On Tue, Nov 03, 2026 at 05:37:42PM -0600, Bjorn Helgaas wrote:
> > > On Tue, Nov 03, 2026 at 10:29:39AM +0200, Leon Romanovsky wrote:
> > > > PCI P2PDMA applies Request and Completion Redirect throughout
> > > > both paths.  This misclassifies asymmetric and nested switches,
> > > > and reports one answer for every kind of TLP.
> > > > 
> > > > Three ACS controls act on TLP attributes the Requester chooses
> > > > rather than on the topology: Translation Blocking and Direct
> > > > Translated P2P act on a Request's Address Type, and Completion
> > > > Redirect skips Completions carrying Relaxed Ordering.
> > > > 
> > > > Evaluate each direction at the path divergence, decide every
> > > > class from the one walk, and treat a client with ATS enabled as
> > > > translating unless its driver declares per-mapping ATS.
> > > > 
> > > > This completes the P2PDMA side; dma-buf and mlx5 follow
> > > > separately.
> > > 
> > > Is there a one- or two-sentence explainer of why we want this?
> > > I'm thinking in terms of what Linus will want in the merge
> > > request: a fix for something that's broken or some new
> > > functionality.  It sounds like this is solving a problem, but I
> > > don't know enough to translate the nitty-gritty details to the
> > > higher-level user-visible problem or feature.
> > 
> > Not AI; these are my own words with grammar fixes from AI:
> > 
> > "The existing implementation of PCI peer-to-peer assumed that all
> > PCI TLPs were the same: ordered and carrying untranslated addresses.
> > It did not account for the variety of traffic types defined by the
> > PCI specification. As a result, only simple systems supported
> > peer-to-peer transfers in the upstream kernel; real-world systems
> > required out-of-tree patches and careful platform design.
> 
> Can we be any more specific?  E.g., what makes real-world systems
> different from simple ones?  What does careful platform design mean?
> Something about ordering beyond what PCIe requires?
> 
> ACS P2P Completion Redirect affects Relaxed Ordering (RO) Completions.
> Translation Blocking and Direct Translated P2P affect Requests with
> Translated addresses.
> 
> So I assume the existing P2P implementation breaks somehow when RO or
> Translated addresses are used?  How does it break?

Let me try, something short for Linus:

"Enhance detecting if the PCI fabric can support a peer to peer path
by evaluating the full bi-directional fabric path over each of the
three traffic type ACS controls. Expand the number of fabric
configurations where the P2P algorithm makes the correct determination
of support to include non-uniform ACS and situations where translated
takes different routes from untranslated."

Jason
