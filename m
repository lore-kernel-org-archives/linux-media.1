Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0817261C;
	Sat, 28 Mar 2026 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774693620; cv=pass; b=QkpU4IwqkMsU+TVwjPP64QziOcEC0skzFG4Q5VE2Lr9mUdJw26q63LI5ec7tZfd3HKXdoyveOjJIXTGI2A3E3smUcYqKcB1WUt+6ffE8z8QqhTM6MqCaoC0RWOeKcHOuXYUwqaSqGCxk1dLbeojmlanMe2zljjw/DiYnPEk524g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774693620; c=relaxed/simple;
	bh=EKQxLC74AufikOVLkGu/heEyBqjdTLKPCac/YJa3J/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rabFCbCEVxAFBqFd4f1JHATi4sspCVe4tweupYUeW++kQzdyizvx3lVDd1XEBbhG5WojK3SpdNPW/uWFV7eosuUXtgHUYFn8FaAzRbqeJAeBzpC21Gumn0YyK/KZ21Yiqrg6/Xm9+SUcc/+xKJe3nHmn+4u9cOe3mf3IuMiAPXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=ming.li@zohomail.com header.b=EPIijCGa; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=ming.li@zohomail.com header.b="EPIijCGa"
ARC-Seal: i=1; a=rsa-sha256; t=1774693608; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bd04Drm1ka91hLk83I4D41jzfa767UAObfBF+bgB0pm95rWCjbPL2/DFkPuFA+coBHJrQyCa6jIMdvC0T0XzV0kEGlZvc+Xw8RFkkb3910SQMeFI/fvATlC1whTR0S/cLPRccPyCm/bk0eIeENLcztL9csTokh7InXq4jrq221M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774693608; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ciHXL84GeJtK0HQxAPRAp8r6EO6wmx7etoGI66aZ/DQ=; 
	b=jXyRBdCeckauGWZOhTnJY4FNpcf0usn0Tf7aLAEIm/ue7RWGssafHHUeiHPP/3yr5hTfbDGuEZANaIGe237526YwRmEjTN8224KcrHn+f+pFMseRoQuHY/sBpu5APNVHNsm19nt66wYtNbg07EK7f6Uxn2KiEJ262yLfKwFkAso=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=ming.li@zohomail.com;
	dmarc=pass header.from=<ming.li@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774693608;
	s=zm2022; d=zohomail.com; i=ming.li@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=ciHXL84GeJtK0HQxAPRAp8r6EO6wmx7etoGI66aZ/DQ=;
	b=EPIijCGaDgTIF2sDnEETkEuCZaUXdCUl+m9ZaNuAyQVjAc1dwXK4Di/ShBMRobuu
	G6MtHCXgfMqSr1r6cXjpKl91Bi4x0D5bJv2os/FKCZ/Qdem4plxtPvhfI19XoHvQKSD
	Zf+iZSsMYKutNqTBIy65sqoa1nfyf8cQUadzwCWg=
Received: by mx.zohomail.com with SMTPS id 1774693606783318.50737463196515;
	Sat, 28 Mar 2026 03:26:46 -0700 (PDT)
Message-ID: <bb78ce6f-603a-40eb-ac47-bf5ea06a6cc8@zohomail.com>
Date: Sat, 28 Mar 2026 18:26:19 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dma-fence: Dereference correct dma_fence in
 dma_fence_chain_find_seqno()
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20260328-fix_dma_fence_chain_find_seqno-v1-1-3847c8ef0292@zohomail.com>
From: Li Ming <ming.li@zohomail.com>
In-Reply-To: <20260328-fix_dma_fence_chain_find_seqno-v1-1-3847c8ef0292@zohomail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011228714be64caeac2580a28d597b0000a576b4265144d1ed4868621b53a46b30201aa250b3b8ad53604b:zu08011227f075a096bbe2bfeb18edbcf10000903c53a81a69f96adcc687cb99671445ba47013c463356e5a6:rf0801122d6651f41a29a921138dcc181e0000fe57356feb5c4cb23fd16d37eb8f4ccd68fbd2b68db835a285f86371b5fa97:ZohoMail
X-ZohoMailClient: External


在 2026/3/28 02:47, Li Ming 写道:
> dma_fence_chain_find_seqno() uses dma_fence_chain_for_each() to walk a
> given dma_fence_chain. dma_fence_chain_for_each() always holds a
> reference for the current fence during iteration. The reference must
> be dropped after breaking out. Instead of dereferencing the last fence
> as intended, dma_fence_chain_find_seqno() incorrectly dereferences the
> first fence in the chain.
>
> Fixes: 7bf60c52e093 ("dma-buf: add new dma_fence_chain container v7")
> Signed-off-by: Li Ming <ming.li@zohomail.com>
> ---
>   drivers/dma-buf/dma-fence-chain.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index a8a90acf4f34..71fa173aef13 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -103,7 +103,7 @@ int dma_fence_chain_find_seqno(struct dma_fence **pfence, uint64_t seqno)
>   		    to_dma_fence_chain(*pfence)->prev_seqno < seqno)
>   			break;
>   	}
> -	dma_fence_put(&chain->base);
> +	dma_fence_put(*pfence);
>   
>   	return 0;
>   }
>
> ---
> base-commit: c369299895a591d96745d6492d4888259b004a9e
> change-id: 20260327-fix_dma_fence_chain_find_seqno-7adea64efe01
>
> Best regards,

After looking deeper into this issue, it is not a bug.

Seems like this function requires that caller needs to hold the 
reference of the give fence before calling it. When pfence changed, need 
to transfer the reference from the original fence to the new fence. That 
is why it releases the reference for the original fence in the end.

Sorry to make this noise.


Ming

