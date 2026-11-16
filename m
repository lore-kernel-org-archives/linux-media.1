Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853503;
	b=q1qlN9ANQWkMmmx69+pl2tceqnCIwvbPikd0fJasBO+fmVuT9Wq73iwlFjM8KQGZK5lz
	 SYmcTbXnFJwN5ycFPwXa8d+8GWmunRVjB9HRsnXYBJDpMZsljUIaOCYv3lk+jptsU0wr+
	 s2SaRX2eryNXiO/ryFtMh5xB+kT1xyULvHoSK+yMK64NT5gxHPNyrcNvgch5K6m2TQfX5
	 bfzGLWJpCvBHqEMtiSvg1HU2PodyEAOJpZ8tkKvwff1J8QH85RX5PGQKtYpajjhpIRBrd
	 bjHXDrGdhtmbdSWN0jx8uQaq6QP7CcqMbD3+FD8jeA5pjQ0E3W38/EdmOaKCYdSFDiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=RxveffzrPQLFyll9ZgjwqbKKHagqTYrppHHKXVLfEqU=;
	b=PRutx10wnWBD/nIqLxGsd5WbRgZZsETDrHAzluadl1cATfLfR94shZIpmxynsjPbcscq
	 fqC6HeAj2F1q7e4IieoHW0lRTtycRr5ckMCA98czyozvtA92HbEaLsNhkzxqgSu3sFSnK
	 LMVLVaxO0OLgolW1g3jHk1MEnJYhJHlvMhJ9yFAuhNNSLaf/27j5DcaGQ+/dcjyFV6V9E
	 6tppGzkwWC6uviHDzgUqQ2XXbFWvU8wu6oy9hjNIcSg9zu6oEnBumfhUs4pWevBG28qJ7
	 GCxS9skG753LjboahbtfuhyrAltqRV6eh1JubGyRkzJLIS/Iro8UXk3e3rifko+u5CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A2luHTnB;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B5E606A332
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 18:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75B5E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A2luHTnB
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2efc4a84e75so3835ad.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 10:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794853502; x=1795458302; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RxveffzrPQLFyll9ZgjwqbKKHagqTYrppHHKXVLfEqU=;
        b=A2luHTnBzkGSMF2SIgDNxeNTW+bNvFUE0N2jlRcqRczmzdfRdcN9yBTceU4GEI6kAn
         hfRh+Bi3fIaAUEv1QVrJENm5Lqq0t375pPznAk7/OIdgG1YibB+Qs3xumwqfJ8g5nd0k
         6tGPIUAOHCegV3iOa0V9fxGubHoApxuoEM/xrOxhuTpgwO4kS8hLv9/rEbNyLdYr4kiE
         746Q8+8rNxbMY4cUu2/EQeyEGKWNs2kMUNjwXx3+b/QQq+OLETf+jHbn0FbHZVV6KC/A
         SGedSkLiSxOSdLSFaZk4mkqZi5tkVkbnF9iMk5R+t6kAJqe3URHpGr8RZe+HWd/gWgpK
         n6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853502; x=1795458302;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RxveffzrPQLFyll9ZgjwqbKKHagqTYrppHHKXVLfEqU=;
        b=W+AnN7MqexwUPG+LWOzxtJ76f3eeWxD5OtkZI4Po23BGHOC0X5PHjjjPK2feLwxhuu
         rRM/Eop7BKiCnzirj/UM31nTknjYgdQ0j/SjmKeWJ2MAhhS2n6ELMGv4yOkUnwyWhD4m
         c4LafgpAc3JsUlk1X8vUUTVR4IH7syFuccWO2Ek5TFVTC3Oa7l3CmXaGVvlWi6mZv1Om
         8T92tgukLHfl0MMzfHgcU9mCNATTdkmkPgSgSPrOzFqNu3vYX0jP5EuV2XdhYbN03gf4
         kYq+adz9k9pay1gRrlFoQVEDiGyN9ZIcGoTIY/I4EBcDHOlW6SDZzAA9WT6mKJjU/L5R
         2eag==
X-Forwarded-Encrypted: i=1; AL+hErHNueX5VWGAAcCQbqz+lg4sxcMRgP01HKvWagnBLME8M8w5VWlTUUxbOHi7HKVJbtpxk1c2eFhIYSN1aA==@vger.kernel.org
X-Gm-Message-State: APuU4Z97G90ueOK45PvLzBR6LSJVrHN+otrzYSLfQd6dbvmIXaYTyyVp
	X/y7BrWn/zX0rVnlKPE8n/CE8lgybSTXwVALNc0Fj/i7HhoODlA9WgLwRf4sM/6Zhg==
X-Gm-Gg: AZFdTZckp1EfRmvxnIZHodANb40xlEQg5ckaZiTXZ7dyFtnm6I02MEIS0LSUvDso74U
	iobMLyGs6y1Jv2Arn7Y1hmjJgfZS3SC9QjhtNxBVFfjVynCuKfa1lIpAPLN/sE/a3uePGrH5CEY
	qF93YwOQwlEIxVwXYH59NWBcTOtc8JCASf8DX01O8/mXudN96Z6TsXZ+p8qbZFO5tSw7gcJIGEM
	+cuLZhZYQA87vHljYkHZPXzMXoJHZni4GvZs2KD6NYLphFyL0OmU04c9yxDMjxpQY6z+5bGLJ+k
	eC06SAGJ9n6nSNS55Yvp1UY/hIUd4LiS2jz8ZVCeuAFXxCm0YkIkuKKSWfPfZHl/ARPO59VXMNV
	9i7DVs3dmEh59AKeAMycRt5N7QtoJskE9V+kehpHaQW9jnz1rlehee4qLBLTxYOmUuoco/J5wqA
	EhGNHjG2gcDU0VHjb6wocFkI+MBJKggSWgX7kkJWTjcDrMH2XH9EzKpoRmLoKX2+7ltA+ZQF5xE
	hBOmJkVjW5dTQSHQ7nbjQnEyTYKXjHwdSOsCkBizvenOdB/AZC4xtgFRpuze3Cnzy5igfGXmyDp
	RI7g8ca/k/n7QLUC8VCX6XWYZ6JHK4xiNEmFLaxV+MjncxD0b2c4DWa3ZivStrOwl6h7x62yWzP
	ITOhY/Dgp5whvvlcXoff3Kg==
X-Received: by 2002:a17:902:f68e:b0:2e9:73e0:2a6e with SMTP id d9443c01a7336-2ee2b19e019mr7765275ad.17.1794853502041;
        Mon, 16 Nov 2026 10:25:02 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm296668a91.17.2026.11.16.10.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:25:01 -0800 (PST)
Date: Mon, 16 Nov 2026 18:24:57 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>, 
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, 
	Matt Evans <mattev@meta.com>, Matt Evans <matt@ozlabs.org>, 
	Mina Almasry <almasrymina@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Vipin Sharma <vipinsh@google.com>
Subject: Re: [RFC PATCH 0/7] vfio: selftests: Add peer-to-peer DMA selftest
Message-ID: <avtI--OIZu5E5sma@google.com>
References: <20261111192411.4133780-1-dmatlack@google.com>
 <avYjFfqr3T/U7lvn@devgpu015.cco6.facebook.com>
 <DMTK99TDM9AM.SAM3Z4COP9WS@google.com>
 <20261115231946.GB1239159@nvidia.com>
 <CALzav=efnA_ABCZVicX0QeTmHknaEbMeWOy8cS+zHYVhm5z+iw@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=efnA_ABCZVicX0QeTmHknaEbMeWOy8cS+zHYVhm5z+iw@mail.gmail.com>

On Mon, Nov 16, 2026 at 10:02:56AM -0800, David Matlack wrote:
>On Sun, Nov 15, 2026 at 3:19 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>>
>> On Thu, Nov 12, 2026 at 01:47:03PM -0800, David Matlack wrote:
>> > On Thu Nov 12, 2026 at 12:35 PM PST, Alex Mastro wrote:
>> > > Hey David,
>> > >
>> > > On Wed, Nov 11, 2026 at 07:24:04PM +0000, David Matlack wrote:
>> > >
>> > >>     Is requiring userspace to re-issue IOMMU_IOAS_MAP_FILE the expected
>> > >>     uAPI behavior?
>>
>> Yes. Even if we wanted to the locking is doesn't allow trying to do it
>> automatically.
>>
>> > The way I designed the P2P selftest support requires 2 things:
>> >
>> >  (A) initiator: A device that has a VFIO selftests driver.
>> >  (B) target: A device that can provide a memory BAR (vfio_pci_find_mem_bar()).
>> >
>> > So far I haven't found a single device that can do both. But you are
>> > right that theoretically a single device could satisfy both
>> > requirements.
>>
>> mlx5 can do both
>
>Looks like GPUs and NVMe can do both as well.

AFAIU the memory BARs for GPUs would need initialization. The internal
VRAM needs to be exposed (mapped) to the BARs.

Do you think we should have a P2P device "setup" step that can be
implemented for various types of devices?

Thanks,
Sami
