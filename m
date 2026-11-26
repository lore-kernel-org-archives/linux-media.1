Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692065;
	b=Z281xRmHA6fjjuMwJZHSKa46lG6mMwHT7R6t9bW0WlJBze1N5D1WfSftFZJUZPi0YlDf
	 EOGJ/AIBBRCfrp9WEYG32pFcBCN8Ov1p+Sm/U4DwGwwfmWWTHqoA0qVxfqsfsSEVobtbW
	 kF3qDhMu0os2uYw+d/nsh3fiRMOm6gZLxvlMVlL9wCg0BudqaLNvK+fiYG0TfioAqdzyL
	 yO9j23Qk0LMCMc4/FrxPu4xYHZLqvo/A92MzEQegMvOclepnjkLgfWkz5PJOMXdTtD7GY
	 iPuun4Y0t5+nGrXFftE+W/vSF2q5iQx2/THL5NvTJYMhoE8QHuS4tkGSEttdn3mnI6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692065;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=zIHuFarcS6Fh+RV7UoaafACerN1VwcUrnwEg4Ma6T9A=;
	b=iURBomQxPuZ84eJ6laxs5RkoSEPCr+T376fGdPE85QGvjmBP3KgRLOYwOYDmkWPCJcb4
	 Z9WKV2cfSEPJlNMhlQqwvHPdlUQt79R5uHZwcNT1EBl4c9rDe4YJ1Q3v85L9ZkQEO9812
	 OY4p+vUcBeTflWRwaPQkaoEgCFpW1HS5Bdu2lvbmj6/+j0dGgPQ0zT8l4G1JkwBPOO5cY
	 mQ8zNfyCmIhi+K2tpjwFIWjtmys4IeB1m9EzGxsyeEH29IPTKcFFOnFQjTVDOv+/9uyun
	 M37PxgDt3VStSoZO+BIsc1q8xFhd2omAzeFgniTd+LR7NoP4q75YDRjJNYoSbEgD7vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=a7snv.com;
	spf=pass smtp.mailfrom=a7snv.com;
	dkim=pass header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b="p1g/GpoD";
	arc=none smtp.remote-ip=185.70.43.99
Received: from mail-4399.protonmail.ch (mail-4399.protonmail.ch [185.70.43.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABD9606A32D
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 11:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ABD9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=a7snv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a7snv.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b=p1g/GpoD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a7snv.com;
	s=protonmail; t=1795692062; x=1795951262;
	bh=zIHuFarcS6Fh+RV7UoaafACerN1VwcUrnwEg4Ma6T9A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=p1g/GpoDV6p7G8RLn4E9/ZRlEjWREq/H7gMEJDVN8w2qTVpNiYpGtLrnfZ2w/Jq2b
	 YjLex073ORmJ96TZskqlPlWefWjlWF66QwRQgFFV8jyPQSoysKBXlQLrBCgWsqhC9c
	 qYtJtNtDZNH5G8Ipy3xHuO2j9zAUoh242AE/A4nQmsfxl3ryFIDOiaZKHb2uc08hIg
	 Z+W60M0z1dGneIWDqYHEbqnbxQtXznj7h3FwDO85GbyNpmSed0gI8ztf8Fennn8Sao
	 EjAWQWHNIthrKSbYAlC1t7XgYlZNMG7kBB9YdylUGEZvTaW0U7xasX6w82/xANjPUU
	 s8R1iDb55pnMA==
Date: Thu, 26 Nov 2026 11:20:51 +0000
To: Mengmeng Zhao <mengmeng.zhao@linux.dev>
From: arsenova@a7snv.com
Cc: Anuj Gupta <anuj1072538@gmail.com>, Nitesh Shetty <nj.shetty@samsung.com>, hch@lst.de, anuj20.g@samsung.com, axboe@kernel.dk, sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, djbw@kernel.org, willy@infradead.org, jack@suse.cz, viro@zeniv.linux.org.uk, brauner@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca, libaokun@linux.alibaba.com, ojaswin@linux.ibm.com, ritesh.list@gmail.com, yi.zhang@huawei.com, asml.silence@gmail.com, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, liwang@kylinos.cn, zhaomengmeng@kylinos.cn, mcgrof@kernel.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [RFC PATCH v2 2/8] iomap: add dma-buf direct I/O guards
Message-ID: <XNQ-E6Q8GZFQ7mImRSSv-9Rn2rFxrM6VjLvIp5yb01GOtKLUp6q5lc7ZLXO-gylrW13D6rxO-KSHTrnWFowX8zKQnZvpm0QYHBHGDjyn-ZE=@a7snv.com>
In-Reply-To: <bff85d7b-84dd-4f4a-91c1-7f5c9ef2e51a@linux.dev>
References: <20261125171600.4053585-1-arsenova@a7snv.com> <bff85d7b-84dd-4f4a-91c1-7f5c9ef2e51a@linux.dev>
Feedback-ID: 235448903:user:proton
X-Pm-Message-ID: 61e994b372b81e8b5a2d310c657a2284db10d784
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
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 06:23:06PM +0800, Mengmeng Zhao wrote:
> Since Anuj is currently consolidating the XFS and ext4 dma-buf work
> (along with the cross-file registration sharing updates) into a unified
> series, I fold your diff into this patch and send a seperated V3 version
> with your Co-developed-by and Signed-off-by (if you're okay with that)[1]=
.

Yes, I'm fine with the Co-developed-by and Signed-off-by, both in v3
and in Anuj's unified series.  Good to hear it holds up on real NVMe.

Thanks,
Yun
