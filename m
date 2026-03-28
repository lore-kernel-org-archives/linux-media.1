Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F8C1CAA78
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 14:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774709942; cv=none; b=RqaYrPMzaPOe/CrMLTfPR+nwDjUYguFf14CNx12eyCtJDvLJTfFmTTFdw/DBYin6xAzW/nF5sEs9bzV85pCKcEIct71B5I+hdKCh2GPiHeLS2WO48ZlM4rkX+ON3CNmWtU/aXHlsnBtHDrKxXtTpdk7hjVc7N8hDBwx8py5k+OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774709942; c=relaxed/simple;
	bh=5mmjhWAxCiYFPAEUtWK8vIBoYVI6QTdkJFmQtrU9oyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOdI0iRPKfnEgI+N4EwutbUR3mZNIcKfVpIoQvZyFrnciIcD///fHa3dQpi7rLUZPXfVlcChtakQnqaTBS1f+GNhlTmne95xpASzKHzbFSYg35T33hMai4dDe/3gZTWStz8Nn5yNYI9aqZLKGXMHOVoMmL1L9CsUINMwnSRjT3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RMSXO1yR; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMSXO1yR"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so5702433a12.1
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 07:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774709939; x=1775314739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IpiZdUca/KvBHgqMWXQPF+EJwwgHXh6W6A/k2bT285Y=;
        b=RMSXO1yR4T4uuAX/fvyiCpfUjZ4FqZp5WSUY8yikWrKwG96ovtkQtG3TdtvbM6JMe8
         DVV/Tav482z4raTrr3p8lq9rYuH2ucAxBAxa0ntHn9VatoGBWoJRRI/YjEMwHHhIjOdl
         Qc6gxPgIKZ/xGVCfRyW1ujaqMVNS4OMn1ZICswrcaD+Yp9AuYeahPQtjmO6zpXWhheOV
         GJ2r0bHhCbuR5POGvtGU8QFVHswL1+302yAwPiS946ovQ/mJKOMZGs59KF1kNBi15Mv7
         N9/God0oyoCPrxaVSQ1mt+6NAIltPD7MiiLbdklN8N8QrCtJvBUnCa8MEcKTviL/28Ix
         4WoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774709939; x=1775314739;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpiZdUca/KvBHgqMWXQPF+EJwwgHXh6W6A/k2bT285Y=;
        b=BJ0WtP3R2RnIRuQWb4Ao6m3d2XoSWbJ2EQAwG7A+vQVOozPU80uTRV/LSNRuHJuF1H
         sUa5vlUn4Yf1DmQiLpwDq7g/JXZaDTckJHR+g9689gaLamiO6SKNaQBi3U7EasIRFDnP
         1BSo+dXlV9qyqxSyMfqHJtgAIonVipi8zye8AONBvTpbGlwDRpfdAGnmwIM8/Ulo4S5P
         KTQAXALzqtSg26CKPmMCWRAUZLNDzkHifbAFuP4oEgnH2XIrNbsMHihiyInL/XDCmFDb
         cHvQ5lhLGj7HTZFalwnbLw0tPOY0fZU6o10lOuXUiyoZUBtT2/xJpETm0Aa0dgFZ1XXk
         RlaQ==
X-Gm-Message-State: AOJu0YyxokZrcDNvPUYsHAiQEhzIFyxjLrHcRuEDXEaeFOX55muvfNTh
	gCaHeTV3GTbvnTJC7RTCCKByQOyK2/SxSfUodEORCVZfaUCap3yfGZcYEmYhzScmyZKlv0tZmgs
	YXGNE
X-Gm-Gg: ATEYQzxpsGGRfrI7JnnT+0dG3CdP6o+nmD9hQ/eVFmWD1gVcVCJEcSgtByzAYAYTM02
	ogPcKfQ15HIR/Cfdoc7caD649QlwBbwsrdowbMxv6IIGjXyU8TPxYLBkqH4uldQ8RGxYeZzAAEw
	9kBC6OTxp6SyhO8/GTIpsTlPQiipCbCkQ+k8EmuYjzDQPNfyWy+pqmldBtRdRTV7LR1d/5N+u80
	fe3/SU8UMwKbHuKh+etetq6BNuNEbDr9MlmRlSbGPANH13qiXwcB3+aKmdanqwfG324skKNFCHC
	+YhzquCAjkEbHfKRUdwqdw8uiIVgSPm3+wk8WlwhHJFyVp8t1xpdAXkU3z6A/vY1BT8WQ3+97eX
	fWZwqjN+2Tijrsx6i9c4RLxlpQrZVdrykgtdywLnA9fam6lA4PKSpQw00qzUoCZS1bUtb1XVEwK
	0DCz6AmxF69Ye4Lypkd9txizV0OSyF7AZwooPGfvd8cBAT4w==
X-Received: by 2002:a05:6000:430e:b0:43b:436d:77f8 with SMTP id ffacd0b85a97d-43b9ea4acbemr9747762f8f.29.1774699315674;
        Sat, 28 Mar 2026 05:01:55 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.108.64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2727sm4926384f8f.2.2026.03.28.05.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 05:01:55 -0700 (PDT)
Message-ID: <f2e9a9fa-f089-42b1-90ff-572f620b127e@linaro.org>
Date: Sat, 28 Mar 2026 12:01:53 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: qcom: camss: Fix csid IRQ offset for
 sa8775p
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
 <20260313-vfelite_fix-v2-1-7014429c8345@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260313-vfelite_fix-v2-1-7014429c8345@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/03/2026 10:13, Wenmeng Liu wrote:
> Fix BUF_DONE_IRQ_STATUS_RDI_OFFSET calculation for csid lite on
> sa8775p platform. The offset should be 0 for csid lite on sa8775p,
> 
> Fixes: ed03e99de0fa ("media: qcom: camss: Add support for CSID 690")
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-gen3.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index 664245cf6eb0cac662b02f8b920cd1c72db0aeb2..bd059243790edeb045080905eb76fef3b12caae1 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -48,9 +48,9 @@
>   #define IS_CSID_690(csid)	((csid->camss->res->version == CAMSS_8775P) \
>   				 || (csid->camss->res->version == CAMSS_8300))
>   #define CSID_BUF_DONE_IRQ_STATUS	0x8C
> -#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
> -						1 : (IS_CSID_690(csid) ?\
> -						13 : 14))
> +#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ? \
> +						((IS_CSID_690(csid) ? 0 : 1)) : \
> +						((IS_CSID_690(csid) ? 13 : 14)))
>   #define CSID_BUF_DONE_IRQ_MASK		0x90
>   #define CSID_BUF_DONE_IRQ_CLEAR		0x94
>   #define CSID_BUF_DONE_IRQ_SET		0x98
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

