Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792791144;
	b=KKqtL5x7xr0t2U7/qrGZlXkFhMpq24gshbL9CM924YFvDhwlKizbyvL3lcKNFKKIWwbo
	 xyJPJOBU2oHtIH0F4fjPysvsuye3Z8IjwdXeT/luqjrf8CfChUb3MaBhe51HnLZEJ8eUp
	 hm6GIZoJqaGegtqtXcdKZpR5VQ+yKQGTjcgcFeYMfeiOVGGm69s9rUFF712URxGTi88HO
	 NCTNDqexknAqxLQKcZxpF9jmnc5c+O+FkZWZrChjG7jYfiuNVC7/M2Tt+bfUKqXXcYgYv
	 3eK+VYOOdKSwb45cDein1T9RyjgqzsnCMwqPUkZEnpblw3+DHfzHVAvPGtf0cAnf5Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792791144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=MCxa46aslGGuaUGVmz9JnA/umfWZT7rJVYao++z36o4=;
	b=y1Auj8d+jEOwztQQrSqUwTOs85tpe/pwQCewN34tffT1bJJO4wTMOgIrYCVY1hdkw+u5
	 SmRhYZQUebvuhsGlGntI0C+Gq2MMPx7uDslJFn+GiwvPaTtRKo8UsPAhUdV4buRBP2Ck1
	 d8oMlIDAN1HA+5LFDmwFnYlifmGgU1ssR1G2mEfXhp0Qheb6RdkpzVkyEtjGI7ghBRkpl
	 RP2h0hj6tLKCMra/lC9jwK/rIrr41fJXG4toBfV7mj1AP8L/+xSmoG2E/2jL/NeLk3e7R
	 5aM5cLUB8vS7nRQOwMXxiMu3yJElNYWHPclIgcI0snDecR8JNVndBRUa6AZPX8IzHqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="gW/lVNEr";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BFE606A31A
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 21:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9BFE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gW/lVNEr
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso850025e9.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 14:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792791142; x=1793395942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MCxa46aslGGuaUGVmz9JnA/umfWZT7rJVYao++z36o4=;
        b=gW/lVNErkWubXa1IK5n1Pca6MEI56259qgdOLKwzMCmA0zMYTMRis6aNpLK216moqD
         gPVhyYHf70MniXrc1ts0otBaqIRS7oXxy6ab1m2qDUNct93aiU98mzTTyzrsRbCsvXZd
         W4aMyl9fw1PxNNM6zy1NmVPdWEN4nhQ33mrNH4N+fG4rOv1smC6MLPpH9EtsJDzCd2Rc
         Tq2Pyxrhi/fVsYre0eT0cgKZfCtcNZSwvB9e9p09Twh537oAJNc40e4ZO7f0QHmvyhsk
         c3RtQXjbIgerz+NOlIH3c7JSNpRlbRNjfQJcLC2oQPjJ9JhUEYMpFqlZ/xqC+mcyDKke
         huFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792791142; x=1793395942;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCxa46aslGGuaUGVmz9JnA/umfWZT7rJVYao++z36o4=;
        b=ES/2AAB6jP1VMsOb/eEC21regIJQDFsRNpBd7efQ3bQ4lw46s68691/3U2IzdlSLjS
         cGN/Ov3Wuo+qD2c6Io/0s0DBTr3zD6LoVhewXu7OstA6S7NAYZdcfnSp2FYn1EdApEex
         iCGfWRI6wHyoS5ypijof0SosYsZuFW4e07nVoVqgVUW8chAVi70Ov0B7ksXYruqSlbRW
         sX8zcmub7lKjEOKkidhtFvcF53ZtXy0/JihRGe3Cpk7EKo26GyLZgT2rhGSjGV8pepvT
         JzgoFD1AA8XWYzVAQH53cwLBjNPbES7RwRY33uzhfMZ+/aiCfMCGYkeD+HPCOwu0JJvn
         WplA==
X-Forwarded-Encrypted: i=1; AKwUvBymXdBA0VpnnzSdqOLkp8C3TDk+l8JSSRkktFkIbGv/a0R4C1IJKmunp9tMITiBhipdWHO8p/Sqg29auw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL0NoT+wWnyH7Zb0Rqw1o/RPCHJfY19VQAndkhFBzr7tAbfoUKj
	tFls3FaMJdfuihVy8l0lldaHRo1GRmEyQYKLsSa6Ezcj8eh0y/V+YIXLYxQ6KjPyl3o=
X-Gm-Gg: AYBFou2dnr4dpfqE9P9NNk42/gwAi5lGz+PODy3YfRRBjW8X98ZIOFCkDNBiD5uTcf8
	nOOWTTL8kEePIiP4CYEWoQ2NoLFWLByXyyOyoGBM/grWtzxWsJsk1peQtbKkIoadgaCvcPD2a82
	7GQ2mOzMaA5MHFNr3UfRFx0DTx4BpU3SapngRIxkHyb5NulsTe7p0US0xQWQjxFSxog8vXFNCV0
	fyvw0oIcWH2hJmTGxAdUdwGDAatSJUOUhUem8bMLA4uqlqGqPDOvQsZ9hhqdmi5dcEPK9amm8LH
	5xDFFXQsVah44FXM8YZ3E/nAocgcd7XKihJiJTx5OYAc+fn4ur+ertHrfzT+XBbCrGbyjfNMIQE
	JW3AoL2wIAbWKLKhLsQaAh7crn9/U1/aLuocu5ATGtVslkTWvvXDpVdukLR4eaYN6DRjw1gPA3K
	x627Kxk8VDGkbrHnZFWovnMy5SqnJvzR/gn7aK3KXwBI0L3Z8SGjMRXJWMuTrd3eDT2f1NmhXpD
	XpN52T8p0Jt0yBQuDtHTWa0UI6MFaDHmdCOehoffK3pW8FsPFVclloEZn9n4tS1h8+P
X-Received: by 2002:a05:600c:530e:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a35acbee85mr2035185e9.26.1792791142061;
        Fri, 23 Oct 2026 14:32:22 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.107.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a0e2sm10678435e9.13.2026.10.23.14.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 14:32:21 -0700 (PDT)
Message-ID: <d9b8fbc8-c8f5-4c3c-aa5e-20e1e311a543@linaro.org>
Date: Fri, 23 Oct 2026 22:32:15 +0100
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
Subject: Re: [PATCH 2/4] media: qcom: camss: sm8250: do not set VFE core clock
 rates from CSID
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
 <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 16:28, Atanas Filipov wrote:
> The SM8250 CSID resources list clock levels for the VFE core clocks and
> for the shared VFE Lite core clock. CSID power on runs after the VFE is
> powered on and sets these clocks to their lowest level, overriding the
> rate selected by the VFE from the pixel rate and lowering the shared
> VFE Lite clock under a running VFE Lite.
> 
> The VFE core clocks are set by the VFE. Drop their levels from the CSID
> resources so that CSID only enables them.
> 
> Signed-off-by: Atanas Filipov<atanas.filipov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index c54185c93a8a..7fe12049b78a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2052,7 +2052,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
>   		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
>   		.clock_rate = { { 400000000 },
>   				{ 400000000 },
> -				{ 350000000, 475000000, 576000000, 720000000 },
> +				{ 0 },
>   				{ 100000000, 200000000, 300000000, 400000000 },
>   				{ 0 } },

This sounds like it needs a Fixes: tag

---
bod
