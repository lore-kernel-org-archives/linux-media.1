Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C20F433BCA
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 22:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671452; cv=none; b=WlAjD8p7P986d4CcyZZzUL0L5KzLyojR0A7Y535I27EmU9SFhRZ+1JJVQVMxwuiR3MAwukr71ePxY+QL0949DcXb8QEE7SRLRnX4nNqbBtuEl20HnNyDOLwbB9jbzYY16fdZKBtUP/qCpmNf8cKZ7xax3WhzMnGB720P06H0szM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671452; c=relaxed/simple;
	bh=jiPXaplbBrjDBiyD+2xdkHqYyJ73BZfU7SzbcpN7ktI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uRzt8clC1gX9j/XDJzIX6jjzW/O+h8uqqwBFBz2R5IutDJZjvkGQY7V8ifXo7ymOh09EHVElF817NZjT19ZI98tyHhlqrOuxIxaGNWCeioqG+vVI0zeh0tUHQEL3r2zkJO67RBv9OqefRW8IzYSovL2owuPxwTaxhim8r4RiqMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CnCvzHI5; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CnCvzHI5"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so10432832f8f.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784671449; x=1785276249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QogQktI4cQ0/cwbQynb7SnvvTo2aGoVhN6/lvaHQfIo=;
        b=CnCvzHI5RuLhUghyb2cJd7j0Qi0Td9MTuzFvQ8+NclDHKArzQxfF6oWS/Fs+lBGmQT
         3nhOHO6n/wmkGQ6FLA0ftnfgVmOjg9TNzvEFVhZJ8NoUh3n7KyJJHufvaZSp+oamYQbX
         Rl2DdjYlnvf9lIfu8yqs98EMrov5oxi6UAq2maWzTnfWWHDwl89Y0PFS7Oi3QYGwJH5p
         c0o15T1a9eNFbI2pFq9vslpUNmKQP5tMVay89/PsrXuNjWf2eOIJ2QOHP3DTuMFR7pQ3
         4mCj6BO+7OjdER+wcyhAGk+8NjELIVxxSGZXeLGF50N3dplHkFKHswF86jXEik6qIsx3
         vFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671449; x=1785276249;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QogQktI4cQ0/cwbQynb7SnvvTo2aGoVhN6/lvaHQfIo=;
        b=UHrY4/NqYJfzLKuX+ZRZQna1D8xwPsicfRV+5zOFI2drCskTj/8Pr2H1SGgjUyaOoI
         P2drpaBB/srBudueKTHeanHNZw6s+D/zjuUPjs1iKjf2uGOe48+DnwLGEayYVUuQGb59
         S+XJFNI4Uv3pVuMxrde1QTO5+LjumVDNGDi6PFOClRd2WsrBycSRc8D/W/C2I7EfKVZD
         JciB2xxaK3srLmyHiVpUArm52t8hp4q2TyVXTzmUK7RiJKQ3nPEvi7P1toVKGqtdHHSQ
         0WAKtNSXvLIFX304cRpN0PSpf+YnwlkMEWfdwm8kq7gm8udGfFSk1t13P+7SQycab+ME
         fDZg==
X-Gm-Message-State: AOJu0Yw37+HPpNE7m4khuLAw+HjupAD0nPtwbh4k7siQIyWKVXAn9WIF
	J6zJuQq7Tj7CfZt5gJYqHXw49drip9rKLOCqnrSv2BT4FBi9CvsP+20h9OdolWO/gCmg5CeLY//
	O7eJ4uiU=
X-Gm-Gg: AR+sD13Fm2d1+9gTGDZALN6ok1WDz4RExBWIXWROAFpus9ltEcuO/WbJiBjCosv6Mth
	mRcNy7r+OzXIPHyskJgLXe132envvwg/JBYrSgGCSz3eD+CpJJXsN52UjIBL5hR3LYU84hZoTdM
	ODsOCiXu/7aUuDfxidIG4pYkdqy2LMqsD2wmWxui+tQ93ZTQcqc6/wvCK7c1eq53hRycaiAs0ky
	GNsAGwhwzs3YLP3MX0yu3cHKIbKjgHhawnWHN+HrRIKQ3WQkQrXfPdNtloDwbaQb/GHcMcNKV+H
	oJQRTJjd4XtXZDjrp+KMv/KTrh0A8MZlhhxvw9lzdfJ0QKXJX68gPT1SN2yfAxwnZYg44C6sC0k
	JVrac8iYeaJtyzzXlCIACpLJiCVaYzlIXAi3/Dx0M+uhrXpRtlXPcY9McaUyb8GjRqe32fnI+mL
	UurxdOmzk65Rn22NWIGNd6rB+0Ag==
X-Received: by 2002:a5d:5d0e:0:b0:46e:8226:96ba with SMTP id ffacd0b85a97d-47f623036aamr25701097f8f.13.1784671449467;
        Tue, 21 Jul 2026 15:04:09 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.186.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a659sm33588f8f.6.2026.07.21.15.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 15:04:08 -0700 (PDT)
Message-ID: <f94e951e-8abb-440c-8b23-2795d2d0e31f@linaro.org>
Date: Tue, 21 Jul 2026 23:04:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] media: qcom: camss: Report hardware version via
 media controller
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
 <WyExpG29R5g-ynyRT5a1EPDWu2HjZDXAvHvdooTK2NoC0fIzNJe-A-PXSQhMByC0uXZ4cfA8EsF1E90oymjZzg==@protonmail.internalid>
 <20260721-camss-version-v2-4-b2440d99085a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260721-camss-version-v2-4-b2440d99085a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2026 14:21, Loic Poulain wrote:
> Populate media_dev.hw_revision with the top-level CAMSS hardware version
> so that user space can query the exact hardware variant through the media
> controller (e.g. via media-ctl or MEDIA_IOC_DEVICE_INFO). This can help
> identify the platform variant and adapt behaviour accordingly, for example
> allowing libcamera to apply quirks or enable features that cannot be
> discovered through standard V4L2 or media-controller APIs.
> 
> The version register is exposed by some platforms through the top-level
> "top" reg region (offset 0). When present, map it and read the version
> once at probe. This is a no-op on platforms not mapping the region (yet).
> 
> Reported media info on Agatti/CM2290 (Spectra 520):
> Media Driver Info:
>          Driver name      : qcom-camss
>          Model            : Qualcomm Camera Subsystem
>          Bus info         : platform:5c11000.camss
>          Hardware revision: 0x00050200 (328192)
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
