Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890173;
	b=kTyD9/bl/BpaIeBMBiplKq6XhVJ0/OfPE3RQ9JU1I2gag6lIHQcP4Q1M6LSyuAutOMyu
	 FbyLv1MdQy2ouAmk8RN5gpStmiDF05D4L3r0e5yipcQ12AKg+gh7yIMFzpXi7j3wydqkH
	 aq0Gd9pAXASGzCmqgI62UF29QoMiA46CLc2Ykdj9fJosS3zcw4GxEDTvvdQrcAFPJlerJ
	 8VSTcHklm0IuadYQW55PXK9rq11rMAauiYJfpFAzJxi3xQnX4NNIaxIprJnEeQgeoqIwo
	 3PAIniDV026gIOZnSUM0sOVgdJfVkIweRRhcnD0ycFHnr1BTqYKAtGO4KSyBCf4/A0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Om0tcSZNhZ5lOUlggnaxDt40uTNRQpeANYB2F5Pi83A=;
	b=jDktBHdmHLcpu49LfbrC6+73ajhjSexT0iz1EYupcBatS5QJYEnoR5Q1Qhq1mPj9Kk8f
	 3+q+bo0t8NQ/zzNM56eOEcBzbJQ/Ws14wsmrXPywgCwpnTRVgFzOD2rx6J668U0n6urKv
	 2cHmiNtu53js9d36lKZZXcUDqLFQmbdQ9I8V66CkauQ+0pusls9D3d2UXO79Nll+bSUkv
	 JaRFx2xZlDIv680YAxDmDRyrpBEKIXwCYex0HXY3HqsH4eqcqDXWPRveRPz6dsQFVbQSq
	 9p3gj9Qs1JkogN0naOJBOtMwUWU1+gpAPVn2PmQ/JnlWPTD4GNw1MPQl9GVxA65FNAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OxV2lkRh;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107FF606A32E
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 14:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 107FF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OxV2lkRh
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so19103685e9.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 06:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793890171; x=1794494971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Om0tcSZNhZ5lOUlggnaxDt40uTNRQpeANYB2F5Pi83A=;
        b=OxV2lkRhk0C0TAO6rN7Z6hKEHmcuG3z7lblZ6BAeXcdGdhxfPtIsTrrTLyoBf8mX9h
         bsf9ewoi+eyF8RgAYLuAL9zrbWAiPVXk/61pfnNmZZf4l5k8wW57vsQz2pHYof5P45M7
         UM+yiwAiohv1D4Afb3JF+cnuAw0OwINRvK6KQ03FdSAcNMK/sQnKoe7Zkpa4jeK2RESF
         tHeQZZQstnEYt3KtTFgg2WuDGMVlEf8XxhmJKJx3Cn9ng1SReOwQdlA2p+bcmdz6eSyv
         f8WJcsqYkouW6OqvEMbwMsEsdd7AIE2QXvuIov6rB4iXhwTiEg8FuhJ8FQb75d2su6nQ
         8a/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890171; x=1794494971;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Om0tcSZNhZ5lOUlggnaxDt40uTNRQpeANYB2F5Pi83A=;
        b=Zy2zA9J10NF/tZUDmrHPRMA+EyB9NF9n3GY1EInkDdby8hHGoWu0TkSU4mPEeBpuiL
         NSJAdLRc2vfAVzzOWL8s4Xe9/zTBEsDZ78nnj3lRGxTjFxYhEkp6rOCUbxr+4eC+MkPH
         khPCfN/eWdI3OAYHsorhKBr1EpHMWg/2E37pnBuRV2/nlNLlQvRdPn2XwobYyTMe6CT3
         elc+P3MPBKIjrSEih+ZWEVn3GoqRCBqabDFGGcQx2X73cLUqfHAOQukQP7LvVv65FvyY
         /0JPNE9hJFP620+u7wv/9NHwV5ePdeA8/YUn51VqMCJm6m2HlgqNopwRPYDm2Xc8gxwn
         MVqw==
X-Forwarded-Encrypted: i=1; AKwUvByEMeaE9xDeNxn/h2oP97zMOiEwTygFox2Veehrc/GVq8+WDLU+QguRhrWSKLAScR4h3fmhS2W3Eep9Pg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8dzZ/YfAnjYxCod2nA7jwO+5B99A7z8zwG5Y5uV0fxQ67wJxCR
	XfEvyztL8Ei0bvZSL+YMbBrDiKVoVwaNC+6jeanO08cNnChhDhmG1/pEoLs3QRIasIM=
X-Gm-Gg: AYBFou0S7mBKt2K3Y0M8dowt6yMHBYzgdlk9EVNr6TLaY9Pkb+mHtc3Z2hgnA3JQTKZ
	gwP5ML1lljxKNkmc1SuwSfzhzTQ4D1PieDEk8EQ4V+1JU9R4nHH+3d+gikQ89UCpltMkZ0t5MNb
	C1F2yE7O3Fn47LL1nfQWgt+EefKfDHK3Icww5hU7WIpAmlugd8NBAHpBIpI9/KDA7Sw2riVFvxv
	ZKA2bB5xvW8iARt2bSwheoqSGUEdUbInzYPVwi394b17QRoqoUC/mnN+D1qBYSbQDwRUyzUecjz
	W4FYYiAu61QIV418hb8Dti/YzxnCamQIzIvUUajOP4InA4BwYLEFKmQf22y68DzBgZ8TJAzi/Ev
	4JYa+3V9D9sE3/DDHOy3s3EvuOiK8jCSmFmlwvBu48CSQzVND6poZySf9S6ErvvBzwSGJI5LIpb
	55o6jyn+QzgimU/mYG+l8OlnV0nOtcYRXOuzjn1ZMRthkTmgxIsAqhOcVv9/0hlQsBzcUx08G1e
	yegz7B+ASiSTdA9q+3V1RyL1Kt2XOYpjNQn+wB2QqBB106IW4lJqpuBlq0tumT6btA0w2fuWBvi
	MRqRd7hCly3MSkbcuZSH8Us0isLhZqjNFZ5ZsEuK
X-Received: by 2002:a05:600c:6285:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4ac182dc8f6mr417083355e9.34.1793890171437;
        Thu, 05 Nov 2026 06:49:31 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4104d600fsm129873185e9.0.2026.11.05.06.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 06:49:30 -0800 (PST)
Message-ID: <1215dd37-1575-4dab-8ab2-65348ac69d91@linaro.org>
Date: Thu, 5 Nov 2026 14:49:29 +0000
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
Subject: Re: [PATCH 3/4] media: qcom: camss: always stop the pipeline in
 stop_streaming
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
 <20261104202313.72494-4-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104202313.72494-4-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 20:23, Allan Siriani wrote:
> video_stop_streaming() walks the pipeline upstream and calls
> .s_stream(0) on every subdev. It gives up on the first non-zero return,
> without stopping the media pipeline and without returning the queued
> buffers to vb2.
> 
> A subdev without .s_stream() returns -ENOIOCTLCMD. video_start_streaming()
> already ignores that, but video_stop_streaming() does not, so with such a
> subdev in the pipeline, e.g. the pixel array entity of the MT9M114 sensor
> driver, every stream off:
> 
> - triggers the vb2 WARN about buffers still owned by the driver,
> - leaves the pipeline started, so the next VIDIOC_STREAMON and
>    "media-ctl -r" fail with -EBUSY.
> 
> Treat -ENOIOCTLCMD as success, as at stream on, and only log real
> errors, then always stop the pipeline and flush the buffers: a
> .stop_streaming() callback cannot fail and must give back all buffers.
> 
> Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
Please add a Fixes:

then

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
