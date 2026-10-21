Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594869;
	b=5R6OD0knDf3sLAfU9fFzL/EGRA4lWATOgl9uPZWULhNkClWVSGZLKWaxiOTpmZOqJJWl
	 7ntMX7rKABZT771SnSFJoy+V4u31U87dJ6QzeUrmIrj7gqAEMJZDI9R9NWNoG5g0b8h2D
	 LLAqxrE8wpan9MXhv4ln96nmMnUVEUKOF7a7hamIQN4emvsB+jtV2bENvhOTA0LAJfzoA
	 k2FYc2V0+kHWGKyQmsR89XxiuZvzd7WISJuyaGQCYZdA4Rf8u/wOt3jzrjFBh8ij3mzik
	 tsVS0cP+9YPUWRVK1onCf5/qzkW6SaACeEBRX/x1lehlsNPRVAG5aN6RYJ+3XuO3eqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=l5YmJOrwJgNdPors4hwaMvEw7jPwZ//sTr6muol287w=;
	b=XaQAB6h+4vR1myK3zfIUdTfWBAajbsVE2lpbDm3cF4A8Y/bEpeyO/gWDAZwCln/QLL2e
	 V52HOOjxGrLpjKMzN2hvVEBWuyO3Xw9tTsfEZiHCJ6RCtiXidiowwUBKeQtt70yzjoQ1S
	 UIe0O/XBG74ncXk2rIfol6URUIumi+9I6J+7WhAj0lx/2JoShw/d7io63g/WptF5eMhHR
	 EvgPmU26PQZriwxMoFrfSgTaVDjfY4XCeCAWSTDHvWuMT7CxuvKAlShj9aNurI1Gyjvgc
	 2OqMxXmSSC/d3zmefmNW2eW5ZXGaOQh1iw8ZkthgsvTYcnDNgmel+UwIVNwL4Cgt8rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SNfikhEb;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970D4606A31F
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 15:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 970D4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SNfikhEb
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f30660e69so52260385a.0
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 08:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792594867; x=1793199667; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5YmJOrwJgNdPors4hwaMvEw7jPwZ//sTr6muol287w=;
        b=SNfikhEbH9QUIAPD8zgF6gBEb3YRzM7HYTihFKf5TM3kPasOVzdC7DuU6I5nJZHW1A
         iomGNjKUYhQ+HiDPKGRa/M8EyF3FMnkdDth17W2AfTclhZqdUAiqO76yQ+rrk6ey93GU
         D/uoieoGan7l0u8KWOrSbaxT79Ps6th+14rW6Tc5hUaPjKXgS1uWSzUF+jeEf1tr6d2R
         Ehk+YWVWiQw6shc9Jxm7sagMIDEvlZf0dPUv0nXDSdHgKsC1CTgrpPQdv3mQP0VXgGhV
         S+mmifHdwVkelVZ4pSbh4EGpZ+08yJFeJQD0P7eUu51B2J47VQlKqA1fH1ZYOGUVs9rW
         IECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594867; x=1793199667;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l5YmJOrwJgNdPors4hwaMvEw7jPwZ//sTr6muol287w=;
        b=NHyh8lL/oIKcoQUcF49XQhwR7k71Ntx3tX55e+8uKUVv+XThsEvxph/RYDNdO4df8l
         IEvGIQlDsE5etEUgBwe8DnjaqHcsHp+cHqh6eYXPROzI/rAqngAbSpI+lYwlDBY8pwfV
         zd0DnpHYzufeyKvjVgyBXWwJhIFsi6nwKrRico47u3wEnQ8Yj8lKkUXFCLFMnWmNz+ew
         Kh5hjLMlG40I4xuyPAE12YuW9Qw+yBntdRN243mbhKp8a39ROiIAlgGPBhJ3unBMwazv
         BbHXA2yoF+j4+4A+nw6QYm0JizPoeKlE4OFf4RcQTYbVrQhXd6292W9kPWOOMWbpI2+x
         AFSg==
X-Forwarded-Encrypted: i=1; AKwUvBy9Z34w2cx9ZQfofB76+jSRpbgdo8WrOZFh34BtZFCDA0pjjDu0hs2yV0CdnP5ALUlUbnfbo2p7LNrRig==@vger.kernel.org
X-Gm-Message-State: AFq9FYLgWO9tum8I3A6cgrOPJcWxFp71ucGoAj9kTYK9wPeoytMmcL2q
	wuUJyiXTf90nD/ObgGNb5bj2n5UnAT620xlExDzanFN90UoEnF+zdtu3lWPpn5uos90=
X-Gm-Gg: AYBFou0XywWZPvlp8LQxMz0p2077VRY+0M9PZ4Svy8APGuTnvreinr4oOJAABXNrUEW
	rJ8FLC7gxa/nQvbdr012YkeBS8WdybIoHBWnt8vRdHhjDPbFFW1CcMJwSll5wfp/CPyt/FjA3st
	q00CoIo12ruGm4JZPf0ejx6EPW3xIT19+SUQO5mcnW9ibGcZAbQ6trpsdDMOfGq+pRVSaVzHsZH
	YHazDcG1vx+t/02njOuG0iQcX0pXDPDY10/u/EqK4slzWWYhYOlVyov1K6y6i11mgQJBoxbcQSx
	d88AgY+OUsL+TQXCFkPiguAm0cudezd1KxCM9tFMyCx4DskzFjpgj+7IGiQXHxGQ5ooUd9lMkuV
	wS3+AF61jGgh5Z91J6xI2h3TDPKf/pSjYze+bD7cJ5CYh3YbSZx7sogwrTpdegy3en+KcN1Ddf2
	RDViZcQUD42bZX+GajMpwtHbuCVfn1ipsqoegf6b4NuPWoT9jis5TuRUzM1JMctnp5qJWaRYcpJ
	pkY2GNHQ6sDC5wojACo1bgJdhRGguRjpUwJ0IeKjCbcyjG+jlcmpNprmYq6JxkBemdEWNKuF05Y
	Vz8/nzCp66nd6/dDkzmax757P0x+3S5+gLeBgQ==
X-Received: by 2002:a05:620a:29c6:b0:93f:3863:268a with SMTP id af79cd13be357-93f57f23259mr459988385a.37.1792594866402;
        Wed, 21 Oct 2026 08:01:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56c6e030sm276704185a.1.2026.10.21.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:01:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJXoO-0000000DwuG-2ayD;
	Wed, 21 Oct 2026 12:01:04 -0300
Date: Wed, 21 Oct 2026 12:01:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: Restore the scatterlist entry count before
 freeing
Message-ID: <20261021150104.GT14213@ziepe.ca>
References: <20261013-dma-buf-fixes-v1-1-0e2d9ca41f3a@nvidia.com>
 <20261019183146.GH64621@unreal>
 <dc91d903-139d-4253-83f7-51a78dd4530b@amd.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc91d903-139d-4253-83f7-51a78dd4530b@amd.com>

On Tue, Oct 20, 2026 at 08:42:18AM +0200, Christian König wrote:
> On 10/19/26 20:31, Leon Romanovsky wrote:
> > On Tue, Oct 13, 2026 at 02:46:24PM +0300, Leon Romanovsky wrote:
> >> From: Leon Romanovsky <leonro@nvidia.com>
> >>
> >> dma_buf_phys_vec_to_sgt() clears orig_nents to mark the returned table
> >> as DMA-only. Since sg_free_table() uses orig_nents to walk and free the
> >> scatterlist, dma_buf_free_sgt() leaks the allocation on every successful
> >> map/unmap cycle.
> >>
> >> Restore orig_nents from nents before freeing the table. The helper
> >> allocates the DMA list directly, so nents retains the allocation count,
> >> including for chained scatterlists.
> >>
> >>
> >> The reported kmemleak output was:
> >>
> >> KMEMLEAK LEAK: 2 driver-related leak(s)
> >> KMEMLEAK LEAK: unreferenced object 0xff11000125ceff00 (size 32):
> >> KMEMLEAK LEAK:   comm dtr, pid 4432, jiffies 4295031027
> >> KMEMLEAK LEAK:   hex dump (first 32 bytes):
> >> KMEMLEAK LEAK:     02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >> KMEMLEAK LEAK:     00 00 01 00 28 38 00 00 00 10 00 00 00 00 00 00  ....(8..........
> >> KMEMLEAK LEAK:   backtrace (crc 4e8077f2):
> >> KMEMLEAK LEAK:     __kmalloc_noprof+0x451/0x8b0
> >> KMEMLEAK LEAK:     __sg_alloc_table+0x2a0/0x4d0
> >> KMEMLEAK LEAK:     sg_alloc_table+0x24/0x170
> >> KMEMLEAK LEAK:     dma_buf_phys_vec_to_sgt+0x84f/0xed0
> >> KMEMLEAK LEAK:     0xffffffffa1ad21a8
> >> KMEMLEAK LEAK:     dma_buf_map_attachment+0x138/0x690
> >> KMEMLEAK LEAK:     ib_umem_dmabuf_map_pages+0x249/0xc90 [ib_core]
> >> KMEMLEAK LEAK:     0xffffffffa138f8d2
> >> KMEMLEAK LEAK:     0xffffffffa1396abe
> >> KMEMLEAK LEAK:     0xffffffffa1331a5f
> >> KMEMLEAK LEAK:     0xffffffffa13320dd
> >> KMEMLEAK LEAK:     0xffffffffa1ad696d
> >> KMEMLEAK LEAK:     0xffffffffa1acecc7
> >> KMEMLEAK LEAK:     0xffffffffa1acfd17
> >> KMEMLEAK LEAK:     __x64_sys_ioctl+0x72c/0x11f0
> >> KMEMLEAK LEAK:     do_syscall_64+0xa1/0x4f0
> >> KMEMLEAK LEAK: unreferenced object 0xff1100016dbf3a80 (size 32):
> >> KMEMLEAK LEAK:   comm dtr, pid 4432, jiffies 4295034705
> >> KMEMLEAK LEAK:   hex dump (first 32 bytes):
> >> KMEMLEAK LEAK:     02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >> KMEMLEAK LEAK:     00 20 10 00 28 38 00 00 00 10 00 00 00 00 00 00  . ..(8..........
> >>
> >> Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
> >> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> >> ---
> >>  drivers/dma-buf/dma-buf-mapping.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> > 
> > Reminder, thanks
> 
> I'm waiting for anybody familiar with the code to review this.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
