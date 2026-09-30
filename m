Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01123D5246
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762995; cv=none; b=nKxMTnvyytxTpBlXMnBFKC+WWZ2dP4cmGFoGBP5Hf1C+9F+OLiTBU6jwaBvh7KsLMin1Z0sNKRygZ2vNplsSwRhCEeJFsqOy24ui42WYsjfEO94W/y4IcPveKYOOQgxYd2cZIYGGdGNm94cTCF2Kd9FAzubb8Hokw5NtDNKFOh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762995; c=relaxed/simple;
	bh=hrw1dd3W52X2PRIBJ61p/Ixy3mLjm6opZZ+GWT4oBp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHnmUt9idigiUpJJ+lFg4U0PiO79SbqnA+RSSOOi76QS6yLVCWVBwf6NY5Y8sDcnQhUzU6TgU92nnVxG7wRYfqFiyGOb+P3AtCMYhs+b8pjdhiEjfpGk0R5x8+Xj5RTWdgZFE3geBqC9DDhNuNAbNRSVbkpynUH6Qo0a212jBMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkzMs851; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkzMs851"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac6fa788e6so4994410a12.1
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790762987; x=1791367787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruocdeJmKgpaQFus+PucSGDLt7ZSCHmy/3XR1sTVzPs=;
        b=bkzMs851c9zZ8pLRd7lGGP1HQkdNCJPEQ9CuXY49B0eFdR7dpGB2Nur49+z/HeFkDt
         /SUCrNcWrt6mHvkiKtv5YoTO978/x0FED9JnCX0Almu9bcN+rWc6Vw9/YKgCZNEsUjMY
         eEPNYB/IE7flOrrYfumMz/Yx/kGJAuanFQkOz1UHN2Vd5QMBdgYAjUmprorWC5SOGetH
         DH3fbXlvIB1K4BuylVIKa8z6j3JzdSpqtjjxxZ/nhXwLOhcKvaNjXwDfodTHtvNH3Z2P
         mx/KKz9VOP4glr4+nStpRUBmLTXc6hFwIx1ennedbu8C9DVP9nCgNzuTcNnitLYDpsnu
         fOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762987; x=1791367787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ruocdeJmKgpaQFus+PucSGDLt7ZSCHmy/3XR1sTVzPs=;
        b=XdhIOM6gNpTwVHFT7a8bOmHVMrvjcccnRZdlt7Ax3fc9aOSpT6xqYA7YLFmRgk8QTy
         16S0QTQUe5R1IqGcymOdJyhoVGJuEzcd2fHPlY78ns60hI9wpKy6Ug3BStmeZ64boL0l
         dY5SK0Sokm8lvFwHWeTd2QJd2h0MNrk37+/8KgLBUMecxUI9GEOQym1QcWx0WGzkTtq3
         DzOCun9R+Y0xCn/6uzJvjVkmJZZrfT1wvVfLp6Zl7MTy6CHb6deqS/CwStpIs2YOWBE5
         Hi/9dZR4h+OIw9oYWYWVyO2RqLsz5BBfzBeTcZqYZQWs4NwigV1D0KMTd4WoPU41oHXr
         8VJg==
X-Forwarded-Encrypted: i=1; AKwUvBwWB7xAimPIXppvoxB7ekBYqqO87E5L7x4a6eoNqNMR2pzv6g3VfUK9X5GQEpTlSY7ibBZo5XPcd7Yl3g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKETNseTl5OHjGdeZwDl6P1kAXV3x61aWU/gVmfP+ljWEW0qsYu
	m15HPaY6cUdbOrbaaIE8nRqvfkM83xH0/2yQKmIZe2SLrDJNyWcT+8nH
X-Gm-Gg: AYBFou0xV7LAmyku3sCPz+xPPV0cQpS3acNrAbG/BSTu70vhOy+QnUxAtEPMlPppKv8
	lKvXgJcXlDUvhovs2MSBiII3Rs+vIAMVfPMcEq52vQMhLLaY2SsDM5nrT/nemD8d4sZE85/uLnw
	uVzVa+05PHVE9v2+TF2NwDisqfdOPpvm9BhiRkgq465buUJJJOotxxUiJ9NoPVTMI9ZnjMgsP9o
	2utzZT25OO9/CqeREKSjRtxE+hTxbzO7zn9zGhBupDVIHOdm0XSHSS9+oqwWPVllXGBPxFgtYNf
	cWbYx0lNlZ0wolB5zqgSBqo+tYt+G3nY1FCCqiipS5JEx8Laq77CP3nlS6x5bwRGzhxAargzgPh
	5RPK2xlAKESHuzkNIVMAr9OKVrdF0iAoQTUbFwdJWp+sm6p7wa/s1RP9GpPhQVCTYbZjolv3ceq
	vFpplyoz6v/rtC3eBGVzHhkHYUHuJfr5YYuxJQwzCMLgMfm2PSC11FNoU3yX/e5P708TZLTe3pR
	oWQ6zeR+rUzHAtVniRIUXCY1H3maYn6AfvKO2jI/Lj1kOdXxB88b/v7SoLbRtrU6hd6VXhjidVc
	BZYi0/i1Ply85++7FBo6tWpwb9mPPEi+u+ApWuvhfgj2IjEr
X-Received: by 2002:a05:6402:27d0:b0:6aa:ec02:7de1 with SMTP id 4fb4d7f45d1cf-6ae199152a4mr634773a12.24.1790762987076;
        Wed, 30 Sep 2026 03:09:47 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae15690dbbsm551642a12.22.2026.09.30.03.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:09:46 -0700 (PDT)
Message-ID: <77db5aa5-f160-48fb-ab59-a754b100bc34@gmail.com>
Date: Wed, 30 Sep 2026 11:09:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/13] nvme-pci: implement dma-buf backed requests
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: agk@redhat.com, akpm@linux-foundation.org, anuj20.g@samsung.com,
 axboe@kernel.dk, bmarzins@redhat.com, brauner@kernel.org,
 christian.koenig@amd.com, dm-devel@lists.linux.dev,
 dri-devel@lists.freedesktop.org, hch@lst.de, io-uring@vger.kernel.org,
 jack@suse.cz, joshi.k@samsung.com, kbusch@kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-nvme@lists.infradead.org,
 matthew.brost@intel.com, mpatocka@redhat.com, nj.shetty@samsung.com,
 phil.cayton@intel.com, sagi@grimberg.me, snitzer@kernel.org,
 sumit.semwal@linaro.org, tushar.gohad@intel.com, viro@zeniv.linux.org.uk,
 william.power@intel.com
References: <cover.1790602223.git.asml.silence@gmail.com>
 <e99dd5221c71cbf9aafb5737468d814cb83b9174.1790602223.git.asml.silence@gmail.com>
 <5a35ad21-c9d4-4dab-a4f0-97baee6e2301@wanadoo.fr>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <5a35ad21-c9d4-4dab-a4f0-97baee6e2301@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/29/26 16:45, Christophe JAILLET wrote:
...>> +    for_each_sgtable_dma_sg(sgt, sg, tmp) {
>> +        dma_addr_t dma_addr = sg_dma_address(sg);
>> +        unsigned long sg_len = sg_dma_len(sg);
>> +
>> +        if ((sg_len % NVME_CTRL_PAGE_SIZE) ||
>> +            (dma_addr % NVME_CTRL_PAGE_SIZE)) {
>> +            ret = -EINVAL;
>> +            goto err;
>> +        }
>> +        while (sg_len) {
>> +            map->dma_list[i++] = dma_addr;
>> +            dma_addr += NVME_CTRL_PAGE_SIZE;
>> +            sg_len -= NVME_CTRL_PAGE_SIZE;
>> +        }
>> +    }
>> +
>> +    ret = dma_buf_io_init_map(ctx, &map->base, sgt);
>> +    if (ret)
>> +        goto err;
>> +    map->nr_entries = nr_entries;
>> +    map->sgt = sgt;
>> +    return &map->base;
>> +err:
>> +    if (sgt)
>> +        dma_buf_unmap_attachment(attach, sgt, ctx->dir);
>> +    kfree(map);
> 
> kvfree()?

Sashiko also flagged this one. I'm going to apply the nits from
both emails, thanks.

-- 
Pavel Begunkov

