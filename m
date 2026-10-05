Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8DE442391
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791200703; cv=none; b=IB9rLyeNFQw5gf9NchIsLIzm2iKAD1nwvlggaNl4KuE5n1poKw4J3XUoYl0E5/pTX7BXyxhvrNZw/bAfa/VzaWP5ExgEAcdgRwiylI6w5BhcZJIQ76N0zpDPd+AnAaymqFPQ9wT7L7Dmudi1YZ2YsNdqlmLzs3vcGTMo8FEi+5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791200703; c=relaxed/simple;
	bh=AgYzF9zCDCjhvarDhGELV8SCCxmRmAduCDS+Ac4RoTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMkV9rGcpmT3l1staWLIe/PXRA8ya0MksDJvvlTLCT90yDHQz1iziI0X1TxaxTsZW7fmWnOO1RXNDKbuxyF8Ko63euz5b23CG/Mn4AbKzkAHuy6OTTxxaPSoagBpR5BA9JxU8AcCzPKEFPx/czSSFgWvt8kyLiJbIZaHRIlcc2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPgdYdX3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPgdYdX3"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso1479458f8f.0
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791200699; x=1791805499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZTSRnK/72f03OAFyRZNcD9D1Hs2QM4XwAkI8vZWB3T4=;
        b=dPgdYdX3mXchRgU1mWLReepLwb6EYksD9oVqP61wtHE1mACXWLZ5ufSTynlOmDVbtI
         NTh/irS5FDLmy/lXohPIsU1I71+iJUNM4Sto/wO5hReO5gkWpujUw7sH/f5zn4o2ycWr
         Tkfm5sZitIcSLTK08Pljy9lcVHc5tEH+Ozpk5Vm3CDpQuoq2+arY2DVHdXfRnwH86vaW
         Ffpbe9a9MNbEJXpWsFnz3F5Bh2uZnkkc2Vwug15VXNAl2hOOERzJ3o0mIH4E+roy+6Y1
         qSueKyN42cVluThyRvgOJ0gYC0gTcdbm3WhEMryVYcVmEDSNiLaOdVmNZA418wadbe1g
         BdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791200699; x=1791805499;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTSRnK/72f03OAFyRZNcD9D1Hs2QM4XwAkI8vZWB3T4=;
        b=Dk23P5rKMFmAPItbyNPegiTokMg/DmnfN08lHZPsWZerTx9c8OAOV78Htvf0/M++GN
         WbGea0fGLF38UW3PGjbHOvvfWMYRXmiAx4RxI5ze9REjA/ysx5eoJWx2sHl4NQGf7soo
         0GG7iSj9gFMJwG9wmKAyeMBxSn5tMu3AXHTebwXpZzQZTYH/eq1e8fVjycvHrQHdhKFD
         84EA3PDjBbLI75o/yseTZkfZb/drzJk0UmyXXs/aSvm5kpvxjJZcLFZJsi89VFkdPFuk
         DN0+G6PuNtaedLBQue+ZoQxQvLTdb1uL/O9N9FvQ89fqQIRgqC8PWaqZ4ZXpetpZ0672
         2tZg==
X-Forwarded-Encrypted: i=1; AKwUvBzQdHDp+cUfgRvMm9wU/SpSGEO6omXgbanTamEW1K6aLbvAl/DHfHcnKKcKJyppjaPb9ybbOZVP2EXNLA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKHp3pOBhiJt+m6p1Pc65gNMBWYIyq+mgqJpnMOyUsFD8LnqxyH
	V5LL+uDTwNmn/J8jmSGkYOq1MVQz5nevwHNslasa36j6zVtT2iw/A+qI
X-Gm-Gg: AYBFou11jL6e9NZX5qK9SslSNe8sd2e2EJzJufn7o1Zk2LH/S8KpAsxPs1wbnGqNIYW
	EpAlB0vmDnLfJ0I7iLLqQ+hdEkJG0t7d6GXJsLTstZ++aUOcsVFlZAuYfbuzihKg3ksdGPyhNlb
	qhahF3mRw7d99526H3bB/xocojNZ/o24EiioltJZPvHOwbTal4xCcoa/SfB3WEQQIVfrQkJhz0g
	5OM3i7YGQ0mktn2P0qaPtH3CLX9D5DS4zr24xAfeqR5zJi7i4v3Rla2S3XXVXF5PkbVZTslOw0N
	Yo4usdddjdGT9rNSqEdvgNB0NK3eKAPmoxGnEnfKCtHIfupIducJ6Aw2+7qORPKREV+vxaMV0RI
	6YcvTeZOZQLb8Ish5bEume1EJ2BFUCJ4j4bZ6BaR9v2IshDRV1ns7LM04SefjJKuLSqsPVDas6H
	Jj16gaJzLst+qN4NHuenu6xqP0sNOags5WOzedwzUeD8YJboG3wa2h5V5G8qm3TKfoMWzIp+Gqy
	vk8O8D7grldy96psbb3/+F1vp4EZ13+CVM3t+JNqwE8SWX4Ij5RVWgVk6IWQYnt/HIed9fMMkU=
X-Received: by 2002:a05:6000:186a:b0:48b:6bd:1af6 with SMTP id ffacd0b85a97d-48c48000099mr10478688f8f.40.1791200699411;
        Mon, 05 Oct 2026 04:44:59 -0700 (PDT)
Received: from [10.41.30.1] ([161.12.45.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c62270751sm3087877f8f.13.2026.10.05.04.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 04:44:58 -0700 (PDT)
Message-ID: <fb0ec34e-deca-4365-8802-23d5688612e6@gmail.com>
Date: Mon, 5 Oct 2026 12:44:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/13] iov_iter: add iterator type for dmabuf maps
To: Christoph Hellwig <hch@lst.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1790602223.git.asml.silence@gmail.com>
 <74a9d65f5c4f9acce5f57ad5921a9fadc6eda712.1790602223.git.asml.silence@gmail.com>
 <20261005091008.GA10727@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261005091008.GA10727@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 10:10, Christoph Hellwig wrote:
> On Mon, Sep 28, 2026 at 02:32:18PM +0100, Pavel Begunkov wrote:
>> Introduce a new iterator type for dmabuf maps. The map in an opaque
>> object with internals and format specific to the subsystem / driver, and
>> only it can use that subsystem / driver for issuing IO. The task of the
>> middle layers is to pass the map / iterator further down, maybe doing
>> basic splitting and length checking. The iterator can only be used by
>> operations of the file the associated map was created for.
>>
>> Suggested-by: Keith Busch <kbusch@kernel.org>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
> 
> FYI, I think the Sashiko complaint about iterate_and_advance2
> is correct here.  We don't really hit that in the series, but leaving
> iov_iter methods partially implemented and fall through to others
> seems dangerous.  At minimum that needs a WARN_ON to catch that case.

v7 already covers iterate_and_advance2(). It complains about
iterate_and_advance_kernel() but there are many types this one
doesn't support.

-- 
Pavel Begunkov

