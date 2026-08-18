Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E35D3446B0;
	Tue, 18 Aug 2026 08:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041071; cv=none; b=uWx/wuIrDS+VnFjlRqkTnCmNxDHAkXE3j6Zcc5kxrCTcMMT3OWB2JCmkWWXIPzl4fPG/mPhHt1ziTrEzJWTPrqitpuL6EG50d5GpsZCDDpU8zHrNGy9pg86c+m4/L2Y/gdLLmqhet7WFgXqgNrsB3eTkKNPznzvQtR9ia805NDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041071; c=relaxed/simple;
	bh=NwYzDFYcG5R3/hpA4SsHotr/SfjM0cSh6qOAIcBB9Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dl/bfzQ1nK5AkT0cCNRyhe+l77ADo2vDOfZY6Jq3vkZ5zh7+XgZvyTnb/VEvZa0v0iFIpgTzdx7kx8aHaEkn8t1sAIEk7f/banbmjqz6IaJJArKp6uWaq6l3gc5ZOXsQv62CP+ZHWTNZ1DCjg4DZopHIAcO4fNzkU6pb1x2BUKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=HsHdoa9J; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e9mhsTMC; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HsHdoa9J";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e9mhsTMC"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id BB9611D0010A;
	Tue, 18 Aug 2026 04:17:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 18 Aug 2026 04:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787041067;
	 x=1787127467; bh=T/tb/wwVml4lK5WPxEjId+XzaKMtBZnlAIzT0wSkyPE=; b=
	HsHdoa9JeTvaXZ8YKaVoMSv3ust5Nt5ew7IgO71064zIA725meFnCG7GCwIrEWiL
	tq7mpD8JDoQUJL7m+dFXbHjBST0ssL/PeCX00X/xWAyji3aQr99KE9bcF/78PdxW
	ChtET6SaYRGErTppM9I2eiIi6qGvsugwdkfn1NCV+ubhta1UTyNc8KjBdIi4rgtA
	cm8CfCu1EluZNRZMd9jCU6YpjoPL/7SmMzod6FAU8mV892TW58wONt/4sbFRak1J
	54Sxm5JPHz95FPeXlcCN2BZRl47PgLXRN6pD5tq9myBDqntxPqG6zyTzT7QXhYzD
	VfWO437MqRVzcEvq5SFVjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787041067; x=
	1787127467; bh=T/tb/wwVml4lK5WPxEjId+XzaKMtBZnlAIzT0wSkyPE=; b=e
	9mhsTMCB2Hjttsjjs88ZH6W7QAF9fA33mklzRaW/U1ifAjiUDLQ9pfJn2rpNt8bf
	LyNiiVU9BDtLr102l6XGmPMY4b93VZ8do0zUtahb3ak0ojsA6GngSEfYDbOsjbcn
	2J2RD2zg8gOSeT3sfkJWJqT7HsSKlZcD7PZu+P9vsLY799vJ8HR7zu25QdrCuhv3
	hNY9F3e910Iq/8fol226dY5yjmpBtbxvUCKbPOqkRt4fGqZIwvkbEndqWbLTPAR+
	N3Sw8sxcJ9AzeGmAf7ofN/Ki9s68H+y5fCaM3Qvu9rV+Y14Mp8utFqxgzAHGEbTt
	a38XX+e+BVcs8u3syROww==
X-ME-Sender: <xms:KhWEaspnIsnSs5WrIumUGc5R_eDe_jjcpUo021Wyd3PKvjTnopvWzA>
    <xme:KhWEassMa7l3pLek5qtBIXsvRTjY3wLpxCi0w-ou6V9xHOHEC3JOLude6gRZBZAa6
    ZZvWmLP5v-KBOPMubgGpJe-v3RCoznfsVyuRqutgkXntDXo-OCX2jZF>
X-ME-Received: <xmr:KhWEahEwEWmgC9Cu1spUr6rGXkP2TXnhAsZruXfiNQF329z685PJDzol98wTjE6XUjF36W9sMHeE3jPu1CNug0ZZQ0FaiFM>
X-ME-Proxy-Cause: dmFkZTGscohYx44IGm9NeCycOUDhQ2rHfwJxJSvHtyaoOHNy3eqWCEIDBRqKn9hTnKJPWL
    cG/zILUGY+7XRubHkoxKX+LkY9OJhs8bwa/i0G6iowgLsPkW+XuQ/jO7oRC8zbsSKBaX1a
    mCXt4SzY8/GcEraD4RJ+uX2nas89/liI8SM2/Qk/1SmQo4Hk1WiMAe3EoNfBOo4bg7L5K9
    nfL68th76FOe2B+Ev3QiKKMQnU4X+cENmU9lkSDeDxyc6GrMc17L5R+pBRxKV+bOSq8T3D
    nz1UblHKyc9WjTPTykio6915wPDSM4pEyNOmgduXQ+bzitzbjG7tePg75dck88uIF/7PWG
    lqcalZYtuZiXWy8MbRw+GJpPREy2FwW9Tjd78uB5zmc7RhE1QNxTiwsvKcGpB2j86QJ039
    27zJcGHF4SH7lCRHFkG6QGFFByRaipUHyw5HGRKgO4AuimnCq0g1GAE4reO7p+85IsU/Df
    Szs40LS9kySvBNu7/TWsoubSnxqcFZhApZdEo7CJlEkqM8IDqEB2ywBs4c3M/XnsEIT5+7
    qIb8ikqp4zPoNHtC5zivB/8pNj0mYwDjymkHoMC2PVk+mOhpdbc41+ovhzBC5k2wl4udZk
    sljcMUZJgNspo+GUsVN726o3lGR6/xKMdEru8xayBxFsi3rvNvKL8FPwlF2Q
X-ME-Proxy: <xmx:KhWEala4lcnha6uGj54RR2hS4mx2Ya7_b9iYYvnzjMFhthmttN2euA>
    <xmx:KhWEapV-MW89jqw8lvXu3lwswoY8wkFt8780y53I8NOngAe-Xrnmaw>
    <xmx:KhWEajnhESzl9oY-hqlzzmRv5nzxbvOoWukM65LfGpO7tGFOj65k6g>
    <xmx:KhWEasCpwApGEtWnXYjSenZdMzREruTUBUQgf_PgfCbJ_fb1TqnKAQ>
    <xmx:KxWEaqEtSgCWh-R8d7UHiq-NNtHpmVSTUEJzieHfHCffCsrhMlszSxSz>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Aug 2026 04:17:46 -0400 (EDT)
Date: Tue, 18 Aug 2026 10:17:43 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: rppx1: describe the MAIN_POST white balance
 gains block
Message-ID: <20260818081743.GK2757863@ragnatech.se>
References: <20260818020933.3153280-1-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260818020933.3153280-1-lilinmao@kylinos.cn>

Hi Linmao,

Thanks for your work.

On 2026-08-18 10:09:33 +0800, Linmao Li wrote:
> rppx1_ext_params_blocks_info[] is indexed by block type and is built
> with designated initialisers, so a block type without an entry is left
> as a zero-sized hole. RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST is the only
> such hole: a block reporting that type and a size of zero passes
> v4l2_isp_params_validate_buffer(), which then has nothing to advance
> the walk with.
> 
> Describe the block, so the array covers all block types the uAPI
> defines. The MAIN_POST white balance gains module is probed and started
> with the rest of the POST pipe, and RPPX1_PARAMS_MAX_SIZE already
> reserves room for all three white balance gains blocks.
> 
> The block is not dispatched by rppx1_params(), in line with the other
> described blocks that have no users yet.
> 
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes since v1 [1]:
> - dropped the rppx1_params() dispatch hunk, the block stays undispatched
>   like the other described blocks that have no users yet (Niklas);
> - retitled, and the commit message now leads with the hole in the array;
> - dropped the Fixes: tag, the fix is expected to be collected together
>   with the driver for v7.3 (Jacopo).
> 
> The second patch of v1, "media: rppx1: bls: read the raw pattern from
> the PRE2 acquisition module", is dropped for now and will be resent when
> PRE2 support lands.
> 
> The zero-sized block problem in the common validator is addressed by
> David Carlier's "media: v4l2-isp: reject zero-sized parameter blocks"
> [2], so it is not touched here.
> 
> [1] https://lore.kernel.org/linux-media/20260817104529.3132552-1-lilinmao@kylinos.cn/
> [2] https://lore.kernel.org/linux-media/20260815193839.141406-1-devnexen@gmail.com/
> 
>  drivers/media/platform/dreamchip/rppx1/rpp_params.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> index a75a27a8afd09..5e6727d589464 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> @@ -25,6 +25,7 @@ rppx1_ext_params_blocks_info[] = {
>  	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
>  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
>  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
> +	RPPX1_PARAMS_BLOCK_INFO(AWBG_POST, awbg),
>  	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
>  	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
>  	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE2, hist),
> -- 
> 2.25.1
> 

-- 
Kind Regards,
Niklas Söderlund
