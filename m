Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531345;
	b=iLzzFqyA0FGXCTP5JtiR0Yu0EQSjb7DxzoGNh7Q7yLyyYQ6J6gG5xtu0y+zVDKy1o0SU
	 vauCK4prk1TmBNlGWiRXRtzQHLAqJUTRP1umOA7SZR9oY3y9RwTKRqTZbw8rz4uAOoEBg
	 rD53onwBCVXQszmSrDFveNyzR5O30vWhZKRB8E9qSlrl8HW9YR4MDqxjWjMmbSBsucoEA
	 zBeA5xeJkXu/x9TJkBQj5jHmV7Y3naABRSmyFF0Lpiq7drSXDhVN8BPldPypjLisNMZjV
	 DSpIGEm0OoCJiI0BQXC0hpAMuEJBmIxrqk+SK8kE87OIN/9VoPZqu63LDII/oVd08iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0tUZ/r90AwSeslzGso6dCb5vC4FbswESQba0fvf+Foo=;
	b=XttBPT4xXZDfeJbpCbd46zstBYu1/mGKEGwX7UdYnMx/Mr9y5LNnoJsH4d1smPEmSXtF
	 R/0f9Ag3XqLxJeJ49ZBi5Jxy+0p+L46gRsrImGNpETHRctm8hPBDwMa8pPzlNBmZamMzL
	 5zQRyLtFnQYxdX8Hfs2C4tI3sFH0XTUIU9j7IDO01qRstT+mpBYK8tytK2xd+M493wGWy
	 xuU2KdtYD7CUBOQ0wfAC0y4caetHftzGmf0aMzc4Lx/hqBYPaDYPz1cUdmdpre6Zb8D4X
	 hT9fb/zqVdwztwpSi5yHCMCNImtwR/uJO/6UkxdCoHNIlMqrLWBqnw1rsoZqLJVa7iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lPKSbQ+v;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EEC606A32E
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 00:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36EEC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lPKSbQ+v
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4910b863b84so893717f8f.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 16:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794531344; x=1795136144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tUZ/r90AwSeslzGso6dCb5vC4FbswESQba0fvf+Foo=;
        b=lPKSbQ+v6cn0qckNZ2HObZqsWk1yflt0gbSiGlrodWsODQWWsX8iNNAe/NiVO7iZ7K
         pxsKAgVOAe01/xg1mq2bEoXzeKmqT3eiHSQW0hUIspOlUMg5aOoNqKoBSQopIKlrxgA4
         5upzWRZcqdU74/2IGFFH+DYcZ7RXy45EEvY/nIwEVwWM8pzaNyptVAlRvgc0xagJ5uTS
         KB3XF3mEz8jm04ufGZclHmxIaSvhwbmRdNlox3Hi3gZ9m/lwj+w5XtEyuEsjsZkMuPTd
         ByppVfwoDb5r6hyYUseRFotpWidghcACbYAHKRmQ0y6P252Rn4VeYz6tjgxivGAZq9Fy
         npbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531344; x=1795136144;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tUZ/r90AwSeslzGso6dCb5vC4FbswESQba0fvf+Foo=;
        b=RMB60fIYXAnYsxEMl1h5uScn9QYAjTf7fDf0eirQCLA/UbMOufUCa9TK5f843ZV/xm
         nNBFGuXo9xzKxE3sf0tkotdTBmxoNDkqWUKDxhPhhcVYTsjbJEYZ4+3ezdoFm2we3yvT
         VFnMFaorbqxrqWYQyTWEGWzIOyDtKnQZ/MPAlVAHNmaj9k2Uy/OKyaCBwzBm7Xq4aZ7p
         4fevJnwjrPo5IgOMauEbWJUjqI1Kjmz/wwo150ji7scj1CQLubC9iXmLwt22bMQOrZJq
         nCXlbEX3YQoM0sNFwmISk5y85cAl+p+dWWV2UYc3iNAp6oz3sgjQEPlsyAsLqZcUETPc
         IgbQ==
X-Gm-Message-State: APuU4Z+Uy9n0114zgP2Z/XBZu4Bcuw37kI13AmzwF39CrxelFmNz+8n3
	YheT4Hr2nNJK3eNIesyq/7gO7Tn3dOU1IZIQdFSVSLHCmZowgwvGByBb1LhYRlVsFN0=
X-Gm-Gg: AYBFou2//U3YqIs4LDuf+/JUvbxMg0uL3rPRrwU6Ltd87Rc3Drt4HZwRxc9ogywNq/F
	G0Y9yfb4XH8Mg8Ks4GDjC2Nf8lmzu0DyAyPobWUJb6WvfhMY5rBrHcUVg7xsKuqq6jiQI5cKX5/
	wpOLHfCCsIFb1QomB92rUMmA06LswH6l/fSR7lE5LrDfi1D+S/RHaotxqkr6YrzdmfJngjDP7su
	IrKoCudA4k2/XOXqaLEsk1syVlf9n5MQKmfMh8YkJmW8AVsr/6UwGEvQsPYxZ1fI5dgijOgitZw
	GE3BPvwrjDRAtO74SJ6rs7Fau0fiw5Io46kdx2iDC9dVcX72N9IbW43hfQqrUG5MAKYBoBYo8mi
	7puHAaXeZDSsrnGbicrGryQ3uFh/jl2ogqIQ+olRKmp3jq/BEKs0zypVCMtDK/Vbf7U1Yf4Unh1
	sBH7zwo8pWX3/H4z2JBNZfzPKAcUIwBFBlIsPBY4PXmGirWVtxy7L9EHY004zMTH5oUAZ6bH129
	2yMO562h11xd0dYOurGcEVdHa0EjEUAGJPhzm1WD47ZnpXvL3VTApoMFBrMl9JEXxaNe8y+sKsj
	0Ss793d4Il4OamWgz463cQgImNK1qyENMza6r1yiwxM=
X-Received: by 2002:a05:6000:47ca:b0:488:8347:a110 with SMTP id ffacd0b85a97d-49c6f5e9818mr1560854f8f.7.1794531343598;
        Thu, 12 Nov 2026 16:55:43 -0800 (PST)
Received: from [192.168.0.167] ([109.78.26.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm2106178f8f.59.2026.11.12.16.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 16:55:42 -0800 (PST)
Message-ID: <39881cfa-6f44-41fb-aade-041d9cdf2f9e@linaro.org>
Date: Fri, 13 Nov 2026 00:55:39 +0000
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
Subject: Re: [PATCH v2 1/3] Revert "media: qcom: iris: use disable_irq()
 during power-off"
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hungyu Lin <dennylin0707@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
 <20261111-fix-disable-irq-safely-v2-1-8e13f68c2ef9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261111-fix-disable-irq-safely-v2-1-8e13f68c2ef9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2026 09:05, Vishnu Reddy wrote:
> iris_vpu_power_off() is always called with core->lock held.

This statement is not true : int iris_hfi_pm_suspend(struct iris_core *core)

And TBH as I look at the code I wonder if it should have a lockdep 
assert if that lock is a requirement...

  The threaded
> IRQ handler also requires core->lock to proceed. If the handler is woken
> and queued around the same time power-off is entered, it cannot acquire
> core->lock because it is held by the power-off caller. disable_irq() waits
> for the handler to complete, resulting in a deadlock.
> 
> Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 243bd845349f..1e183fc4e58c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -240,7 +240,7 @@ void iris_vpu_power_off(struct iris_core *core)
>   	iris_unset_icc_bw(core);
>   
>   	if (!iris_vpu_watchdog(core, core->intr_status))
> -		disable_irq(core->irq);
> +		disable_irq_nosync(core->irq);
>   }
>   
>   int iris_vpu_power_on_controller(struct iris_core *core)
> 

Looking at the next patch I'm fully recoiling.
