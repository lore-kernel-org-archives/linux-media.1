Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672723;
	b=yBcUQCRuiS4TAesNCqSPHZaUmsLGen9exe/v+vW1pU9dS9uGbnkyYtJcSQ294mWl5+4q
	 au8sfP8csx9T1+G8b/dBJX1QjOWrjxYAD7tIiaSsI1XQgwCHW68Ni29RDhkS4kyBj9btk
	 07jz+b33KnkAcpbeUkhBJX45epeLSrbfDQ2+H+IVAvcBLgRdBXeOcyOvC807HZPE7QQtR
	 iqF4oe04TkkxHkPIKkU11NW95Kq6RvjYlZskOrPv/8+qVxb3UDANKju2grzUkVMeJO4w/
	 aru/OiMcp+jowj89qigc2j3uCg88+alwNagNg4f1RjBMJVEGZQN1E1aXnOEr2D20LGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=z9mqzTj0TE8Dvmu37VtnOOjrtJgwrbw+0ALBo5nrPOQ=;
	b=O0CF0bIm0PM/jCQREcUq/Oga7PEqghZ0AuFiNPchIny89n4kSIGqhcFX+WSyEQwRD6WF
	 jllV8zvBuyvgxJ4PHvQxFwPU7ey2PLOio2SIhLUN7zd0YdzhNv3cdOJDGLyOhuglXdks6
	 /Fkqn8OeOvA45j3euWUcVid1dNTG7s6YCvzzLv2Xrr5T/Y1Cnj7GbxhO/DCZpu34avAXF
	 TQuU9bKtGxxBnpY9Fja9Fk6dG/4tcHXhAPNNzrrD9wfi8CUJtIBrQxKRAX6iz4hIjUcCE
	 k0woc2P6MQgIpoTbgN93EM7lz/zs/kGgW3iYRXKSUKfL7blvcuK5HZpLYfB29yOA/Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fgwd7q4x;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9324606A31C
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 05:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9324606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fgwd7q4x
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c00c727a21so543087e87.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 21:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795672721; x=1796277521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z9mqzTj0TE8Dvmu37VtnOOjrtJgwrbw+0ALBo5nrPOQ=;
        b=fgwd7q4x2oo3KRStS1qxJPIf7HEppN3pEKniLX3DvaQ0dz0mnDLUa2B/J80XkRGLOi
         uSj/dv4qEmD1ay9SwXIH7KcaJQuiL7PMmX7c5wHN6RuL6Iy17q8zb/Rj+q95xJ7Z6TcF
         1BADaB3ltf+Lb76igC3VlFAjUcm8+/WK2J8qvBZE+bakF4FOrIofJyCkCxciMA0qDFZ/
         mt1MEueLyRgt341f+wZm0DcDAVFuLDV44Fycw7rkElZgzXIvE6XeK/gJPEY3IS5cYIQN
         gtNxHQEJvjcIdA4k2GIpzChqsayFFFu9FnSGq1EgXCABDVOyZxlbRyV20ZoBYkdGY6zy
         w9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672721; x=1796277521;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9mqzTj0TE8Dvmu37VtnOOjrtJgwrbw+0ALBo5nrPOQ=;
        b=sObGQbMt9+IP6elUfnKEV61xjIa+pUiXIKcaUZmiRklOSV5phw+qKAGG85pmm9i6jp
         dYDSU187I44LtYayh3RrAF1OXPIG3Rz0DXjdHBX2oEAbVZyIDNZb1qpGkfdfAY2nVjDZ
         w/JcMkBaWwVfLPZu4IHLjlu/E/uSweyC5wMZxEYyqCWf0a2hV33ox9RzssR3PaonnhdV
         oitjcupgK4W3LUh4Aa2PJrwl00XjhZTipvrQoRjsS83VgvNn+7Gaao9fwQ+Np2R5LGya
         sHQCbZ6e4eXGzv6jWcn+JbF6qPzAuVFkTwS9EOkPDa/o/WoOyBp9mcnkRwZAcu6K4O3T
         RJzA==
X-Forwarded-Encrypted: i=1; AL+hErGug10O4cIJcGz+Ru268d9MCindKH47Rhe+XNAttOqjE7JZk+m6lCK2RKhFzcaKg5iYi1bJ701SiCP6pg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ERixAVxWRQ55Q+ABbMfxdOUFTOuqEECjOjQN6jgx6XQGMmD25
	TmSteBpgFEcnFrRoQwpyBAI1n38Tcuzb5uWqu/hayvDk2SaFcxVeZyAw0W8WT2kuShA=
X-Gm-Gg: AZFdTZeaNRRtwXbxdOvsPddWs9yrtR1bEQma7PMJRLnnUaEcIb2lmGxhWdQVEA3PsHa
	oo+cwS1SvmCfsCpV8cDEHf0WvT6Ac+UnUL6R377luNjI7LsP8TGeb9lF3KamBtTvfiIw+/vfeOC
	3atRH8uEPQcPYtnnkHzSGqOEXFACdjRWqEwFy8LMJfcu/KBDLMNTetxyLz7nFwLuPAvQWZsUIuM
	jsZwVjf5mNhVzRFNpefhDaAVJ48FdWeTfu00yeyLE/9mUJgUaDTVEYW7CgQv0JCFJcECoE9KgZr
	Aw0zoX2E6ZkSUVcgu1XjVHDwWQR1MxXkpMWsSzq8GinPxYUof30hfhjMoIn/JstowOCDnXq97yK
	GMRSoag9bEfkWUdQL4pL6YD2E0EhSsVWtLK+zP9rPdHHF9Ke4IHaGohbFaT+TieyNjZaG3uOlCt
	Y96GVvweCHrdU1r7gDrtZDbhEPw/iYBbZcDx5IjVZHiiFN0BgGs4KXzkDBfYB1c2a8AtWtvn4EF
	FHHGMC1+YmJneFzAvqfwQsP6z9XS+OfuDHnoWA3ULIHLGmzMxXmcjTXQRrVBPk/ojOWFzEEEvlJ
	sAhv4N4Q/ZUCt0bt4DPsQfdmz30KuE2XJTc790SQjBK3WgBnhlk9vpxNMBgOApQFJO0PwHX5Zup
	U9PRPARU=
X-Received: by 2002:a05:6512:85c5:20b0:5c3:2506:4c1 with SMTP id 2adb3069b0e04-5c32506083fmr1030505e87.4.1795672721080;
        Wed, 25 Nov 2026 21:58:41 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd043420sm4925147e87.57.2026.11.25.21.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:58:40 -0800 (PST)
Message-ID: <69b8d22e-f688-4458-ae2c-0e75f7b23234@linaro.org>
Date: Thu, 26 Nov 2026 07:58:40 +0200
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
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
 <20261123-glymur_camss-v4-1-d7db74f59e22@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261123-glymur_camss-v4-1-d7db74f59e22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 13:35, Nihal Kumar Gupta wrote:
> Glymur has three CSI2 PHY connections: CSIPHY0, CSIPHY1 and CSIPHY4.
> The binding documented CSIPHY4 as port@3 because the initial driver data
> reused the X1E80100 CSIPHY table, where entry 3 maps to hardware PHY id 4.
> 
> Fix the current v7.4-rc ABI to use linear graph ports 0-2 by replacing
> port@3 with port@2 for the third CSI2 PHY connection. The matching
> Glymur driver data maps port@2 to hardware PHY id 4.
> 
> Fixes: 1e0c8f82d710 ("dt-bindings: media: qcom,glymur-camss: Add Glymur CAMSS")
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55ed4fab194091c02 100644
> --- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> @@ -109,7 +109,7 @@ properties:
>         CSI input ports.
>   
>       patternProperties:
> -      "^port@[0-3]$":
> +      "^port@[0-2]$":
>           $ref: /schemas/graph.yaml#/$defs/port-base
>           unevaluatedProperties: false
>   
> @@ -288,8 +288,8 @@ examples:
>                       };
>                   };
>   
> -                port@3 {
> -                    reg = <3>;
> +                port@2 {
> +                    reg = <2>;
>                       camss_csiphy4_ep: endpoint {
>                           data-lanes = <1 2 3 4>;
>                           remote-endpoint = <&csiphy4_out>;
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
