Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795526434;
	b=A1K0Oj3E8zKXb4G6hteus4355qqQ5RarKh9mX5xWIunt3KI0wA7GwZte3/BeZG0GT+Pj
	 cQDVZXZCQEKrvmVUz0QqsIda0NClP+jZig1z/VbTew8pEcyDliRMHi6l/MAFbev46XJ/a
	 ohDgMWfYPLjKwMVSfnVA+klcJk1dDrrSpCQqpYCi517Jb88PNnTE7GHC4HwIJJVBgZnj9
	 5iOkgkYxrV01ux1sl3Jz5ILfB07/0Ik+Xgf23CkVZiTXf8cVJvi45qJZ6vaeomTWuv03G
	 iEGlrT+R+sRWp84YeGvGbvjp8OPPKB3+HWea5b5hFEM6JWBQsX9bn7sOSmWmLDoeeXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526434;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Xi9+n6mqjen7xK0aEroUXyIA3DFP060y5zPoLf1Eehc=;
	b=beA2ZNoXSGeO2L1917xWmp3pHV3ZAuLxTv7Ty7zeDgJWYvByfnIXZ1UauLCdRFHINtcN
	 K/rIvN1CjeZpRzfH5OfE6kT/GTVSaUvD+KVYaJshtHsC58SYvsg9kcY8931OpkohK19Eg
	 SJtlZ8LUdprcGco1V+M0Ye1qBopgK/N5defd8XxDrNA33DgKkYYDHFQSCUYiD2SMUKvd5
	 UwYqU32sLI0LtJneO5YPTggO/FxJIOwvwpFvF/ahVbzwJ7Hjk8dFhgdTHZce3q18OXW4+
	 qJziVOl8pwtp/0CvuOXxx127lOqYNReUlXGQk43MQiguTUXjh49L4oLwCMn3yvvqy1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=AwVkoZL0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5FB606A31E;
	Tue, 24 Nov 2026 13:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C5FB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=AwVkoZL0
ARC-Seal: i=1; a=rsa-sha256; t=1795526398; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LOwRIjs1wsFGb8Mjv9bwP1HYHL8EgTZVQvpp8eqhlM0lmJO4Jdhf/7v5VLvwqw9dx2+6oowjoGYmrrJ5CUzAKruAIrlEPg4NPlB+IOg+Y+CJKXMClD2IYefFVb1hmHwlNE+trjxhtzMsrEdil9bwNR0ZAK01pTBbzSYtf2FB7ro=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795526398; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xi9+n6mqjen7xK0aEroUXyIA3DFP060y5zPoLf1Eehc=; 
	b=EMF6+ukaUhVN3AnviAu9l8x7FxSTpD1QVsY/4+GXBHwDrgBboDynHpJz3qsGHLTyZJOaVwgFGTUrVxcFq7qBpD5PNsJVte5aGyk2nAN6KUCtehk1uf/MxYAwNr7F6rGf1P2Lnj+fbLTUS47wXzxMkQNQ6htT7+YaTswl4+8rOtY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: a=rsa-sha256; b=AwVkoZL0pZ/5m6zosyq6PPf0lR13fLOzXsaev1rIOHGJKAgv0UvcrMxAgYBx3a0D35u90tvIadG36jusM1KqWrOny5eXuLiuxHDw4/wAHJaiU8PH+Kp//Gen/DsIjeEvMikB8KWvMaMHl7dl0dYkdqO8PrZp5iU5OgtQxzy21Mc=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Xi9+n6mqjen7xK0aEroUXyIA3DFP060y5zPoLf1Eehc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179552639643419.95007240456698;
	Tue, 24 Nov 2026 05:19:56 -0800 (PST)
Message-ID: <21937a4c-44ad-4511-b408-00a5607c9c24@collabora.com>
Date: Tue, 24 Nov 2026 14:19:53 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] media: verisilicon: AV1: Check reference frame
 index
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de,
 hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
 <20261120143135.71134-2-benjamin.gaignard@collabora.com>
 <9c7ee6cfa9f4923756ce6355ec20fa8ac916b9ff.camel@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <9c7ee6cfa9f4923756ce6355ec20fa8ac916b9ff.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 24/11/2026 à 04:29, Nicolas Dufresne a écrit :
> Le vendredi 20 novembre 2026 à 15:31 +0100, Benjamin Gaignard a écrit :
>> Make sure that reference frame index is valid before using it.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Fixes: 727a400686a2c ("media: verisilicon: Add Rockchip AV1 decoder")
>> ---
>>   .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>> index 2a145433e6d1..5da59104a966 100644
>> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
>> @@ -121,7 +121,12 @@ static int rockchip_vpu981_get_frame_index(struct hantro_ctx *ctx, int ref)
>>   	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
>>   	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
>>   	u64 timestamp;
>> -	int i, idx = frame->ref_frame_idx[ref];
>> +	int i, idx;
>> +
>> +	if (ref < 0 || ref >= V4L2_AV1_REFS_PER_FRAME)
>> +		return AV1_INVALID_IDX;
>> +
>> +	idx = frame->ref_frame_idx[ref];
>>   
>>   	if (idx >= V4L2_AV1_TOTAL_REFS_PER_FRAME || idx < 0)
>>   		return AV1_INVALID_IDX;
>> @@ -1262,6 +1267,10 @@ static void rockchip_vpu981_av1_dec_set_prob(struct hantro_ctx *ctx)
>>   		rockchip_av1_default_coeff_probs(quantization->base_q_idx,
>>   						 av1_dec->cdfs);
>>   	} else {
>> +		if (frame->primary_ref_frame < 0 ||
>> +		    frame->primary_ref_frame >= V4L2_AV1_REFS_PER_FRAME)
>> +			return;
> Just returning does not abort dec_run() and will lead to triggering the HW with
> partially initialized data. Either this should lead to some default cdf to be
> picked, or we add a return value and check it in dec_run().
>
> May I propose to validate these once once in prepare_run()?

I will do it when validating AV1 frame parameters in v4l2-ctrl-core.c

Regards,
Benjamin

>
>> +
>>   		rockchip_av1_get_cdfs(ctx, frame->ref_frame_idx[frame->primary_ref_frame]);
> Here, the index passed to get_cdfs() is not validated and will lead to out of
> band indexing inside that function..
>
>
>>   	}
>>   	rockchip_av1_store_cdfs(ctx, frame->refresh_frame_flags);
