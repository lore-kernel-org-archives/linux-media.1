Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1144519BD
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787232460; cv=none; b=GRzdHuSgVU+l/kIQsM6cxlLiaxi7VWFJ73GvvoFwLERfqf2MwTH7Hflzh54eJ85Xr1naIYvzub1AzQoog+opJAxyr8hvcuPbjo6xDgo4G+gZyqibnIeNMbL76yTG+wpCUYuC2ODdfRwB96/9TfLVeezSCqyd6tatjrt4EbUcAfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787232460; c=relaxed/simple;
	bh=+SdpdDD75Et7iUr1bfUimSJDvhfY48HkhbWpzMccHZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTDgijGe7o5f4T9sepnp7DEPHd4mvuRvxHvN1rRtDCyme7V1f19M8vrFZm73Ts61NJRcBh+buH8jRkwA1nB1b/38cp0LDOmZSuYf6UtkRKRrehSgExs6yu0XdL90gKcJBxhjVeUrOuiNxXfWGGMN30C1O+Jg9MTnQRDLg+3skw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=QQwQnoBn; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="QQwQnoBn"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52de50e77ffso5908891cf.2
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 06:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787232457; x=1787837257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+OWRyp1Na2XBrlQ7bIW9EaBkPnu+lSJuThzM8dmXiRw=;
        b=QQwQnoBn3nyWbxn0oVjyrs3ySJm3X6IyxHdKtXCQ9+6+tdPI4qjSnYNuQwg6SUUId+
         DFfFumvhymYu8YiXHLVRoKE0vD1lH+C7aC/fd9ez5bORRO13PG5XixMpGCyP4a2zCESG
         v4Gaw7YgzEh9T2I37n6DTQL9JX7UV52Q113ZE1285BII/IuphdmN39EtEf8K4pwxwmcZ
         RWIKyu0sADFKQKBP+Pc+gf4SQt6Ru6WglshvB07CN3O0Ckkl7ejaObiMinhQE9C131ya
         2ZWZb+F06oVKpOVPR5Yz8vgvEXrEgSBfQziQ6T/Ucn9EMjsjcoGEcIb/zMvgo0rIoOC9
         kUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787232457; x=1787837257;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OWRyp1Na2XBrlQ7bIW9EaBkPnu+lSJuThzM8dmXiRw=;
        b=rICP4/eyRvqHWQ5xOXgGzoLPn4QZw5P171mmDJAjcrHOY1PSgyGbdUy5ZJHKOm1skb
         uoD0B9hc3+9zraiqpuCxmGqmTRGMT5hFwWd5ogxIAqXhekfEWNkGfiXRUkntPNqf0oSH
         MnvXz4urFGJkkKsIR5f4evhhMGxgig03pwcS9DO+O7OL6NJwaQ09Lovh25zvJRHbuDpa
         9xIv1+LdJCWXKAMZahDA8FiWulab/uzhuhpmvCTkoby/Uavno46SSHCm7EZoXa0qg7i7
         edNkrmdE7bl2I6tdJriRTmxp/O2tsnFYMYz2QrCEqnvNW8ib6RcEKdwuiTMM3PSlJJI3
         H0jw==
X-Forwarded-Encrypted: i=1; AHgh+RppBzaky/4ZEGAfzO9OGsYYluaqsCH4zQsYF0/c90/Uulup+FrkRKwGp9t61as49tdMoQe8NvRQq+48qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgnjwoLkCzWz3KW5iOWcFq1gNjbFJLL/mLt9o6GjKaGYP4uJ2u
	ko4D7Y+xaYg2a0CUkFf/5oo/0F3BqySv7bOUzidqXHwG/X/6Q1jZ95nr5eSiV9bx1uQ=
X-Gm-Gg: AR+sD10OMVCr3Rou/B40dBb43Ba0GbsWSkUA+y+aUPbf8tOQfMONSBU9W6VI2bIEeAs
	mZjFRDZh9q48KQZLXQEb/KUlM180MxZwEccJgRFZrFzmrgJG7x351E+w/10THRCeiTSbKZp1Q4C
	zyIB1LWsU931J/6ch6QVJ15TVqSJJZeyNoQ/28anPfftwuUYokkB4KnalY8XkYR2eeUCT8iCri7
	MFO6PHrW35gqiKFTnERBw6XM1F3b1fK8hi5/KmSqJdXuBqdUSR5uiT8BLZrswjKjx2awGV4Dypz
	AYGpoXa96rZf2cUphU6tiTK7oEFvLGWxmFa10/3KQ/Id46p7EGuptt5x6CN885OqPRz1+dno80H
	SLJ93hC+pcF+GoCu1wx0R6FSW23pKBlxesZrQboTuhX36jWVpzvQWufMG+LrLkYahrTSWLyR4F9
	WFF+NT35/cMzdjl1tCkIXG+1tOiXGV1XfTSWVb5y0CA4k0U2OhtyjFyDQVTScKOBFSxqdrS0E+L
	EfomtAyFcZAJF1pwPWD3DHt/flXzV9LISrz+IhrAMLRKg==
X-Received: by 2002:a05:622a:5149:b0:52d:ce86:1393 with SMTP id d75a77b69052e-52dd5cecc34mr115534681cf.37.1787232457641;
        Thu, 20 Aug 2026 06:27:37 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd857b6b1sm30570231cf.3.2026.08.20.06.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:27:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wx2nw-00000003ikC-1Lb9;
	Thu, 20 Aug 2026 10:27:36 -0300
Date: Thu, 20 Aug 2026 10:27:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Marc Zyngier <maz@kernel.org>
Cc: Steven Price <steven.price@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH 1/2] irqchip/gic-v3-its: Zero shared pages after
 conversion
Message-ID: <20260820132736.GC18100@ziepe.ca>
References: <20260820105026.53208-1-steven.price@arm.com>
 <20260820105026.53208-2-steven.price@arm.com>
 <87wltlnfay.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wltlnfay.wl-maz@kernel.org>

On Thu, Aug 20, 2026 at 01:32:05PM +0100, Marc Zyngier wrote:
> On Thu, 20 Aug 2026 11:50:24 +0100,
> Steven Price <steven.price@arm.com> wrote:
> > 
> > its_alloc_pages_node() passes __GFP_ZERO to the page allocator before
> > calling set_memory_decrypted(). This assumes that converting a page from
> > private to shared preserves its contents.
> > 
> > For Arm CCA with MEC (Memory Encryption Contexts) the key used to access
> > the page will change, and so by default the visible data will change.
> > The host could ensure that it zeros the page, but rather than relying on
> > the host's behaviour it's best if the guest simply zeros after the
> > decryption rather than before. Specifically in this case the ITS tables
> > are required to be zeroed.
> 
> What are the guarantees that we want to enforce post decryption?  My
> recollection is that the RME firmware cleans the caches to the PoPA,
> making the data immediately visible to the hypervisor. Obviously, this
> isn't the case anymore, since the zeroing comes after that, and I
> don't see any CMO enforcing this.

I thought any CMO stuff was principally about cleaning things as part
of the MEC change? Coherency after the memory is made shared should
follow the normal cachable memory model rules, just like in a non-CC
VM? We don't need further explicit CMOs for that.

Post decryption I would expect from all architectures:

 1) Neither the guest or host take a fault/error when accessing the
    memory. ie the host may immediately pass this memory to an
    O_DIRECT system call and have its kernel read from it.
    It must not crash the kernel.

 2) So long as the memory is mapped cachable it should follow the
    normal memory model visibility rules. ie it works the same as
    VM CPU memory prior to CC

 3) Rules for actual DMA are the same as prior to CC, the VM is
    expected to issue its own flushes prior to DMA if the platform
    requires it.

Given the requirements for #1, is there actually any case on any
platform where the host doesn't *have* to fill the memory? Is there a
platform with MEC that doesn't generate an error on reading with the
wrong MEC? Without MEC it surely has to be zero'd in the RMM world,
right?

I've argued before that set_memory_decrypted() should be defined to
return 0'd memory. I think there are real systems that *have* to zero
the memory as part of the state change and this API is now
forcing an extra zeroing.

> I'm concerned that this relies on undocumented behaviours that may
> hold today on some undisclosed combinations of HW and hypervisors, but
> that are not guaranteed at all. set_memory_decrypted() doesn't really
> say anything, and I have the feeling that we may want some hypervisor
> specific hook to perform the correct CMO magic. I don't think this is
> required right now, but I'm not excluding anything!

I would expect any required CMOs to be part of the arch's
implementation of set_memory_decrypted()?

Jason
