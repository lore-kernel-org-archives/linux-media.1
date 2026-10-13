Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E995753B5FA
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 20:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922833; cv=none; b=k0Kec1xjU09lurK4DqayD8SHVUk3LDdT6xp/Fbpwwy0af9LX16c9KiafNeXb7WYbzdTFU3/fOqKkvfZHz1DKpwf1itKwytBhFem/B+SijAiH+9P2DCJA9AFJrNkS4FEVj7dmdRnqbhva9AgfhNWCfgstpz/vJaMTuIPVdR3RhDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922833; c=relaxed/simple;
	bh=52S8eIGd/kdNc5YUeahu1cnDerc/gG8vGqhjAz+A1V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0q4+2DRslegnG3eyCGxTEUOUacNWawoKZQGXeSYXWhXOjP8CjrTHauBT52zqVcneV6AsXIJ0Hp31nuFYGLBXvE/21ig1sTFpYiqaQgX2ywbZ2HTlM7lWDeVHb22gLigSJ1mlkg9ng4+EaFzYDzpSufsQd2FKx9DKZbjF2kCRWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UT5OjOJz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UT5OjOJz"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso31587715e9.1
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 13:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922829; x=1792527629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFWmLiUqCazwiWkaP/d2QvvXVbxF3nnToJUN5Fd7XEc=;
        b=UT5OjOJzidLKFj05iK9BuOurmL8Uy7CUWIVuguxc1JgXSg2hNlDZMtKm9doKnw6oO3
         kNbLvL4Qq8q88Gqnb/+spB0G6J6pBDp0TQDv2ePCHeXCo89++B5/nWWFBLB0ROyYsz+n
         SjMCdmZwi6AVTjJGBZr2ovMgkciMxK6/5L8uxL7691rIZ7Ru9pXBx5JDvcA4ZktJKwT1
         0c0wbUI8DbdmOvZfzCL8fQD8zIivnfBNbg9vKCtVljI9d4l2VzIv2SoFefvb99VsUrb/
         5MU+3aW9OrjhgiUZkULiycdJdAsQKRajaCALEXwleSDsZCtNM9+dHOS76uxMzmpad8d/
         725Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922829; x=1792527629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFWmLiUqCazwiWkaP/d2QvvXVbxF3nnToJUN5Fd7XEc=;
        b=0Q95vYFA7tpQQci1Q+UF9nuHwpfNaJ7IAM5xTm9GyFDlwYgAxWULYfoPobqUqHZ7Ay
         mUWkOtysp0FdupkW+HkxxsHKJlv+eV3NfsZ2uEXRKVOSrDjfmv00DYZFXO+F2hBzxp5M
         q1uEpZTa4xwgIPUSmf1pDKJx8A+l4jBbR1nGO6m1Bq9MUEKhuebMUlW/XMQ2orQMeyiO
         47enHS08XQEWnssbTabyYs+dShcLZHKiu8kgzxQg7cHHvfYR7ne/pb5erM/1J1EAPF3j
         USZ7I9HoyWqjquDfVsVhiTs3AB8DWoI2Yg6ZDnHFhCcmkVUqPx/YywTSRRRkKijXYA09
         dNsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzblEzazyilBtq0YKKHs7QlK4YLsrupOSrdiO6GnoiBY1GOt9s/GHQXyeG6nZl5pSnKmsrgCj8o3Wf5WQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJm4Vl0y2ZxFo0jK/PnS8U+ql2IoA3zSPxMzJJ6RzqXnfu/JbRj
	Ra0lv2mE6Dfxz8MCjjrfYpV8Z+m5gccyA2xsRt7BedVLR4Ujy6IKtrD9
X-Gm-Gg: AYBFou2N7NS8Civp8GKsRuTTTYxO5xRYgtaKuQUunazwewIdUuT/dg/+bsI8K3BJokz
	ePPLgmuCNHrRyyhi5A29rYDy67BxZmUMoTdUgv+umkwf4TR5E2+I+6B+1SfrvTMdNG1UoVomda4
	ELbELz9fI27dJgJJXHkkmbSK95HCiqm3Zb/DKCBgfznuto3ujHV/zFXv3UYRg+ncgJj6ybxGeGB
	BfAeXtkX1vk+zIaS+FqvoEAAvo4m9X76XuGNty/vkx7aczCmqRrCG//4qgoAuTrV+AMt2uy1oug
	2Y+01K+uzR7yUNa5PnxZSACsRUbncrxEgEZFMJgtVM9gzDefy0W38xqJMIL02mCf/qZHPmWpZkU
	I6PdAZN4pjyUxHao87V2e2hAL7RyCcnY8uKNdAYAcEU1N7GsNtgRx0/OU/BjwQbLeY8fapo/3N4
	OZ/ytUh031P/bznm45s5Zag1i2KC/jiPNMB20OmMyGhjx6uAgPhrtPbeEQAZ3+65rzSzV4ytKVM
	Oy9wOaEO+AePuTUCaW79bz7itM4JoqASocLgLa7dy+n0+iIAxAtaCp/E/YWiCU2a0NssCXnzWD4
	UM7mHcgR4JDd58gSZtr9GdQr9b8EGM+eFadDjTjcGsItL5Ac
X-Received: by 2002:a05:600c:4594:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a18e4d6ac3mr267044135e9.26.1791922829049;
        Tue, 13 Oct 2026 13:20:29 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm426025355e9.10.2026.10.13.13.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:20:28 -0700 (PDT)
Message-ID: <32a70bda-de28-416c-84d8-a56c261063dc@gmail.com>
Date: Tue, 13 Oct 2026 21:20:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/13] Add dmabuf read/write via io_uring
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1791336930.git.asml.silence@gmail.com>
 <d00e43fa-8f5b-4a8b-8b83-421d637ba519@kernel.dk>
 <20261013141046.GA12680@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261013141046.GA12680@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 15:10, Christoph Hellwig wrote:
> On Mon, Oct 12, 2026 at 02:21:41PM -0600, Jens Axboe wrote:
>> I've queued this series up for some testing, in a separate branch. JFYI.
> 
> More testing it obviously good.  I've been waiting for addressing
> of the Sashiko comments on the nvme patches before doing more ACKs,

The nvme array out-of-bounds one is sashiko getting confused, we
check all sg chunks on alignment, and seems like sashiko ignores
it.

> and while I can't really judge the code those in the dma-buf code
> also look somewhat serious.

Should be false positives as well.

   So it would be useful to get them addressed
> and the series reposted.  Same for folding in the PI vs dmabuf fix

I was going to repost, I guess Jens staged it before. I'll send
v10 anyway, should be less confusing this way.

> from Anuj, although making the combination work would of course be
> even better.

-- 
Pavel Begunkov

