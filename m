Received: from mail-ej2-f37.google.com (mail-ej2-f37.google.com [74.125.228.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5403F27FD49
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546096; cv=none; b=PmP0LhMthPliPSs/4tQhS2+G8a7ECxaZ22uIXh4oObf4MKlwQxCtWK+sBMZNT9GGHY8SgsRVscbszbhZ8Tzg04LsgDtEn1tGUOevt/RFN+9UpDjxubIaxWW2C8sM5qHHBAjCZn4kmwc55w5ehz2ekzDmWP7w03uCi7kUNYJMax0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546096; c=relaxed/simple;
	bh=yLnOagV+pT8eAzSsdk6JR1MTvfu3QPXw3QIDFR8KAo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jnmCZ4KYGoN9mluCLtvSG/JKWWwdrMZ4fAQa/v0aCkyo9vq5p4Z/s+/2vXh7eovi/sCSk64umFShvIvwGf4S2XSrOT+NboM5a1gjc+yqH5mDP7T71nLzpIKqZg8ZHyW0pMi4nsgWIeQ0N16apNNjI67qKrdkNQZGSFG4bP5laVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYJo9uha; arc=none smtp.client-ip=74.125.228.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYJo9uha"
Received: by mail-ej2-f37.google.com with SMTP id a640c23a62f3a-c294af0caa8so96089966b.1
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789546086; x=1790150886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJf22ij+JQ2jMGLbFA1R+j1lqSUaO3cpmGjQBuD64T8=;
        b=jYJo9uhaS00BaRERJ68n2phfJZhMK5tlAOlpmR7za6vywdJjm8TAb+R4dHNvDN9ssK
         OV0QA+zwSr+HYk6vrgfQJHUKpRRLs1arQvzrnB6o7zkG4jcwy8T9S0H8rdIhAU1tVpFa
         eMSQd8qUlVVfaoiBrTM5W/zQ/S7Gj0IF4Kte/MYM5aoKtEqc3Bboo8lDSUGRRgQqXO+/
         6xtsi3ZkyBk+xuLo5sHnVnGHKcSBS6T8xEgVFqvDriw2WMqwxUFsW+iRB4JLnPT3uApD
         F3nTGt8wdhBDOx9SkZdXsdWLomg/T9kymHmjbelV3c1v6TdwQIt90URDFzDl8BEuaofj
         4iwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546086; x=1790150886;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJf22ij+JQ2jMGLbFA1R+j1lqSUaO3cpmGjQBuD64T8=;
        b=0Cp+Cm6lBu5q1J3Gl9kjYoWYRW4CcA5VvXZCWM3PDksVhKtnQjp6sjIkDgisiJk8MX
         OCqTDXubA8tChtakJIlRPdKDjCJq+/yzXZbzKXGu5S8jEyHtpU9Lti78O4D/f7cpMOx5
         HOm/H4MTaOx3YfbzmV0UqjCKohAkThTcZBJyvnjlgXAAj3IW8ya2ReJXI4GSa6hYjLPU
         sTqbx/3MLeBkW0KYUW1IC4ho6krZ48EaH42Ov0A77+kdH4GyxrgYTDXcQdSLfIUWyMFu
         zFnWOAp2KxGFz/BmosivsTrzN3m9sIQD/UPDZI8OhhfHAA8gnaJwZa+ttefWvSLC+Air
         QNyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqXXC6jqZ5H5aW6jlDCN8oRMFfSzkgo0AGP4f6J5o8FhQvkLzYzBftZrkW0Z2sq4fSC1x8n2QFNrBUJw==@vger.kernel.org
X-Gm-Message-State: AFuF++kUV7H6aH/U6I8th5K0lBpz77yIQya4e/ObepenkYKSSiCHfdb8
	rq0C2KlZdtoeNXSpCToC0xVmaix0k2ewAYi3oTwGzsKBJ2dWE8gHbueyNTPnltqaODo=
X-Gm-Gg: AYBFou3SFR/LPvRdpfzi3KaYk4espJxjFaDAVybZI8LcJt8VQNgm1amTOjT9+UTBsfF
	DKS5BI9ZVX6euR4fL0OM6XWYaCVlvKsEOKsiHxEZLlz30BS+gQDRvXZnnbbcsYtqNX8r+tz7U8a
	ZP1XOAhlisTQHaNpN6XPYLWApZyaidqwRDo0h52DIU43BOubcuRqiAgwQPG0trR1RelrXvUeCrI
	V9aKecaV+F1j34XbdfyXgq1s28JyrPr6KoZ0BhJJSatD4jQH4F1G1qlF9Wsqze3zaJ3eRTB57nL
	x/YqDQ1xq5BYVzn8Amp2eTm7NtOkpluv2ePMzbNxlFEZZchC8OvgsuJuxYG/2URtVRdEA+a+RzR
	gp3MWM+4vziZSEWGGkDeQpXIff2mazoVZado7184UYngcE/mc7O4FztUxibbwOHuBzejqsCgFxC
	SODkT3RDZaxrPdeOSCv7LKGsvCt+UJkqTeLNcMW91lAS0EHcMh/AzI6rnXZZWYcc7Hx7ZbUZvQK
	JbztbF5K0rCtFOt/KqCkGI=
X-Received: by 2002:a17:907:6091:b0:c29:5340:1837 with SMTP id a640c23a62f3a-c29e52b6aedmr98025366b.16.1789546086423;
        Wed, 16 Sep 2026 01:08:06 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.116.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de4866d9sm83158966b.23.2026.09.16.01.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 01:08:05 -0700 (PDT)
Message-ID: <fcf04e15-d47c-4b42-a94b-077486cf634a@linaro.org>
Date: Wed, 16 Sep 2026 09:08:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: Enable the streams API on SC7280
To: Hitesh Patel <hitesh@ebytelogic.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260915121536.19207-1-hitesh@ebytelogic.com>
 <20260915121536.19207-2-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915121536.19207-2-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2026 13:15, Hitesh Patel wrote:
> Set streams_enable on every CSIPHY, CSID and VFE line of SC7280, as
> done for SM8250.
> 
> Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
> deserializer, one camera per CSI-2 port, so two independent pipelines
> share the deserializer subdev: both cameras stream concurrently, and
> each can be started and stopped repeatedly while the other keeps
> streaming, without the WARN in call_s_stream() and without the second
> pipeline tearing the first one down that the legacy s_stream path
> produces. The CSID test pattern generator keeps working.
> 
> Signed-off-by: Hitesh Patel<hitesh@ebytelogic.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 0201debd4..2023c0df2 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2280,6 +2280,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   		.reg = { "csiphy0" },
>   		.interrupt = { "csiphy0" },
>   		.csiphy = {
> +			.streams_enable = true,

Set it @ the SoC not for each csiphy and csid.

---
bod
