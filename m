Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2419B38F651
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463476; cv=none; b=BuLlKO4u+dd8zadmtg7YViBAEs2DELZcQdnrCRmgfgdo55hwseVmpBRYDvrd/HywE7zcWiGOArIlTZxK8CH7use+3JpCXe6IZq17FPcoyWu1tvFJqSdXRi168WhV/SkcDJIvgdNdnFWvlZ58bw/Oi83G9jXgrYE3a7+72m6rSNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463476; c=relaxed/simple;
	bh=fQkaQGH966gFPO5U3wwOm+ett7I82/RABfQ7YT2NVGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HzrwB84YMdRQ1t1EyBDS980vAiAW7UVzk2hxNxpjwU7aio0VkiGWVIxLOR4wf4+6Oilbc43dx1I0xb5/uuPu6aU2T5LpBYr8CIMueD7Cc4cMgOhksdHiHXX708pJcnJYDkwRU9D/f+ljH3iFO6kGuBxmsEVJ2QlMx3ZJWEhX+5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CnVacH6R; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CnVacH6R"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so5234481a12.0
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 02:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789463471; x=1790068271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4S77UvxmKvQGEySDdGGt+bawAL6b3X54Q38xL2/BalY=;
        b=CnVacH6R6tI+sMYnpardK/lSWHogum4Dv34ECxiVVx5po07L9D4EHGlJp/3zcgFvLG
         crl4KhDkiCcvJtAfkuE2Vl6XhKZw2yqv6E2k325vbbHExBtr0RmYVB3zITdX7/7F4XZA
         apBXWwiyVrkXD9HGkAu/OvXi73naLPF6RxI6Jt5MVzesVQ/izih7kmR3bPgpRKBk+skp
         28+jfNSoH/kgZJMcV+Futv0Huo3NqzE7hLewDjqvG0kiPmrrP3pbsseSaUCcYAcZ9cRZ
         G8yQLRRSaqg4Q1kX1qn9jT+jooKw4Obl8NX6guEqWv7SbVrdz6rvvF3yV24eKQ4Rpa50
         WExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463471; x=1790068271;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4S77UvxmKvQGEySDdGGt+bawAL6b3X54Q38xL2/BalY=;
        b=z1tnF9jKM0fzmpv6wsbKiu3dDfcxwywDkud0rkYZ0PwuEsSLm0n02JDCZgCqNCyV77
         gtgMm4TXvPmydTnqcXVJkJS0BrWxsiQn2lJu1Emt9ciaG+zHgdpapkPtuNxroQZXIXaW
         XZg37i3DjsnuVx6P2X/cj6jVLiHR0jQQ6uERYWjqcK6h/FPHnyClZtg9j/QeQeFqwFyD
         Xo5GL+griXfqpaw/bX/lXGpE1h+r2s9Y0Q6DjDbFPibnnR991FzMuSrVB0ijIqoNd/8g
         QpEiLOnIHNIMq9qB7h191UNLjVLphIe9OFB+IqDmmlXCzimeTnqHk4XpeuwxXkdtlHVH
         ayDw==
X-Gm-Message-State: AFuF++nDGZ6H0aHWOMGsHYiYkPkBdP5vivYdTCrcC8rymgPgII5cOQps
	2Ung3WqnsKu9OfvXwdcsA0nr/XQPNaeO8DsvFsr6uUU3tBGVEWgiqSJLT0Tj6/JObp0=
X-Gm-Gg: AYBFou0++OS2tcMtoIxlRwYGCCIzTe9gHzorRp6LOt/AoY3RDj+tHDZx19fZ5Fn//+D
	9FxewzqlEJCwE066vcVGBYKcEC3dHnmiQiwdypNpkE56ysG++1hd4Q/wOCRs8QRgX1C7O0GCCF+
	+m2Vw+PI2ooNmr1eb++FOPLx1mfWrW8laCLdOWS5N9pbUkhW8JFUMhPLlUIqR/hf8e9VERRj7BC
	E7dDD7bnwSYtSK4OZg8iSe00vmWf8U+eN3eOqSc06Zuq+QMaT0QSagXcXdiApnPydvx/03XOBuN
	o6s+WsHpt8fq6tIUOLRIXjg6N3jMDV882g7cvl290fhZ5nNZeSlh4yHFAB61LnGbzXoAHxmXfhW
	zQfVC1zYbsy6vyPG7ri7Ffq9S+pbEfoOOjCbZRkYWMvBbejAoaAqR1ck2bdKyblQb9zTnZvYxKk
	Q5I8RpQ3bUpFRbh/7tfr0kRQjuEI6/ufXKt59H7L42fulOxI1IzGPHgdlCfFjCpajBTQv40VCH2
	66vbC6x+VA=
X-Received: by 2002:a05:6402:e8b:b0:6a9:d959:c94e with SMTP id 4fb4d7f45d1cf-6a9f63cd955mr3622644a12.25.1789463471264;
        Tue, 15 Sep 2026 02:11:11 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.15.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9ba8f3ab9sm5100887a12.15.2026.09.15.02.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:11:10 -0700 (PDT)
Message-ID: <4b8f4fd6-53e0-4efd-953a-cd8ebad7d479@linaro.org>
Date: Tue, 15 Sep 2026 10:11:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/9] media: uapi: Add CAMSS ISP configuration
 definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
 <20260915-camss-isp-ope-v7-4-77b13d131d3d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915-camss-isp-ope-v7-4-77b13d131d3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2026 09:11, Loic Poulain wrote:
> Add the uapi header qcom-camss-config.h defining the ISP parameter
> structures used by the CAMSS Offline Processing Engine (OPE) driver.
> This includes structures for white balance, chroma enhancement and
> color correction configuration.
> 
> The block type enum is shared across CAMSS ISPs so that userspace only
> has to deal with a single set of block identifiers.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   include/uapi/linux/qcom-camss-config.h | 212 +++++++++++++++++++++++++++++++++
>   1 file changed, 212 insertions(+)
> 
> diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e3d6cc4df7de00345e8142c81392dd42338c6ead
> --- /dev/null
> +++ b/include/uapi/linux/qcom-camss-config.h
> @@ -0,0 +1,212 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Qualcomm CAMSS ISP Driver - Userspace API
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> +#define _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> +
> +#include <linux/types.h>
> +#include <linux/media/v4l2-isp.h>
> +
> +/**
> + * enum camss_params_block_type - CAMSS ISP parameter block identifiers
> + *
> + * Each value identifies one ISP processing block.  The value is placed in
> + * the @type field of &struct v4l2_isp_params_block_header.
> + *
> + * @CAMSS_PARAMS_OPE_WB_GAIN: white balance gains and offsets (CLC_WB),
> + *	&struct camss_params_ope_wb_gain
> + * @CAMSS_PARAMS_OPE_CHROMA_ENHAN: RGB to YUV colour transfer matrix
> + *	(CLC_CHROMA_ENHAN), &struct camss_params_ope_chroma_enhan
> + * @CAMSS_PARAMS_OPE_COLOR_CORRECT: colour correction matrix (CLC_CC),
> + *	&struct camss_params_ope_color_correct
> + * @CAMSS_PARAMS_OPE_GAMMA: per-channel gamma correction curves (CLC_GLUT),
> + *	&struct camss_params_ope_gamma
> + */
> +enum camss_params_block_type {
> +	CAMSS_PARAMS_OPE_WB_GAIN = 1,
> +	CAMSS_PARAMS_OPE_CHROMA_ENHAN = 2,
> +	CAMSS_PARAMS_OPE_COLOR_CORRECT = 3,
> +	CAMSS_PARAMS_OPE_GAMMA = 4,
> +};

Most of the OPE specific naming can be dropped, I shared the ICP 
data-structure analysis already:

https://patchwork.linuxtv.org/project/linux-media/patch/20260426000346.1158633-1-bryan.odonoghue@linaro.org/

i.e.
> +struct camss_params_ope_color_correct {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 a[3];
> +	__u16 b[3];
> +	__u16 c[3];
> +	__u16 k[3];
> +	__u16 qfactor;
> +	__u16 _pad[3];
> +} __attribute__((aligned(8)));

For ICP I have:

+struct camss_params_color_correct {
+	struct v4l2_isp_params_block_header header;
+	__u16 a[3];
+	__u16 b[3];
+	__u16 c[3];
+	__u16 k[3];
+	__u16 qfactor;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));

So this data-structure is shared camss_params_ope_color_correct -> 
camss_params_color_correct

> +/**
> + * struct camss_params_ope_gamma - per-channel gamma correction curves
> + *
> + * Implements the CLC_GLUT pipeline module, applied in the RGB domain.  It
> + * holds one independent lookup table per colour channel. Each table is a
> + * direct (not segmented) map of input level to output level.
> + *
> + * Each table has @CAMSS_OPE_GAMMA_LUT_SIZE (256) entries of 16-bit unsigned
> + * output. Each entry holds an X-bit output value depending on internal bus,
> + * the upper bits are ignored by the hardware.
> + *
> + * On Agatti OPE, The module maps a 12-bit input to an 8-bit output, the top
> + * 8 input bits index the table and the low 4 bits are used to linearly
> + * interpolate between adjacent entries. Entry i therefore represents the
> + * output for input level i/255 of full scale.
> + * Output range: 0x00 = black, 0xFF = white.

That's not specific to Agatti, its hwo the Qcom gamma silicon works right ?

Same RTL synthesised in OPE, IPE and IFE. So you don't need to make this 
OPE specific commentary.

> + *
> + * How to fill a curve (same on all three channels for pure luminance
> + * gamma; different curves per channel additionally shift colour balance):
> + *
> + *   Identity (pass-through, gamma 1.0):
> + *     lut[i] = i;                                // i = 0..255
> + *
> + *   Encode with gamma g (e.g. sRGB-like, g = 2.2):
> + *     lut[i] = round(pow(i / 255.0, 1.0 / g) * 255.0);
> + *
> + * @header:  block header; @header.type = CAMSS_PARAMS_OPE_GAMMA
> + * @glut:    green channel gamma curve
> + * @blut:    blue  channel gamma curve
> + * @rlut:    red   channel gamma curve
> + */
> +struct camss_params_ope_gamma {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 glut[CAMSS_OPE_GAMMA_LUT_SIZE];
> +	__u16 blut[CAMSS_OPE_GAMMA_LUT_SIZE];
> +	__u16 rlut[CAMSS_OPE_GAMMA_LUT_SIZE];
> +} __attribute__((aligned(8)));

For the ICP I have

+struct camss_params_glut {
+	struct v4l2_isp_params_block_header header;
+	__u8  instance;
+	__u8  _pad[7];
+	__u16 r[CAMSS_GLUT_LUT_SIZE];
+	__u16 g[CAMSS_GLUT_LUT_SIZE];
+	__u16 b[CAMSS_GLUT_LUT_SIZE];
+} __attribute__((aligned(8)));

So it makes more sense to differentiate the firmware type to the 
register-mapping type. i.e. the above becomes camss_params_icp_gamma {} 
whereas your subumitted change would be just camss_params_gamma {}

> +#define CAMSS_PARAMS_OPE_MAX_PAYLOAD		\
> +	(sizeof(struct camss_params_ope_wb_gain)	+\
> +	 sizeof(struct camss_params_ope_chroma_enhan)	+\
> +	 sizeof(struct camss_params_ope_color_correct)	+\
> +	 sizeof(struct camss_params_ope_gamma))
> +
> +#endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */
> 

