Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201469;
	b=rNaU5TxxXslRhhlYcH+hsHRLSmcnM6Pfz31T9JmsHwwcb8FDQOGLv9vINwmY+WdI4iF7
	 S26SqmV7s8uUhaEFdvF8v2FczLuHlaYY8+aT7sjqjqkV1oWdCILqk+9votgYu58f0zZk2
	 ejQ3oxj8dR7crEQybEpDI3FxM1/H+llxcDYarsP9crmzDRy5mhdfm0jo08VszbSq+NmF9
	 tnqsdGwKdGQzt7RqUvz+TamXtveaB1wOnszQv/cqXA71BiK8Mnn3B0HXNrqGnu8MHKFKx
	 xUKOnJd/Sgnc1u7T4ZpRyMbP82Oz2nuse0Y2TyNiFzSxX+WjhlWfBHIMnZP5+KcHMxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wemZBH5N8kr8/m8fq2ioHfv60pNctDnjzWt9aNzMtaw=;
	b=RXHETt9BVLvlbkVEkkGWDD0cTgW3bCxoathQfLCeI4YNCoMoJjRfOUcrXGUxO1V4MMFx
	 pOwmLS+bWX6D4UBWWqFesH3JJupdIH1q0CjsxldYQcWrShVoIj2l3/VaWzFYqytVyTWmD
	 mw12ZtrDBbNXbVQudotCmrigzKipWtSy+HlHsTLgPAZFGLkCMjZDft/mv1g48Dxd5fFdz
	 oS8kGRLnAQD8Xks3k2vhX2KxIi3Fw4k/22U6rRP5G9dkppRwJBrqYRSvbGup1U57YM71b
	 6jbVoXXHuqxhboth3nJ9HkK3ID8iXgV+t5fgOs4TeokWPXE+v6EuDYW2DoUKcDU+oAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZpLSHtz3;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C432606A320
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C432606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZpLSHtz3
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so1956079a12.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793201467; x=1793806267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wemZBH5N8kr8/m8fq2ioHfv60pNctDnjzWt9aNzMtaw=;
        b=ZpLSHtz3kFRM2BRETpYSukD3bRLdMeTKGj2xHeVRSOavkV/SJShwlinM7GpZCEqYy3
         zD7wE36CmGuVt0WMUlb3rzEtobX818C1CgH6DgL7nMrgCwL1NvNueDFwKWGzLMXV+kEd
         GisIPOclVxDYGguyzba17fLH5ZszWEgnW+1ceT8rlUzLkFLCO7oMYINNoqlmBKqCUTYp
         7HWmoWQGizm2Ewx79YjaPLfAcNtKLpUSwRvWkAKEIkb51CS876G3x1/TiDL2hpcue+qc
         M0i8Dhw6UDGpu/Jpz2uK2YgVFDwNPoR3ykzRej0CH4upXFppSjaVmmOiNTrpYE6yE0RD
         PgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201467; x=1793806267;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wemZBH5N8kr8/m8fq2ioHfv60pNctDnjzWt9aNzMtaw=;
        b=ap715LB273gfl+Au9p72us8iwWAc0IcjzYf8tLLc8W1gGJceybqgxaMvA64L5p8vbg
         XNzniP1LiYDmivaC5X383dL5L/CozfvXZHyezOYBVeOvVvDFhII+GkFS272/znpedM4f
         dhl7F8ZOhiECMHSyO0kc5hJLTxrxHGVqHt1ERDL/oMahABqBqfQpMacLWxl86BaBnx/E
         gNUPoCISN81KPUC2wYCbAPLuakl7dJeVYYSS2vLztkCRFCFSUB7xedrHLmMsrWtmx33n
         tbGIDiseIk6OZUU0oVYAUOA/9/0O4STcrHaFCMVdtBXIp84kpAtwdk5LoASYoDauftnr
         2few==
X-Forwarded-Encrypted: i=1; AKwUvByhyfe7fZoQJIi1/5/9+ZAyyscrTdMCZgZQR3G0sXByEks+1Kw6tS3bcHxLvpTODGjcuV6jNiIkkkAzFg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIjndBz4NhfnADUdK62chTNetMyLmmWb5FI3j1pE+ZZnkfMsT2E
	oV863Tr/ozX5jHxpAJZNR1UsDg2AcDtaIM35fs/6IfyBnEgH3si83s9v2EGIlsEgF1I=
X-Gm-Gg: AYBFou0pkrzFN4WxtgHci18GT5+N+rnO4g9rGzP+jinrlMz0qbacZ2cjE62UhLeFPS6
	+T6wySeIrp2pBbRxOJCE+L1/Igqp5v2GE5wq6me4K1Unh6YPMkqZ2a8yebVj2d2/od44pyJyBmN
	R7cst+S1NMoPnqcDOgFUJLp9XzKOtVBPuCPARWYPc16J4CDK2GJM9oAT97MwbCInAP27qvvLTdx
	PDFlb73KsmVBPP29JTpvQz++KKO8XiopEVi87PtxuX+AECx4moPDZizTwlXPShtTfzxvVZNjk2w
	dUvU2EzhM0Qp95gPy7Px3GQjWrjWylTr4vaDiQYWtqM71+rvrz5NQXfi4GRRltUMuYiD1nyjCbU
	HwiomDnsCkgUPX7BgpKGxycikOyuR3suoU/W6pCDsn4YoKu5oZumwkX2Rc/b8qKxeOuDnAIGTls
	WMDFpt9gFYvOwLc7ynIWu/+qLDYnTlZgiPc3x5Q4w//0conJ6/iLMsXnfiqX9UYhdN2AcVhPRK2
	NympqdDomsL9QsM313ieJ8X8klzDn/i7nroIBfdMc7ZJMwJCYcgHY8PubtCM6AoVGNy/KjNTeKJ
	dDdqlYQIeID6pKeeDBQ9Z51i00BYtM+mODYlc1BsSg+FFDCCSvFIdT/9gQRbWws=
X-Received: by 2002:a17:906:ee8b:b0:c40:9839:c892 with SMTP id a640c23a62f3a-c49bdf140a9mr230072266b.19.1793201466691;
        Wed, 28 Oct 2026 08:31:06 -0700 (PDT)
Received: from [192.168.0.167] ([109.79.76.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e9995sm616663766b.15.2026.10.28.08.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:31:06 -0700 (PDT)
Message-ID: <9d22f3e6-7f6a-4450-b6f5-871b87fe49bf@linaro.org>
Date: Wed, 28 Oct 2026 15:31:04 +0000
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
Subject: Re: [PATCH v23 07/15] media: qcom: camss: Add PM clock definitions
 for Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-7-95f250b18612@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261028-kaanapali-camss-v23-7-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2026 15:20, Hangxiang Ma wrote:
> The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
> sub-block. Register them as PM clocks so the PM clock framework enables
> them once when CAMSS resumes, instead of each sub-block listing them and
> taking its own reference.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 98ec23c39fda..a64242c66cf0 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5606,6 +5606,7 @@ static void camss_remove(struct platform_device *pdev)
>   static const struct camss_resources kaanapali_resources = {
>   	.version = CAMSS_KAANAPALI,
>   	.pd_name = "top",
> +	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
>   	.icc_res = icc_res_kaanapali,
>   	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
>   };
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
