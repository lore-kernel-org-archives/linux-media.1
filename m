Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D57F383998
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812773; cv=none; b=rSlIXO1O7+9r0g5B4oW2U2hnYFzfLAOYbJuIg91rgbIKQyrRJaWvf/vnJZrBhgZb2cvJWNE/WJvYnv9/8sSJdMFV3Sud8940qXBY0N2Ord6zxxunMJ4OxL2aisEU1Cx7HXTCMP5idirystvsOjl6AOaqdUJ+0snhy7yauVs8Rnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812773; c=relaxed/simple;
	bh=sTKTqMrlzRhmp4al7IjMezpQjYCs9jIcQILHVFsOG/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QeCX25ClQ7CDHE85O3I+IVYMz99WGaHnRu+QjM+VlOJLjUYOho+RXsMhufPxRLVBIacqsqxU8RnOu87IeyaAhWv/qiA2k0d1Lq9ZFO5aOWAZLRU6Lbq2L8oF/DUJKtVFrTNlLqH5qM36UkFuR9cWv5hU3O4GHwH4Z7RgAVxP1ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v32pJASl; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v32pJASl"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c262f1186f0so249156266b.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812767; x=1792417567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dHws0iegm7/ve8hvmLh8jfg8R/Vly+TZYm5WF3yIxo0=;
        b=v32pJASlphSa6Mc89V8MioFyF5EVZhM/e69oceX53Cjv1k5O/2bMmiWbXXw1SWSF6V
         flvswQn0nqa1+MUUbR4RHw6dNTwwOFMVd9swPn2GpX27dJbxAnnSBQB3fJVvisG8n2+r
         s3fSSWjYvvNcnq7SreR7Zp4kHz4HWpv9XAbKVZeFdz09MO1IcsmhRrV2/MZ5h1loeA+L
         TMTzR/9bLEQpq3tl7CJ42ap2UR2zI8J5vSYXxrs7UWX1eUiyJtrWoJbO83Ujdtq4GLtd
         g3LJyAro0UbMPL5Ia+ycAfZuSELrzbsgK8UJjROALv4LV8D4+5dMZIYdHdfs+K6j3MJA
         S2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812767; x=1792417567;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHws0iegm7/ve8hvmLh8jfg8R/Vly+TZYm5WF3yIxo0=;
        b=ukmOvqtuJ9nJsGUaQQbPMpOx9ahzXQTSF8V7KyfGsniWFDrPB2x/VdclVtslmCpXhp
         mUtVtF/HiGsH2iniyJcaeAYbxg77lU1muY0LURDcOtg8ie5LTgj99guG/eqZcJ9pzOZs
         atih9ua1p/ouvKPoAZPnwzPzwoyI00qvst7WE1gYykX9jwf3hP3fE9G2ApCn6mc6xizy
         fiAZtMVP4Ja4m2OsMahkYDEyUMRXf+oiGpX1YReBmXZ4tIKQDpWcYijJis4cwidxaFHI
         fnKytB/af9PD26+oj4Y7l2gJ/5IZcddha7HGXtzQFrYeODhcBtaVkFncxooFm5rwX2N1
         vvWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwITYNNRsrs3UmCDY7QKAu5AEFKt09FbwxeO1FhKjTtBIhSUDuUFmr3FLTEZbShPRb9f0P9DbZvwfN6tw==@vger.kernel.org
X-Gm-Message-State: AFq9FYInlvPxkA0xx9qo3WvINSM+5kEOmyJQpEgNQ42JfD2n/2dPyswM
	rWwMiFGWOOeWh3HmJdWXaiiDdFB+jE6t/R+s1psF/RaaJNimGB/NeJhV3Jx3oW/NC7E=
X-Gm-Gg: AYBFou280DpZ2oZ9mxq2vlSTVnVdxsf1Kah4DqO1WRZVYPq/vYCN1D9lhTqAK9c42sK
	ayIKP71Eg2917PnIwjFiCuIDVDlnpCUGj9Jg21I2mE83HiapJORrUQzQ3x1yGlewmx0C+qBMknF
	mCb+oOVr8ypvjZdrJKUv0iZXAw9Zde/5BC5Y/57t8iAxYTOAJH2LHpklQeBikn/3uASdeSh671e
	vbvmrtFWEceFi+NjBCCiZFZM+s5/q0tiuJFfMMtOf1BcIB7ZkOrM1GWhpq7lJqcoUh0C9zbXHNR
	T4Wa17TFUcQr9DPULXWJn0LaFRUSFUmJSQ9IXu7zgtULQlvd3RL+j8Vjh/O18ULDWNYjBVspCqZ
	wrqwqBtCuK3fzpk1K5BajTnE5ZzkdJ2qic9vXIfNWYNY20PL6tRV++aMFzT9DkOmUEdpD/DsWJy
	eccjo/HstgyffD0nzksKYaEfL8U+y82LRMf7u+qohsmpOeQLMdgL4Qijofh+YhdcYsQ30D/969M
	Q3n8O0XtBlK
X-Received: by 2002:a17:907:2da4:b0:c2e:4705:467c with SMTP id a640c23a62f3a-c31a9fa2040mr978925866b.10.1791812767239;
        Mon, 12 Oct 2026 06:46:07 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.202.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a38050sm470538266b.24.2026.10.12.06.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:46:06 -0700 (PDT)
Message-ID: <6f40cf25-1967-4a7a-9952-a0fba3bb5fe6@linaro.org>
Date: Mon, 12 Oct 2026 14:46:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] media: qcom: camss: csid: Match the current
 set_fmt pad op signature
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com, atanas.filipov@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20261012120542.1140157-1-hitesh@ebytelogic.com>
 <20261012120542.1140157-2-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261012120542.1140157-2-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 13:05, Hitesh Patel wrote:
> v4l2_subdev_pad_ops::set_fmt gained a
> const struct v4l2_subdev_client_info * parameter, so
> csid_streams_set_format() no longer matches the op it is assigned to
> and the driver fails to build with -Werror=incompatible-pointer-types.
> 
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 2559ebe98..991275398 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1696,6 +1696,7 @@ static int csid_streams_get_format(struct v4l2_subdev *sd,
>    * Return -EINVAL or zero on success
>    */
>   static int csid_streams_set_format(struct v4l2_subdev *sd,
> +				   const struct v4l2_subdev_client_info *ci,
>   				   struct v4l2_subdev_state *sd_state,
>   				   struct v4l2_subdev_format *fmt)
>   {

Please add an appropriate Fixes: tag and Cc: stable@vger.kernel.org

---
bod
