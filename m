Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B92226F2B0
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822105; cv=none; b=I/oEVaSQnapOHxaH8B7QCeMUDtvkUHlkuINnSqS2uK+7eQf7JmQ9LmKQvoUjqgB+WoJRDc2tqfvleDPMKLpIYK5QjLvbNs8rJuDr/GovLYsIZoHwWat/IdvGW2QgLiFvvfHaRosig0azTkV3WDp7XLjqWcYrYndBqxoCLdYoclk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822105; c=relaxed/simple;
	bh=ZBhs34ZISK9bRi/rf/JPGKWEECowkqkQOjuTBR4fNCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Go2L1MUGGYNmVvB7EXIJ2cGgJC0ua+Qu8G8du/bL9uTfIqZy6VX4iZ6JwB7G4RJjdCILFwrxnBeRA4GY2VGgrjjSTg1HAXhXNHWHM3z0osZF+NC8NJ8xlK3Nb0/ZnZdX5cPLXJzZKAR3NkOzS+ocJlXLMXHB/WpgRROgz+LNkoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQK1lL4o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODmWO7k5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQK1lL4o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODmWO7k5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n1OE1573385
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OKA9ni/VKYiyOGZbetdw2GUFM0Wy/xcP3QxXwwJdhrk=; b=IQK1lL4oceipm8Q4
	wpDe0abCYCvbADeNXWX3gj3hyHy7jURTho8WgTcNP0wxHt9iM42a5wd1u/4ra8hi
	slQfbSxApQbzQkn8/8rw/U5Aie8gnKbUeQo73GyfSHmrz/dWJU0L41C2pCOKK+Ux
	eQKjyqY08FHK7bPN2E46E1JCFGqBqISg00TgsLFx+NiEjiPYYH01FCuafv6/DTcr
	zI2JXzR4UsSaslUZH89nqjJ+CIcWpYI258CT3uYhXgutcWX1OsKtcX3nMdwRsr1c
	6alJGvFylNA96g1H5P+qcJH/bFmFX/4BL4uCgiQv9zSHsVRPKJgbUp3dwNymm30A
	1zcuIQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46862521-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:21:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9691f63552fso154495241.2
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822102; x=1783426902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKA9ni/VKYiyOGZbetdw2GUFM0Wy/xcP3QxXwwJdhrk=;
        b=ODmWO7k5d35aQmY+TNpaXyJPMoIQtPsOLkR4UQCAidVsK+plGEyVZEn7yz2Je7nDcj
         GNVuaQ7hMovEktvOXFO+twpb/yMkfkBWeRNs4iNSxKv4oyUkQZhTQ9HSJji1Xt7LrfxF
         ZQvVbitc55+tKdVEPOuoxG+9D7VtcHn+fgtIjFG4qh12fDJA/DUAyWMC0YpngDFIQ7yi
         ohKaeJNu4qhum9fsXvMiWTG294u9ziGQSUderrF3uiU5AArUWMb4wEvhb4Bnq46jEPLc
         TLdIMK8xDY3dYPblrYf0TdeMvsNGWSl9RhizjpvY1Y6qylvJFhw7+Y2Uk7PEa/5jj1ZK
         qk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822102; x=1783426902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OKA9ni/VKYiyOGZbetdw2GUFM0Wy/xcP3QxXwwJdhrk=;
        b=sjKHH/xRbE15I7M5E54G7XnzyjNGrR2hmRVIh/piSvmHcqzPT8B+tWEOApwX5psLx+
         BNotnWNIJZemeYmv8vywH63Rx+p2Wwj21ntWRIL3Eh1lKtVIz2nM/+Z6UMapTlsHHvK0
         JREZSfrq3k+KdOhfJZOmuhHWLPJSO+ng89ZGJLh/OlipH/UhICH4sEoFny4Oecn1gnzl
         p7pGXAbtBVVQ81vT7nrValJuLD1/OHb0CeHsX6iD6MGEUX5/duvHPs6kj5DaoWreX23W
         nHo5sm7dXOVY7MuOoY8HU6MUFgOPJCX9m7JhqHPFD0fl4YTjjxqv7HzB310g1PIpbw6N
         nQ+g==
X-Forwarded-Encrypted: i=1; AHgh+RpOoTHy9sXMquLme88xMdhGr1ndCoLRkpPnD+nm1uebWCWXBgPZsixK+Kg/6A1XRWhQ0Q/hesZ+Pcjefw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwslbbLHQYITtiRvmYRacFpYxQ6i6bNEs4eppnDm8kFN6N7tPCR
	yDBn6UZtqDzIyzb4FcdiPUhEQCVo8qVthtzMLZHUJ9dBab79BaVw+XKSkDRJrOxJiL7zMPfuRzz
	ZQk7zx6NgADeUWJCm50/hSzkrHO695mu9UY/NpJSlD85OM+kWxcL7n/3Xw2EvOJHpsQ==
X-Gm-Gg: AfdE7clH1zbaqxzclFImFpI6bOhj+kkzdtRdZbk9gIvvVb6Nna9Q888dyQmkzXycKtD
	ASzrvzhbu25ZzNQSHD+nn5EONTDJ4fs4A0qLgckYwkhK6e6+LCXW8Ee+j2aHA75F398GjLDPAL+
	i5mcD09g2keDV8ZLS8Pm3SQ1/TNDY0LEVOdrSm1HtfI9OuHwtdJJ8WVYOjVsm5MfmhMyT983A/e
	xb2XvC2PxBLbqqZDZDM5ku/ZJb8HjyRdLB8ZoFzOluOaJXV4UXTOqr6i7Yf+v0kaeMXIvyjQB50
	jQOjdXUDONOwhgt5HBarUhYK9oLywjmGHux+qib3WHDs2lZ2C0H4Ck+jHu21T8dRnFM8PffNSpK
	rgEcY68WvAIBTkRvHhTcrW5ScyMCTIYdFy+Y=
X-Received: by 2002:a05:6102:5986:b0:739:b7cc:3ce7 with SMTP id ada2fe7eead31-73a3934de72mr535086137.7.1782822101839;
        Tue, 30 Jun 2026 05:21:41 -0700 (PDT)
X-Received: by 2002:a05:6102:5986:b0:739:b7cc:3ce7 with SMTP id ada2fe7eead31-73a3934de72mr535050137.7.1782822101431;
        Tue, 30 Jun 2026 05:21:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c9503f5sm1104309a12.20.2026.06.30.05.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:21:40 -0700 (PDT)
Message-ID: <bd4080da-0c15-4142-aca0-21bdeaf9eb33@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:21:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-2-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wYwAAS9n8cOZ_bY3uQvrpBcJj5a7BIfR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNCBTYWx0ZWRfXzWRntrd7I9RN
 xh0BMcDf0WmK296gkOZHFuJSq+CqAomUXMIiIRFfklASFmM918Y5IY70qhDX7TG8AAcCKfPaCny
 QFctKLa02f1xPiYNevT4ikV3xVrvmPsoNfA3BABNQya8dgwIzqRaKQ9KKFn3kUIlbsHd2T1B0mg
 0EeKzcdtgQNZYqQozvvdb5rtQb/RqqLWt/vnjJfpNilIIFkeArhOlt6FVzLy2flrKXpnMHstNZR
 SS6Ac6nXoO1QWCiYfU7rrh0jIYknJ3o+hEzqIjn9bibF+qnC+y0XcOjZWqLq7MqXh5z8quZt9ZD
 RCDrldWyXVNB5FVgKe3NYBJN1BXbTGTLAzoLjCoVtWJyqO+s8EqE2hBmBRUtL03tv7gMdjMK3N0
 Ropy112xLaLbG3xArd/KRcgVR3YKiNWTZOX0LEcdOYJAUTjRNnVOzsZjPtMIxPc9BTsy0h9T8oX
 wbMK/GOrezZHrEn5X5A==
X-Proofpoint-GUID: wYwAAS9n8cOZ_bY3uQvrpBcJj5a7BIfR
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43b4d6 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DWWpLck2SfFL7czMIZ0A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNCBTYWx0ZWRfX99chXv80u8gg
 bNsD3fcp8jJax4+R2Xgvc+9NSM1GUL5qvltRk++fv3DLmhDrgXxtfUz+rl/DSSQb9QVN41Kbtzy
 0a9QOTXgwB7Dz9KKK4OG1iQl+fRgpm0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300114

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> support these non-standard SCM calls. And even for newer architectures
> using S-EL2 with Hafnium support, QTEE won't be able to support SCM
> calls either with FF-A requirements coming in. And with both OP-TEE
> and QTEE drivers well integrated in the TEE subsystem, it makes further
> sense to reuse the TEE bus client drivers infrastructure.
> 
> The added benefit of TEE bus infrastructure is that there is support
> for discoverable/enumerable services. With that client drivers don't
> have to manually invoke a special SCM call to know the service status.
> 
> So enable the generic Peripheral Authentication Service (PAS) provided
> by the firmware. It acts as the common layer with different TZ
> backends plugged in whether it's an SCM implementation or a proper
> TEE bus based PAS service implementation.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

[...]

> +struct qcom_pas_context {
> +	struct device *dev;
> +	u32 pas_id;
> +	phys_addr_t mem_phys;
> +	size_t mem_size;
> +	void *ptr;
> +	dma_addr_t phys;
> +	ssize_t size;
> +	bool use_tzmem;
> +};

Redefining this instead of moving the definition (this is a cross-
subsystem merge anyway) makes things more difficult, as there are
patches from another team touching this struct.. hopefully no kaboom..

Konrad
