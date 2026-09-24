Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4207049F118
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 15:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265232; cv=none; b=Oc9cCuoctoewDDR/zmDRL2UHEQndNR22i7CPNUXhtc8qViI3dyX7m1HX96plWKDLWuFBnF1SFsJTXMIS5RLJOZ8IlmRoq5GtxtL7ZXqTpa1ZTByzsehq5lGJVx8v0OBv9iRLMZWBc8bTNS+vhD4TbwrVJ8tAVdkejwTjUrV94KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265232; c=relaxed/simple;
	bh=wMUbxl5vt/9aakHALUb0wzH/L2TqRFPYLffnV8Cgl4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kwndrKopoTJjAXi1a8yXiAbzzKBM1iH/S/ocoq9wplhCwRbiSawPXXzOMVF5ARvK8rtrWfBNa/tDrOsxjhi+9zla0urQAIDMjmJ89443mqlgbLns5lGSNcTKf+sj9SHzrfpR5nhficPvfe5f2EpWX3tS+CE5RoNMoR+nS2kO9tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCGQz2eS; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCGQz2eS"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso1978667a12.0
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 08:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265228; x=1790870028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNmm9vpoKogbEkGqMdf9XAhWMEnJbsDsb3NN6zmWdWA=;
        b=bCGQz2eSkcQYMSbQNfLYFZiq45HlXMpEwZjtjh5ha94/5vOF0qLHpu9X/lZmf/vZXK
         DeUHu394OYCJ6Lj32I9RPjdNdKveIfOpfEWorZhCfIEYywR+cRALMykbVEFtub5oDS2O
         MpV7RU+rbkuShz+jA3asVlrDJ23iFlQ4iSPCrgC2ETXrn5yuRl21vE7rVYDSB5jygVhZ
         dyoViXu0rSJrHzN+ecwAoQ1pkTwqCTYP8kzclXNL+9EdUyS7bNOcgcXqSJPkcGLBQzc8
         HLItADMdjRIEMYD5rCPdt6ykQwa731k1tcla8CM/ahBbW8iD8Wx9Jtw/dlD8gEdJRYNb
         Lqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265228; x=1790870028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNmm9vpoKogbEkGqMdf9XAhWMEnJbsDsb3NN6zmWdWA=;
        b=tOcnGOiHw2oHWlUCef4idGSkG5zJstKtFtEiI9duw0JUbXFm2ZlSi3X+q31MaluBGH
         gdHT+P96o9tMdhs1g0UMKjZnEQTu4JYeDz0ECegkAtq0Se7Uz3zw8AUdnlkmAlIoRPHh
         LxQks3WTIPSBH1cgfrN/1OWaJYPAikgTPtSRyJGALbZDmCBppxZZVjqKcZBGTUpxsvgs
         U0yFOeoHpd2ShcWqvruVdnGweAkCk7PV6+by/bTX7WKvcGNFxlwXp3oNhWh8vljnq/Q7
         sidfblcWKS9jrNw80m1lOzmZitkS8lhwEv+MctuRcUBOTqQlnd3CLAMRcppbVeznQlo9
         T6nw==
X-Forwarded-Encrypted: i=1; AKwUvBzhBlkg05BBFtEiwmAESxQKjzmAVqDx5IY9Oehr8Eingczwtq3s42JXnchPngdo9KygrCM2R+OT2xn1Ig==@vger.kernel.org
X-Gm-Message-State: AFuF++lMcl8+jbnYZWbhxW7xJdXjF1QC/0dQOJ1jRwrGm8QoEqfMqSGt
	AQnsCXDb7E2V7WAWbmv+VELGwJUiuMzTd8wtjSsPfjQv0T+OhP6NBpAkQ8LxvQ==
X-Gm-Gg: AYBFou0DuinwRvegakzgiKND5MyU9L4Tw/zt1EXQRjYMPcxjnPAfV/Yv4a1LgyXSUoU
	sIS2kkKlLHqy082ZSd5nG31qBMAoe9UjAnl7TyQg7d0+6zkOyHpIW7vXRCbduLA0uLHSyd4o5sK
	W2UMqtTsRTyMW2MC8825i0B46iinVQcTN2Ua3pzM5iLRLcFsnEihq9FNzjTFYOZPqSIKrGFm2Qg
	6cEaKam5v/HJKFsyjqO10eqIDvn1Q22fdh0Fw8TNgsqEQcQuvckx3wo1L6HQolzYD15SFCFF2dK
	cRLsTozrAywxqdB5t4vPx0ODD8NF8nTp3/2xIU97BStq9PFkYrUJLeubgo4VYht3yVmzUkz4D8L
	67y/XPAlEJjiFJySBIcfNzksR6pBicT7DPDlQckNmt/9bMuU8QlU0Qqdiu7rq0iVkUQ/oka151I
	tXOs9rMLXW+CwGYRLN5smNyyJnUTiOipkX05ChGZN1h4EsdCj3cq3RmUkctXRYaCw97G+YCSIN7
	c4EmxtM9IJKWPJD86QueG2yEzLpaqACHZHVnWHxYaYfWb8AlwlzoU4JPGK6y99ZC4YGhfAl8RIa
	Soh2AhJ7v90y3/YJ5tZ9rVMX2KHQEmeCGG8+gFfNgU8Ib/wh9g==
X-Received: by 2002:aa7:d94b:0:b0:6a9:c9d8:b3b6 with SMTP id 4fb4d7f45d1cf-6aac8f0ae7emr1949690a12.6.1790265228473;
        Thu, 24 Sep 2026 08:53:48 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38b2fc5sm3815784a12.27.2026.09.24.08.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 08:53:45 -0700 (PDT)
Message-ID: <6d538f3d-dd83-4dfb-b091-9b84acf47c62@gmail.com>
Date: Thu, 24 Sep 2026 16:53:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/13] nvme-pci: implement dma-buf backed requests
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
References: <cover.1789997898.git.asml.silence@gmail.com>
 <e80c3b1e0de004eaca6c51a2a86115ac9ed36381.1789997898.git.asml.silence@gmail.com>
 <20260922132016.GA30684@lst.de>
 <d39a6dd7-cb5a-43d6-8dcb-16eb9fc95b4d@gmail.com>
 <20260923045505.GB26231@lst.de>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260923045505.GB26231@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 05:55, Christoph Hellwig wrote:
> On Tue, Sep 22, 2026 at 02:37:08PM +0100, Pavel Begunkov wrote:
>>> Sashiko had a few comments, which I think are correct - if we use
>>> dma_map_sg to map the data, we need to use the sync_sg APIs to
>>> transfer ownership.  That only matters on non-coherent architectures
>>> with MMU, but we need to get it right.
>>
>> I've seen that and fixed everything locally that should be fixed,
>> apart from the sync. I wonder what we can do about that? I can
>> somehow replace it with the sg variant for now, but sync'ing the
>> entire possibly multi-GB mapping for, let's say, a 512B I/O, sounds
>> not wise.
> 
> If we'd want to fix this for real we'd need to add an offset to the
> sync by sg methods.  Or move away from scatterlists in dma-buf, given
> that they are a horrible API.  All of these are bigger projects,
> though.  So for now I think you'd want to do the sync all, and have
> the people who run high-performance io_uring code on non-coherent
> platforms suffer.
> 
>> And I can think of another place that does mix sync_single
>> with sgs.
> 
> Which one?

All the recent networking zero-copy / dma-buf apis.

-- 
Pavel Begunkov

