Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2178A3CAE7F
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 22:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673619; cv=none; b=TgUeudU4NwcKdsn0S1RNNfy6e5VkrQqIPguX4h5ouYDA2i1xC5kqvTiU8WUdPWdVvZWbl+8ZkbbKRlQSk2vgWOmpGqMTuU2+DbcRUO7lw6oKuTn2cSS4A5vSI45CfD0p9uwKd3HOOyuq88e5dF1UF0D2JEG9z0/dWSI7oEfW7S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673619; c=relaxed/simple;
	bh=86+FFVf2RJXCDge481xc40j9yQcZbXPzCSDbKxjMSQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nkLZV/2bur1WSNk82u507yT9bcoo6LeSLVbtev2FMQxiwU6LbEVb7sqA7WVJ6rBhgOm/m9oSVCHsxuess+xGkvZcc4PUv8GT3gz+H3SuG/8jpYlnrqHC6RD5MegJHJucZAcS5zF4kxfgE+6XJ+usp7Sg2tZqxiKUxBzEyw4v6nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IVqIG5mP; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IVqIG5mP"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f7854678cso1278526f8f.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 15:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784673616; x=1785278416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RskP6QT1dpaQK7qfXd+bxkNm79lnYJ2LdMNrXnjHeIs=;
        b=IVqIG5mPge4kyxaEU3iL1xqOKSXgvrOTGk9GR5/koVoRSn8/lrEYcwdbaXEZD6d9y/
         ZpCsMjousZtMAJ5Kg78w0IWAbM4++jsnzlVTir75PCDAfkGh9sjZ8BiF0a7vaIKd0fVq
         RJmmWUjW6LUvuZDxw3nEtU4PLupoW4jXrX8bmw+jNXoRVFxlKnp5ieSGInXX4/k4UxEk
         ZKdb/0lRUHvJFDvsbjaNCAy8mMp73gP1SZxWaUqZq8+fKWY9KC2ogN/gtj0mdkovNpz8
         el/eMIkw6u2/N0rB6TsOGTW1NkHEW8XogucJq8sMv6EYbgTw0/thk+0sLWZn766mUvaT
         vwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784673616; x=1785278416;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RskP6QT1dpaQK7qfXd+bxkNm79lnYJ2LdMNrXnjHeIs=;
        b=sVm6PxEaN/Ie9JV+7Rdx0Gsl78k1+Isk5Wwu2q1LI2arz5Kt04eBgocmsgFY3WpfOl
         14C7jooqf9UVbyvseYHm/euZYgtGDj+OELrfwqBzfGh8qKVQ+vm8xxcNltyburY+2aCq
         Ae+y4qYTvR0GCzjyvwc/ccCkArFlEDUdJ6z4xzZOw7bYIXV2c0X4FOXiZatb6SMtYj9l
         HynLZyRfCQyVRTuAGKI42hF+Z9sARx+pwwkq/f/OEbCXJErftOQGrbTcXqcObo3dPxeQ
         LCmlCNH7/bldpTFZcowpNXApZtOPd7N4PbbsDVUQNar2jQnsMA+8QwKB+6dyT1biD1Z6
         2oow==
X-Forwarded-Encrypted: i=1; AHgh+Ro929DLNw4VoG0xiatpGVklpkZy3oS8gnSLLiHv8HCqItvhlBltDlEly13bNOr0J9mFqxG3TS3zwo/Rvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5RaHXHCJDGMkI0Jw/8RwFo9tMiPx1PTJqVDiJbdK1U26dnZrj
	rrVfYePL6Wzah49xpSqTMcWEJ32uGLIt7IfHpM3RbirN+gSCmP2uOLdM+PP1+npd19A=
X-Gm-Gg: AR+sD110SDwNdcl0NwjpjveqgZlzYHj+hySHM/BbLitAbaOycSpALs5CXeAlWd0JaZq
	H/C82qeJqIILJfFhHe6v7Dmglt4uK6R0OwqLE0X/eUKehO5iNqFnZYYi6c7lfaxD5a4//9fRDPF
	wd0jZtrN+AbrSF7el0hYM+53mOcIUfPFSakS3Cf/gFmtPHFhVuPpVCn0wkh4SoNFOSQD6oZN6XJ
	okRZG9o9V8tIoZwl+nB+wOIZaYntNUh+J6UEvP9jFm3z9hy83b20JUM3KMcOAy604wYaNXNKvam
	XVa9zEmkDxm2sig8jBElCMDvw4Zcw+CPRWrl4t/z8x0jChVq2HK9jFZ1+c9SM2I9i4/Zl0dWLzD
	O+QjwMN7Xk+UK9AyTN4jeGd5HqXQDZgd3Tepx1/H8g/Iuh6vbILHqbvcd0stoqCA9CqZAwmOmrJ
	cZwViK8jDRN4uzPjgevNVjycsE6Q==
X-Received: by 2002:a05:6000:712:b0:47f:6f2c:7303 with SMTP id ffacd0b85a97d-47f6f2c73c3mr17096854f8f.33.1784673616312;
        Tue, 21 Jul 2026 15:40:16 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.186.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm249830f8f.11.2026.07.21.15.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 15:40:15 -0700 (PDT)
Message-ID: <b14b7ead-d063-42d4-92cb-1299ef0a81e8@linaro.org>
Date: Tue, 21 Jul 2026 23:40:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/8] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
 <20260720-kaanapali-camss-v15-1-c0b1c1167c5d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260720-kaanapali-camss-v15-1-c0b1c1167c5d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2026 05:50, Hangxiang Ma wrote:
> The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
> C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 880fe602945c..7943049834f9 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -16,7 +16,9 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,x1e80100-csi2-phy
> +    enum:
> +      - qcom,kaanapali-csi2-phy
> +      - qcom,x1e80100-csi2-phy
>   
>     reg:
>       maxItems: 1
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
