Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321768;
	b=wzBT+8P/cV98KT4kj76mOG89PuahFXrRB2+xws9xA8eN90mTFULfW7snBj9JztqI9r02
	 MTQAGkStZBOQk9KEJe6owuWjpyKTw/7Kn74LDMiTUI4toT17AuXy3WcCRNVYAFpeWWM9Q
	 l7K4s7EgBNSXl7wly5CrsNU3M3OsQikVz+G6zgFbaZkWhJbLLZebM65r5pKseXM3dCd+M
	 IfAyfyOU+epCwoCUN8uIOz2bOT1HdVgDyJv8gT725thoK5uN65EKldc7W/BLALD/GG2a2
	 VCFQJ50owTkvOEAcxk3fmxO/vFqKyVeKYf2zyugtZPwjluXl63DFD/HOIG2pSNPP4yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iU+EzkbKMFrOZFFUWDUX+jv1j+DUirQeUzUM2Odhqp0=;
	b=ZockHefmMGvL9oKl5oiwgtLdGDampeok/+TXup4t9Gb3xTcl/HOlV4El7bmX2v1gLUy+
	 B3lw3izEFhTc6b3AzCkaHD5wtW79KSy35xaof2tvfs9fTQpn0W0mznRSSn2DLhD/oULyp
	 ds88S3jQzh1J44qGgFK661OEdpnPNyYZd39mOMJZbthe4Q1dDOBJL8NSe3sUPdTzX8sWo
	 XkV5OwwBG21H9YnljM4BlAd6woEi14xpVt4t+Dclo/W4Trk8G1Utzx+WUaLThsAwzBIPv
	 EwCsIHrnLy9VQZ5Drbkv5piP0Ywty89D10gHWHiQ4i/KbhIeuJ5aBJujWVAvCFinrMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zpSlcvgK;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386FE606A332
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386FE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zpSlcvgK
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c3fd91337baso362088566b.3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 06:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794321767; x=1794926567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iU+EzkbKMFrOZFFUWDUX+jv1j+DUirQeUzUM2Odhqp0=;
        b=zpSlcvgKQl4GAF+LAEWwXo102Dk6lRikWqRJTDbMVSdWsHj7c3FRe/SdIx4D6DmgCj
         +TeNDxHm/XD7kdkMGcaXqBUFnkHMTqxgb9NhSUWUm7n1o/xzOd3YbjcZlRGl1Ly+rrf9
         Ip8WihiP4WCqVbJBKydkH0HRz1sRDBFGoQ8HJafvhSQrODlgYoCpcZcg0U2HLEX1IRF3
         4TaDSGjDgXx/pU4U9x5GiQxlFjtGhUHXnDwhjtMPqnXHwRsp4vMms1LgHbg0+/67vCjZ
         /doYZIydqNjewM46rQvM56F8F/poFKOb5HpYtovpd5bT3je56+Rn4ScuTIg2GqUDPHrn
         zTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321767; x=1794926567;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iU+EzkbKMFrOZFFUWDUX+jv1j+DUirQeUzUM2Odhqp0=;
        b=IatZYBqI/lTikMLGtwaW32D4liX2gKR+aSKJsUhj1U8qTNEhQN1pO3iu30gp1YzhRr
         WqVeYEu7n/CjCWHwCGtqXrXJv8g4vJkM8IdhqTnIv/H0gXFduJgc5g876ASLKuOoRFIx
         vUfpnBsqYHql2E5S0cF07xXp51PuZk3j7YpRaLL62k6g6o+RhuMigJtBuVVaEzpDWNy8
         SpmFkXNIGb11QRRPgQ0AX05Lo38u0Rn0aILArTa1rMoD36A7Xv3kS8oEe99B28D8KOdT
         0Iq3mRjqcOIIPMB+tIA97uSFwCIwoLt395jDU9N2khmpCVZvlTTh+iNL2VHilMXwxHcc
         3ENg==
X-Gm-Message-State: APuU4Z/Vdv3M3LYiKnuhTtyemSuu2y3UDj8I/ZL/Vko9SB4otP8bn7/I
	YLLAJTBlyiimqyxzOUg+T1QdTEK58aOZY4IwLTTIsW4NL0u3St9HepXZk+Hvjo95aYo=
X-Gm-Gg: AYBFou1FeuO2uJn50Ir9Zlo/zyR3R7MJwNWM9zYwtuZAisTkn14wJtheZ4PmKjW1Vf2
	/NMNZjwOv2L7jATxgwpzrRynnzdnOUIBA0uN+FgALbfyQRGtdgPQoZQoAyGRnQ8mq98SV6eg1QT
	nUNmVAKEKeFVggeH9TMQYM7OAdRBld+SrDysRaZ/M0eWsHnL85JbJgkCWW5cs7jsbdLBiIjZkWH
	0Mv9ZV0803FyefH/+LnBw5IPagyb670TbVs7GJ3J9c7aZ4UKH59l+0kMpOpq9SMuyLKTW810p07
	NifJVaRpj5bz11KC2MQU53fRZTdHfDZGEiEJz7CDz0w6TM64ot127pS6sMhBZvYGb88OVIzNoEs
	Ku3e3RbX6WKvaviPXAte4uqXFty/BUecdvuCcMQsAL3CXyHiZA2VpkYBoysUVG4D7Rj8/2ULMLn
	9fP3SnxlQWvsIwcZfllqr44sOO7TI9i30TlH4PY36OSohxhcLLmA5h1ZoIuhoWURjVILDQEDyXF
	AVzz5Bgk5CKciM+Br19dPxZKet1kRU9OIv98+V4jKEnOIWizqcMQuwk2R+TNr8r9wE7naT87BSk
	cl/r4PVjZpa97wA3rcOc823hxTVa2q27wSlhpEH6C5o=
X-Received: by 2002:a17:907:e849:b0:c49:9383:a28 with SMTP id a640c23a62f3a-c50495ef6d1mr244854866b.35.1794321766382;
        Tue, 10 Nov 2026 06:42:46 -0800 (PST)
Received: from [192.168.0.167] ([109.78.220.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a65f267sm112205666b.71.2026.11.10.06.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:42:45 -0800 (PST)
Message-ID: <ee2aedde-6688-4cfd-9f92-3703b081247d@linaro.org>
Date: Tue, 10 Nov 2026 14:42:44 +0000
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
Subject: Re: [PATCH v2 3/5] media: iris: Fix use-after-free on unbind with
 open sessions
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>,
 stable@vger.kernel.org
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
 <20261110-iris-handle-unbind-v2-3-86d5f6f1dea8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261110-iris-handle-unbind-v2-3-86d5f6f1dea8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2026 14:09, Vishnu Reddy wrote:
> The driver can be unbound through sysfs while a client has a video
> session open. The core is devm allocated and freed when remove()
> returns, so the open sessions then use freed memory.
> 
> Only the core structure needs to outlive remove(), because it is the
> only thing the file operations of an open session still use. Allocate
> it with kzalloc and tie it to the reference count of its v4l2_device,
> which every registered video device holds. It is freed when the last
> file descriptor is closed. The other devm resources (register mapping,
> response packet, clocks, power domains, interconnects) are only used by
> the power on/off sequence, the clock and bandwidth votes and the
> interrupt handler. All of them are released with the unbind, after the
> core is shut down.
> 
> To make sure nothing uses them afterwards, set a removing flag at the
> start of iris_remove(). It makes core init, new sessions, command
> writes and the clock and interconnect votes fail with -ENODEV, so a
> client still holding a file descriptor cannot power the hardware on or
> vote for resources that are gone. A client waiting for the firmware
> only times out and returns an error without touching them. Runtime PM
> is also disabled explicitly in iris_remove() instead of with devm,
> because its callbacks use the core.
> 
> Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260926064921.976721F000FF@smtp.kernel.org
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.c      | 10 +++++-
>   drivers/media/platform/qcom/iris/iris_core.h      |  2 ++
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c | 15 +++++++-
>   drivers/media/platform/qcom/iris/iris_power.c     | 13 +++++++
>   drivers/media/platform/qcom/iris/iris_probe.c     | 44 ++++++++++++++++++-----
>   drivers/media/platform/qcom/iris/iris_vidc.c      |  3 ++
>   6 files changed, 76 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index d558475986ff0..bdac6b8c98e44 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -43,7 +43,10 @@ static int iris_wait_for_system_response(struct iris_core *core)
>   	ret = wait_for_completion_timeout(&core->core_init_done,
>   					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
>   	if (!ret) {
> -		core->state = IRIS_CORE_ERROR;
> +		mutex_lock(&core->lock);
> +		if (!core->removing)
> +			core->state = IRIS_CORE_ERROR;
> +		mutex_unlock(&core->lock);
>   		return -ETIMEDOUT;
>   	}
>   
> @@ -56,6 +59,11 @@ int iris_core_init(struct iris_core *core)
>   	int ret;
>   
>   	mutex_lock(&core->lock);
> +	if (core->removing) {
> +		ret = -ENODEV;
> +		goto exit;
> +	}
> +
>   	if (core->state == IRIS_CORE_INIT) {
>   		ret = 0;
>   		goto exit;
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 3e4cf652bf39a..379f0666a42cb 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -62,6 +62,7 @@ struct qcom_ubwc_cfg_data;
>    * @iris_firmware_desc: a pointer to the firmware-specific descriptive data
>    * @ubwc_cfg: UBWC configuration for the platform
>    * @state: current state of core
> + * @removing: set when driver removal starts, blocks core init and resource votes
>    * @iface_q_table_daddr: device address for interface queue table memory
>    * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
>    * @iface_q_table_vaddr: virtual address for interface queue table memory
> @@ -108,6 +109,7 @@ struct iris_core {
>   	const struct iris_firmware_desc		*iris_firmware_desc;
>   	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
>   	enum iris_core_state			state;
> +	bool					removing;
>   	dma_addr_t				iface_q_table_daddr;
>   	dma_addr_t				sfr_daddr;
>   	void					*iface_q_table_vaddr;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index 545bbe75e1740..e0cfa5107d1d9 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -128,13 +128,26 @@ int iris_hfi_queue_cmd_write_locked(struct iris_core *core, void *pkt, u32 pkt_s
>   
>   int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
>   {
> -	int ret;
> +	int ret = 0;
> +
> +	mutex_lock(&core->lock);
> +	if (core->removing)
> +		ret = -ENODEV;
> +	mutex_unlock(&core->lock);
> +	if (ret)
> +		return ret;
>   
>   	ret = pm_runtime_resume_and_get(core->dev);
>   	if (ret < 0)
>   		return ret;
>   
>   	mutex_lock(&core->lock);
> +	if (core->removing) {
> +		mutex_unlock(&core->lock);
> +		ret = -ENODEV;
> +		goto exit;
> +	}
> +

This locking scheme is looks racy, what's the point of this granularity ?

---
bod
