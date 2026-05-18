Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7C73E51E2
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095429; cv=none; b=GzN72Z/HM7cr3QynHcOv0rUYAPem6My88wieDgjeoMeE9KA4Ef1dp3v57Mad18G8mzUnznGAt0utQaC5JPsUCbcmZbr5q4glLqgON6mRnx8VPTZWZYjUBAz7jMvhDStIhsQ8Mk5sKg2Zm6BxCRScW8HW8gqqXytxGX6Enr1fWFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095429; c=relaxed/simple;
	bh=JDf5tfG8fpD06t7iMggta6QbZxhroHbPF6Ww351Aud0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=T3mqj2z4GxwSbU7sikPNq2RymayOwpYNhvSmWLKQftsCh4/AaGtBV49nLChbU31G1iBZrt2poN4BrAeQAoBUNRHGZF5yakuduaa7M/hZv6RYp22a+iwXNjAMUZ3RfbxugwnApz4Ax+EVuA2/LsvoDmCxf59aqtTPl0YkDrpqFJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJPAkrMm; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJPAkrMm"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so4354217a12.3
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 02:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779095426; x=1779700226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NK6QaM0AvluQNq8GVPqTX/wBbD7FgigoEBmBlLT11LA=;
        b=TJPAkrMmxASGuDLSpftlKK9PV2MtAwT6+7Zl98Vv1r8yDlfkDFF/T+xJ88LhrcItVy
         ogY/zfhZ2Xnl5jlrZIb6sM4Mz3XxcicP7OiNGHUStVms8Gwjd5P8+TT6NAfBi73t5hZg
         0RQzv0FBgIFWDCSXCa+GlKsUl4aracaro5yu0WDXS0VvvSedi6zLP0ZXeFy0w52LN7k8
         XipxwpaOI/gdIFepZD0M2KQT9zlG3SAeoBBPX89ZVnTj0/aWa+P3LiXCRjYEu+4pc9c9
         vZ0R9gPdyLql3qAx7QemfDa+q25ncNE+TNIhhkPPbjwsPksLMjMxFooK9aFjxvyUC/I+
         Ombg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095426; x=1779700226;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NK6QaM0AvluQNq8GVPqTX/wBbD7FgigoEBmBlLT11LA=;
        b=p+v5OSmAR3nZAK6HO9KPAXAZTF8CYmtiyHKq9Fetv4Do7HHZUGKLvsPDJfwSeFLlVF
         3p8yT1nutMzhsuWaJCthT2i5KzHoi9OvvrniBabEjlrIgVM8GXWPnYvP6FAOup6s9M04
         Z8Is1o1NQRdnPZYwV9vbg1KUOCuaLsJswI8LSDWkk2m2wbgzLN6Y2pUXeefUE5R2cYQx
         1VjNipyGm4M2TxX3JUjykpeTHeL92KJ2iL/gYN2hrKleMZyNBgC8YVrV3wPTIozGl5ZG
         roRQE+/m8O6tlkoe0idgwzEbTxpiQCua9NCCADvWxbqAbFtVVtAAm1EtBzpHQcPj0FGn
         Rdaw==
X-Forwarded-Encrypted: i=1; AFNElJ+Pem/YbHwCQCrFmUYxUMuoR/1jq0N0WJwiYNYkd3+6uagrvmUpvDaR96Q02ywF4ED7K1E6YmD+ga6AjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/tVVbrbWViRnXNUIbrKKu7vzlmdeph9SZ3yA0TgESu9nONbjD
	Z/LgGO0u/heTwEgfUC75ndSDe1wX+0WPWPGVbSlk3g6gQMA/EJ9zsMl8
X-Gm-Gg: Acq92OEcGfnQ++6tjvmZdZ9v/u+gzTm9vrWmfDEBQ3vP6HvZeqXraFyKnYzm0I1Dr9e
	yZvnDARlEyWzGTUmi9WLBarfXeVcEY2yW980RIR42tNVD9Rt1EtnyeWuLr4E5Qv1A/0tk7VdC9P
	b2LiYeUWtT+LXBaCeFSrHkF8IRAQI6ztK++MuVifC6BNtFQSdi3cPO1GKjdyPAtNF4w/dAqMFfb
	8zJNY/MYqyfHMJ1ctnY6G0hzgTKyEi2FkyCI28XJdSB8MOW+H5es5d+hsFbzlzjMmTK1iLu5JRX
	FfrVAtf7hcpenWKBBOJR7RamRIq4MQrthdxTkU/tyW/oeSDYDneyE6B/Ko9zbBQCFrNiF8w816M
	mDifFlo5qWXlXDRrbCI4fIT4O9DHnFwETPfz+Yl6OzEIeh5Lsffezs3zHRIHGC9QBdv4RYR/dhl
	1I0D0WANlhEzxYtJyVIq124gtaNuieelbKoHav7MAiycj9rw6Vm5aRsaVjqvaSp7i6hXF77vOpG
	bkmZA1eFZ4FWUwNzc+xvFN50CJjnlIovjhphNjwG6Qo6ZK5UcKu+hCZ5DEutB/sqJ84Gw==
X-Received: by 2002:a05:6402:4150:b0:67e:153e:51cb with SMTP id 4fb4d7f45d1cf-683bcd9e33amr6611396a12.16.1779095426574;
        Mon, 18 May 2026 02:10:26 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:6e9b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b4069dsm4929655a12.1.2026.05.18.02.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 02:10:25 -0700 (PDT)
Message-ID: <d14967a9-979d-428e-8190-6a756da1c130@gmail.com>
Date: Mon, 18 May 2026 10:10:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pavel Begunkov <asml.silence@gmail.com>
Subject: Re: [PATCH v3 03/10] block: move bvec init into __bio_clone
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Phil Cayton
 <phil.cayton@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.1777475843.git.asml.silence@gmail.com>
 <43a91f54d61d3329316e40c69ace781b4d35fe0b.1777475843.git.asml.silence@gmail.com>
 <20260513081238.GC5477@lst.de>
Content-Language: en-US
In-Reply-To: <20260513081238.GC5477@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 09:12, Christoph Hellwig wrote:
> On Wed, Apr 29, 2026 at 04:25:49PM +0100, Pavel Begunkov wrote:
>> To quote Cristoph: "Historically __bio_clone itself does not clone the

Sorry for late replies

> It's Christoph.

Oops, typo, sorry for that

-- 
Pavel Begunkov

