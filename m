Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95643476CE1
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366558; cv=none; b=Mb5V+OGomJkM2TZFPw4R7E1ZtGoymmbRj9D3ly43l9lRpLbVIpeBDmgKNZfrrBIyLw9H4tKHgQFsPKXXvl8AeVjfwxNCvQnNdXvv5pBRyN/y/adYqgI9aygBodWsYlgDv0jAdBUNQ9oPCnH1LeYsYEO0WCGC3gFs0ANI7mqzcBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366558; c=relaxed/simple;
	bh=0sEpBHImgtBxz8uqC365DtivvPzhsstSwHsRYHYQ4t4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9WfBK60o0VlrfahsyoObFv5LGHDtFUxjUUVDQvuGSdn6dYnX69FzhDGn7n1Oo1wevUT1BYESALtpCBLd1sEBfQbwVc/yoTEiatf5qlCD7sNpY3vOhKOKICq327thQ3azG+CMYiZmPOfyNVOA0Kmw0dbVdabV3pTmxcmwTLQZ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKBJxCJS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKBJxCJS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a061a13884so13957495e9.3
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791366547; x=1791971347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KCLuNr5Jl4WbBQBGA8ZScNaP6xA2JOMpqFLldkWVSHk=;
        b=rKBJxCJS66UM2veHqCI1TbI+fZfaHwd4eP6Gu4swccjbzbpvgp6Rud1/IufdLNsjGw
         l6NN/lgL7o2ZPPhB8dtPcrTdBIXsn0KhuBplwK2+N5Cnj0u+mwwS0rlAs71oxerGwqWo
         lxoJ0DuE6A1WResD171qmlH49cB6pT0UnqhRIh1MHBL6sq6nTcJN0Ri+KXuzICgtfG3T
         SxrXfd1NwZrinvmxuusS9kQ7OvNe/GVpHyEiWFcGaowIB7CdDJaDhQWqr0w6rEQ/1A4F
         9eFU0aaQM+DdfmXIkuQaj50sQ8Zub9QWO2c8QARR6aJdvlNj+ObGY7qTYEKftyj/MRQM
         Uluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366547; x=1791971347;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCLuNr5Jl4WbBQBGA8ZScNaP6xA2JOMpqFLldkWVSHk=;
        b=woSGU8eZjQLPqa1nxNvMrbEaBcblU7ZoSTC9nHCgkJPrcHDnvVQjmjM18rLHAtmLk8
         Bjbk5WFc45A3IFT+GlTrmcnv20XpL9SVQ6yoljL3YAD1TMVA31WAwHkC5S9vbpIQwZpu
         KhMjGlvvYyYOdhidhpZIGmwMI4p46XiBZ1rIKiX/baPpngvzEjQ0wwm6juxkx+nZjanu
         mFmWG1XJ2ny8ur2UtIDSHW8yGa3z0Udqpu2ls/hvtcsDWO/G02DCx6CI7fKjq2SQAOnw
         dZqr/ZXxtdmQxUTPc0vKrLDJk2jBtxEKe2OpjLgJc9Zfe3Gnbu1feOkL7nWQb/YJqY+C
         VZpQ==
X-Forwarded-Encrypted: i=1; AKwUvByFqN+HtFCXozKsIHfXO68jv5x7Hgs9eTqbJXzaABNkjYP4cGHxCrNpgk/3d9Vt31F+ZTR7APSn77aGYQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lkNmsxaqkSU/Za33wTBdyN6aB3b3l/QSaUYd6r0VpFl/tSkBOq
	CtgtsdWoaaVVw+3UL6KUdCzf60CgPNiwjV09baEN45EdaoQuvtw/gyYUZbY5Cth7Ry4=
X-Gm-Gg: AYBFou1LRGI5SUa69m/QtkV5H3GeiUPliM3Oywo0tUZ7izTI/ydwygE0bOz0HsdzVwE
	Ow3bNXqdBHwcs6qQSOjC6yZGWrOt7nVilLNI8fwVuJ7Sz8Vito/ZKvFDnPd1wvOFeJJB1Ejzil/
	PTMoBIyL8t8vZcmu5vL2TgLAO7HKeCTCDeRWE4JSkgT3BtsacKYlh8hQegps+ENM8bfl+9m7WKH
	RcxAhDklcG4CKBIUMHQ8Cuzengsgz6CvjOeLCe70G8B4ymccaoYaeSweW2eY/Jpds6X2AnRPabK
	AESoy/3AldPiKiNu7qvycO1bFYI0/D0v4Tnaaj2yWybrQfrOwJLGmTnUICYpPRJYtAkDAaHOec1
	C8orKuhpEQ3CKConVi7FVOgyU8SJV3RRQRzHLR0sXxrlWN3jP2EktHCyWLTzbMxhoeEiS5TQc0m
	jZQiubq25mn4SilHujv8nxW9zIRMBTUR3MRGeS8c+kM65LcmwVN2c8vfVc6U6gUCoIiRA6mFDgW
	WYt6tA7hBgz
X-Received: by 2002:a05:600c:19d0:b0:4a0:1f51:ba2d with SMTP id 5b1f17b1804b1-4a18045373dmr21395025e9.22.1791366546591;
        Wed, 07 Oct 2026 02:49:06 -0700 (PDT)
Received: from [192.168.9.72] ([185.249.114.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180932dd4sm20918875e9.4.2026.10.07.02.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:49:06 -0700 (PDT)
Message-ID: <2bb9dda6-4a13-4da8-b17d-3bee6ecf9bba@linaro.org>
Date: Wed, 7 Oct 2026 11:49:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/45] dt-bindings: media: qcom,sa8775p-camss: add pixel
 path variant
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
 pshrotri@qti.qualcomm.com, Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-27-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20261006223953.3382273-27-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 00:39, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> Document qcom,sa8775p-camss-pix for CAMSS configurations that use IFE
> pixel paths. Keep qcom,sa8775p-camss for the legacy VFE resources.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/media/qcom,sa8775p-camss.yaml         | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 48f280e99809..9206c7cfe197 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -14,7 +14,9 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,sa8775p-camss
> +    enum:
> +      - qcom,sa8775p-camss-pix
> +      - qcom,sa8775p-camss
>   
>     reg:
>       maxItems: 22

I don't get why a new compat is required.

Please look at my RFC - there's no DT depends at all in that.

The existing CAMSS node has been designed around the IFE SID - not by 
accident - I've been pushing this for months - to prepare the ground for 
not needing DT churn to enable IFE.

Sorry NAK to this.

---
bod
